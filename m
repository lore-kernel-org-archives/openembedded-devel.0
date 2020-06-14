Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.27110.1592138260113541688
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2020 05:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OB9xKnfH;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id x1so14505215ejd.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2020 05:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m3YuHSnhvEqODbbdboF+7SKdrq/6+VOOwSxfDjZK/SM=;
        b=OB9xKnfHxRqHGhLE2Zevy+TbvA8mV5+22RWqWIgaSWjr1BU3jJM92G1KEzKdXUzJso
         mXy+2kiNGj69Ulqo1ktLIdV4nmim4qWmGl8hz/uL0k/S4YVR+GsjqdsiIkRtxh3Z4Oll
         ecB8/NyyMWPbcijutAPpd2qxfAi3Nt7Wwfj0yBDr3vmoZqa0mmHX8dTHVn7YuPrutJt7
         qReiguFZXWyKYzkGq0LqGssSHt+ADEZsS71/VLba7Lsvzs0/74np+z1rBna7x+9YArxT
         slK4gxHLr/hQoV55vTs/dnuJuhnKR2v3ayxpT+L3b+wvOdiryfapKaSb7/P4W4lj2Mvr
         PcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m3YuHSnhvEqODbbdboF+7SKdrq/6+VOOwSxfDjZK/SM=;
        b=jvhFhd7aYbLryUy8ruTWAl3ELz9D1EanusQlAcMvgYBlsOQMD8YcCdTCJMrrKHHbYZ
         dThIhJpqSdbSDcqvAkpCyjMXHNeQiaOb3md3aibvyzqFY05H2kh1TqRevcIbR7E3KntO
         3qDxS371jTDxbUyW+Fpyjr+IbnCm5kNwisDp0I0YZgooV9vctt56yRbkK0HOW6+5VOdp
         GFsMJSDc+jOH5gepyyMrF+KyQthk8okKxBq9KaibxhgR9KdXs1WMUfD09E7nXhdEpC7e
         4/lEqcgDaDkk33dYW9kqSQAh8pI86wE4neIi/bDM6XS+RNbFFyFEkxngLAvSRyndapVx
         OP5A==
X-Gm-Message-State: AOAM532MAwvUzShdO2iOmm/7XNzmXKZA1pIuNOm2jVMcGXuSzKT9v9FX
	s+6Eul71kFxboWRnGYOm78ct8c8b
X-Google-Smtp-Source: ABdhPJwXx8XJ/KBICoOMEtLYt+q8gEPN7/yTLW3I5gpwV6yUu0LwNv+Koaf2ldrhleDfOloHrFVMCA==
X-Received: by 2002:a17:906:2dc7:: with SMTP id h7mr22037945eji.15.1592138258209;
        Sun, 14 Jun 2020 05:37:38 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fw16sm7076802ejb.55.2020.06.14.05.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 05:37:37 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] ace: fix installation paths when usrmerge is used
Date: Sun, 14 Jun 2020 14:37:34 +0200
Message-Id: <20200614123734.2396875-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* INSTALL_LIB is used after INSTALL_PREFIX and in usrmerge case the /usr prefix is duplicated twice, because
  export exec_prefix="/usr"
  export base_libdir="/usr/lib"
  use baselib which is without the exec_prefix/base_prefix from root_prefis:
  #     "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}', '${base_prefix}', d)}"
  root_prefix="/usr"
  baselib="lib"
* fixes:
ERROR: ace-6.5.8-r0 do_package: QA Issue: ace: Files/directories were installed but not shipped in any package:
  /usr/usr/lib/libACE.so
  /usr/usr/lib/libACE_Compression.so.6.5.8
  /usr/usr/lib/libACE_ETCL_Parser.so.6.5.8
  /usr/usr/lib/libACE.so.6.5.8
  /usr/usr/lib/libACE_RLECompression.so.6.5.8
  /usr/usr/lib/libACE_Compression.so
  /usr/usr/lib/libACE_ETCL_Parser.so
  /usr/usr/lib/libACE_Monitor_Control.so.6.5.8
  /usr/usr/lib/libACE_ETCL.so
  /usr/usr/lib/libACE_RLECompression.so
  /usr/usr/lib/libACE_Monitor_Control.so
  /usr/usr/lib/libACE_ETCL.so.6.5.8
  /usr/usr/lib/pkgconfig
  /usr/usr/lib/pkgconfig/ACE.pc
  /usr/usr/lib/pkgconfig/ACE_ETCL_Parser.pc
  /usr/usr/lib/pkgconfig/ACE_ETCL.pc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
ace: 16 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/ace/ace_6.5.8.bb           | 2 ++
 meta-oe/recipes-connectivity/ace/files/ace_config.patch | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb
index 24315320e4..e35bce7f3c 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb
@@ -24,6 +24,8 @@ inherit pkgconfig
 
 CXXFLAGS_append = " -fpermissive -Wnodeprecated-declarations"
 
+EXTRA_OEMAKE += "INSTALL_LIB=${baselib}"
+
 do_install() {
     export D="${D}"
     oe_runmake install
diff --git a/meta-oe/recipes-connectivity/ace/files/ace_config.patch b/meta-oe/recipes-connectivity/ace/files/ace_config.patch
index 207b85ab9c..1b8e218658 100644
--- a/meta-oe/recipes-connectivity/ace/files/ace_config.patch
+++ b/meta-oe/recipes-connectivity/ace/files/ace_config.patch
@@ -6,7 +6,6 @@ diff -ruN ACE_wrappers1/ace/config.h ACE_wrappers/ace/config.h
 diff -ruN ACE_wrappers1/include/makeinclude/platform_macros.GNU ACE_wrappers/include/makeinclude/platform_macros.GNU
 --- ACE_wrappers1/include/makeinclude/platform_macros.GNU	1970-01-01 02:00:00.000000000 +0200
 +++ ACE_wrappers/include/makeinclude/platform_macros.GNU	2018-10-31 15:11:18.265392460 +0200
-@@ -0,0 +1,3 @@
+@@ -0,0 +1,2 @@
 +INSTALL_PREFIX = $(D)$(exec_prefix)
-+INSTALL_LIB = $(base_libdir)
 +include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU
-- 
2.25.1

