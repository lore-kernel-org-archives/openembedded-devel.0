Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxMSU-000569-Kd
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 19:51:15 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so2820016pbc.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zhc5L19O9yuIVh7tgiN8FYzsSXGq9fVl2LK2PCdzorA=;
	b=Wc2WTDEhOMufgFVnDfTtHM5ODTj1c85upZaCQp6+835PtpxiDKNY++ecPtLq2Vn7+j
	Gp2Qfv9P1xnKvEhvkoKgZ7v2+YyqDS+EdZxfEzqpSKmCEU8NLofUB0xavROEerXX0yX9
	HUnnpWvtchm6Ex0XoFRE6zgq4/d2UQF5sxky/0DjwI5PQ7K2JQDL3LbHX6fGIgRk2utl
	4Ynfb39TSiv1OucBfMu4RwzGV7I1Kx4kAqTOxPv4ZMAtV3fJgWgiBFo0NvVLDCidF2xU
	fTm9y0D7cwqhkcvdmVVot96D7rIlUV8OymuJi/17QkciQbYNFPHIlPWjNyJXUNrnmYRs
	YKpg==
X-Received: by 10.66.81.231 with SMTP id d7mr49242164pay.27.1358793333078;
	Mon, 21 Jan 2013 10:35:33 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vq4sm9096196pbc.67.2013.01.21.10.35.31
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 10:35:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2013 10:35:21 -0800
Message-Id: <1358793321-11181-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358793321-11181-1-git-send-email-raj.khem@gmail.com>
References: <1358793321-11181-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-kde][PATCH 2/2] recipes: Remove the multiline comments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 18:51:22 -0000

These are now flagged as errors by bitbake
and parsing is terminated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-kde-base/kdelibs4-native_git.bb |    2 --
 recipes-kde-base/kdelibs4_git.bb        |    2 --
 2 files changed, 4 deletions(-)

diff --git a/recipes-kde-base/kdelibs4-native_git.bb b/recipes-kde-base/kdelibs4-native_git.bb
index 3f31391..30485e3 100644
--- a/recipes-kde-base/kdelibs4-native_git.bb
+++ b/recipes-kde-base/kdelibs4-native_git.bb
@@ -11,8 +11,6 @@ SRC_URI = "git://anongit.kde.org/kdelibs.git;branch=master \
 	  file://0002-Fix-openssl-check.patch \
 	  file://0004-Fix-the-path-to-Icemaker.patch \
 	  "
-#file://0003-Fix-FindKDE4Internals-cmake-file.patch \
-
 ## Tag v4.9.0
 SRCREV = "bfdb17858efeeabf74ccb4a4010e250bcde6aa42"
 PV = "4.9.0+git${SRCPV}"
diff --git a/recipes-kde-base/kdelibs4_git.bb b/recipes-kde-base/kdelibs4_git.bb
index 8779572..a66c189 100644
--- a/recipes-kde-base/kdelibs4_git.bb
+++ b/recipes-kde-base/kdelibs4_git.bb
@@ -15,8 +15,6 @@ SRC_URI = "git://anongit.kde.org/kdelibs.git;branch=master \
     file://0006-Fix-makekdewidget-executable-path.patch \
     "
 
-#     file://0003-Fix-FindKDE4Internals-cmake-file.patch \
-
 ## Tag v4.9.0
 SRCREV = "bfdb17858efeeabf74ccb4a4010e250bcde6aa42"
 PV = "4.9.0+git${SRCPV}"
-- 
1.7.9.5



