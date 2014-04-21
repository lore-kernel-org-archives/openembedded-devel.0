Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7199165D2B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 05:53:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3L5rVud024718
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 22:53:31 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Apr 2014 22:53:30 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 01:53:27 -0400
Message-ID: <751e6bee2f8bcfd9c78ad2b03a9f8b007abe028a.1398058983.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398058983.git.wenzong.fan@windriver.com>
References: <cover.1398058983.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] vsftpd: fix install warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Apr 2014 05:53:34 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

WARNING: QA Issue: vsftpd: Files/directories were installed but not shipped
  /run
  /run/vsftpd
  /run/vsftpd/empty

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
index 0698a63..2cf9ac3 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
@@ -70,7 +70,6 @@ do_install() {
         sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
         sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
     fi
-    install -d ${D}${localstatedir}/run/vsftpd/empty
 }
 
 INITSCRIPT_PACKAGES = "${PN}"
@@ -82,3 +81,11 @@ USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g ftp
                        --shell /bin/false ftp "
 GROUPADD_PARAM_${PN} = "-r ftp"
 
+pkg_postinst_${PN}() {
+	if [ -n "$D" ]; then
+		exit 0
+	fi
+	if [ -e /etc/init.d/populate-volatile.sh ]; then
+		/etc/init.d/populate-volatile.sh update
+	fi
+}
-- 
1.7.9.5


