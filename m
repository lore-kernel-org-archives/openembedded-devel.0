Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 219E978479
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:28:46 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id l75so22691265ywc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2ndvzvVoCXnRxHV+W3bknp7rVkaURUzdMMMve53HWU0=;
	b=FVPXVEmJY4TVVH846PSDc49+lxwa3bOHXfYzxp+y72IpI9zUKW59neI8qOLP8DzKPj
	hWK3Dsy6TejHRfJpd2H/U61jUqUKs5gmRamTx6DsgI+uJZ0J7xVJG8V9YLyWRYye8fdv
	9dmianOa3QBGhJmCUUp+6J45f9NvUh8G8oln0fADr14ATdMofQ8rTnnOZxRy9GDAwE4U
	TRQrbHcA02w/16W8MidVXC6jeofoJqy6MzfC63i5A2D8Xy2ACKaGofjtn96Pa+KAaABK
	8F5yFh1s3GdPgQ6lCsdNMwSa0QafPvmygM4L3VKgm4uQeetZGL0Qdh6fFIjjZjdoI0Ow
	U8gg==
X-Gm-Message-State: AKS2vOzbLaP+tRunKNqKF0hhIQ1hHXJiSRT2K36tdTQDQomploB3ZJ5O
	RFZiZ8U4ArQ6C+fq0+E=
X-Received: by 10.55.184.5 with SMTP id i5mr14053821qkf.141.1497634127842;
	Fri, 16 Jun 2017 10:28:47 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id r1sm2071918qkh.43.2017.06.16.10.28.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:28:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:28:41 -0400
Message-Id: <1497634121-3716-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-py: update to version 1.4.34
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
X-List-Received-Date: Fri, 16 Jun 2017 17:28:47 -0000

Verify the license terms remain the same and update the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-py.inc                   | 6 +++---
 .../python/{python-py_1.4.32.bb => python-py_1.4.34.bb}             | 0
 .../python/{python3-py_1.4.32.bb => python3-py_1.4.34.bb}           | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.4.32.bb => python-py_1.4.34.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-py_1.4.32.bb => python3-py_1.4.34.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index 4ac502e..cfead95 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -1,8 +1,8 @@
 SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b506f3df287708b2f99588b5cc351091"
 
-SRC_URI[md5sum] = "68ee0b5867282595d0b410a7f3c03ab3"
-SRC_URI[sha256sum] = "c4b89fd1ff1162375115608d01f77c38cca1d0f28f37fd718005e19b28be41a7"
+SRC_URI[md5sum] = "d9c3d8f734b0819ff48e355d77bf1730"
+SRC_URI[sha256sum] = "0f2d585d22050e90c7d293b6451c83db097df77871974d90efd5a30dc12fcde3"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.4.32.bb b/meta-python/recipes-devtools/python/python-py_1.4.34.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.4.32.bb
rename to meta-python/recipes-devtools/python/python-py_1.4.34.bb
diff --git a/meta-python/recipes-devtools/python/python3-py_1.4.32.bb b/meta-python/recipes-devtools/python/python3-py_1.4.34.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-py_1.4.32.bb
rename to meta-python/recipes-devtools/python/python3-py_1.4.34.bb
-- 
2.7.4


