Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7xa-00067y-Es
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:26:09 +0200
Received: by fg-out-1718.google.com with SMTP id d23so235584fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=DfBfmBO12JCKjVunvOrWM0t7yGjTVvZEozOc15ehVD4=;
	b=BJTH/uvBgEx3RCWOjJjQ3RQt7FxXtxjIZpDCyVlT/Am41cgvYB6owBAw+JTNKH/+sY
	UhvTpvtYoKNezlgFOcD4EP04n70M4T9z2MuwSHo6u8b49cifHASOiuD2H8fg1WmWAmMV
	kdYRnK0XARqkBJ6oUyfn3m/wGkw56lfR6EPII=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gMh0edrwxie+BJmjbd/tL6bvnpbT/dm3sm4QQxbjcsdhZf5Xh8PL+EHHI4+YQhV+bT
	ergmkfoDnli7RBFa5N/Lw/gMoyhgul4p2XXh3GfnjU/xUnMpdP1maUQKSlAdxOJeBwdt
	PloCHwv+phBvPCg9Bw0iPX7H8vrJX1qPyyYog=
Received: by 10.223.30.10 with SMTP id s10mr511324fac.4.1277468406195;
	Fri, 25 Jun 2010 05:20:06 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a3sm37855097fak.16.2010.06.25.05.20.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:20:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:19:39 +0200
Message-Id: <1277468383-16679-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/9] mesa: remove 7.4 release, which is not pinned in any distro/include config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jun 2010 12:28:45 -0000
X-List-Received-Date: Fri, 25 Jun 2010 12:28:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/mesa/mesa-dri_7.4.bb  |   27 ---------------------------
 recipes/mesa/mesa-xlib_7.4.bb |   24 ------------------------
 recipes/mesa/mesa_7.4.bb      |    2 --
 3 files changed, 0 insertions(+), 53 deletions(-)
 delete mode 100644 recipes/mesa/mesa-dri_7.4.bb
 delete mode 100644 recipes/mesa/mesa-xlib_7.4.bb
 delete mode 100644 recipes/mesa/mesa_7.4.bb

diff --git a/recipes/mesa/mesa-dri_7.4.bb b/recipes/mesa/mesa-dri_7.4.bb
deleted file mode 100644
index a78c03f..0000000
--- a/recipes/mesa/mesa-dri_7.4.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-include mesa-common.inc
-
-PROTO_DEPS = "xf86driproto glproto dri2proto expat"
-LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
-
-PR = "${INC_PR}.0"
-
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
-# ASUS EeePC 901 has DRI support so use mesa-dri by default
-DEFAULT_PREFERENCE_eee901 = "1"
-
-PACKAGES =+ "${PN}-xprogs"
-
-FILES_${PN} += "${libdir}/dri/*.so"
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
-
-EXTRA_OECONF += "--with-driver=dri --with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
-
-SRC_URI[archive.md5sum] = "7ecddb341a2691e0dfdb02f697109834"
-SRC_URI[archive.sha256sum] = "6e945389add4e5b41f2c403ced13c343767565f2eacde4b16de2d0f9f8a6aac4"
-SRC_URI[demos.md5sum] = "02816f10f30b1dc5e069e0f68c177c98"
-SRC_URI[demos.sha256sum] = "c3de74d62f925e32030adb3d0edcfb3c7a4129fc92c48181a389eeed8f14b897"
diff --git a/recipes/mesa/mesa-xlib_7.4.bb b/recipes/mesa/mesa-xlib_7.4.bb
deleted file mode 100644
index 68e7218..0000000
--- a/recipes/mesa/mesa-xlib_7.4.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-include mesa-common.inc
-
-PROTO_DEPS = "xf86driproto glproto"
-LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
-
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF += "--with-driver=xlib"
-
-PACKAGES =+ "${PN}-xprogs"
-
-FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
-
-do_install_append () {
-    install -d ${D}/${bindir}
-    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/${bindir}
-}
-
-SRC_URI[archive.md5sum] = "7ecddb341a2691e0dfdb02f697109834"
-SRC_URI[archive.sha256sum] = "6e945389add4e5b41f2c403ced13c343767565f2eacde4b16de2d0f9f8a6aac4"
-SRC_URI[demos.md5sum] = "02816f10f30b1dc5e069e0f68c177c98"
-SRC_URI[demos.sha256sum] = "c3de74d62f925e32030adb3d0edcfb3c7a4129fc92c48181a389eeed8f14b897"
diff --git a/recipes/mesa/mesa_7.4.bb b/recipes/mesa/mesa_7.4.bb
deleted file mode 100644
index 43cde67..0000000
--- a/recipes/mesa/mesa_7.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-# This is a dummy package so OE can use the poky mesa files
-require mesa-dri_${PV}.bb
-- 
1.7.0.2



