Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id BB177613DF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:49:01 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id l9so12800452oii.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3/klWYZwuUXpjhV3CQweyyme+ONf0k/imI21rnqdFMQ=;
	b=KyC0E6y4FtgG1Zm+3mqQldUUEEbpJl/26GQTA5gbmYLVe6vTx1EKrsoCQuATnqevGP
	9ORmRmNqqikhOvfTUqoRY3xFG+AP3X3l6YjcX1w74oXV+PQVcpVPr9LUklEGwJX+Wkdz
	yGrZVk9jOgarS048UhdlLsPO7X1OG9S+HnC7/zjQea5RYkyjkm0uBEol72JDjF8t1g2Z
	AsVOY8kCI70zVdvYKXMIVTHMQHSyyIxx2tO+84OOX5FfF9SYVeNNEnCFp+jT7jOwvjyI
	gCN+aezgxNcaiYfqU/hcafszmLiOrHSyF+08zk+dHMXjw6+lmmIzj5xK7zVKM3G2HMiD
	AaNw==
X-Gm-Message-State: APjAAAW8UGR9jDAZkDlWwzslqkwLkl4bNzUupdzMuT1PMCcRfVYJU+U6
	TtkvcSBrK9o7LXd3yUZ4N6Mmp9BnDa0=
X-Google-Smtp-Source: APXvYqxbbTlUIlj816p+I7p5ugJXwQ4EP9BvGtDGlQUJfDiM2ra3TAuuCFTMnH1HHrxNz3J/A/q13w==
X-Received: by 2002:aca:eccd:: with SMTP id k196mr5261163oih.95.1581788942498; 
	Sat, 15 Feb 2020 09:49:02 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id g5sm3312552otp.10.2020.02.15.09.49.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:49:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 12:48:51 -0500
Message-Id: <20200215174851.2731-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-contextlib2: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Sat, 15 Feb 2020 17:49:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-contextlib2.inc    | 10 ----------
 .../python/python3-contextlib2_0.6.0.bb               | 11 ++++++++++-
 2 files changed, 10 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-contextlib2.inc

diff --git a/meta-python/recipes-devtools/python/python-contextlib2.inc b/meta-python/recipes-devtools/python/python-contextlib2.inc
deleted file mode 100644
index 750721f3d5..0000000000
--- a/meta-python/recipes-devtools/python/python-contextlib2.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Backports and enhancements for the contextlib module"
-HOMEPAGE = "http://contextlib2.readthedocs.org/"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
-
-SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
-SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
-
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb b/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
index 1c0b560b41..6074efa73e 100644
--- a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
@@ -1,3 +1,12 @@
+DESCRIPTION = "Backports and enhancements for the contextlib module"
+HOMEPAGE = "http://contextlib2.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
+
+SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
+SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
+
 inherit pypi setuptools3
-require python-contextlib2.inc
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


