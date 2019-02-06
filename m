Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id A83EE7C29A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 00:45:59 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id b85so2316431pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2019 16:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XSVYkLcfeJZiOhH5pRUjWhnITlo3iMkcw1zyAMw25vU=;
	b=YYb1C9TvueTs2PKT3P4VGYmIXUilBvjdA/rbkQrCKeFK6kv46JTL4jrsoZNgFAwra4
	ROTqNkgZrUMe29EX96j8gftkpLcVtTSKeKbSIKH3MUXnbP9UvA/+6wGHKLENGjwsWB1D
	Pn2VXjZaupCZjpV+aJPvyeLC8ZYguZiUUFlCK6CSCHdO/CLHn+1IOU0jd1R+7L6Zt4br
	rOLIOkNgze/7mBd/Rm9rQTFfnKSXQz3GSB6o3un5Obh3XzST0eKLBavIZzurEvJVBfD2
	p2kB22HeVoiAGip0tGhM3Xc1ibtE1W3hrm/hgUpgZm2MyLFu6ELfGBYu9+v1b9w/rLjq
	tVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XSVYkLcfeJZiOhH5pRUjWhnITlo3iMkcw1zyAMw25vU=;
	b=jLa+COwUZy4PO43Bq3pKDacOXRZMNk/ceXFtKAn5IXc9sXsKCmyUPyZws7z86QJFRw
	31umb2+K+y0JKHHeUOkUyC9uOM2fqfCbF9PODVx+/bjvW1qW9SS6tM9RIY6AdzfTOd9e
	xKaa68z4BctCRcMKDYenFdH+t38H+SqZkw5Hj62D2rN8feQNFqHQqhAWd0BFL/bDZBX+
	gseHZnuGgHokBj3Dw5TOTDEhqlvAnd1fCqG17Z17YhHYumYdxOJ0SznF/YuMaxYNh+7L
	/3e5PBcimiAdaH73g/d0toNgJUGAVTDb/C4p1tlejnDc5PCMeybtYk6W1XiIUYUysbU1
	rqgw==
X-Gm-Message-State: AHQUAubakaB6xjHahXpipEPS5ivF04mnQYyoINiR9prGWBbfjcYJXxEG
	9pC850z6TfOcjQLaolV7d9w2Ma3f
X-Google-Smtp-Source: AHgI3IbB6g1QK1YaNczDV6IXz9IpqY3sszv45dGiZeEwJS6mW/KybXAuXl1e1Ru0dQf0/ZqMq+DJtw==
X-Received: by 2002:a63:555b:: with SMTP id f27mr2342213pgm.313.1549413960369; 
	Tue, 05 Feb 2019 16:46:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	l74sm7684098pfb.145.2019.02.05.16.45.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 16:45:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2019 16:45:46 -0800
Message-Id: <20190206004547.32351-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206004547.32351-1-raj.khem@gmail.com>
References: <20190206004547.32351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/6] mongodb: Fix build with clang
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
X-List-Received-Date: Wed, 06 Feb 2019 00:46:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sio-Dont-use-experimental-with-clang.patch | 28 +++++++++++++++++++
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
new file mode 100644
index 0000000000..b597422e40
--- /dev/null
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
@@ -0,0 +1,28 @@
+From 31ca5c563f1d9a3f70258be3dd2b1e547a65a550 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 5 Feb 2019 00:21:12 -0800
+Subject: [PATCH] asio: Dont use experimental with clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../asio-master/asio/include/asio/detail/string_view.hpp      | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
+index 222c02186d..3bf7494529 100644
+--- a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
++++ b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
+@@ -28,8 +28,8 @@
+ namespace asio {
+ 
+ #if defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
+-using std::experimental::basic_string_view;
+-using std::experimental::string_view;
++using std::basic_string_view;
++using std::string_view;
+ #else // defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
+ using std::basic_string_view;
+ using std::string_view;
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index 6494e25bf0..53a9f66117 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.0 \
            file://arm64-support.patch \
            file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
            file://0001-Support-deprecated-resolver-functions.patch \
+           file://0001-asio-Dont-use-experimental-with-clang.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0002-Fix-default-stack-size-to-256K.patch \
-- 
2.20.1


