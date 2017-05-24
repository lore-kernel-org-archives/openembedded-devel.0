Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7C0780F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 21:27:52 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id k74so164792762qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 14:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8Hsw3lbtWNnSIo5SBkam4Qe+ctYjK/NGe0uBLl9wGyQ=;
	b=mBKbnr1pWnpY8SACWwGCojbV7CuyBXrJduzrEvXTbvrwD0i25I6/ILAOgGXdtqG/Sy
	w29nFjf/dCUBiC/4/R+5xRjkO6bDCA/pM2zI888NJSbrLHdulWjN3bg8NOHHq/UWpId2
	nzoX0Tl9RYjGTZescj8zv/MsVNrXB/1GVx1qYcB+TqCDnwuPozurlf3aArbB32P09C30
	5XVEPMQN+1kolxJl3KL3TK7U7UPRFJMyAHG9L8nYzz+TnDK/bz8JtRppncBhAvxSE9J6
	fVg1HLtfilJnbaBW940wK9OFjbaQWUyFVzgx1ljiMPjv7DdPtbwP/jhNT9gv4Poaq1Am
	XOFQ==
X-Gm-Message-State: AODbwcBqlliamlK6k/p4xBrwgMj3IGANmZs3iFREshVSSrOrghWWgLQD
	eT/UkkW5W+x9ZQ==
X-Received: by 10.55.121.196 with SMTP id u187mr34153893qkc.91.1495661273466; 
	Wed, 24 May 2017 14:27:53 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id t5sm3315505qkd.4.2017.05.24.14.27.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 May 2017 14:27:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 May 2017 17:27:43 -0400
Message-Id: <1495661263-9873-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pysocks: update to version 1.6.7
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
X-List-Received-Date: Wed, 24 May 2017 21:27:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pysocks.inc                | 4 ++--
 .../python/{python-pysocks_1.6.6.bb => python-pysocks_1.6.7.bb}       | 0
 .../python/{python3-pysocks_1.6.6.bb => python3-pysocks_1.6.7.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pysocks_1.6.6.bb => python-pysocks_1.6.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pysocks_1.6.6.bb => python3-pysocks_1.6.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pysocks.inc b/meta-python/recipes-devtools/python/python-pysocks.inc
index 5aec6fc..cf9509a 100644
--- a/meta-python/recipes-devtools/python/python-pysocks.inc
+++ b/meta-python/recipes-devtools/python/python-pysocks.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
 
-SRC_URI[md5sum] = "571f4c23982fa86bf0e7a441f1b6c881"
-SRC_URI[sha256sum] = "02419a225ff5dcfc3c9695ef8fc9b4d8cc99658e650c6d4718d4c8f451e63f41"
+SRC_URI[md5sum] = "07007ec7ed46292dab06013f2e3af365"
+SRC_URI[sha256sum] = "d00329f27efa157db7efe3ca26fcd69033cd61f83822461ee3f8a353b48e33cf"
 
 PYPI_PACKAGE = "PySocks"
 
diff --git a/meta-python/recipes-devtools/python/python-pysocks_1.6.6.bb b/meta-python/recipes-devtools/python/python-pysocks_1.6.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pysocks_1.6.6.bb
rename to meta-python/recipes-devtools/python/python-pysocks_1.6.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.6.6.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.6.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pysocks_1.6.6.bb
rename to meta-python/recipes-devtools/python/python3-pysocks_1.6.7.bb
-- 
2.7.4


