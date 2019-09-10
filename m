Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2F26010D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 09:58:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8A9wqhs008234
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 02:58:52 -0700 (PDT)
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 10 Sep 2019 02:58:51 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2019 17:58:24 +0800
Message-ID: <1568109504-17588-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568109504-17588-1-git-send-email-yi.zhao@windriver.com>
References: <1568109504-17588-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-webserver][PATCH 2/2] apache-websocket: fix module path
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
X-List-Received-Date: Tue, 10 Sep 2019 09:58:51 -0000
Content-Type: text/plain

The apache2 module's path has been changed from ${libdir} to
${libexecdir} in commit 8d4d608b4e937bb3b8e3b260bd75338c3ff7e8fd.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index c44efb6..3cbab22 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -25,9 +25,9 @@ EXTRA_OECONF = "APACHECTL=${STAGING_DIR_TARGET}${sbindir}/apachectl \
                 LIBTOOL=${STAGING_DIR_TARGET}${bindir_crossscripts}/${HOST_SYS}-libtool"
 
 do_install() {
-    install -d ${D}${libdir}/apache2/modules
-    install -m 755 ${B}/.libs/mod_websocket.so ${D}${libdir}/apache2/modules
+    install -d ${D}${libexecdir}/apache2/modules
+    install -m 755 ${B}/.libs/mod_websocket.so ${D}${libexecdir}/apache2/modules
 }
 
-FILES_${PN} += " ${libdir}/apache2/modules/* "
-FILES_${PN}-dbg += " ${libdir}/apache2/modules/.debug/* "
+FILES_${PN} += " ${libexecdir}/apache2/modules/* "
+FILES_${PN}-dbg += " ${libexecdir}/apache2/modules/.debug/* "
-- 
2.7.4


