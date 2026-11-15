Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3804.1794728989765248658
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VbqL8+7I;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37986eb6fa2so2503686eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728989; x=1795333789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7iN7G50vSdzwFUxEtYwOdk+tBd7zkE82FhryAw1bls=;
        b=VbqL8+7I2KWkRHC6jz6nUf00zhUjQXuOOXnYSrXd2mvYvU/+CJ9+eh3SrB6qW/NaxT
         gto0E1101XRN4u9upHQv9fN2gYNCzGqcir510NRNBKon3BMs9G1oj3JbMMow3G3mURWA
         q5xFgfaORy/9w6Kq8RGGMJLylbNt54wfT+YTqxzNjlg1jPlxeKK++InJdoVP76ziKqbq
         axJ5HNaLD05b4YUQvWs6EiLE8N2HF6I0C0Gryc6P4oCUp+6s03ffVc+46UU7IR2Iv0Fr
         Kd3jtqO+h7UdefKfTDeh8WG1nXFqz9eoUjJbDEQN6NmuWytMpitUB0GQYR3r5TXDlPBY
         Tbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728989; x=1795333789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7iN7G50vSdzwFUxEtYwOdk+tBd7zkE82FhryAw1bls=;
        b=ew9iMblgjohITJ9xMJe9t77vJ0rZv4/tjE5LRX7ZQYOihtzEzrfzmL1isjCT89ppMy
         HcjvZkdubMi0IntAo0X0zshSir8m2VJJ5NlpiqPBTI6/QxZYGlWmgWXDEJFBIEOVIEwy
         U/r2uSmhTvt1pZ1L4au7zRWOtwqoNgKThLcuiYZbd/Almri5kdGwMDA5Bu/XMoK4Z1L8
         CfxUXhX/2bEQkwjKrDjOOMd/0erYbs/+GrdS/C8EEttm44lx48bOLPgNkaDue5Ka8vm8
         5gMXZLXJGe9ZhMdX1rBvJqFz6Q4H1yqz9mPTng1gtlkzq8nqDLvobWqA+xbcedunWYNA
         vMQw==
X-Gm-Message-State: APuU4Z9MRwYRTIz87u48ctrU0n1uDW7oiV5GHa++4NB90o9CemmIp4MI
	pF93WwUDHmcqkGvSPA8v8cOV92M1grQ9LcLxr/hKb3My2njdxfAn/eTJ5EXbMuT9
X-Gm-Gg: AYBFou3O8CvAQFxeqAgz3IBaZm4mwxubVb5QLz4ekiUxdsNcOg8pPlxrKqm00gVc75Z
	hyVRtkkRItLWwpee65pITjuqqTzGEBs6ET/4y74hahdtWDJByLuaBzYXOH3n2D3oCWAI7Dld62o
	rugM6HVe2KoGDFJR0pmWoPZXBs1ep0tGkGEFu/zpB0Nnuxr6jrwWYQdW7NSsNBYePqRbhJwRAms
	d0DVNBCFXxv/nNyfHNRx7+hH4KeD932GsKYN9g53FrYFc3nmmlVLcB/+Qtnv/DVpOloIc+4DEpl
	aiG8N+4I0NQFE0kXVBdoicLnDeQRlqJgom6TymtdWf0KQiCiXnfyAJxuDTI+AIr89s6mrwYiGYh
	B8806QosobLpGWs/i6bbKTjA/ZqcHjMqZQpp/SDHT4C8NnTjh5GVXSa3AWJWNwOp17dZRGUAmL0
	9Av9YxF/5DVdWov+oro9BIkH+q7u7vPCKKtXjh7o2d9rFlli/Lv7BrQ2BAyRaNB2WrD9iZSvwWK
	/r3iYbaLgQNj32K5DLU0Zm/gTrW6LYQ5A18h0Y2exn6FugXl7D4ggnEEgiPD0MSURP5xaTaK7cf
	scmEih3kyfHo501r0jZtsjPtSp/7oDdRvS/wnPoS7A08CPejKawREjdnVG/vH6VuPhVBjneDTg6
	u6aB2yC8oI82IzzwsMxTHZkRVYmnmup6LDPctBxiFsS/28k2q2bym/VScILuw/O5v/I4CXtwpTN
	at2RQBRlhJMh5tKhfXO1yVOMMMxN5zzJq7hXg/xAYLD4TOkMfUwUD2z1qrjwIPxkQVGz2yFi/mP
	TT5f2f0YqDC8fqome6noojLzG8GtRtSYnz3fnI+hvrSu/GMpkqyqiCyCd11eRCKiZSLwfzypDl/
	kRd/
X-Received: by 2002:a05:7301:da14:b0:35d:4185:5395 with SMTP id 5a478bee46e88-3796666f4a6mr6888099eec.16.1794728989080;
        Sat, 14 Nov 2026 23:49:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/96] libabigail: Fix build with musl
Date: Sat, 14 Nov 2026 23:47:55 -0800
Message-ID: <20261115074918.2932593-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132287
Content-Type: text/plain; charset="utf-8"

The 3.0 tools parse their options with argp, which musl does not
provide. Look for argp_parse in libargp at configure time, link the
tools with it, and depend on argp-standalone for musl.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...argp-standalone-when-the-C-library-l.patch | 48 +++++++++++++++++++
 .../libabigail/libabigail_3.0.bb              |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/libabigail/libabigail/0001-Link-tools-with-argp-standalone-when-the-C-library-l.patch

diff --git a/meta-oe/recipes-devtools/libabigail/libabigail/0001-Link-tools-with-argp-standalone-when-the-C-library-l.patch b/meta-oe/recipes-devtools/libabigail/libabigail/0001-Link-tools-with-argp-standalone-when-the-C-library-l.patch
new file mode 100644
index 0000000000..77c9beef55
--- /dev/null
+++ b/meta-oe/recipes-devtools/libabigail/libabigail/0001-Link-tools-with-argp-standalone-when-the-C-library-l.patch
@@ -0,0 +1,48 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 12 Nov 2026 00:00:00 -0800
+Subject: [PATCH] Link tools with argp-standalone when the C library lacks argp
+
+The tools now parse their options with argp, which glibc provides but
+musl does not, so linking them fails there:
+
+  ld.lld: error: undefined symbol: argp_parse
+
+As is already done for fts, look for argp_parse in libargp when the C
+library does not have it, and link the tools with it.
+
+Upstream-Status: Submitted [https://inbox.sourceware.org/libabigail/20261113043746.2721849-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac      | 9 +++++++++
+ tools/Makefile.am | 2 +-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -373,6 +373,15 @@ dnl glibc and BSD include fts into their
+ dnl check if we need to explicitly link to the standalone musl-fts.
+ AC_SEARCH_LIBS([fts_open], [fts])
+ 
++dnl The tools use argp, which glibc provides but musl does not, so check
++dnl if we need to explicitly link to the standalone argp library.
++save_LIBS="$LIBS"
++LIBS=
++AC_SEARCH_LIBS([argp_parse], [argp], [ARGP_LIBS="$LIBS"],
++               [AC_MSG_ERROR([argp_parse not found])])
++LIBS="$save_LIBS"
++AC_SUBST(ARGP_LIBS)
++
+ dnl Older glibc had a broken fts that didn't work with Large File Systems.
+ dnl We want the version that can handler LFS, but include workaround if we
+ dnl get a bad one. Add define to CFLAGS (not AC_DEFINE it) since we need to
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -19,7 +19,7 @@ else
+ endif
+ 
+ noinst_PROGRAMS = abisym abinilint
+-LDADD = $(abs_top_builddir)/src/libabigail.la
++LDADD = $(abs_top_builddir)/src/libabigail.la $(ARGP_LIBS)
+ AM_LDFLAGS = -lpthread
+ 
+ abidiff_SOURCES = abidiff.cc
diff --git a/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb b/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
index 4bff1209d6..9dbecacf79 100644
--- a/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
+++ b/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
@@ -5,11 +5,12 @@ LICENSE = "Apache-2.0 WITH LLVM-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
 
 SRC_URI = "http://mirrors.kernel.org/sourceware/${BPN}/${BP}.tar.xz \
+           file://0001-Link-tools-with-argp-standalone-when-the-C-library-l.patch \
            "
 SRC_URI[sha256sum] = "d34ea7c4b150f61e22edb1d16157e12c43fd18f8e8f09abce053d82ccaf92e06"
 
 DEPENDS = "elfutils libxml2 xxhash"
-DEPENDS:append:libc-musl = " fts"
+DEPENDS:append:libc-musl = " argp-standalone fts"
 
 inherit autotools pkgconfig lib_package
 
