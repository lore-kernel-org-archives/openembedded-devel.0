Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB0227806E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:52:05 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l25so2477356qtf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sDU2wMLxCDOiko+bEQV7G+vc1lOCB9M0BRE7bB55xf8=;
	b=aobyjcOl/w6hhvKIlOqALrwcwlOo8jWbTgvlUpZgwbgEIoR9ea7Bw+8a7XLLZgFIWp
	b22rZOpcGQndNclSRX6IgGbdz4SILURyAJ6PuvAV68C82Bm7zCdo7AfUcQECdLvp1j0+
	CMjgWyrRyR/2NYkWukgOMZG3hbpXp0SFTsKHdME+XE0/mBT1TZzDwObxsC354jfLUdjX
	+bwyZLjtVQA8NibxVxRz71+VtPl73CbLRrhiNMuOZJMgm9b3xPbIxTRyaABNp1uK9m6+
	gaLFct3QtMQqogx4Eq8cbglg33/cJMiJ8iaK44ugnDnuGhnUChFOs/VDVMBkK4HNDT8x
	evYw==
X-Gm-Message-State: AHPjjUii6jjWwrFUDBwC4TYVWOqAVSS3jrZViV6iaKYzalFrLhi8AZGn
	WGdGCEVI/99c52QoLU41LC/OOPMs
X-Google-Smtp-Source: AOwi7QAUgD5Za7N5AgvajvZh8dv3sjvHD+bex3yJ1D+bQ0kXZD05VAUOw7SwMXgqFgZdxWD9ixuHSQ==
X-Received: by 10.237.34.118 with SMTP id o51mr2379111qtc.36.1505832726459;
	Tue, 19 Sep 2017 07:52:06 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	a125sm6843532qkg.13.2017.09.19.07.52.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:52:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:52:00 -0400
Message-Id: <1505832720-19049-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cassandra-driver: update to version 3.11.0
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
X-List-Received-Date: Tue, 19 Sep 2017 14:52:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc       | 4 ++--
 ...3-cassandra-driver_3.8.1.bb => python3-cassandra-driver_3.11.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.8.1.bb => python3-cassandra-driver_3.11.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index 43c346d..a522e67 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[md5sum] = "67b107df88b0a609497814609685d0a3"
-SRC_URI[sha256sum] = "2c35138c52fb85f3889a2841af1d39a0fe91e2f58a6205b1676944d2f4cbefec"
+SRC_URI[md5sum] = "1659b074e10c613e5ba1cdf92974a57a"
+SRC_URI[sha256sum] = "643bed0fac08ee91630f0f35556bb62c3b4b007c20d4e6e8d349f769ea648150"
 
 DISTUTILS_BUILD_ARGS += " \
     --no-libev \
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.1.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.11.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.11.0.bb
-- 
2.7.4


