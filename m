Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 48C7577DCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:58:32 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id m21so1781236pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yMKx0oJ2SeI5kfbGChJo5SNjvaXhoo75lYrXXjy53hM=;
	b=vYUayWdDHX0aInEr633jQZVfMd8x8zGABgDq59NaklfRwUKkngc6F8IVFhi65hueZ9
	FRn4g9Pe+Cq7aBK/CQFWPaXbmV/S/lP1P3MYMzB2YIvHp1jKcihqJr3S61uLc+887kar
	7i7hEg0xnY5540KVhcVUgYZJ1QuyThc4tj1oOTN/wauwxhFpcdVgHcCtQuQ68Yeq034G
	wtXKAdbBU/3TaVKbrJsxT2NtAMO71//E64TY9+lC1hELmquUiTKnPUbG/ZXA5wuGzNji
	BIPE+57AFjsKps6zrrrWAhf+uX9UugmOEWuBiB22pVEP2qhJXUVFJh2nNcsvnMksqPcb
	YB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yMKx0oJ2SeI5kfbGChJo5SNjvaXhoo75lYrXXjy53hM=;
	b=eQhL6UmpvA138TMSuBKyFx/XmY+vz8evIxSWUcvgfu6Wyw0j1MdsWm7QAv+qVaM69K
	hAjeDyE8fls78Jqxy1paijc5rY3ySnBFI4x7NzSk+tzP0Zg6x4MRv2aUcovhfiZve2yg
	BMkK6gK8ARvOfn3nKcLJBDaayJFrxPiXOOG7yeNc23rkny7v/768FhA4huFNSqFkAAKj
	SiLUjIexXlPFBUbJ66tgmMNoe7OTHLIUCtxctFitRzO/F/iBrStrFaFFbVL/hZXuklKp
	0btpkFyjsdwOU+Pp1OXlaAdwazCD1sKWXIVf3wRjLVKwYeJbJkrNon9GpPB/VAarxsR9
	xP0Q==
X-Gm-Message-State: AIVw1113/l03H61C5wfCvs5hA7G6Pa0dv/CQmG0jmGRVRIDO/1UwdsEZ
	dhsuSCezhc+j+he1
X-Received: by 10.98.109.65 with SMTP id i62mr1748737pfc.309.1501095514160;
	Wed, 26 Jul 2017 11:58:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s15sm33245864pfk.42.2017.07.26.11.58.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:58:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jul 2017 11:58:12 -0700
Message-Id: <20170726185815.8898-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170726185815.8898-1-raj.khem@gmail.com>
References: <20170726185815.8898-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/7] usermode: Link with libm for powl() API
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
X-List-Received-Date: Wed, 26 Jul 2017 18:58:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Makefile.am-Link-with-libm-for-powl-API.patch | 26 ++++++++++++++++++++++
 .../recipes-support/usermode/usermode_1.111.bb     |  6 ++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-Makefile.am-Link-with-libm-for-powl-API.patch

diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-Makefile.am-Link-with-libm-for-powl-API.patch b/meta-gnome/recipes-support/usermode/usermode/0001-Makefile.am-Link-with-libm-for-powl-API.patch
new file mode 100644
index 000000000..76640b0a1
--- /dev/null
+++ b/meta-gnome/recipes-support/usermode/usermode/0001-Makefile.am-Link-with-libm-for-powl-API.patch
@@ -0,0 +1,26 @@
+From fda0ff49968aebc7b27f9711cf6eb7f6c560adc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jul 2017 18:28:15 -0700
+Subject: [PATCH] Makefile.am: Link with libm for powl() API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4219f28..2a5ceac 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -69,7 +69,7 @@ dist_pkgdata_DATA = usermode.ui
+ userhelper_SOURCES = userhelper.c userhelper.h shvar.c shvar.h
+ userhelper_CPPFLAGS = $(AM_CPPFLAGS) -DSYSCONFDIR='"$(sysconfdir)"'
+ userhelper_LDADD = liblib.a $(LIBUSER_LIBS) $(GLIB_LIBS) $(PAM_LIBS) \
+-	$(SELINUX_LIBS) $(EFENCE_LIBS)
++	$(SELINUX_LIBS) $(EFENCE_LIBS) -lm
+ 
+ userinfo_SOURCES = userinfo.c
+ userinfo_CPPFLAGS = $(AM_CPPFLAGS) $(PIXMAPDIR_CPPFLAGS) $(SBINDIR_CPPFLAGS) \
+-- 
+2.13.3
+
diff --git a/meta-gnome/recipes-support/usermode/usermode_1.111.bb b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
index 06e400e52..c2d73289e 100644
--- a/meta-gnome/recipes-support/usermode/usermode_1.111.bb
+++ b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
@@ -15,12 +15,12 @@ DEPENDS = "libuser ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '',
 
 SRC_URI = "https://releases.pagure.org/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-formatting-issues.patch \
-"
+           file://0001-fix-compile-failure-against-musl-C-library.patch \
+           file://0001-Makefile.am-Link-with-libm-for-powl-API.patch \
+           "
 SRC_URI[md5sum] = "28ba510fbd8da9f4e86e57d6c31cff29"
 SRC_URI[sha256sum] = "3dd0b9639b5bd396b7ea5fada6aaa694dbfdaa3ad06eb95a6eabcdfd02f875c6"
 
-SRC_URI_append_libc-musl = " file://0001-fix-compile-failure-against-musl-C-library.patch"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit autotools gettext pkgconfig
-- 
2.13.3


