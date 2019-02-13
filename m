Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 88C756BCA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 17:31:27 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id w4so1501399plz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 09:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9HD+zDbmnGYMzprkSE/Hn6VO1KHREY5RSjb2dePQO6U=;
	b=Ocaki3Or2nSA4PIMqoObnvn6wTBLt8CmeAMFJDxstlrbwls6w/4cbusVDtGmZaTmcz
	vMafqwCe7ajiMHVsZ5jpuDhmGpCifyifhH47BYxv1X6clqoMnXNHCS1OCgDKacQMYRKg
	LdwjnGa2xcJ95nnbFSFZS34XY4mWCjJ7n2G461MBhsR5i/9Ah1pLsWQToQW/S0dqGjJQ
	h2KEb6dRuGqy778nlMQVqGIbEsq0o/CcXAmAUadVk+/Ut6aFvPV2MIRv0KHwjhWM8vai
	d1pdVy16UifRu8odEW7qOgrZHcyO2NlUjwAw/4SZOMTNv51C3LnMYvGUroM00oEsaNA3
	FMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9HD+zDbmnGYMzprkSE/Hn6VO1KHREY5RSjb2dePQO6U=;
	b=kBDp+cLORcu5Q0Wi2/l6QsXh+4UUn01WqEetb+43HObcghvU/29yk8HZSCABXdVa+d
	GlCJ4r/b6b7VOyofSeQucgP2SXGajQRbI91sM9SQscME0PtSHbYc311dfoeFl0U9y+FK
	bT9SgTPPDjFps/Vb/URXmWtuMwt9qWyqv7QFlvcRPEXGfe0+ubXYiIGOVSOhEeKd/B2j
	P81Wz108/JZF3w2Fymfash+eZpi3IOKqqbIcMAUpYCsyiIF/4REGksg+PHNNWMRlBymh
	VAwk8d2UnnhaOZPvaXkngWl6svUkbGSIxCiktJMEjpTWKPqtEpKWj+E7PqrGKa5sAEDx
	9SlA==
X-Gm-Message-State: AHQUAuZpaaCWJSQKqMVt25wq4jfdKY1WoBHskx31KYcayPG/re+efg3w
	CsvaIMOOdQ4KtjZ9eAlXdv2vzUxb
X-Google-Smtp-Source: AHgI3Iajbr/BzSI9NUpu+rkR8/6PRHxFKsGbPQw9AyVoNavTgYfFsBoFsOVwpYQm/FmEYqEraC8lsw==
X-Received: by 2002:a17:902:bc88:: with SMTP id
	bb8mr1648292plb.12.1550079088263; 
	Wed, 13 Feb 2019 09:31:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	h15sm21528945pgl.43.2019.02.13.09.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 09:31:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2019 09:31:16 -0800
Message-Id: <20190213173118.44597-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190213173118.44597-1-raj.khem@gmail.com>
References: <20190213173118.44597-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/6] catch2: Upgrade to 2.6.1
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
X-List-Received-Date: Wed, 13 Feb 2019 17:31:27 -0000
Content-Transfer-Encoding: 8bit

Fix build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{catch2_2.6.0.bb => catch2_2.6.1.bb}      |  5 +--
 ...-Wdefaulted-function-deleted-warning.patch | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.6.0.bb => catch2_2.6.1.bb} (83%)
 create mode 100644 meta-oe/recipes-test/catch2/files/0001-Fix-Wdefaulted-function-deleted-warning.patch

diff --git a/meta-oe/recipes-test/catch2/catch2_2.6.0.bb b/meta-oe/recipes-test/catch2/catch2_2.6.1.bb
similarity index 83%
rename from meta-oe/recipes-test/catch2/catch2_2.6.0.bb
rename to meta-oe/recipes-test/catch2/catch2_2.6.1.bb
index 13beb9e8b5..08d6616401 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.6.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.6.1.bb
@@ -6,9 +6,10 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git \
+           file://0001-Fix-Wdefaulted-function-deleted-warning.patch \
           "
-# v2.6.0
-SRCREV = "d75e9b3c0f24fe42553131873459611ed155e297"
+# v2.6.1
+SRCREV = "dbbab8727c342733f75045483048cdcb52421e32"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-test/catch2/files/0001-Fix-Wdefaulted-function-deleted-warning.patch b/meta-oe/recipes-test/catch2/files/0001-Fix-Wdefaulted-function-deleted-warning.patch
new file mode 100644
index 0000000000..555c71ad22
--- /dev/null
+++ b/meta-oe/recipes-test/catch2/files/0001-Fix-Wdefaulted-function-deleted-warning.patch
@@ -0,0 +1,35 @@
+From a39e0eaa8318335260967ffd1d16388eb5a1d6d8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Feb 2019 12:57:00 -0800
+Subject: [PATCH] Fix -Wdefaulted-function-deleted warning
+
+Clang8 warns
+
+catch_interfaces_reporter.h:84:25: error: explicitly defaulted move assignment operator is implicitly deleted [-Werror,-Wdefaulted-function-deleted]
+|         AssertionStats& operator = ( AssertionStats && )     = default;
+|                         ^
+
+Upstream-Status: Submitted [https://github.com/catchorg/Catch2/pull/1537]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/internal/catch_interfaces_reporter.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/internal/catch_interfaces_reporter.h b/include/internal/catch_interfaces_reporter.h
+index 9d99c981..e5fbf8bb 100644
+--- a/include/internal/catch_interfaces_reporter.h
++++ b/include/internal/catch_interfaces_reporter.h
+@@ -80,8 +80,8 @@ namespace Catch {
+ 
+         AssertionStats( AssertionStats const& )              = default;
+         AssertionStats( AssertionStats && )                  = default;
+-        AssertionStats& operator = ( AssertionStats const& ) = default;
+-        AssertionStats& operator = ( AssertionStats && )     = default;
++        AssertionStats& operator = ( AssertionStats const& ) = delete;
++        AssertionStats& operator = ( AssertionStats && )     = delete;
+         virtual ~AssertionStats();
+ 
+         AssertionResult assertionResult;
+-- 
+2.20.1
+
-- 
2.20.1


