Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.20591.1621846560911526708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 01:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lNZ6Pw/z;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id n2so27775747wrm.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hzf1TgKTqJZjBC5/vmER2bpNdGXQGDYlMjwLMX3vC34=;
        b=lNZ6Pw/zwaC5SW0A5YbOocNO9fsjycRE9yuU47p7ZQ6NOPAvedZmmnYX/uNN2rzvda
         seZswUlCL/jutyMUyAfg8zcg3S1YmGtYydRmLKJ+UltSXvG/mj/rnTik8FM/OCud79DG
         KbVY6HyU1rHqiWjCZKU1c7gLLCwy9dwREObDLOzCdUM4CS9j+g2Y/1KE6dFfnB0O1UTX
         PksAlPmbDGlWohn81AwdgPfEKhESJUaU04+iF+kZATk7Z9tpyjJJe9DTXb/PMD5ifdJs
         ZXsADYGG3xLQXrImxv6C4PMRxVuXvmkO7PrQkm2N1zLW31IctrOvzuYQo+9YAoHD4GNF
         xdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hzf1TgKTqJZjBC5/vmER2bpNdGXQGDYlMjwLMX3vC34=;
        b=oGfl9S3cdphYo7vYwzMD+oL2/HifiCWVupc5QOYHbJ+zeXXbho6isGGmMX7p0bU1Bj
         dYdxGiitgW4UFwM5Tag5FkVnmPAMfvC3X3R4ArF994xBHSVV4rBGHyN7u23vfZ/H8gzC
         bBw89tarAvgjDXg4RTvf2I5mQUAciKt/dtW2FJDH2i0lA69C26LXz2Ir12wlE+9hp+qG
         TIfMQONp/69qrqLLDbGYnTpWlvpAacd7TrvNG/dUu0VGVXnjmQwhQb4CDh3U+O5uA+6n
         dp7ttEidU6myc8ldIVpz6AHTKLQp7Adi3TNnZesjqFoGSCtTjNlCAIjR8lNA5A/w3uW3
         yuRw==
X-Gm-Message-State: AOAM531vgj0Kbf+/T2cNupMWHU79JUF9TvpGUS6yvXsK4cVixG5G6HiE
	obnYVQrhkObCSnJRgYh3yeNCD0L4f3s=
X-Google-Smtp-Source: ABdhPJw+6XArBrD1kGZQ/8xy3IFzRC7dB4wNTvrOxANSbImm1OHBRJ8wBhPYh8/dE6aofxX6IIaQ8A==
X-Received: by 2002:a5d:4351:: with SMTP id u17mr20662692wrr.47.1621846559535;
        Mon, 24 May 2021 01:55:59 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i1sm11397685wrp.51.2021.05.24.01.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 01:55:59 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] libtinyxml2: restore building shared library
Date: Mon, 24 May 2021 10:55:54 +0200
Message-Id: <20210524085554.4128366-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524085554.4128366-1-Martin.Jansa@gmail.com>
References: <20210524085554.4128366-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* since the upgrade to 8.1.0 which includes:
  https://github.com/leethomason/tinyxml2/commit/7df6b3ff4ab3e3cec7a242fa5f8749decd129e13
  it no longer produces shared libraries by default and linking
  with static one will often fail, e.g.:

  rosbag2-storage/0.2.4-1-r0/recipe-sysroot/usr/lib/libtinyxml2.a(tinyxml2.cpp.o): relocation R_ARM_THM_MOVW_ABS_NC against `_ZN8tinyxml210XMLPrinter11CompactModeERKNS_10XMLElementE' can not be used when making a shared object; recompile with -fPIC
  rosbag2-storage/0.2.4-1-r0/recipe-sysroot/usr/lib/libtinyxml2.a(tinyxml2.cpp.o)(.text+0x162): unresolvable R_ARM_THM_CALL relocation against symbol `vfprintf@@GLIBC_2.4'

  fastrtps/1.9.3-2-r0/recipe-sysroot/usr/lib/libtinyxml2.a(tinyxml2.cpp.o): relocation R_ARM_THM_MOVW_ABS_NC against `_ZN8tinyxml210XMLPrinter11CompactModeERKNS_10XMLElementE' can not be used when making a shared object; recompile with -fPIC
  fastrtps/1.9.3-2-r0/recipe-sysroot/usr/lib/libtinyxml2.a(tinyxml2.cpp.o)(.text+0x162): unresolvable R_ARM_THM_CALL relocation against symbol `vfprintf@@GLIBC_2.4'

  fastrtps-native/1.9.3-2-r0/recipe-sysroot-native/usr/lib/libtinyxml2.a(tinyxml2.cpp.o): relocation R_X86_64_PC32 against symbol `_ZN8tinyxml27StrPair5ResetEv' can not be used when making a shared object; recompile with -fPIC

* restore building shared library as 8.0.0 did

* it also fixes PN package being empty:

    diff --git a/packages/core2-64-webos-linux/libtinyxml2/libtinyxml2/latest b/packages/core2-64-webos-linux/libtinyxml2/libtinyxml2/latest
    index 594585fe..496a109d 100644
    --- a/packages/core2-64-webos-linux/libtinyxml2/libtinyxml2/latest
    +++ b/packages/core2-64-webos-linux/libtinyxml2/libtinyxml2/latest
    @@ -1,9 +1,8 @@
    -PV = 8.0.0
    +PV = 8.1.0
     PR = r0
    -PKG = libtinyxml2-8
    -RPROVIDES = libtinyxml2 (=8.0.0)
    -RDEPENDS = glibc (>= 2.33) libgcc (>= 11.1.0) libstdc++ (>= 11.1.0)
    +RPROVIDES =
    +RDEPENDS =
     RRECOMMENDS = libtinyxml2-lic
    -PKGSIZE = 90076
    +PKGSIZE = 0
     FILES = /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /etc /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev /usr/lib/udev /lib/udev /usr/lib/udev /usr/share/libtinyxml2 /usr/lib/libtinyxml2/* /usr/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers
    -FILELIST = /usr/lib/libtinyxml2.so.8 /usr/lib/libtinyxml2.so.8.0.0
    +FILELIST =

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
index fea5aeff17..5245059a89 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
@@ -13,3 +13,5 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 BBCLASSEXTEND = "native"
+
+EXTRA_OECMAKE += "-Dtinyxml2_SHARED_LIBS=YES"
-- 
2.30.2

