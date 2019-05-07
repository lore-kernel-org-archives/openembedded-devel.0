Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4F17C131
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 14:48:03 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id x132so1145238lfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 07:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=o+Bi5L3EahpuWlij7+nJOjY2OL4QNjGfJxJdYQO3cb0=;
	b=nChGLTME/jYTpIYUO35jisSxFaUoZO14N9bEZNC+mZTotWUkI5zWK8zwOD3FIu2C5m
	sCyBBuvLuj4dtxPVgGxDyuNykMcUZ73cLENQm1iB1SGl+8Kx0nCVn6Djyxdrz2ynAzZ6
	Tmo6wJXUx+H9V2fzw/Q0i38FA4ShHXUROkvvJS53eVyBY1X2bR0xYN5Ik+cWF2qJweNc
	LeufBWOjPDIucVpMEebzP4w2nx2aJ2uL6lfv1nKvAJkc7kjcZQYY34Njlvg6Efa+UfE/
	3RoOUC74e27di0mUCJa5yRbyd6gpUl3A7imlgXi1xCmr87meWhl8EHe9TXtdz9JqzPjH
	R0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o+Bi5L3EahpuWlij7+nJOjY2OL4QNjGfJxJdYQO3cb0=;
	b=hpsqo3Pih/rKuBLAkmAcqyesOH4z9fTKOf8eWkMR7AEz9KILN8AkQ2dTgXZzvgWLq7
	kxhj+cJrKNNtoI4C9HNXhr15cwPcB86unrFWkXizfipcRLpxrGGu+xh9emhzgC5YT0wc
	RSiXOv5qMLXeP3aWQ4dUM1wMJgv8BnHwy12pgwl0eKF0hGkzB1wfkr1cvAMa/oeJgczC
	BpXNGi19QXQqom3wvvWTQ4eZYUjtkwkZucDEwwdKr4d+AHb/4xhXqjLy35AiPdfULZUR
	/8VvCmCVaOxu9Ms3OGAg5E1HcfY8fD7U9sZWIQghjUpJmMxdI/7SbwdWhqBu2IMYWNIt
	Y3bg==
X-Gm-Message-State: APjAAAU+TAnwHX4FGHPJp+Gjz5xQuI0hz1TIxQc++GPqHvoU3aaR5Y7Q
	PzegKTdLgzpOrcs9BIMDgszSvMC2Zjw=
X-Google-Smtp-Source: APXvYqxgtpxBBrM4u4qIrnqWcA6CxAoNYgJ8E5hO+ftaGbm792xqt3qCgsGlN5UxI4YE9bsDOlCDsA==
X-Received: by 2002:a19:3f4f:: with SMTP id m76mr16689321lfa.17.1557240483671; 
	Tue, 07 May 2019 07:48:03 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n4sm3374886lfe.15.2019.05.07.07.48.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 07:48:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 16:48:01 +0200
Message-Id: <20190507144801.8739-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] mmc-utils: update to latest revision
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
X-List-Received-Date: Tue, 07 May 2019 14:48:03 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...rncpy-with-memmove-on-overlapping-me.patch | 36 -------------------
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  8 ++---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch
deleted file mode 100644
index 62e25fde9b..0000000000
--- a/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 175ac0f362bf6121c3537e2f1760ad41c8f81367 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Mar 2018 01:04:57 -0700
-Subject: [PATCH] lsmmc: replace strncpy with memmove on overlapping memory
- copy
-
-here source and destination addresses are overlapping so using memmove is
-going to be more efficient.
-
-Additionally, the bounded size for copy is overflowing for first copy
-
-In function 'strncpy',
-    inlined from 'read_file' at lsmmc.c:356:3:
-/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/mmc-utils/0.1-r0/recipe-sysroot/usr/include/bits/string_fortified.h:106:10: error: '__builtin_strncpy' accessing 4096 bytes at offsets 0 and 1 overlaps 4095 bytes at offset 1 [-Werror=restrict]
-   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
-          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10314723/]
- lsmmc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lsmmc.c b/lsmmc.c
-index c4faa00..bcb854d 100644
---- a/lsmmc.c
-+++ b/lsmmc.c
-@@ -353,7 +353,7 @@ char *read_file(char *name)
- 		line[strlen(line) - 1] = '\0';
- 
- 	while (isspace(line[0]))
--		strncpy(&line[0], &line[1], sizeof(line));
-+		memmove(&line[0], &line[1], sizeof(line)-1);
- 
- 	return strdup(line);
- }
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 37a4755234..69b230e54e 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,13 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "b4fe0c8c0e57a74c01755fa9362703b60d7ee49d"
+SRCREV = "aef913e31b659462fe6b9320d241676cba97f67b"
 
-PV = "0.1"
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
-           file://0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch \
-           "
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


