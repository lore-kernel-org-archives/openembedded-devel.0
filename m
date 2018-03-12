Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 97FA877F34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 00:24:08 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v124so9648687qkh.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 17:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C2FtsRIdLGgizbL9JrRB8fxiw/7I2+tUIYfQeK7W7Tc=;
	b=NEjWCR7flUQnFudJg2tTEXYy2Y0Oo1cacjcOU+j9dWEVAdsiCLDt7lNy1x/0ykpqXJ
	Mjb1sdn+tzBpjLTFjFX6gFjIeuG5L7lWGnYlHa59PZyfEzZNZz46ui4GjXQDsBN5+lRu
	3i9KdGYdTEv7nVI997qm6ImdCpE1V0qRXUDCp+NWF2ZrMy4P84+inbD6a5XmFUHIP+eW
	/UoXLsWm8g02hUHsp2JX37gNnPqDm+obrimRiE/O6QvRXzlqwtt6VjOWoi5f6MjjinGK
	xM6eVholqtXql96VNo1KAF7WOWsi6R1NNCgEGjMzB+jIYhrp73Fz9JrpRSKB9+T9o03q
	f8TA==
X-Gm-Message-State: AElRT7FuRslHelWKaYuNoPQqmDjuDaHHXvBhgoc/jJIOH/F27CPeqb6U
	aXk8PqgA8GXT80wIZBMOppLyk05Y
X-Google-Smtp-Source: AG47ELtFDaXAWaNHFOfv1lpUagSqkMMLJdRLadH7xAq1eyC8lj2te8SNOnywaFfTCkMNeR73fmDC9Q==
X-Received: by 10.55.212.13 with SMTP id l13mr5086626qki.268.1520814249424;
	Sun, 11 Mar 2018 17:24:09 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	c13sm4210493qth.97.2018.03.11.17.24.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 17:24:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 20:23:59 -0400
Message-Id: <1520814239-31241-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyjwt: update to version 1.6.0
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
X-List-Received-Date: Mon, 12 Mar 2018 00:24:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyjwt.inc                  | 4 ++--
 .../python/{python-pyjwt_1.5.3.bb => python-pyjwt_1.6.0.bb}           | 0
 .../python/{python3-pyjwt_1.5.3.bb => python3-pyjwt_1.6.0.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyjwt_1.5.3.bb => python-pyjwt_1.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_1.5.3.bb => python3-pyjwt_1.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyjwt.inc b/meta-python/recipes-devtools/python/python-pyjwt.inc
index dda4b94..baecc39 100644
--- a/meta-python/recipes-devtools/python/python-pyjwt.inc
+++ b/meta-python/recipes-devtools/python/python-pyjwt.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[md5sum] = "739494379f582ca98c89fb7ac229915b"
-SRC_URI[sha256sum] = "500be75b17a63f70072416843dc80c8821109030be824f4d14758f114978bae7"
+SRC_URI[md5sum] = "3c3762c88b210763a311a5db06aa7d6f"
+SRC_URI[sha256sum] = "9c3016e4a292151c5396e25cc0c28c4e1cdf13fa19118eb84f500f9670e3f628"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyjwt_1.5.3.bb b/meta-python/recipes-devtools/python/python-pyjwt_1.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyjwt_1.5.3.bb
rename to meta-python/recipes-devtools/python/python-pyjwt_1.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.5.3.bb b/meta-python/recipes-devtools/python/python3-pyjwt_1.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyjwt_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_1.6.0.bb
-- 
2.7.4


