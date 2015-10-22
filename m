Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5728760088
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 20:10:02 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so4483050wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=1WW6mKR3OXGOIESXQfkyMEhnGCY4jaJRbkQQuO9PCHg=;
	b=MX7MCxL2RqHTjNN/SjXWKbCEsWey+ndwt/Dt2NfnsbXXD9aVmnj60pNGVrLlqBueO8
	nr1NsdtRBOo2ESpoHlNRhf6s4Z+BIZ3RyDmJuuj1Fy+6Hm5X9J5ZTvwaJbF0815Vv6fs
	UGD5cfSZnjPyybp8Ep5bs5Ru8MBpZclHQ8ty0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=1WW6mKR3OXGOIESXQfkyMEhnGCY4jaJRbkQQuO9PCHg=;
	b=amxOaT3y6QeuZLojOs7Ao9LCVpZV2C0/ZxhwZH5qwjhGqfzJkVsM85G6YuyiLZs1lT
	qN4vWbnjtBF58US9HsA+ekhY0Y+3BBzY1Xw9V7kY/2r4uY83gD34Ral83arOwm9NCZ3N
	Nfcn6X3JfqaQhtHvqSrpsnqXYR6dS9zukzfN7Z01+nE3qTCzDpV07BGStH45HDdB52Z9
	g/Xg5vTdJzxYzwuGmyirowQIPBg7KNRjxt7w5uEWJWn5jKw4AFd6xBpGBmKXTMbrXckS
	b6SWnok/tpgEb5kS+B3WSCL5GBKHUzHthXusJZA4yVhwMru2Upzlne9VdPHEozUxDftV
	NAkA==
X-Gm-Message-State: ALoCoQkM5EdN3ux9eNre/L1h8B/nk3m1BEvJ61k4GTSO8kc/yg6Lq8mm3VslLFYmndQhn8uhBWD1
X-Received: by 10.194.19.134 with SMTP id f6mr250747wje.133.1445544602354;
	Thu, 22 Oct 2015 13:10:02 -0700 (PDT)
Received: from localhost.localdomain ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id
	ee5sm18776551wjd.17.2015.10.22.13.10.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Oct 2015 13:10:01 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2015 22:09:39 +0200
Message-Id: <1445544579-4198-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][meta-multimedia] vlc: fix freerdp module build
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
X-List-Received-Date: Thu, 22 Oct 2015 20:10:03 -0000

Since we are building "freerdp" again, build can now fail
due to reliance on removed APIs. For instance :
http://errors.yoctoproject.org/Errors/Details/20603/

Fix this by conditionally building the module, and if we
build it, patching the code until the fix gets merged
upstream.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc        |  1 +
 .../vlc/vlc/0009-fix-rdp-module.patch                 | 19 +++++++++++++++++++
 meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb   |  3 ++-
 3 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0009-fix-rdp-module.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 41b5df9..ee90ac8 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -57,6 +57,7 @@ PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
 PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
+PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0009-fix-rdp-module.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0009-fix-rdp-module.patch
new file mode 100644
index 0000000..8e554a9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0009-fix-rdp-module.patch
@@ -0,0 +1,19 @@
+--- a/modules/access/rdp.c	2015-10-22 19:42:24.447445250 +0000
++++ b/modules/access/rdp.c	2015-10-22 19:42:46.570445248 +0000
+@@ -428,8 +428,6 @@
+     if ( p_sys->f_fps <= 0 ) p_sys->f_fps = 1.0;
+     p_sys->i_frame_interval = 1000000 / p_sys->f_fps;
+ 
+-    freerdp_channels_global_init();
+-
+     p_sys->p_instance = freerdp_new();
+     if ( !p_sys->p_instance )
+     {
+@@ -504,7 +502,6 @@
+ 
+     freerdp_disconnect( p_sys->p_instance );
+     freerdp_free( p_sys->p_instance );
+-    freerdp_channels_global_uninit();
+ 
+     if ( p_sys->p_block )
+         block_Release( p_sys->p_block );
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
index ba8ca4b..fa9d11a 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
@@ -9,8 +9,9 @@ SRC_URI += "file://0001-enable-subdir-objects.patch \
             file://0004-modules-gui-qt4-out-of-tree-build.patch \
             file://0005-libpostproc-header-check.patch \
             file://0006-make-opencv-configurable.patch \
-	    file://0007-use-vorbisidec.patch \
+            file://0007-use-vorbisidec.patch \
             file://0008-fix-luaL-checkint.patch \
+            file://0009-fix-rdp-module.patch \
 "
 
 SRC_URI[md5sum] = "42273945758b521c408fabc7fd6d9946"
-- 
1.8.3.1


