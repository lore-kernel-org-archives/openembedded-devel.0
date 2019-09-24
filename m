Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC836D7C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2019 01:33:42 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f19so191535plr.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 18:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IlZtgga+S6RjMhnTV61i8sIPOwVETf6NGIFE4ExOOTM=;
	b=TCNPNjyaILFCiwqAwLq6s1N5GbpyN4fe4nXmrjJ+SxkV/YyqsDSLlCxBD7N/3qVWE3
	fnE/0oDCB5FoUFQAG3QkAPrRfaJ3TTR5OV/06V9fm3E7ShaL6n+Q3q38QFpH7oGz4U6P
	JG4n023nlC63og67nMs8nflbCmEt/tdNnPNYLpwOTKBB/1fwuUBxL89Gf1wfprzg3BV2
	gVwp4AiaQznAx0S0QuUgrq25HgqA+ab6bxyJaFWaR6BuK+6iCTY/cSl/WRRvvMruhvvc
	KpS13dnt1DHsRlHdlwXsvQotEGNdaqj82YHsyXxZ9g6DdA3a6GUEmNitbU87CWHHj/2R
	TjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IlZtgga+S6RjMhnTV61i8sIPOwVETf6NGIFE4ExOOTM=;
	b=d9fHS91EihsVtdu4bsUF5cT2FquR732vaDMNa83n4xxjx69kXKhEuew+8tV+AZ+e0t
	AE+YoyP4AF09ycm0hoc9AmZxNUwczWloyX1M2t4qKy5K+1TQ+1Zn7iHwylc3SrmD0S6f
	XI9kptXUbR1TicoJWnNzxiJvmSEGdH+IsVQ8tGzqvYwm8LOj5FKql/z8EEBoFJexmX4/
	ZbPJhAShZAtLEl878WQ1YvqfqZl/QPnEqGmECPCDAVyNFd+oQuSgRMua71E25Qdgbyuy
	ijIZk9B0TJXYNuzYduygEpgvT8KtiX863JxJDA8qdRtKu8TOGdBO71iq9+wt2sODFERk
	3NIA==
X-Gm-Message-State: APjAAAWKnMICrUFooqbd2E5kmfFOq/z/bD3VoNmryyxTTVe1jhSx8/Pt
	SgDlFkG4AiVI7ZAGBV0fw9na4hfPCaw=
X-Google-Smtp-Source: APXvYqzeUU/3glj3nYydgb8N/mZGo6H1kOpEEz7BRWrE0Pr0ko0ntFAcoNEXqrVwyT4Vn2OBjhBKoQ==
X-Received: by 2002:a17:902:bb84:: with SMTP id m4mr463914pls.10.1569288822656;
	Mon, 23 Sep 2019 18:33:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id o9sm49688pfp.67.2019.09.23.18.33.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 18:33:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Sep 2019 18:33:32 -0700
Message-Id: <20190924013332.2305173-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mongodb: Fix build on musl/aarch64
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
X-List-Received-Date: Tue, 24 Sep 2019 01:33:42 -0000
Content-Transfer-Encoding: 8bit

one impl of strerror_r is glibc specific, therefore check for __GLIBC__
also before using it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rror_r-implementation-glibc-specific.patch | 31 +++++++++++++++++++
 .../mongodb/0003-fix-musl-strerror_r.patch    | 30 ------------------
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb    |  2 +-
 3 files changed, 32 insertions(+), 31 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
 delete mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0003-fix-musl-strerror_r.patch

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
new file mode 100644
index 0000000000..5337fcdbfd
--- /dev/null
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
@@ -0,0 +1,31 @@
+From ca004968b8d2149f72d4edcfe029489a8c5e10ca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Sep 2019 12:31:31 -0700
+Subject: [PATCH] Mark one of strerror_r implementation glibc specific
+
+glibc has two incompatible strerror_r definitions, one of them is
+specific to glibc, mark this one so
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/util/errno_util.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mongo/util/errno_util.cpp b/src/mongo/util/errno_util.cpp
+index 564c0071ea..4f7e1d3a38 100644
+--- a/src/mongo/util/errno_util.cpp
++++ b/src/mongo/util/errno_util.cpp
+@@ -61,7 +61,7 @@ std::string errnoWithDescription(int errNumber) {
+     char buf[kBuflen];
+     char* msg{nullptr};
+ 
+-#if defined(__GNUC__) && defined(_GNU_SOURCE) && \
++#if defined(__GNUC__) && defined(_GNU_SOURCE) && defined(__GLIBC__) && \
+     (!defined(__ANDROID_API__) || !(__ANDROID_API__ <= 22)) && !defined(EMSCRIPTEN)
+     msg = strerror_r(errNumber, buf, kBuflen);
+ #elif defined(_WIN32)
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0003-fix-musl-strerror_r.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0003-fix-musl-strerror_r.patch
deleted file mode 100644
index c6035894ed..0000000000
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0003-fix-musl-strerror_r.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Index: git/src/mongo/util/errno_util.cpp
-===================================================================
---- git.orig/src/mongo/util/errno_util.cpp
-+++ git/src/mongo/util/errno_util.cpp
-@@ -49,6 +49,16 @@ const char kUnknownMsg[] = "Unknown erro
- const int kBuflen = 256;  // strerror strings in non-English locales can be large.
- }  // namespace
- 
-+inline char const * strerror_r_helper( char const * r, char const * )
-+{
-+    return r;
-+}
-+
-+inline char const * strerror_r_helper( int r, char const * buffer )
-+{
-+    return r == 0? buffer: "Unknown error";
-+}
-+
- std::string errnoWithDescription(int errNumber) {
- #if defined(_WIN32)
-     if (errNumber == -1)
-@@ -63,7 +73,7 @@ std::string errnoWithDescription(int err
- 
- #if defined(__GNUC__) && defined(_GNU_SOURCE) && \
-     (!defined(__ANDROID_API__) || !(__ANDROID_API__ <= 22)) && !defined(EMSCRIPTEN)
--    msg = strerror_r(errNumber, buf, kBuflen);
-+    msg = strerror_r_helper(strerror_r(errNumber, buf, kBuflen));
- #elif defined(_WIN32)
- 
-     LPWSTR errorText = nullptr;
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index d3c19d6c4c..3e77ac32f3 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -25,8 +25,8 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.2 \
            file://0003-Fix-unknown-prefix-env.patch \
            "
 SRC_URI_append_libc-musl ="\
+           file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
            file://0002-Fix-default-stack-size-to-256K.patch \
-           file://0003-fix-musl-strerror_r.patch \
            file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
            "
 
-- 
2.23.0


