Return-Path: <eduardo@monkey.io>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8396FC5F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 23:39:16 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id lf12so1530376vcb.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 16:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=udL9h24XX9HyHSt+5UqY2JoeoSVSSY370Nnx2YNvEeg=;
	b=jxH1mfvSgXWwEp1Lz9Jnu2c5z5UbJ/S729OxySI4zBbWHDaep59uLda6ErkjDtiggc
	1H/+/X2f6iXezaXpQE+DF3ZhVH1WvSn46GH/caYB2xx1gbMAWQYjJlyKB87hTnqqtcXK
	RrLRYDgHT3LORRGGly5A89C2JbKiviNfRuckJ7bNtXtvXsoxBJMrW0ujfOd2gNsdSL+f
	suvu9zq7ySOAyzqPJlUei49TWT2jXNveYFLygHUITiA2mCyXLoqgVS1qzh2rNfCpwD4X
	hhhEJ53cdtDizX8/oB6v6THscf3U8j2OHjLQjmtx6l4szt2wfNtk8PWbhDlvCqfscKjd
	xkdg==
X-Gm-Message-State: ALoCoQlxPPYjb+67lzrGydHxp1elT1xH0qCNa0G06ks70SUDYxac2w03VdjzmKncTB8cb6feOekk
X-Received: by 10.52.163.161 with SMTP id yj1mr582978vdb.35.1403134757785;
	Wed, 18 Jun 2014 16:39:17 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id 5sm6768647vde.27.2014.06.18.16.39.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jun 2014 16:39:17 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jun 2014 17:39:02 -0600
Message-Id: <1403134742-29428-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [PATCHv3] monkey: new v1.5.1 release.
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
X-List-Received-Date: Wed, 18 Jun 2014 23:39:24 -0000

This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fixes
some problems when switching user when started as root.

monkey/yocto: 3163d01492ea3d85268dc3773419e94db57ee8df

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/monkey_1.5.0.bb           | 36 ----------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
deleted file mode 100644
index 6fa1b77..0000000
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Fast and Lightweight HTTP Server for Linux"
-HOMEPAGE = "http://monkey-project.com"
-BUGTRACKER = "https://github.com/monkey/monkey/issues"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-
-SECTION = "net"
-
-SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
-SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
-SRC_URI[sha256sum] = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
-
-EXTRA_OECONF = " \
-             --plugdir=${libdir}/monkey/ \
-             --logdir=${localstatedir}/log/monkey/ \
-             --pidfile=${localstatedir}/run/monkey.pid \
-             --default-user=www-data \
-             --datadir= ${localstatedir}/www/monkey/ \
-             --sysconfdir=${sysconfdir}/monkey/ \
-             --enable-plugins=* \
-             --disable-plugins=polarssl \
-             --debug \
-             --malloc-libc \
-"
-
-inherit autotools-brokensep pkgconfig update-rc.d systemd
-
-INITSCRIPT_NAME = "monkey"
-INITSCRIPT_PARAMS = "defaults 70"
-
-SYSTEMD_SERVICE_${PN} = "monkey.service"
-
-FILES_${PN} += "${localstatedir}/www/monkey/"
-
-CONFFILES_${PN} = "${sysconfdir}/monkey/"
-- 
1.9.1


