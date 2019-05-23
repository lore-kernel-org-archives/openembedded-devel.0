Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CA0A67E43F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 11:55:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 198so5515882wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8FUnIjZGl+JMvwU4g+uR/kO33ab5nmtD3/VqEQuIutI=;
	b=I9Ope3HeCYfGWZRbSZMtuu1QI30OoPuPrknPdKCqqQBseDcgSG+Z48WRAhLLP72H3e
	QAlA4UbqSpgrdI94uUZonwu07d/MP9aW67x0IgeMXtVQ3tJyWSaYxyE2mTVtTdCitPDD
	HDiekVsQfOwz+pZawQwbhRmFkY5spRMNxt1LFAQfno+Mnxa6C0490vXD1dbdrxmYgFKq
	LRTmhqLXHZwWeYNNuZ059TGk8VVtJiLLCw3kCWhDlghr2wn0czgtkDFIUD4kI2Fn7Akf
	3HAdebpEpR52BWkwj6i8UcMGr8Kdv/BeEzeeLjdZ+8qpu9PuyKXjlMeIotwGoTplSJOx
	tUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8FUnIjZGl+JMvwU4g+uR/kO33ab5nmtD3/VqEQuIutI=;
	b=RFMAeiGi37F/i5lCdB75A5AddjnMaoNGULaj3vSxT6ztyQCBsZ4mI2eWcDxMg5ro2t
	WUMHyv4LEJLPkHgEtyilLXiBBZ7CJxiNv6igME27klJrhalc18qiuux6QMbITupzytAN
	gczJoLCDI8/3h9mLzojhIduQ1OJIGNux1eceEycLzerjPJtaEk8qwihkuS/LuR3Ekal9
	fOJHHl3/xwXy1dhkVdHt7EqguoEveUgbqWoSqkGzs0gDDXM9YaG5t8SXoIVI5qvQak4t
	1XqMDbYv7UolNGRALGEbbXCizSrN5M/7JFp4YsGVRzxPJhCUO1PUySkNnqTxlxzqU20P
	EQ2w==
X-Gm-Message-State: APjAAAWJJZRthiwqcvQZneFin+Kyo341aay6sqRZAqzEbO3316kddf4n
	DKiI5dmWCl7oCkxXOvC5N+TIw7eI
X-Google-Smtp-Source: APXvYqywamQj3wnkZOEeaPtdWI92WPaiGjLLOFbzoRdcTuqqQi0pyNUdOADrWmsjR7okpVd+/m26iQ==
X-Received: by 2002:a1c:be0b:: with SMTP id o11mr11882286wmf.63.1558612504283; 
	Thu, 23 May 2019 04:55:04 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	u15sm52980374wru.16.2019.05.23.04.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 04:55:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 11:55:04 +0000
Message-Id: <20190523115505.18245-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523115505.18245-1-Martin.Jansa@gmail.com>
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 7/8] ttf-mplus, ttf-vlgothic: add ttf-mplus license
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
X-List-Received-Date: Thu, 23 May 2019 11:55:04 -0000

* add meta-oe/licenses/ttf-mplus from ttf-mplus/027-r4/mplus-TESTFLIGHT-027/LICENSE_E
* use BPN to use the same LICENSE even with multilib
* use the same license name from ttf-vlgothic
* fixes following warnings:
  WARNING: ttf-mplus-027-r4 do_populate_lic: ttf-mplus: No generic license file exists for: ttf-mplus in any provider
  WARNING: ttf-vlgothic-20141206-r0 do_populate_lic: ttf-vlgothic: No generic license file exists for: mplus in any provider

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/licenses/ttf-mplus                       | 16 ++++++++++++++++
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb  |  2 +-
 .../ttf-fonts/ttf-vlgothic_20141206.bb           |  2 +-
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/licenses/ttf-mplus

diff --git a/meta-oe/licenses/ttf-mplus b/meta-oe/licenses/ttf-mplus
new file mode 100644
index 0000000000..c9cdca3fe6
--- /dev/null
+++ b/meta-oe/licenses/ttf-mplus
@@ -0,0 +1,16 @@
+M+ FONTS                                Copyright (C) 2002-2009 M+ FONTS PROJECT
+
+-
+
+LICENSE_E
+
+
+
+
+These fonts are free softwares.
+Unlimited permission is granted to use, copy, and distribute it, with
+or without modification, either commercially and noncommercially.
+THESE FONTS ARE PROVIDED "AS IS" WITHOUT WARRANTY.
+
+
+http://mplus-fonts.sourceforge.jp/mplus-outline-fonts/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index 9ad348d9fa..efcf1b6165 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -2,7 +2,7 @@ require ttf.inc
 
 SUMMARY = "MPlus font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
-LICENSE = "${PN}"
+LICENSE = "${BPN}"
 LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
                     file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
 "
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
index 62f2bb2805..e522810a24 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
@@ -4,7 +4,7 @@ SUMMARY = "Japanese TrueType fonts from Vine Linux"
 AUTHOR = "Contributor: noonov <noonov@gmail.com>"
 HOMEPAGE = "http://vlgothic.dicey.org/"
 
-LICENSE = "mplus & BSD"
+LICENSE = "ttf-mplus & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.en;md5=66ecd0fd7e4da6246fa30317c7b66755 \
                     file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
 "
-- 
2.17.1


