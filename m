Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00015C44508
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14734.1782634327586239971
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YN2KvTlf;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4928835eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634327; x=1783239127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ind4ShP67nbubjW4S+neM77fjmZkZR1W30FvYgq6fuc=;
        b=YN2KvTlfmtkGLMpW88pOHyX0aT7EekqVwWd+RsVl1ue9WCTBv6Z972HCEVXBxcch36
         XrborzaG7LmGI4fcYmn8p628vr7xE8ZnuYjs61hdvhK3CL3z4UXftXYN73eJ50gioeHS
         CS10xn2GipCiW7IeKH/P94LTfQHfHQaJ1Nd9jHF0Pk8VIgtHZY21WYEdEZMrW5H895yw
         RU9HedIQ/bSrEY2m8ZsyqoEsFuwX8ox5FS7cYJjW59m4lNxnKEEn2aFo5/ybQl9cADal
         VtR63AUk5PSqwpHrZNmNjoRBJlSiH3GBa7R4uFmwsugKFjAiw/qfsrF7K4Qz373U8Yke
         R4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634327; x=1783239127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ind4ShP67nbubjW4S+neM77fjmZkZR1W30FvYgq6fuc=;
        b=TVEHnEJceUOpFhboIwOUE5BHUotFXVTt9UuvfQHQnRKGFfHoy18MfgrD0uZXpimY8w
         yZi9qx6UQLnzqpsNxyzQxU5l90xemMBTleEXQQbCAkyxSN0oqzytD7ONXxfsb4xbpynH
         jCEziG3gTMg4H4fjy50i0l8fG05yxtXGLl97L+6ZOk6zS8E3jCdv4gcCrWvPTqWZmXOi
         HWSMzgnnBNS80x0q1pevCkkCXXlVa9NKvkr/v3sZZo4A1itqLd/fUvDPhOoigXiM/EVb
         B7GjgJwqYsXTH6CubSNGo/cgtRBAgXY1ZfeXe+mvCf/UgcF/+MWaCyrIbdALdP61sYCt
         QOYg==
X-Gm-Message-State: AOJu0Yx0ARC6reSMQKk8DTUrdmLDYrrhgh+rE24rxVVgSy0AOU9oqOZZ
	C8WcjGFCB4z2DbJhpPiPPNf+0S0QfUbNoKWNnDrdpSQjl8koYyNgOMHp1z0mLMoSQasfig==
X-Gm-Gg: AfdE7clmvQqQPwz9QOw5/RU9r3Q+M8vYKlrpdJYpX5SLVVv24vx60pR8zQggp3+2wQm
	WQuug7+1z/s8An+hG+MB7GoKt9VH60okPcibIl9ltm8wpiYCIO7IkU6BhMGhPBrav2lx8Z9GH39
	p5OcNPcWXTov5hqOUZNSM6fmRW47VjCIlu+RQm6ST2FM3jG9XQW1ywgt7onepEQmJ46E9PGFpSy
	f4WlmgEPuzOIewUdVkv8pCPr9Tu3k6XVA41XSmd+bVD9pPko+2NeosCebfR3YOyf4FieL3UOv/f
	QaoxMzINGcutINBiLt3ZxDI56EVEDakDtsuIuD+i4zJY2USpeBjAyQ6716gM1Yd77ywE1K9Xzns
	qOA0HFYje5XvmaK3oIr+Cgj+FRjqlilYE3DOqg7n8x9PgEoGEdwlOU5Ukk/fLSF0u8Ohmj1y4Ai
	fwMDotazvkPQvDh1FMPsmS6278NNy/LXYLJCDE/ProoZf2ud9prMaN452qU6SaCOlheHMiPQh87
	ZBNLlYOpUCmtrNGeR506N1iVtREr4vpsFW1Aaf6bAjQJbz++eQ3dc3ii6dFfZq0fwSRymXxbCly
	/PuckmziquHidxxuxLR2RU/gZ8Y1tw==
X-Received: by 2002:a05:7301:3f0f:b0:30e:c32a:ec84 with SMTP id 5a478bee46e88-30ec32aee3dmr1159375eec.30.1782634326816;
        Sun, 28 Jun 2026 01:12:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 045/128] tiptop: upgrade 2.3.1 -> 2.3.2
Date: Sun, 28 Jun 2026 01:09:56 -0700
Message-ID: <20260628081122.178348-45-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127855

Drop the no-longer-needed 0001-Fix-parallel-build-problems.patch,
0002-fix-reproducibility.patch and
0001-Fix-a-lot-of-Werror-format-security.patch.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ror-format-security-errors-with-mvwp.patch | 31 ------------------
 ...rallel-build-problems-by-Adrian-Bunk.patch | 28 ----------------
 ...fix-reproducibility-of-build-process.patch | 32 -------------------
 .../{tiptop_2.3.1.bb => tiptop_2.3.2.bb}      |  5 +--
 4 files changed, 1 insertion(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch
 delete mode 100644 meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch
 delete mode 100644 meta-oe/recipes-extended/tiptop/tiptop/0002-fix-reproducibility-of-build-process.patch
 rename meta-oe/recipes-extended/tiptop/{tiptop_2.3.1.bb => tiptop_2.3.2.bb} (78%)

diff --git a/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch b/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch
deleted file mode 100644
index 6d5e293c7f..0000000000
--- a/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 42e99eb6c727df7c9d49586803a4bf9933a9796b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Oct 2021 10:52:42 -0700
-Subject: [PATCH] Fix a lot of -Werror=format-security errors with mvwprintw
-
-In all these places a non-constant is used as a format string which
-compiler complains about. Fix by using "%s" as format.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/helpwin.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/helpwin.c b/src/helpwin.c
-index 0d660f9..1623d9c 100644
---- a/src/helpwin.c
-+++ b/src/helpwin.c
-@@ -61,7 +61,7 @@ void show_help_win(WINDOW* win, screen_t* screen)
-     wattroff(win, A_REVERSE);
- 
-   /* screen description */
--  mvwprintw(win, 2, 1, screen->desc);
-+  mvwprintw(win, 2, 1, "%s", screen->desc);
- 
-   /* max size of column headers */
-   for(i = 0; i < n; i++) {
--- 
-2.33.1
-
diff --git a/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch b/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch
deleted file mode 100644
index ae676ae449..0000000000
--- a/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 848983a30dc99248ec45632bfc31718716a86e9d Mon Sep 17 00:00:00 2001
-From: Tomasz Buchert <tomasz@debian.org>
-Date: Fri, 7 Jul 2017 21:15:58 +0200
-Subject: [PATCH] Fix parallel build problems (by Adrian Bunk)
-
-Taken from debian
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile.in b/src/Makefile.in
-index 32ab563..1993c9b 100644
---- a/src/Makefile.in
-+++ b/src/Makefile.in
-@@ -59,8 +59,9 @@ lex.yy.c: calc.lex
- lex.yy.o: lex.yy.c
- 	$(CC) $(CFLAGS) -I$(srcdir) -c lex.yy.c
- 
-+y.tab.c: y.tab.h
- 
--y.tab.c y.tab.h: calc.y
-+y.tab.h: calc.y
- 	$(YACC) -d $(srcdir)/calc.y
- 
- y.tab.o: y.tab.c
diff --git a/meta-oe/recipes-extended/tiptop/tiptop/0002-fix-reproducibility-of-build-process.patch b/meta-oe/recipes-extended/tiptop/tiptop/0002-fix-reproducibility-of-build-process.patch
deleted file mode 100644
index cecb70bc99..0000000000
--- a/meta-oe/recipes-extended/tiptop/tiptop/0002-fix-reproducibility-of-build-process.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 89dd9d8705408dccd5c5e47d22eba6fd6ec22b50 Mon Sep 17 00:00:00 2001
-From: Tomasz Buchert <tomasz@debian.org>
-Date: Thu, 9 Jul 2015 16:07:23 +0200
-Subject: [PATCH] fix reproducibility of build process
-
-The upstream Makefile sets macros that depend on
-a particular platform where the package is built.
-We don't set them which fixes the problem.
-
-Taken from debian
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile.in | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/src/Makefile.in b/src/Makefile.in
-index 1993c9b..4392c06 100644
---- a/src/Makefile.in
-+++ b/src/Makefile.in
-@@ -48,9 +48,7 @@ Makefile: Makefile.in ../config.status
- 
- 
- version.o: version.c
--	$(CC) $(CFLAGS) -DCOMPILE_HOST="\""`hostname`"\"" \
--                        -DCOMPILE_DATE="\"`date`\"" \
--                        -c $(srcdir)/version.c
-+	$(CC) $(CFLAGS) -c $(srcdir)/version.c
- 
- 
- lex.yy.c: calc.lex
diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.2.bb
similarity index 78%
rename from meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
rename to meta-oe/recipes-extended/tiptop/tiptop_2.3.2.bb
index 8dca2940b5..fe703c7e95 100644
--- a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.2.bb
@@ -5,12 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "ncurses libxml2 bison-native flex-native"
 
 SRC_URI = "http://files.inria.fr/pacap/${BPN}/${BP}.tar.gz \
-           file://0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch \
-           file://0002-fix-reproducibility-of-build-process.patch \
            file://0001-Fix-build-when-S-B.patch \
-           file://0001-Fix-a-lot-of-Werror-format-security-errors-with-mvwp.patch \
            "
-SRC_URI[sha256sum] = "51c4449c95bba34f16b429729c2f58431490665d8093efaa8643b2e1d1084182"
+SRC_URI[sha256sum] = "a14b1b59ea4856844e27bc4e22129b7906b8815afaf50a25ac60998dafcc93a7"
 
 UPSTREAM_CHECK_URI = "https://team.inria.fr/pacap/software/tiptop/"
 

