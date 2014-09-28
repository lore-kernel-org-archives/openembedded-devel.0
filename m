Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8486FE10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 07:53:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8S7rHWT015819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 00:53:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 28 Sep 2014 00:53:16 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 28 Sep 2014 15:54:04 +0800
Message-ID: <1411890845-30154-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] vsftpd: fix pkg_postinst
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
X-List-Received-Date: Sun, 28 Sep 2014 07:53:25 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix pkg_postinst to not exit if "$D" is not empty.
Otherwise, postinsts from update-rc.d.bbclass would not run and the
symlinks under /etc/rc?.d/ would not be created.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-daemons/vsftpd/vsftpd_3.0.2.bb         |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
index a1c4ff4..07c73c5 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
@@ -88,12 +88,11 @@ USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g ftp
 GROUPADD_PARAM_${PN} = "-r ftp"
 
 pkg_postinst_${PN}() {
-	if [ -n "$D" ]; then
-		exit 0
-	fi
+    if [ -z "$D" ]; then
 	if type systemd-tmpfiles >/dev/null; then
-		systemd-tmpfiles --create
+	    systemd-tmpfiles --create
 	elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
-		${sysconfdir}/init.d/populate-volatile.sh update
+	    ${sysconfdir}/init.d/populate-volatile.sh update
 	fi
+    fi
 }
-- 
1.7.9.5


