Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3898.1794729087169782627
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vyEY4PsE;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37071c0f42aso3571515eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729086; x=1795333886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui6mF5GnizyV1GT1w5KoLvearViIDN/jYUh97XmEs7o=;
        b=vyEY4PsEvgJDxLcOw+CmT2fUwrbLW59tcpAW53NvauNzLngSH8H7WP0q+x+32AJKe7
         IUBCj6VlHtueMRBxUgpW8/bhDDVyChltNriL/FyByeLmPY53AgqH0tSh+iqxU06IgCW/
         AsgLu4QTU2L+G5r7r+8MFOyb7hXo+QXw+Xgn91JdHNn5+rXwj2A1Ps9wqBThpTJqS3Ds
         +BXs7Uo2D9nlilU828aQE/KWnhm+fvY/stXD7Z4t4qcsNvCKeC6QfyF34yqtXfOqWeRR
         IikuhNVikIEQDcEZMZX+VtjaESKKHRSCvucTLV3HDx/JvvHTVE2HU084ik2qNdEpe3JU
         BXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729086; x=1795333886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ui6mF5GnizyV1GT1w5KoLvearViIDN/jYUh97XmEs7o=;
        b=nTZ/o/IcUewYB1qHOUKsV0w3R+u93/ApGNCQz+b4onqeZh/N0wU02253JlVh3EOkfZ
         HA3h1aY0AgUTLPHBgXa8pLg1J5fpD32vjaT2Exwe8vLW6Jncxg+1il9Jwn7cM6Io+9Z6
         sI5wsWdF8PGUis+LAcGQDaVVEdlkF9WXZUPwHTUrp4gteIs2oFfeNoLsp/LarYpwwJy1
         GiSh5aMdC2GcKTBHnbrTdLo0MAEWOh52pIxxdWnVnUrO7uRjnlsYorTQsMqKkCpErpPi
         MP8Spa9AoAimhcowvR1JH3FtMEftDQB7ebQqUdEt8uoBEdCxnFq3Vxyr0mfM+StRzYla
         t3ww==
X-Gm-Message-State: APuU4Z89idnmMM1FFm0ZGjGo1kbMekLuldxARg+LFYauWDSRtmU9bl9l
	dzujcoONQoJVbtS39Lv7OUh4dxz80jy0Cak4EgW9Ax/cmS9SYLtOoHphRdUHOTQV
X-Gm-Gg: AYBFou0oalFavxogMKUu/NWvL384HbeKfKQrQtQx1NDK/nvKiX8ycvgW8cDd8sG6IQW
	7Ixx+//bkpAx1nJQ4soHguMmLDEqIw0CXkPRNvDX8zkbYkVqdmXplqCZEHBv+G3IElESz0USJSe
	3Ai3XuJOYlvgNQ4qtKt8Q3ASdm8vcBpi6ut4acx5Q5PbPEFxdLPoQHXZoenke8/W2kW3e8ZMJuc
	2EUimhyFam2hxPAYd3Jz4BmGCchND4EHswY8Scpn4c2QeUm3nGeVAh+HOQ2GoXhs0yTKFb+yIoF
	UYsuK9tPB8baIviteio/Mx0VvgQLnZdrR20gLcVTPhpWMEOA4wasbOuPzsXEq9YPXcFhC+eosuy
	7wdZoHzNMT+PaO/0xPdPxJI9YfLStgqGF0TOYMpJ9gyQ6gmRprB55kGUHkjrflNg+pdZ93oUayV
	A2mLbFzNIHQvR3jwNxqyJ5qZun/G7SLSLuwqobnNyhbB5vSm4CaodaIa20cWVe1fdDoVbt2d++Z
	FaIBlNLIk6jbg2tBu+WaGbChFBafLbjY3L+Upaids/j94Me7HT92oowg4eAzunIU/JCHILLaKKa
	Dystj90vSByScFHDwK+3rWjr197cL8h+vfZCSEJ878ykempSUYgy+HJKR0IS6yBpBkTs1elic/M
	qH9GeqjDqGX6zYheh3quyw6W7XJ/+Qkxtt7rvZZ4DvS4+XUhIazYcjQx6STtnmv07tC2Vjgnx51
	IMe1m343EtZtIJB1H88RWS+SDNMancrcNmE1oDH8VNddbLAs72Hvlmh68EPZjT/qTQZsXzrnyr7
	wqlj5BHH7c1XBQrWic5X2QHKJsmCLe8G2UGAKfT0aTikzVVDmXJRzXjiOwzX9WA/saeDE0K18tT
	N5q5Xw==
X-Received: by 2002:a05:7301:db8c:b0:369:38e3:5363 with SMTP id 5a478bee46e88-37966b5261fmr6708738eec.7.1794729086388;
        Sat, 14 Nov 2026 23:51:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 77/96] pidgin: Fix build with libgnt 2.15
Date: Sat, 14 Nov 2026 23:48:55 -0800
Message-ID: <20261115074918.2932593-77-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132347
Content-Type: text/plain; charset="utf-8"

libgnt 2.15.0 deprecated gnt_util_parse_xhtml_to_textview(), which finch
uses, and pidgin builds with -DGNT_DISABLE_DEPRECATED. Stop disabling
the deprecated libgnt API.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Do-not-disable-deprecated-libgnt-API.patch | 24 +++++++++++++++++++
 .../recipes-support/pidgin/pidgin_2.14.14.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0001-configure-Do-not-disable-deprecated-libgnt-API.patch

diff --git a/meta-oe/recipes-support/pidgin/pidgin/0001-configure-Do-not-disable-deprecated-libgnt-API.patch b/meta-oe/recipes-support/pidgin/pidgin/0001-configure-Do-not-disable-deprecated-libgnt-API.patch
new file mode 100644
index 0000000000..1bd7c9c6da
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin/0001-configure-Do-not-disable-deprecated-libgnt-API.patch
@@ -0,0 +1,24 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 12 Nov 2026 00:00:00 -0800
+Subject: [PATCH] configure: Do not disable deprecated libgnt API
+
+libgnt 2.15.0 deprecated gnt_util_parse_xhtml_to_textview(), which finch
+still uses, so building with -DGNT_DISABLE_DEPRECATED fails with:
+
+  finch/gntnotify.c:96:9: error: call to undeclared function 'gnt_util_parse_xhtml_to_textview'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/configure.ac
++++ b/configure.ac
+@@ -1262,7 +1262,7 @@
+ 
+ AC_ARG_ENABLE(fortify, [AC_HELP_STRING([--disable-fortify], [compile without FORTIFY_SOURCE support])], , enable_fortify=yes)
+ 
+-DEBUG_CFLAGS="$DEBUG_CFLAGS -DPURPLE_DISABLE_DEPRECATED -DPIDGIN_DISABLE_DEPRECATED -DFINCH_DISABLE_DEPRECATED -DGNT_DISABLE_DEPRECATED"
++DEBUG_CFLAGS="$DEBUG_CFLAGS -DPURPLE_DISABLE_DEPRECATED -DPIDGIN_DISABLE_DEPRECATED -DFINCH_DISABLE_DEPRECATED"
+ if test "x$GCC" = "xyes"; then
+ 	dnl We enable -Wall later.
+ 	dnl If it's set after the warning CFLAGS in the compiler invocation, it counteracts the -Wno... flags.
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
index 397ca3e4d0..7ed75c7ed3 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
@@ -10,6 +10,7 @@ inherit autotools gettext pkgconfig gconf perlnative python3native
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
     file://sanitize-configure.ac.patch \
+    file://0001-configure-Do-not-disable-deprecated-libgnt-API.patch \
 "
 
 SRC_URI[sha256sum] = "0ffc9994def10260f98a55cd132deefa8dc4a9835451cc0e982747bd458e2356"
