Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 02D2A6093D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 22:39:37 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id az12-v6so13873412plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=66Vz+oe/r+GseLXSW3l32I2Yf6m3m/+RXtzYUjUcjQs=;
	b=W+GCKfmTbr2RnPxaksJ24t+Ttd0ziOh0Mn39AZPljyx74FCpL1AMXwshWOL5UhsbWF
	M9AvNvjmrX46KMQna1A9MRWDmBLT+hwOMg2ZEsTFORDyp+FzuuyU7XaXyIpjBpnd35Dq
	JBzgl9/wJ3okHYX7L4etWHtliqpam5Li7Kbw+JvHgD7CpV+dUN3ZjGhNY15UC0M5sYHR
	HQIWbm0RcGZsHT93yKM2ayy2E1nxu95CJ0lV/Aiy9qzoTVYVg9R1rsDIecsYn23Mhi75
	YG+2IqA+W1Es+6ICeRFCCi1q7V/bouw+pjuIhpi9cWwQPcetO6iORVFa7BT7GMINVyek
	Dg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=66Vz+oe/r+GseLXSW3l32I2Yf6m3m/+RXtzYUjUcjQs=;
	b=s6O6ghsXdslMvArkajJm2PznkjSSr4pCfg34wqr3cVm2sTcpV5Wk1Xo92KJqxD3+/P
	3Q2CY4HHj+5J9aKsY9D8z9GSKZhYXv9lyG2diRun05mghQn1ILMaX71IoiBhKkvsNEGR
	w7s1dzDQAlm9JQv3LIVxRotnaBW/uvDwNauPawyRhz0plt24bQZlA1P/y4sf1kfaZBN/
	qQi7+0jhbUpdyblR8n3AOYcje5ssHddJ30H7HLNOPJYPZmcW5iiKwtIA/MbQbazskaqs
	U8sicQ4cflGY+4rt6dSFdIdfetTYynHaXs7SC1R1xyAn3wACPh6zJS9WSxgT9d4VV1mT
	Pz1A==
X-Gm-Message-State: ALKqPweCKH5gIsuN5qLl3Wu/KdV3GnFRx/yCDKxKzUYxkmoFtqasY2aT
	PjfZHhj0RK1vx4qZDURvmL8UkA==
X-Google-Smtp-Source: AB8JxZo+EQNIL3B9EOJpaUwDbvHZ78Sy2Ti1coaL8LRXyiYV+O8qgIZK3Po+on3q1ESZYiL1s3xn9g==
X-Received: by 2002:a17:902:3381:: with SMTP id
	b1-v6mr4730250plc.248.1527115178416; 
	Wed, 23 May 2018 15:39:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	g15-v6sm25900272pgv.58.2018.05.23.15.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 May 2018 15:39:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 15:39:27 -0700
Message-Id: <20180523223928.21302-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180523223928.21302-1-raj.khem@gmail.com>
References: <20180523223928.21302-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] cpprest: Fix build with clang
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
X-List-Received-Date: Wed, 23 May 2018 22:39:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-a-build-problem-on-Clang.patch   | 28 +++++++++++++++++++
 .../0002-Define-virtual-destructor.patch      | 28 +++++++++++++++++++
 .../recipes-support/cpprest/cpprest_2.10.2.bb |  8 ++++--
 3 files changed, 61 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-Fix-a-build-problem-on-Clang.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/0002-Define-virtual-destructor.patch

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-Fix-a-build-problem-on-Clang.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-Fix-a-build-problem-on-Clang.patch
new file mode 100644
index 0000000000..dc6b9dfcab
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-Fix-a-build-problem-on-Clang.patch
@@ -0,0 +1,28 @@
+From 0c07931f77aa9df2da065b633ae66faad5a570ec Mon Sep 17 00:00:00 2001
+From: Wu Yongwei <wuyongwei@gmail.com>
+Date: Tue, 10 Apr 2018 11:29:12 +0800
+Subject: [PATCH] Fix a build problem on Clang.
+
+AND_CAPTURE_MEMBER_FUNCTION_POINTERS workaround had a check for GCC,
+but did not exclude Clang.  Clang has a fake GCC version of 4.2, thus
+caused problems.
+
+Upstream-Status: Backport [https://github.com/Microsoft/cpprestsdk/pull/732]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Release/src/http/client/http_client_asio.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Release/src/http/client/http_client_asio.cpp b/Release/src/http/client/http_client_asio.cpp
+index 4ba3e085..fca4bb5b 100644
+--- a/Release/src/http/client/http_client_asio.cpp
++++ b/Release/src/http/client/http_client_asio.cpp
+@@ -47,7 +47,7 @@
+ #include <unordered_set>
+ #include <memory>
+ 
+-#if defined(__GNUC__)
++#if defined(__GNUC__) && !defined(__clang__)
+ 
+ #if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
+ #define AND_CAPTURE_MEMBER_FUNCTION_POINTERS
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0002-Define-virtual-destructor.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0002-Define-virtual-destructor.patch
new file mode 100644
index 0000000000..34cbe66974
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0002-Define-virtual-destructor.patch
@@ -0,0 +1,28 @@
+From 816d183eb0fe9ab4607cb049b4b792f8df84d5fe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 May 2018 22:17:43 -0700
+Subject: [PATCH] Define virtual destructor
+
+Fixes
+error: destructor called on non-final 'pplx::details::linux_scheduler' that has virtual functions but non-virtual destructor [-Werror,-Wdelete-non-virtual-dtor]
+    __data_.second().~_Tp();
+
+Upstream-Status: Pending [https://github.com/Microsoft/cpprestsdk/issues/747]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Release/include/pplx/pplxlinux.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Release/include/pplx/pplxlinux.h b/Release/include/pplx/pplxlinux.h
+index 6aa1ba35..f3f8d70d 100644
+--- a/Release/include/pplx/pplxlinux.h
++++ b/Release/include/pplx/pplxlinux.h
+@@ -240,6 +240,7 @@ namespace platform
+     {
+     public:
+         _PPLXIMP virtual void schedule( TaskProc_t proc, _In_ void* param);
++    virtual ~linux_scheduler() {}
+     };
+ 
+ } // namespace details
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
index 2ba6fc66cc..1dbe093bee 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
@@ -5,9 +5,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
 DEPENDS = "openssl websocketpp zlib boost"
 
-SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master"
-
-SRC_URI += "file://fix-cmake-install.patch"
+SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
+           file://fix-cmake-install.patch \
+           file://0001-Fix-a-build-problem-on-Clang.patch;patchdir=.. \
+           file://0002-Define-virtual-destructor.patch;patchdir=.. \
+           "
 
 # tag 2.10.2
 SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
-- 
2.17.0


