Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id C0D7F73204
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 17:19:11 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id x189so13278743qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2016 10:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Thxz/FTIhqZiHVh5EFiV3tVRx7P6wXjLthpJyiMZGT4=;
	b=cWJPcLmwrxOktgIigI01eKaVkZc1fDvK9yaLkzW9l9JJEFhv5RhT2qKLIMxHx56Xt/
	3T940OyRzseTqOUDA3ooQZRWXSS3vnFomkskLsfXuy77QY3qaDBpgedO5XChZoCFdGsn
	1y85ngdnXq9nnrUClcsHEQ/4gA1X9fyRl1eYLAKANQkIJdfcXZJsQtj0HhF3uKtq3FpQ
	X2GCFN3eY19SVT4Zs9X4xtQ0xB9Gkxr0Sa2WPXVTDn5eaqbCiayqArip2yGXYjre9ieg
	GhCvMOmDGis2FwOKNwYmS0R58pAVipapaRlYo1N31a2XwnOBZboN3UVDOXg9AN1kwwSL
	HgjQ==
X-Gm-Message-State: AEkoouv+2cPj+n7d7s3RWsjrCPqiezhDp64TLPv9AZw088kFgAFILD9aQaCghFy9Xdxd2A==
X-Received: by 10.55.148.67 with SMTP id w64mr7543243qkd.78.1470331152157;
	Thu, 04 Aug 2016 10:19:12 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	w185sm7418491qkd.23.2016.08.04.10.19.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Aug 2016 10:19:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Aug 2016 13:18:48 -0400
Message-Id: <1470331128-6970-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] asio: update to version 1.10.6
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
X-List-Received-Date: Thu, 04 Aug 2016 17:19:13 -0000

 * License remains the same (dates updates)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/asio/asio_1.10.1.bb | 6 ------
 meta-oe/recipes-support/asio/asio_1.10.6.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-support/asio/asio_1.10.1.bb
 create mode 100644 meta-oe/recipes-support/asio/asio_1.10.6.bb

diff --git a/meta-oe/recipes-support/asio/asio_1.10.1.bb b/meta-oe/recipes-support/asio/asio_1.10.1.bb
deleted file mode 100644
index fdfaaf6..0000000
--- a/meta-oe/recipes-support/asio/asio_1.10.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require asio.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=113f800aa522d9e38c3309c98ec53ade"
-
-SRC_URI[md5sum] = "4d508c9947404fee40945375b8a5fd32"
-SRC_URI[sha256sum] = "820a5dad3c56a4f3e937f2b9ae059ab2696c6058345d71b7a8b072a0f2fcbd99"
diff --git a/meta-oe/recipes-support/asio/asio_1.10.6.bb b/meta-oe/recipes-support/asio/asio_1.10.6.bb
new file mode 100644
index 0000000..db4ae80
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio_1.10.6.bb
@@ -0,0 +1,6 @@
+require asio.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=fede5286a78559dd646e355ab0cc8f04"
+
+SRC_URI[md5sum] = "85d014a356a6e004cd30ccd4c9b6a5c2"
+SRC_URI[sha256sum] = "e0d71c40a7b1f6c1334008fb279e7361b32a063e020efd21e40d9d8ff037195e"
-- 
1.9.1


