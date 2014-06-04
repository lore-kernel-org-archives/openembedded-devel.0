Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2426ABDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:18:19 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so8288869wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ToHXLeSMq2+RSHZYfnyfkLDSVLeL+Wk/4tVZlbJ9Hwk=;
	b=sKAD7WM9yzizQdz81U/txNJXhBZNZU+pBmtaj/wiH8/WUpPFiGQ6WwNLKOuJTqEMxb
	rweDOpSPeftS3VO0gu7xFPqVmUBdQkYOCivMseEGa/CO+6ulf9YqOc/FL6bZeh8occSR
	wORDDZuNJm9mLwzjKH+ioHHcsw0CLI1SnkAzcKx3Qdy6jFPaFn7QU45rxHEPcPPza0xr
	81d1wvTIMaDT7QdJZF4ZhCuDyDMALOBx+fXr8+XLZJy6SuWP780R/IqeTyViGQhSzgDr
	42fuA7gwZ888KqO4y3edBuadPl3WjuVR0TYFKs9UT8qy2D/1U7lEqTuMPnllGletb/6r
	jsSg==
X-Received: by 10.180.221.229 with SMTP id qh5mr3203781wic.33.1401873500491;
	Wed, 04 Jun 2014 02:18:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b19sm8571316wic.5.2014.06.04.02.18.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:18:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:18:23 +0200
Message-Id: <1401873504-32120-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/7] efl: use luajit by default
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
X-List-Received-Date: Wed, 04 Jun 2014 09:18:22 -0000

* lua-old is less tested and supported by upstream and luajit
  seems to work OK with 1.10.0
* luajit will be hard dependency with elua

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 752e3b7..deca4bf 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -44,8 +44,8 @@ EXTRA_OECONF_append_class-native = " \
     --disable-image-loader-xpm \
 "
 
-PACKAGECONFIG ?= "opengl-es gstreamer1 pulseaudio lua-old"
-PACKAGECONFIG_class-native = "lua-old"
+PACKAGECONFIG ?= "opengl-es gstreamer1 pulseaudio luajit"
+PACKAGECONFIG_class-native = "luajit"
 
 # sort of tri-state
 PACKAGECONFIG[opengl-full] = "--with-opengl=full,,virtual/libgl"
@@ -55,14 +55,8 @@ PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer"
 PACKAGECONFIG[gstreamer1] = "--enable-gstreamer1,--disable-gstreamer1,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-# we don't have luajit-native now, so use old lua for -native and
-# for target it's also currently failing with luajit
-# | /OE/build/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/core2-64-oe-linux/gcc/x86_64-oe-linux/4.8.2/ld: /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libluajit-5.1.a(lj_err.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
-# | /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libluajit-5.1.a: error adding symbols: Bad value
-# | collect2: error: ld returned 1 exit status
-# | Makefile:12007: recipe for target 'lib/edje/libedje.la' failed
 PACKAGECONFIG[luajit] = "--disable-lua-old,--enable-lua-old,luajit"
-PACKAGECONFIG[lua-old] = "--enable-lua-old,--disable-lua-old,lua5.1"
+PACKAGECONFIG[lua-old] = "--enable-lua-old,--disable-lua-old,lua"
 
 # new efl doesn't have option to disable eeze build and we don't want to provide udev-native just to build eeze-native we don't need
 do_configure_prepend_class-native() {
-- 
2.0.0


