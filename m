Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 374B77D8DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:40:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3F3eAqX028613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 20:40:10 -0700 (PDT)
Received: from localhost (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 14 Apr 2019 20:40:09 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Apr 2019 11:39:39 +0800
Message-ID: <1555299579-31574-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555299579-31574-1-git-send-email-yi.zhao@windriver.com>
References: <1555299579-31574-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.192]
Subject: [meta-webserver][PATCH 2/2] apache-websocket: upgrade to latest git rev
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
X-List-Received-Date: Mon, 15 Apr 2019 03:40:09 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-httpd/apache-mod/apache-websocket_git.bb           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index 0beb3ed..c44efb6 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Websocket module for Apache web server"
 DESCRIPTION = "Process requests using the WebSocket protocol (RFC 6455)"
-HOMEPAGE = "https://github.com/jchampio/${PN}/"
+HOMEPAGE = "https://github.com/jchampio/apache-websocket/"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
@@ -13,9 +13,9 @@ RDEPENDS_${PN} += "apache2"
 # fork contains patches from the modules ML and fixes CVE compliance issues
 SRC_URI = "git://github.com/jchampio/apache-websocket.git"
 
-SRCREV = "f5230d8c520dccf8631da94bf90c23f3c1100dcc"
+SRCREV = "6968083264b90b89b1b9597a4ca03ba29e7ea2e1"
 
-PV = "0.1.1"
+PV = "0.1.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -25,8 +25,8 @@ EXTRA_OECONF = "APACHECTL=${STAGING_DIR_TARGET}${sbindir}/apachectl \
                 LIBTOOL=${STAGING_DIR_TARGET}${bindir_crossscripts}/${HOST_SYS}-libtool"
 
 do_install() {
-    install -d ${D}${libdir}/apache2/modules/
-    install ${B}/.libs/mod_websocket.so ${D}${libdir}/apache2/modules/
+    install -d ${D}${libdir}/apache2/modules
+    install -m 755 ${B}/.libs/mod_websocket.so ${D}${libdir}/apache2/modules
 }
 
 FILES_${PN} += " ${libdir}/apache2/modules/* "
-- 
2.7.4


