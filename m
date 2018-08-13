Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id B5F62745AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:16 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id r1-v6so7187587pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CZoWycTkZfnOQFxCpBkWuVIeQxK4OxG3fEUFITu1/cY=;
	b=fZGjFyBvUvPzmCHNWwk26iYyDp7GJIJvoCVli+dwsgIDv3SOVD5EOFTorU1Qq52RtH
	c3vranLRcdSSTlHUPbTxbCwJ9P9Q3LEylFd77Kj8C4TldrCd/sy/BBiarPVbWwKGk7PD
	8nSgIEIyrGUqVEPon57XrWtZjaMhlWEyIexsVX0v+hIhesdsByxBOfzquHJ8/ceRQ8Xr
	1xyfoc/Uw3cs6gIX6boqBYZfdYpHrKw61VPM8Smh9toMggbuPiQnS8IW0/kMXPpUMDq7
	qHl+b3ZspmutIA4xG8gdi2TvwgkXCSmwgenwzG8kUdUto2SOlLSH14YQcfQ5kMqsL4Rb
	dglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CZoWycTkZfnOQFxCpBkWuVIeQxK4OxG3fEUFITu1/cY=;
	b=jk5izc7/DxO5Wzk3zU5TOAvRDKfnZg+1cWRTYshm82V2B00AR0W/W3McM938FerPq5
	YVZzRik9O3hezK7sxx9FcRNQdFAJ/5qHqZWiNeB1TYoVN7hVGtj8B048IqgnH9nFRcWk
	dJGNA+z/cGpMu2fdEphCLGLV91DnVJHmZsFfP/q/tPNSPBoLJzAtZfybEvCTX43KgKSI
	KeyZoNthUET3L2QqPtok0pe+GX+ZBtPF0ASORSFVDru+gICO4EFjQi5t3aXww8HwqhXV
	yMYNKGHor7WDdqSXqYF+EoxEzO7ON8tJPj6vewKcCaTC2BjcgmfnEgZ1npzgntjNbKBG
	PdcA==
X-Gm-Message-State: AOUpUlGbg9kQSjw+w/dlpPuQ28RoxPwTrnKGcRAV1dHRKdJ2Mn8miZcb
	TnHU3geA6SlxAXx3YfTTI8mhqmp3
X-Google-Smtp-Source: AA+uWPzhKvQ1Tvfarh1q863deL6/Kj3+vkPggyc8f24eHw+yRD2Avfh+FGEMaqZq68L8RLu7HohT9w==
X-Received: by 2002:a62:1157:: with SMTP id
	z84-v6mr18050753pfi.66.1534148296769; 
	Mon, 13 Aug 2018 01:18:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:42 -0700
Message-Id: <20180813081742.6961-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 21/21] stress-ng: Upgrade to 0.09.36
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Several-changes-to-fix-musl-build.patch |  2 +-
 ...0002-stress-fcntl-fix-build-for-musl.patch | 25 -------------------
 ...ess-ng_0.09.14.bb => stress-ng_0.09.36.bb} |  7 +++---
 3 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
 rename meta-oe/recipes-test/stress-ng/{stress-ng_0.09.14.bb => stress-ng_0.09.36.bb} (76%)

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
index d604f860a1..93d9b544d5 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
@@ -1,4 +1,4 @@
-From 784dcd09d3f266e271d007f4fd257e85036872ca Mon Sep 17 00:00:00 2001
+From d499375fe267be8819ecb985123d89a21edc0e59 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
 Date: Tue, 17 Oct 2017 10:13:20 -0500
 Subject: [PATCH] Several changes to fix musl build
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
deleted file mode 100644
index ed3287e329..0000000000
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From faadbc147394cea9278bc2494f33e3521d88e742 Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@linux.intel.com>
-Date: Tue, 9 Jan 2018 18:38:45 -0800
-Subject: [PATCH] stress-fcntl: fix build for musl
-
-Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-
-Upstream-status: Pending
-
----
- stress-fcntl.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/stress-fcntl.c b/stress-fcntl.c
-index 2ea867b..e91b345 100644
---- a/stress-fcntl.c
-+++ b/stress-fcntl.c
-@@ -415,6 +415,7 @@ ofd_lock_abort:	{ /* Nowt */ }
- #if (defined(F_GET_FILE_RW_HINT) && defined(F_SET_FILE_RW_HINT)) | \
-     (defined(F_GET_RW_HINT) && defined(F_SET_RW_HINT))
- 	{
-+		int ret;
- 		size_t i;
- 		unsigned long hint;
- 		static const unsigned long hints[] = {
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.36.bb
similarity index 76%
rename from meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb
rename to meta-oe/recipes-test/stress-ng/stress-ng_0.09.36.bb
index 7fab43025f..9d1f316477 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.36.bb
@@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "zlib libaio"
 
 SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
-           file://0002-stress-fcntl-fix-build-for-musl.patch \
-          "
+           "
 SRC_URI_append_libc-musl = " \
     file://0001-Several-changes-to-fix-musl-build.patch \
     "
-SRC_URI[md5sum] = "1f8b6c2c2830704d2a2814c16082d48e"
-SRC_URI[sha256sum] = "02cac34a5cb041197af60c1867844c6cbb089a6d10a38cdcf7b8f27bfaa6ef8f"
+SRC_URI[md5sum] = "7907e858f560870926e31dfa92f887b7"
+SRC_URI[sha256sum] = "16102abee20fe26b1a8784ab05c61b3e72474503bc50b9debc9f457cb4b4e228"
 
 UPSTREAM_CHECK_URI ?= "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/"
 UPSTREAM_CHECK_REGEX ?= "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.18.0


