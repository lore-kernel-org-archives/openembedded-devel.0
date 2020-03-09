Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6398560F57
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2020 19:37:02 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id t14so4405407plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2020 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vsGR41FwgjKBoPBYTNH2gpUz8A+6lMWPzq+MfT5q8aQ=;
	b=jXWoZz5o64KqLxhCZ3ztTnv7mgFfOaBkbyG3hz1Oz7+oTjaIcoaiGOdultzQX9t8cl
	QdDjzOa7m9W6ks6AK5KyTqhXYSJtetR1gop41gEnpYaM4GWvU5CQyGP1j3Qqz3Z1e4dW
	VcZeO/rocbyQwMb/5LeI5yF8WikPVsi4fhRoNUhLDQ4hpBVpiHEHiWa/v6zPxBBQw2+O
	8CdLEs8po6dRZo+1IlMsiTRGZW6Ac8wUpxvf4lppwq0uSGj3er+fsPTQ0FzmIKGz3hRm
	P5qXWhotLUoNWezmgnEooJW1uQUHgn+oSdg1oCU4rYrCdnoFgRfhlos0P2FC6NaF9b+k
	tk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vsGR41FwgjKBoPBYTNH2gpUz8A+6lMWPzq+MfT5q8aQ=;
	b=F0RAZa7j573n6MwCkEW2cp39qBZd/DXryIz8BPKjSd+/oIA9nPvQYaw8qbwuhLk4QT
	kKFo18bnAlFJLm6u7/Eu+fl7v4U4ijlLO9TtkoeuHUBmYAHC8VFipxynfaxKAY0BAT/9
	MPg7mqR0+7bQ0qA9nY5tzdXFTqzU+P3KJripUDVovQJv3KjYtMcZ9Vcmkd4V9aTFCuDs
	/z0CY21xmnAw/zrqtQlN0C1RXmG9CeaTn4Cwz1z6n26SdEtkqj0xWcifb3lYgiQmXCRI
	GEB55TxgIuRhi6gv33VlBEntthpBg87Dyd70w3/1/vOaMtEmUChF7prcj7on/vST7Pmb
	6IQg==
X-Gm-Message-State: ANhLgQ2ERjMrRUr4yBczQ8vD25fha4ulHyIxnqJG2O3SfS8snDuxUbw4
	p+UAkfPqPEkLtIkdO0ENt1N23ou0bWY=
X-Google-Smtp-Source: ADFU+vt+UpC/MMWAThHXVOKJNx09S4AOcJ8W3O58QbuBl8nO4w9vK1xunkEFNEFWaCx543AhXyEzSA==
X-Received: by 2002:a17:90a:2330:: with SMTP id
	f45mr396729pje.169.1583782623040; 
	Mon, 09 Mar 2020 12:37:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	s11sm16221436pfh.7.2020.03.09.12.37.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 12:37:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2020 12:37:11 -0700
Message-Id: <20200309193712.1028142-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309193712.1028142-1-raj.khem@gmail.com>
References: <20200309193712.1028142-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 4/5] minidlna: Use clock_gettime API insteaad of syscall
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
X-List-Received-Date: Mon, 09 Mar 2020 19:37:02 -0000
Content-Transfer-Encoding: 8bit

Makes it 64bit time_t safe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/minidlna/minidlna.inc  |  1 +
 ...for-clock_gettime-seprately-from-__N.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure-Check-for-clock_gettime-seprately-from-__N.patch

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index 187ff536aa..04648a5d28 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -12,6 +12,7 @@ SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
            file://minidlna-daemon.init.d \
            file://minidlna.service \
            file://0001-Update-Gettext-version.patch \
+           file://0001-configure-Check-for-clock_gettime-seprately-from-__N.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure-Check-for-clock_gettime-seprately-from-__N.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure-Check-for-clock_gettime-seprately-from-__N.patch
new file mode 100644
index 0000000000..24a307db19
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure-Check-for-clock_gettime-seprately-from-__N.patch
@@ -0,0 +1,36 @@
+From 1118b1912916924bbfa3fd4dced9dfed01fbf0e0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 9 Mar 2020 09:44:33 -0700
+Subject: [PATCH] configure: Check for clock_gettime seprately from
+ __NR_clock_gettime
+
+This helps prioritize using clock_gettime API from libc over syscall
+since direct use of __NR_clock_gettime is not time64-safe
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,6 +125,10 @@ case $host in
+ esac
+ 
+ AC_CHECK_HEADERS(syscall.h sys/syscall.h mach/mach_time.h)
++
++AC_MSG_CHECKING([for clock_gettime])
++AC_SEARCH_LIBS([clock_gettime], [rt], [AC_DEFINE([HAVE_CLOCK_GETTIME], [1], [use clock_gettime])],)
++
+ AC_MSG_CHECKING([for __NR_clock_gettime syscall])
+ AC_COMPILE_IFELSE(
+     [AC_LANG_PROGRAM(
+@@ -143,7 +147,6 @@ AC_COMPILE_IFELSE(
+     ],
+     [
+         AC_MSG_RESULT([no])
+-        AC_SEARCH_LIBS([clock_gettime], [rt], [AC_DEFINE([HAVE_CLOCK_GETTIME], [1], [use clock_gettime])],)
+     ])
+ 
+ AC_CHECK_HEADER(linux/netlink.h,
-- 
2.25.1


