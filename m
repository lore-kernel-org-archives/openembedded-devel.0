Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCi2r-0004oy-0l
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 03:51:29 +0200
Received: by pbcum15 with SMTP id um15so956697pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 18:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JJldfI2KS8/go8snLKRBzZdGB5RbantwJJhyKXNiyBw=;
	b=o8BH2S1HBADpyneYLSwUHnZy0S6bFkIaA3v1BFVDFonzfyh8LNE/rRc9yLL1ydQjHP
	WYgU0ujbreGMNszNjP5hMaXE4Pp7HAM8ARgtIwygEMhdc69JvWSWIrIjggdqcy66lJEF
	Q0d1EINTApH3ZMuMOWvYnTXBBkZOblZjSVGPRZu8W8+5lKqCe4OkYwMPSrMsL7YE56gl
	yJigR8hgaa0qUNLKN2ouFon79dO3853Bx2xi3JagaVBPYdbfvFiKmj8wk7/3NsL5Vy2u
	bgZb8wy00iBPIta+6j/ebb3XAjctFczUoBO70YXzo4Fvc/B6ATINh+ljTdEGUnlrOH3Z
	Ukrw==
Received: by 10.68.196.163 with SMTP id in3mr67933144pbc.118.1332898946867;
	Tue, 27 Mar 2012 18:42:26 -0700 (PDT)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f5sm1532418pbe.26.2012.03.27.18.42.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 18:42:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 18:42:07 -0700
Message-Id: <1332898927-17745-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1332898927-17745-1-git-send-email-raj.khem@gmail.com>
References: <1332898927-17745-1-git-send-email-raj.khem@gmail.com>
Subject: [toolchain-layer][PATCH 2/2] gcc-4.5: Fix meta-toolchain builds with gcc 4.5
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
X-List-Received-Date: Wed, 28 Mar 2012 01:51:29 -0000

Correct a typo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc   |    2 +-
 .../recipes-devtools/gcc/gcc-cross-canadian_4.5.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc b/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
index b23b322..4602df8 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r47"
+PR = "r48"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
index 97e1a2b..0afc907 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 
 SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "/lib/"
-SYSTEMLIB. = "/usr/lib/"
+SYSTEMLIBS1 = "/usr/lib/"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
 		--disable-libgomp --disable-libmudflap \
-- 
1.7.9.1



