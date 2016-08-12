Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37CDC6FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 07:21:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7C7KWKj001636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 00:21:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 12 Aug 2016 00:20:31 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Aug 2016 15:19:56 +0800
Message-ID: <1470986396-17983-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] proftpd: fix system account login failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2016 07:21:18 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

When pam is enabled,
  1, Customize the proftpd.conf to use pam to authenticate
  2, Add proftpd pam configuration file /etc/pam.d/proftpd

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
index b6fd4b2..2332ef8 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
@@ -92,6 +92,15 @@ do_install () {
     # create the pub directory
     mkdir -p ${D}/home/${FTPUSER}/pub/
     chown -R ${FTPUSER}:${FTPGROUP} ${D}/home/${FTPUSER}/pub
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+        # install proftpd pam configuration
+        install -d ${D}${sysconfdir}/pam.d
+        install -m 644 ${S}/contrib/dist/rpm/ftp.pamd ${D}${sysconfdir}/pam.d/proftpd
+        sed -i '/ftpusers/d' ${D}${sysconfdir}/pam.d/proftpd
+        # specify the user Authentication config
+        sed -i '/^MaxInstances/a\AuthPAM                         on\nAuthPAMConfig                   proftpd' \
+            ${D}${sysconfdir}/proftpd.conf
+    fi
 
     install -d ${D}/${systemd_unitdir}/system
     install -m 644 ${WORKDIR}/proftpd.service ${D}/${systemd_unitdir}/system
-- 
2.8.1


