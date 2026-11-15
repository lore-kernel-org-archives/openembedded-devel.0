Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3901.1794729092252058063
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I/ZDiIdz;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so3566915eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729092; x=1795333892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVN3L7p6swOaB7BhyQg8yzJIMuLUgsEWDeOjKSuk/Hs=;
        b=I/ZDiIdzDtguOpMOZY8L0ng+L0q1F+4TNy0taU7VO8rkGbuXmA6vfW1GS4MZJZQo65
         OUF8LiWjPZpWfiQAE2CcW6++j9cJn9E8vKjhbhYCuiJ2DOGBSaDcJKLxdguRIj6LEIMn
         nivGk5b+E386HRM4i8Ebo9ijhDNJ4vOUzEQsCIoVHVDhyjtRluQYNzSyeigtSWcXkn0O
         jj/i4x8+Pnm9wRQUmKjTKhDh5z2XV9hx10khOj/eIC9DJWVzDg5p+aO5jtO5Sr0IMVlV
         LM5ZfY0icTat83EVOvjBUW+YyXjt0s25FRcpNSAyAF47F/V+p0UKqpzvLmhWj7soZg52
         U9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729092; x=1795333892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVN3L7p6swOaB7BhyQg8yzJIMuLUgsEWDeOjKSuk/Hs=;
        b=Pl4+9zskEOiAgcKjBM/CkSAgScARh77wiB2v10sCFLQhY6G82tb4tEQVfN8/DixuFr
         Z9duRd1qffspPw5QDBoDdALQjxGZjWVFhM+BfHOn1PmqzKi5jGMyYm94WK4vehWsMEyt
         ouADpUcN/Xj7Wtq5WAA1lpvrklSvpVlwkOY+s14i17JVULEKIEuSImBSY9c/WdnJLSdf
         DoeK05yl3Jg5+g6jYP93ZAelMl+0sEgApCJ0rBnkiXNZf9jtWCqFMSCp5hNln27FJcaE
         yBnT8RyFve35lF4fVwmv4lNZhxSQ2LUEqPZv91pnfIv3mhZV9IzvsWv3+G2/zfaIeB8a
         rM/w==
X-Gm-Message-State: APuU4Z/DjdGFt/n+tA0IaGn1v+OlO9bde810CoegugaE1bYZF1kNsL8L
	xMvOy2ZL07dja0T74MMl76huoh8ssXoHs9VxiWDiN4qTM88B8oay53Y3kbrFTqoX
X-Gm-Gg: AYBFou1kv/b6r2Ru9oL0Ocry9BirQwSsYjlg/T3SLGSbfNdFubFWRDfI8bfkwOTXnGT
	uw2HZPw+6JoIMniLyASIozyu3JzTFlTsYc269cs4Tt6X+75StuW2yJmh3zBPMVTkcVl/MYcQubK
	AjpIxVD0oqkPA/GEYrQ1GGe5BaJUczBNVi6GmRyWIsu7va7ToYfR3q6mY4Y6RjyoqVPfdnUci40
	RWr8KPkuOXkC5TkHmrwII0FKc5M6iT2c9pHeyybWq6CfwVbVZaypnV0dG+0OI4nIY+uES7qqzXV
	J5BvzZ8gZq2V/0t6d5U0hOcfeXHmf7epabYhZqYmEnFZuoOqQWpMD8xWczrT/QDdv2bI10SPPLZ
	P6SgQx9+hdFddhjj/EcFsyiXSpDgZ4Pl8T6ozeSqtqaXXALmbTsEkHhoP/YghbDX1BwBDGqhT9Y
	L5ro0XcgTd4NOSMP/o2ozhBtHWkMD87yITR6pg+cvsAP2VtBZXGMN6DvG+76u1elj5frIJxm6SW
	T4L8F6hkaRaQRxVbI3DMF/wKAs/TaMFTPyTAoMnheOtn1JJ2dBybzCwMA7fHJIBtok9NIqlNAHf
	n//LrUmU8gF4h2iniCtOkHbMT4KyqY3camvu+zkQNw+2JxHaYI2OzLA0GDcKX1Zv1AaJoiAHplN
	hUIfdEgnJBRmtuAKre4FXsWa0ll/Y8UbE5mwsJZikZTHkC84IwlEx/6zzooiPv8gyRzU8vHfJ0D
	AKwhA03mtSb34YOvaCZc+XIbxUEwT88rFHnFoteuGDsbACBVXocgc1qdRIp5Cbe+Q3w9X+uZUsk
	58v+Y/gdlMQizhyPSm59rz13DZY62BcV1pHObwetDle/FiZ4UrSUnxukpGJUdkhxmsuwc12WOnb
	EZBl
X-Received: by 2002:a05:7300:168a:b0:36c:9fa4:dc5b with SMTP id 5a478bee46e88-37966e3ad35mr7263326eec.23.1794729091574;
        Sat, 14 Nov 2026 23:51:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 80/96] multipath-tools: upgrade 0.12.2 -> 0.15.1
Date: Sat, 14 Nov 2026 23:48:58 -0800
Message-ID: <20261115074918.2932593-80-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132350
Content-Type: text/plain; charset="utf-8"

Refresh 0007-RH-warn-on-invalid-regex-instead-of-failing.patch; both ble
handler macros now read the value with set_value(), switch the second
one to set_regex_value() as well.

Add 0014-libmpathutil-Drop-undefined-get_persistent_runner-from-ver.patch:
the version script lists a symbol that is not defined, which fails to
link with lld.

The 0.15.1 release commit is on master; there is no stable-0.15.y branch
yet and stable-0.12.y does not contain it, so the fetch failed. Fetch by
the tag without a branch, which also holds for later releases on a
stable branch. Tested by building multipath-tools for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-on-invalid-regex-instead-of-failing.patch |  8 +++---
 ...fined-get_persistent_runner-from-ver.patch | 25 +++++++++++++++++++
 ...ls_0.12.2.bb => multipath-tools_0.15.1.bb} |  5 ++--
 3 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0014-libmpathutil-Drop-undefined-get_persistent_runner-from-ver.patch
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.12.2.bb => multipath-tools_0.15.1.bb} (96%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch b/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
index a174aa44c6..eeb93d332c 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
@@ -23,7 +23,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 34 insertions(+), 6 deletions(-)
 
 diff --git a/libmultipath/dict.c b/libmultipath/dict.c
-index a06a6138..a734ba9b 100644
+index 0e947b1..c477522 100644
 --- a/libmultipath/dict.c
 +++ b/libmultipath/dict.c
 @@ -189,6 +189,34 @@ set_str_noslash(vector strvec, void *ptr, const char *file, int line_nr)
@@ -61,7 +61,7 @@ index a06a6138..a734ba9b 100644
  static int
  set_yes_no(vector strvec, void *ptr, const char *file, int line_nr)
  {
-@@ -1854,7 +1882,7 @@ ble_ ## option ## _handler (struct config *conf, vector strvec,		\
+@@ -1801,7 +1829,7 @@ ble_ ## option ## _handler (struct config *conf, vector strvec,		\
  	if (!conf->option)						\
  		return 1;						\
  									\
@@ -70,7 +70,7 @@ index a06a6138..a734ba9b 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1874,7 +1902,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec, \
+@@ -1821,7 +1849,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec, \
  	if (!conf->option)						\
  		return 1;						\
  									\
@@ -79,7 +79,7 @@ index a06a6138..a734ba9b 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1980,16 +2008,16 @@ device_handler(struct config *conf, vector strvec, const char *file,
+@@ -1927,16 +1955,16 @@ device_handler(struct config *conf, vector strvec, const char *file,
  	return 0;
  }
  
diff --git a/meta-oe/recipes-support/multipath-tools/files/0014-libmpathutil-Drop-undefined-get_persistent_runner-from-ver.patch b/meta-oe/recipes-support/multipath-tools/files/0014-libmpathutil-Drop-undefined-get_persistent_runner-from-ver.patch
new file mode 100644
index 0000000000..dd305663d4
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0014-libmpathutil-Drop-undefined-get_persistent_runner-from-ver.patch
@@ -0,0 +1,25 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 12 Nov 2026 00:00:00 -0800
+Subject: [PATCH] libmpathutil: Drop undefined get_persistent_runner from
+ version script
+
+get_persistent_runner is listed in libmpathutil.version but is not
+defined anywhere, which fails linking with lld, as it defaults to
+--no-undefined-version:
+
+  ld.lld: error: version script assignment of 'LIBMPATHUTIL_6.0' to symbol 'get_persistent_runner' failed: symbol not defined
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/libmpathutil/libmpathutil.version
++++ b/libmpathutil/libmpathutil.version
+@@ -73,7 +73,6 @@
+ 	free_strvec;
+ 	get_linux_version_code;
+ 	get_monotonic_time;
+-	get_persistent_runner;
+ 	get_runner;
+ 	get_strbuf_buf__;
+ 	get_next_string;
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.15.1.bb
similarity index 96%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.15.1.bb
index 0c572d1bd3..fd9395acfd 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.15.1.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=stable-0.12.y \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;nobranch=1;tag=${PV} \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0001-RH-fixup-udev-rules-for-redhat.patch \
@@ -45,11 +45,12 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=st
            file://0011-fix-bug-of-do_compile-and-do_install.patch \
            file://0012-add-explicit-dependency-on-libraries.patch \
            file://0013-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch \
+           file://0014-libmpathutil-Drop-undefined-get_persistent_runner-from-ver.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
 
-SRCREV = "5bd1163d187520b958d78b85c7b239561dc86192"
+SRCREV = "d53932bdbee02f440518ea384e63d7c4d3f66685"
 
 
 inherit systemd pkgconfig
