Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11755.1795762846450072763
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TiWGQDMX;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f06ff94acfso34740685ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762846; x=1796367646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEVvQ7CbbUDAPLZfZ5Rythg3b8vkoYQzDYSqNS7tkMM=;
        b=TiWGQDMX9G3tH04X3pAGGWwvl38qDHopkwyQgub7uonyqVqo+VVBX+0TaS2Ylmt1vl
         S98NzuKFEG7zn/9idfC5X4iyEXLqWrwMP5px7Gy70lb+CQMI182V9YCc9DPS3+Iv3H3v
         GzpJXJ9Zc1nOtOBNQoRf/i4rgeTGS1HneHaguhah1iSVcQRGIzEzS4nPKzO6lP2PFPmj
         vYAQxs+2jYc4kmyjKh1sRhGglUCY65msY1iRKwmgNYO/Oz6nC6Un9+JwEFy+R5maSoy/
         mIbOMoucMKODRctMujeaspo9Y4eiXoAnB14Dek/NcnF5gU5Q6dTc83rtwqWP4zlH+tmS
         qpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762846; x=1796367646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEVvQ7CbbUDAPLZfZ5Rythg3b8vkoYQzDYSqNS7tkMM=;
        b=REA7z/6vQqFSh5BuCFY+EnZNFmR4w97pEsqVNi+KyBT36q+hR1IX3ptsKbLMEwe8Mf
         nT3lndinGgJqYbH/P5GIP57uVao/NWXtTKskApGmF/7aXiVIVSIWHhxnRc2OdtQmsyzk
         Xge0Qs+24txxMw52ojRb34fMhgN0cicIZPswhZG3+f6JkKV7JshoQeYcmFARPkDNYipm
         kaHTl9nms1nqO6gli5PssgmBfPEFwaMsbYjA/YWdFP9tVQq1D0iJxgiQYjXh3uSnJgkh
         GbHzS45OYSW0SaHnm620vEaA+4Y6jLPfQKrczvXUzm4MawFaHFv5N+ch8/G5P7lLCpiZ
         vYOA==
X-Gm-Message-State: APuU4Z9yy3pjvy6KLE/AikRjPHHAVy5mOnhD70yPDgLYUxOcyQTC1H45
	Eu43ErakD3dMgDJ/smiYVnqudK3ty88UgVdtGgnpQVjPT5M+QAlxM/O1zfrdaA==
X-Gm-Gg: AZFdTZdRpDw9tmztknieVcrKfV3CrI8WA7pQH4yO3Wmkt63dySHrIxtYJA653N5udF7
	GCDdoaUwCiTx7lmA99xt7qkPlacBl1XgKngKRCGKgdFkv8cF2zFrHEFnqXPSk4P5C4vOhIfoepM
	aB/pxb+stG+wDB/NEPa5lWUUMO1hkpTBbqbN2GGk8Pu6xrfnZVHP9jr8DHzsx6a22FbA6YpIK3j
	GFDC8Tpsu4I/Eb+E63Gocv/dv6jExZcWRDCgXsCEj0S3p+VfpXs04i4WrrhaApqz76ivXga6T56
	ViM3QZGxKwe6weUCUNtwQHix3hEeJJv041JTXSrvAErWL7GTgfx5A0vVgTpBxLi4GqiAXlwq1ZK
	H5O6/KCmiDGjDgadLWIxY6E4SZLBteoL80CYEhoiZJM52HLmzwzRMverKhJQ1fXQqsvfxLmiRPh
	wLZQAETjNWhpuJEXS8wqmSgnbgoj41+Rc/Ln2A4jiCI/r9FHRYCwzIhzmpbm6aJsI4lKfUcre48
	IQ8k4ZZwDcMS5tJdGfAwe0uSj5G8cWIIqpY/EH6ElxZPIBNf5KBCJ9JNymdRrRp2y4Tao6eTp+o
	rZDHUr6qiBsSCy99lopR29egxRJTEBUvI19EMxGjL/dpckyTg4rarS0OkD5iv6Euzj1yQichUwI
	DAWa47F82LguF94XF22R02SVessUSRvvo5lC0pT4jSLCVJRJWvE2POja3rpcK4URYZ2m5vid0LY
	qojBEoWxErxSSythEerXsZ0bwg/KUt1wq8Y5A3VpJx7utWIQlzY/DdK0s0No28Ei0wjH+HmGwlx
	hN/qBxw8ljSFIJWwnZvOYaOJuWu0PmmM5d0rFHYezmptlH6rmdEkfWJDf+n9i2MV1FZ16D49Bor
	JezM
X-Received: by 2002:a17:902:ec8b:b0:2f0:20cc:32fd with SMTP id d9443c01a7336-2f03f17e8acmr204719655ad.51.1795762845270;
        Thu, 26 Nov 2026 23:00:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm113719395ad.71.2026.11.26.23.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:00:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 13/15] libtevent: upgrade 0.17.2 -> 0.17.3
Date: Thu, 26 Nov 2026 23:00:36 -0800
Message-ID: <20261127070038.2221538-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
References: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133302
Content-Type: text/plain; charset="utf-8"

- Fix handling of an immediate event handler that frees the
  tevent_context: running immediate events are tracked so the context
  destructor can reset their detach context and emit the DETACH trace
- Updated waf/wafsamba build infrastructure (ABI version script
  handling for linkers such as mold, _Static_assert and
  HAVE_PACKETSOCKET checks in libreplace)

The public API is unchanged (tevent.h is identical) and samba 4.25.1
only requires tevent >= 0.17.2, so the system library is still used.
Refresh 0001-Add-configure-options-for-packages.patch, whose lib/replace
context moved. Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...1-Add-configure-options-for-packages.patch | 29 ++++++++-----------
 ...ibtevent_0.17.2.bb => libtevent_0.17.3.bb} |  5 +++-
 2 files changed, 16 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.17.2.bb => libtevent_0.17.3.bb} (90%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
index 7fdeec61f4..c6a01b2128 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
@@ -27,16 +27,13 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 Rebase to 0.16.0
 Remove libaio option
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Rebase to 0.17.3
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- lib/replace/wscript | 100 +++++++++++++++++++++++++++++++-------------
- wscript             |   6 +++
- 2 files changed, 77 insertions(+), 29 deletions(-)
-
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 77e655b..452c741 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -25,6 +25,34 @@ def options(opt):
+@@ -25,6 +25,34 @@
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -71,9 +68,9 @@ index 77e655b..452c741 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -38,12 +66,24 @@ def configure(conf):
-     conf.DEFINE('HAVE_LIBREPLACE', 1)
-     conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
+@@ -59,12 +87,24 @@
+                     strict=True, # -Werror
+                     msg='Checking for _Static_assert')
  
 -    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl.h compat.h')
 -    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.h dustat.h')
@@ -98,7 +95,7 @@ index 77e655b..452c741 100644
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
      conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
-@@ -113,8 +153,9 @@ def configure(conf):
+@@ -134,8 +174,9 @@
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -110,7 +107,7 @@ index 77e655b..452c741 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -443,31 +484,32 @@ def configure(conf):
+@@ -464,31 +505,32 @@
  
      strlcpy_in_bsd = False
  
@@ -136,9 +133,6 @@ index 77e655b..452c741 100644
 -        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS('setproctitle_init'):
 -        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
--
--    if not conf.CHECK_FUNCS('closefrom'):
--        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
 +    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
@@ -162,17 +156,18 @@ index 77e655b..452c741 100644
 +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('setproctitle_init'):
 +            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
-+
+ 
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
  
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index d912a8a..484a6fa 100644
 --- a/wscript
 +++ b/wscript
-@@ -28,6 +28,12 @@ def options(opt):
+@@ -28,6 +28,12 @@
      opt.RECURSE('lib/replace')
      opt.RECURSE('lib/talloc')
  
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.17.2.bb b/meta-networking/recipes-support/libtevent/libtevent_0.17.3.bb
similarity index 90%
rename from meta-networking/recipes-support/libtevent/libtevent_0.17.2.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.17.3.bb
index 4484c7cca7..ef00b3cc6f 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.17.2.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.17.3.bb
@@ -17,7 +17,10 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[sha256sum] = "e53b1ac288d017d66dde0471cd429a806168ecf07179d7f019572d7a7e05f0d6"
+SRC_URI[sha256sum] = "8eaa1b1b8d3c36ce8ddeae6d79c9a05360dcba5930115112c078415bcbe0d16d"
+
+UPSTREAM_CHECK_URI = "https://download.samba.org/pub/tevent/"
+UPSTREAM_CHECK_REGEX = "tevent-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
 
 inherit pkgconfig ptest waf-samba
 
