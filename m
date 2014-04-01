Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4376F8CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 02:10:41 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hn18so4243545igb.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 19:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LFt1O+WSePPO2UZjh6p5+5sZW7Yh+zFZ4TTgWwPSTmk=;
	b=KV7nEF2BR1LPEXzXFWZhW1bXlKwrya+TMJN3JWdUaiLLGEzUa5aR5TgUYGnKxbeCmY
	P/t/6mo5rf+DORHqfp7kHchV2hM3fTmwe2rinJig1eTjrwMbIBXh5dSZgKXZBLguMCZG
	WOG8Gkngzo27frB2zoKz6YZq3w7gKL24kIHCTkyGngTIK3x7VyK9QMQw7x4/RqZ8iMuA
	tUFYWHgMZl3VdDMdShEv4+NlPd6BitmyzvcWea01VhR2qLiOCOAv3Cfg1fSav2uPvtEC
	OMA+lILWh7tMgvnyMSRLjhmYJ1iaMVQiHx8qHOTp1eqWxvz+JnVvl/hvqIpX6jhbLfce
	UukA==
X-Gm-Message-State: ALoCoQnL4tCIbLcmX/mHnR62JxbnBPoezdpoYP1fL5jTNj7fiGA6mGojsT4z12PjKGTizYlRD0I0
X-Received: by 10.42.50.3 with SMTP id y3mr38411112icf.12.1396318242903;
	Mon, 31 Mar 2014 19:10:42 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id j2sm29054148igx.13.2014.03.31.19.10.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 19:10:42 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 22:10:29 -0400
Message-Id: <1396318229-13509-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396318229-13509-1-git-send-email-trevor.woerner@linaro.org>
References: <1396318229-13509-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH] asio: package bump
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 02:10:42 -0000

This recipe had been failing to build, bumping to the latest stable release
resolves all build issues.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-support/asio/asio.inc       | 11 ++++++-----
 meta-oe/recipes-support/asio/asio_1.10.1.bb |  6 ++++++
 meta-oe/recipes-support/asio/asio_1.4.1.bb  |  8 --------
 3 files changed, 12 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-support/asio/asio_1.10.1.bb
 delete mode 100644 meta-oe/recipes-support/asio/asio_1.4.1.bb

diff --git a/meta-oe/recipes-support/asio/asio.inc b/meta-oe/recipes-support/asio/asio.inc
index 49c236f..c2a6b1b 100644
--- a/meta-oe/recipes-support/asio/asio.inc
+++ b/meta-oe/recipes-support/asio/asio.inc
@@ -1,9 +1,10 @@
-DESCRIPTION = "Asio"
-HOMEPAGE = "http://asio.sf.net/"
+DESCRIPTION = "Asio is a cross-platform C++ library for network and low-level \
+        I/O programming that provides developers with a consistent asynchronous \
+        model using a modern C++ approach."
+AUTHOR = "Christopher M. Kohlhoff (chris at kohlhoff dot com)"
+HOMEPAGE = "http://think-async.com/Asio"
 SECTION = "libs"
-LICENSE = "Boost Software License"
-
-INC_PR = "r0"
+LICENSE = "BSL-1.0"
 
 DEPENDS = "boost"
 
diff --git a/meta-oe/recipes-support/asio/asio_1.10.1.bb b/meta-oe/recipes-support/asio/asio_1.10.1.bb
new file mode 100644
index 0000000..fdfaaf6
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio_1.10.1.bb
@@ -0,0 +1,6 @@
+require asio.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=113f800aa522d9e38c3309c98ec53ade"
+
+SRC_URI[md5sum] = "4d508c9947404fee40945375b8a5fd32"
+SRC_URI[sha256sum] = "820a5dad3c56a4f3e937f2b9ae059ab2696c6058345d71b7a8b072a0f2fcbd99"
diff --git a/meta-oe/recipes-support/asio/asio_1.4.1.bb b/meta-oe/recipes-support/asio/asio_1.4.1.bb
deleted file mode 100644
index 396a553..0000000
--- a/meta-oe/recipes-support/asio/asio_1.4.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require asio.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b99840878263c0bfaa70ca7143624413"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "1879b246f9217d64bd3126aa16488bc2"
-SRC_URI[sha256sum] = "aeb5c997940e6afd399c62316f03f480557f2b721354adff065d230183ff2782"
-- 
1.9.0


