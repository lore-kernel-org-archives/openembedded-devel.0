Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10289.1795752839114890884
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NrgdRYum;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38431138772so9924028eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752838; x=1796357638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgG/TFP3agubloYuMsnec5R8sJMqg37n5tMl8wc7EsE=;
        b=NrgdRYumgcOtw0g1AeHSKoUJSibqV7nYkINY5g10qbn/XobZUqXMESpOUqSN6ZwISH
         wVdHgheaW0+jXj5ibSg7CU2RDEQ/3zIcWw5CFvb7O0RVT/n4j5podYd8L4ddc/mcWTOr
         UBlrvvrv2+guoeMvFtutW6dwyrewc9uOB7UAJbXiQdkDErKuKv+rc4sNg3NOKGpMQ7OS
         9HxqD+yjEXfAzZXrCtoup07xjr2r3DKHjdFP/BmzWUiXoXRFSKPZhsM88///CwqWExDl
         +m2YVrUhG5oqR/dYIgH5M4c9PZutIKitD3l9ZH7tDtwyvLyDJ1KCX8xxdaMx6iH/5Due
         BLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752838; x=1796357638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JgG/TFP3agubloYuMsnec5R8sJMqg37n5tMl8wc7EsE=;
        b=qo2EUGz707YoTeumvIuHWcOEMravrKQXJb0qO4eDCwc2+j9JFwWXxTO51WQO50g46e
         k00mTJleJABLSwgJ3AVlzNiNTV0euG9UE6dbiv3SrfETebce5K+Xo1YbaAPRwPL9FHku
         rStRowFhgIBXqWPI2XekGwHzxhjmhCpHSLDyhKTZuQfAct2v7c0tKS2li4Y1qqH2JkTV
         alypkiVPBhwAV3S5Mx9IDa5L85IOOHOHZDShL9JvxKFKUIUSf45KpmYtbQuDzi1Zc1PF
         SjGwKGfhWbnu6eLg2MddEpX3zokbLkFVSx6fN5wwtwMzjBhEm5K7nbzcZ80m10wg+84R
         bKfg==
X-Gm-Message-State: APuU4Z8HjwVmRnt97iOvfoLa8tDtORBd0DCpS+tA+9kviLsv9smxClZW
	JwTHSlD6/2JXoUX9ORltF/oULjWNqoN0HYGUZaWU87mydBLHNEfMszhPsvGfEI/a
X-Gm-Gg: AZFdTZe+lHB3qlYfD9/Rq3vjL0dOdAVtY0jMYdXoVEXz5DqNOv61LYac6hPvLkVLYMP
	zFx1WAUiQiPijDl6Mkd/lQET6O+W+7XOUDXg6X0nMv4DNWLA9FFUbtkW/YToP2sEwJ6H+H0qqSX
	38NG6i5A02yHToVU7N9PYjSEjl8axV85HwDL+mXZABt8HSLdXy9wnS7HrdLeCsUPoZrSFML2CcC
	EZDLbPy/W3ELr5AMTbcJjaCzO5oG0nD3/ACwFrxF83grHfA7yNW2mp5f454r8iv5t1kD/bOKhaT
	gKwT951HqM2yyhS9sOeWyFhHV10wpGz646Bw79nAj4QiKu78blxCGDA+0xonWH7ckeoK1QO/+vx
	PehSaH27NPW6OXwGe6BHeI4vrusRYEy3ex5DvPCg+Ik60Hi2fDF2cLd/tQdvgHJ1Uv/RECNM5t7
	Qxw//fByhKucPLyh3uAcBCEENuRFHnAvBlpTAZY5QXf77iLX5p1uMkOwHHBEFs69a3At27v0GT0
	ZAmojlvXSn3623RtHSD2Ns95GanbQjfxnb6JzlW44efW3D62tBa1bx+MszzepXvdEbYnoCbdgYl
	+Dg9i73kwXUrmOXTHTpvd7eJhKYc4AOVgYSEqVL9uDc4X7zxGHnYN4+Ra3Udp71L56J4OWq+Mdn
	sRblTSUogw0k5uAQziCPgIrM366SvkjXhskGYPpZyE9oSpSZpScx1YPQGU0Od11SZNfrYuguMpv
	dSpmcRzbhlJAUfEZx3ljMynqZoIKWU1aCUmtq+hT+nc2K+0CnjK8DVTXiNhcUIqUswdRnqn1abs
	V2St4Ud1hN9XO+vJ6cCH1WCom06H432+Eqg9omz4H9Fsj0x4zXHHpHGcfBoI/BwiaWi5lpomyDi
	wrYG
X-Received: by 2002:a05:7300:8816:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38571b071d3mr23165042eec.39.1795752838303;
        Thu, 26 Nov 2026 20:13:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 36/39] minini: upgrade 1.2.b -> 1.5
Date: Thu, 26 Nov 2026 20:13:40 -0800
Message-ID: <20261127041343.1772294-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133206
Content-Type: text/plain; charset="utf-8"

1.5 adds ini_hassection(), ini_haskey() and ini_putbool(), ignores
spaces around section names, and no longer passes const user data to
the browse callback (API change since 1.3).

Upstream moved from the Google Code archive to GitHub, so fetch the
v1.5 tag with git and check its tags; the sources are now in dev/.
Backport the upstream fix for the ini_putbool() prototype, which used
TCHAR instead of mTCHAR in 1.5. The sources use CRLF line endings, so
inherit dos2unix and keep the backport an ordinary LF patch.

This replaces the upstream check settings from commit 787d1b73e2
("meta-oe: repair broken recipe upstream version-checks").

License-Update: LICENSE is unchanged apart from CRLF line endings, which dos2unix converts

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...pe-used-in-prototype-for-ini_putbool.patch | 23 +++++++++++++++++++
 .../minini/{minini_1.2.b.bb => minini_1.5.bb} | 21 ++++++++++-------
 2 files changed, 36 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-support/minini/minini/0001-BUG-fix-wrong-type-used-in-prototype-for-ini_putbool.patch
 rename meta-oe/recipes-support/minini/{minini_1.2.b.bb => minini_1.5.bb} (65%)

diff --git a/meta-oe/recipes-support/minini/minini/0001-BUG-fix-wrong-type-used-in-prototype-for-ini_putbool.patch b/meta-oe/recipes-support/minini/minini/0001-BUG-fix-wrong-type-used-in-prototype-for-ini_putbool.patch
new file mode 100644
index 0000000000..b14f239a66
--- /dev/null
+++ b/meta-oe/recipes-support/minini/minini/0001-BUG-fix-wrong-type-used-in-prototype-for-ini_putbool.patch
@@ -0,0 +1,23 @@
+From 797be9d2b883222d387732df73945d52c99ec994 Mon Sep 17 00:00:00 2001
+From: Thiadmer Riemersma <thiadmer.riemersma@gmail.com>
+Date: Sat, 6 Jan 2024 17:16:27 +0100
+Subject: [PATCH] BUG fix: wrong type used in prototype for ini_putbool()
+ function.
+
+Upstream-Status: Backport [https://github.com/compuphase/minIni/commit/797be9d2b883222d387732df73945d52c99ec994]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ dev/minIni.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/dev/minIni.h
++++ b/dev/minIni.h
+@@ -51,7 +51,7 @@
+ #endif
+ 
+ #if !defined INI_READONLY
+-int  ini_putbool(const TCHAR *Section, const TCHAR *Key, int Value, const TCHAR *Filename);
++int  ini_putbool(const mTCHAR *Section, const mTCHAR *Key, int Value, const mTCHAR *Filename);
+ int  ini_putl(const mTCHAR *Section, const mTCHAR *Key, long Value, const mTCHAR *Filename);
+ int  ini_puts(const mTCHAR *Section, const mTCHAR *Key, const mTCHAR *Value, const mTCHAR *Filename);
+ #if defined INI_REAL
diff --git a/meta-oe/recipes-support/minini/minini_1.2.b.bb b/meta-oe/recipes-support/minini/minini_1.5.bb
similarity index 65%
rename from meta-oe/recipes-support/minini/minini_1.2.b.bb
rename to meta-oe/recipes-support/minini/minini_1.5.bb
index 9baa803382..e447f60498 100644
--- a/meta-oe/recipes-support/minini/minini_1.2.b.bb
+++ b/meta-oe/recipes-support/minini/minini_1.5.bb
@@ -3,32 +3,37 @@ DESCRIPTION = "minIni is a programmer's library to read and write INI files in \
 embedded systems. minIni takes little resources, has a deterministic memory \
 footprint and can be configured for various kinds of file I/O libraries. minIni \
 provides functionality for reading, writing and deleting keys from an INI file, \
-all in 830 lines of (commented) source code (version 1.2) in C (the code also \
+all in about 1000 lines of (commented) source code in C (the code also \
 compiles in C++ and comes with a wrapper class)."
-HOMEPAGE = "https://code.google.com/p/minini/"
+HOMEPAGE = "https://github.com/compuphase/minIni"
 
 # License is Apache 2.0 with an exception to allow object code built from
 # unmodified original sources to be distributed more freely. See LICENSE
 # file for details.
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eb21481ad45c5578ae8c8d37b8c8d76d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f75fb05044181a4a14fcbf1a88f37fa8"
 
-SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/minini/minIni_12b.zip;subdir=${BP}"
+SRC_URI = "git://github.com/compuphase/minIni.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-BUG-fix-wrong-type-used-in-prototype-for-ini_putbool.patch \
+           "
+SRCREV = "ede00e17ab3799dd62d00a5885c144810a335495"
 
-SRC_URI[sha256sum] = "b08839af74acb36061fb76e1123bf56711bc5cf7a08b32e189b0ad78a2e888e2"
-# Upstream lived on code.google.com (defunct); only archived zips remain, no
-# browsable release listing.
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
+# The sources use CRLF line endings; convert them so patches stay plain
+inherit dos2unix
 
 do_configure[noexec] = "1"
 
 do_compile() {
+    cd ${S}/dev
     ${CC} ${CFLAGS} -fPIC -c minIni.c -o minIni.o
     ${CC} ${LDFLAGS} -shared -Wl,-soname,libminini.so.0 minIni.o -o libminini.so.0.0
 }
 
 do_install () {
+    cd ${S}/dev
 
     install -d ${D}${libdir}
     install -m 0644 libminini.so.0.0 ${D}${libdir}/
