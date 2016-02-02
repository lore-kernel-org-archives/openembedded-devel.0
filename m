Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90FDA6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 16:51:21 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l66so3261771wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2016 08:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=X8BY5hFGSzUYv23/zZJl8x6wO1fhUG0kt0AX9AOIGI8=;
	b=iAwor21Fexg8fXkMIGG0snw8QJHhxmr6tTMk4Ey5CkDWVM/dIe57Lpvm8QaPGM8gcg
	j77ZBVXgoVBRQlLTlgUcDSw7UvwG0UwbWXYlIIber9borytVFp5MLwFpUWM9nRxhiHAc
	7Fhx7s+gKlrmcDk5QVk++/u7gMZgUwu6T/Gws=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=X8BY5hFGSzUYv23/zZJl8x6wO1fhUG0kt0AX9AOIGI8=;
	b=A8yhSM07WYfNCij9PeOh7wTEglQsaUV9cEG6e2148FIc9aK47GDjKyKHIERhXRvEmI
	6QMCWmr50z0rjFJhaqJ6b7z5pGDs3pY/IX/KE692iS/OaZRokzD9ZT29W92EAsixa80W
	KSEZV3c+TQwfAyFLirCLfa80KmtYURW3bVQiqhp0mecjbaJycbshNBAFvslBV5LX7Oh/
	cA+gwTQH8pXskMoHzyR5j9IUytaOc4Mqm6oZN0WNw7cnMsih8a6YX1vr76IXZlTLaFJl
	2tYRluThrlCLlKNgeGuS65mQq9txAYoVZFkoMzn+xanbCx219JqI/R4ZnnT3NwCBkpVN
	fWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=X8BY5hFGSzUYv23/zZJl8x6wO1fhUG0kt0AX9AOIGI8=;
	b=HiixHMhYb/Y7462FT4iMx2k3bfigI43ja93piRms5yKOtV+9NVZoObSYBJcGckQLs4
	Y/iM2sEmCn8G44BLsIUmOg5a2gZ3cdJujk9arjwrf09Ls7cyrrrw9Nh4pu6OM77gToS5
	Z5duW/hYmWgmsQkxix1Lg5X1lS++onXbgETTINIwg2DJ4LlGkMSxaz4kHj8pTrA0AvXO
	Qa3qv0uTM5194VvKH0qJgVTzzKN2l8EZfxmfm+MMeruVE/+/J/sYyelt7cZwi1hJR6Jy
	eOaQrGk4bZi22tlHZu4CmWVtTDi88ovgBhVf7K3BlaWYdP1/YcqJdlRIJDEsGIJ/i6Bw
	sxdA==
X-Gm-Message-State: AG10YOS+sxP/aPXsNk8CoVz/conCM9POBNlNbS6He7T0Jk5R+VmKv3/yLF+McOFzaGVODQ==
X-Received: by 10.194.92.147 with SMTP id cm19mr34378296wjb.32.1454431882078; 
	Tue, 02 Feb 2016 08:51:22 -0800 (PST)
Received: from 81fac7212798.vannes.iot. ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id
	bg1sm2343901wjc.27.2016.02.02.08.51.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Feb 2016 08:51:21 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Feb 2016 16:51:15 +0000
Message-Id: <1454431875-4239-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-multimedia][PATCH v2 1/2] gupnp: Update to 0.20.14
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
X-List-Received-Date: Tue, 02 Feb 2016 16:51:26 -0000

Update to latest version (required for latest Rygel).

As the unique executable provided by "gupnp-dev" cannot
work without python, switch from RRECOMMENDS to RDEPENDS
for it, and also be more precise in its required modules.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc        |    2 +-
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb |    8 --------
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb |    8 ++++++++
 3 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
index e23ba68..28e9b35 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -13,7 +13,7 @@ inherit autotools pkgconfig
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
 
-RRECOMMENDS_${PN}-dev = "python"
+RDEPENDS_${PN}-dev = "python-textutils python-xml"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
deleted file mode 100644
index c8c6164..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gupnp.inc
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c01aa6d3a78792b3a24591f036dd91f4"
-SRC_URI[sha256sum] = "205d47b950a1b7190df1115f454cb38a44d71aacfec75d4287299e400e139b69"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
new file mode 100644
index 0000000..ed07175
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
@@ -0,0 +1,8 @@
+require gupnp.inc
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "63346ef90ac5cd925c3a941f51d8bca6"
+SRC_URI[sha256sum] = "77ffb940ba77c4a6426d09d41004c75d92652dcbde86c84ac1c847dbd9ad59bd"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
1.7.10.4


