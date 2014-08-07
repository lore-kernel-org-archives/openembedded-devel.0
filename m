Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1C7617B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 18:29:11 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so5462636wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 11:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aI1dHxK2kNDSomd0EwoDQK+QTOrz7rICc9tihEGt8L0=;
	b=utQp47NE3pII9XgDijgw1fg4CsM5Gm6Z63NW+mwtYK4PEvD6i/XymNCh7vxVV723vF
	zb9XIlPHXaxTiMeF4Sb31I7mASuGojUffrrZTg97CZkDcTSN5HGhf+QpkJjqruYZJWrt
	3kHc/E/ZVJElr+vdqtNbXaHzGzH+qvE0Edk7MAf/CedKPKLQdmIgnSfNTx+phPbkaap2
	aLsPxSJQU3TO6cOWU9BCE0wrUTKz4fTzgL7j+wuM+vQ92UzeCUa1GONF/DgTzNAsltkc
	pwKxs7Wkrdj0Iotsp5OQBP+17S1ZZoVJrn9YORVfPhevdEMo1r9LVEHBimv9NgYKE05p
	dk5A==
X-Received: by 10.180.12.239 with SMTP id b15mr58898420wic.75.1407436152166;
	Thu, 07 Aug 2014 11:29:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e3sm11621979wjp.4.2014.08.07.11.29.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 11:29:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Aug 2014 20:29:40 +0200
Message-Id: <1407436180-31498-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407424061-27768-1-git-send-email-eduardo@monkey.io>
References: <1407424061-27768-1-git-send-email-eduardo@monkey.io>
Subject: [meta-webserver][PATCHv3] monkey: new v1.5.2 release.
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
X-List-Received-Date: Thu, 07 Aug 2014 18:29:13 -0000

From: Eduardo Silva <eduardo@monkey.io>

This patch add the new Monkey HTTP Server v1.5.2. The new Bitbake file
contains the modifications suggested over the patch set for v1.5.1. It
specify each configuration file for CONFFILES_${PN}.

For more details about software changes please visit:

  http://monkey-project.com/Announcements/v1.5.2

=== Build Tests ==

This version and new Bitbake file have been tested on Yocto/Daisy being
packaged and deployed on images based on rpm and ipk successfully.

monkey-yocto/70d57bfd19c01ec055db57e35385ffc4185ae186

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../monkey/{monkey_1.5.1.bb => monkey_1.5.2.bb}    | 46 ++++++++++++++--------
 1 file changed, 30 insertions(+), 16 deletions(-)
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.1.bb => monkey_1.5.2.bb} (35%)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
similarity index 35%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
index 2de98f4..fcd40e0 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
@@ -11,20 +11,19 @@ SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
            file://monkey.service \
            file://monkey.init"
 
-SRC_URI[md5sum] = "2fe04135728f5c3a86c3a412059e0da3"
-SRC_URI[sha256sum] = "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757bfeb72edddf457e7"
-
-EXTRA_OECONF = " \
-             --plugdir=${libdir}/monkey/ \
-             --logdir=${localstatedir}/log/monkey/ \
-             --pidfile=${localstatedir}/run/monkey.pid \
-             --default-user=www-data \
-             --datadir=${localstatedir}/www/monkey/ \
-             --sysconfdir=${sysconfdir}/monkey/ \
-             --enable-plugins=* \
-             --disable-plugins=polarssl \
-             --debug \
-             --malloc-libc"
+SRC_URI[md5sum] = "c90ccba23a814265c7e0fd3a75f883fd"
+SRC_URI[sha256sum] = "2048d49662895f83df475e22d87c45ea8022c0b1565bba222bda2192fd02c349"
+
+EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
+                --logdir=${localstatedir}/log/monkey/ \
+                --pidfile=${localstatedir}/run/monkey.pid \
+                --default-user=www-data \
+                --datadir=${localstatedir}/www/monkey/ \
+                --sysconfdir=${sysconfdir}/monkey/ \
+                --enable-plugins=* \
+                --disable-plugins=polarssl \
+                --debug \
+                --malloc-libc"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
@@ -35,8 +34,23 @@ SYSTEMD_SERVICE_${PN} = "monkey.service"
 
 FILES_${PN} += "${localstatedir}/www/monkey/"
 
-# temporarily remove, because ipk doesn't allow directories in CONFFILES
-# CONFFILES_${PN} = "${sysconfdir}/monkey/"
+CONFFILES_${PN} = "${sysconfdir}/monkey/monkey.conf \
+                   ${sysconfdir}/monkey/sites/default \
+                   ${sysconfdir}/monkey/monkey.mime \
+                   ${sysconfdir}/monkey/plugins.load \
+                   ${sysconfdir}/monkey/plugins/proxy_reverse/proxy_reverse.conf \
+                   ${sysconfdir}/monkey/plugins/mandril/mandril.conf \
+                   ${sysconfdir}/monkey/plugins/fastcgi/fastcgi.conf \
+                   ${sysconfdir}/monkey/plugins/logger/logger.conf \
+                   ${sysconfdir}/monkey/plugins/cgi/cgi.conf \
+                   ${sysconfdir}/monkey/plugins/cheetah/cheetah.conf \
+                   ${sysconfdir}/monkey/plugins/dirlisting/dirhtml.conf \
+                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/header.theme \
+                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/footer.theme \
+                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/entry.theme \
+                   ${sysconfdir}/monkey/plugins/auth/README \
+                   ${sysconfdir}/monkey/plugins/auth/monkey.users \
+                   "
 
 do_install_append() {
 
-- 
2.0.4


