Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id BE604606A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 04:58:44 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id x64so15147157pgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 21:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nJ+OTnecX/7lip1NIUN39/xwCHw0coSKWGc04tRyGIk=;
	b=gaHEdQGQE9KZcx2LA90V9xfdTQCy8R3mWTdXq8/tssQdGlRBPfM/X2KdiPZQjuXNEd
	5PsKuaaiRJSJbWqTAy65WMAekhkbCe8jhVyt1l9APz58cPeGby+/GeTqsc2aegUhVIzd
	AMjB4abQs53LyUL/rnO8hYUfxc+D19ylHl4GyhyNXo0nj+nkl5OaIpQmpuLnvsPaQXxv
	abSpJAvBvlUIPkdYl7us3G35TCsgKpKAuWFb949mIXWJuvbBkZOoR0Wweb3Z1pNhiLzz
	Kndv3tRccQSABzXvO4XG0xgnsc1LYxKUOB7YMq+FJoVLJ51TMG7G8COIQzWm6o69P8Ua
	Jd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nJ+OTnecX/7lip1NIUN39/xwCHw0coSKWGc04tRyGIk=;
	b=WzwB1wdc9u84X+1KY7nW3/MkwSvLgHVUUBhg8fKsSgJ1uNs7+k2cuvNKraGwC5bV6+
	FwfVTLPjTFyGAf9DVJa4sTluFrrKHxdiwMcZHkbbzWtY/CpswLr72ZbegtxGZDbDt0EE
	4sOWHI2D2KwiMvzIzI5XW9o94/Luk41+aqZtVvT0kI5qTo1PVeOR54MHCldgDbhRS1iM
	HemGlHPQdhG8rKoPUEeRq7rt2/AifohAVT+GX4g49lPm3JbrSe+3GtrlglUI9dokZ5WM
	6FAwm+ffO54mTUqCsHj0RnmuO1uRzcPqb6cxe7ZgIqINMx0vZ4lUxGEyoeNtxgg5ZF/c
	eToA==
X-Gm-Message-State: AODbwcA5tFjPph9pngZtXOg0s7LR36w+lDM9e/lm1taXrFHmIBDs0xOv
	VgCgwyyWLAB+I1cL
X-Received: by 10.99.107.136 with SMTP id g130mr10245242pgc.3.1496465925669;
	Fri, 02 Jun 2017 21:58:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	o29sm40732836pgc.27.2017.06.02.21.58.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 21:58:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 21:58:31 -0700
Message-Id: <20170603045833.8120-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170603045833.8120-1-raj.khem@gmail.com>
References: <20170603045833.8120-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python-numeric: Fix build with musl
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
X-List-Received-Date: Sat, 03 Jun 2017 04:58:44 -0000

Use gettimeofday() definition from system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-define-this-function-differently-than-it.patch | 30 ++++++++++++++++++++++
 .../recipes-devtools/python/python-numeric_24.2.bb |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch

diff --git a/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch b/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
new file mode 100644
index 000000000..81ed744cb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
@@ -0,0 +1,30 @@
+From 322e781c67d7a78fc2cfc3d377f50b825fc64abb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Jun 2017 20:21:01 -0700
+Subject: [PATCH] it tries to define this function differently than it is
+ defined in sys/time.h.
+
+Use the definition from system
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Packages/RNG/Src/ranf.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/Packages/RNG/Src/ranf.c b/Packages/RNG/Src/ranf.c
+index 5ca7dc5..e669fa8 100644
+--- a/Packages/RNG/Src/ranf.c
++++ b/Packages/RNG/Src/ranf.c
+@@ -149,9 +149,6 @@ void Mixranf(int *s,u32 s48[2])
+ #else
+ 	struct timeval tv;
+ 	struct timezone tz;
+-#if !defined(__sgi)
+-	int gettimeofday(struct timeval *, struct timezone *);
+-#endif
+ 
+ 	(void)gettimeofday(&tv,&tz);
+ 	s48[0] = (u32)tv.tv_sec;
+-- 
+2.13.0
+
diff --git a/meta-python/recipes-devtools/python/python-numeric_24.2.bb b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
index c0b04e144..c91d77c81 100644
--- a/meta-python/recipes-devtools/python/python-numeric_24.2.bb
+++ b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
 
 PR = "ml3"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz \
+           file://0001-it-tries-to-define-this-function-differently-than-it.patch \
+"
 S = "${WORKDIR}/Numeric-${PV}"
 
 inherit distutils
-- 
2.13.0


