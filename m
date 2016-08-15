Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 92B6477158
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 19:20:54 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v123so4894404qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 12:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VY0iFAGGUlAj6fWr6hG/WBSACmg6f2PCt2ihmGrM4qU=;
	b=dP9NudZm+ZbI2ej/IV0W2mkjnHvtoejr2sxf7YG3m7ipxymdGB4GbjwnzuXq264HwH
	H4DbSjx++05GVks65uHkP/HoseQnARw+OsBuyDR9th2MtQL6Vt+9ku0V7q2tF7kUsZ3e
	U8eWT/Du2Cvgb/HxigeODhBGWSOvjcifdDzvUOPp91Q9WGo2L2iM7va9uBGIqeukka0q
	CydmFD74hlypeVqZjafuV6mqVjhL1ZvIhtGXT83AWgsRhEnln3yT1pnCV00edwxykAtF
	iksLST3IMgBzw7DRzcoZQby3tpdK4iCEWKhHFAC4CzT6UtaDktuS1CtGStlF14NT+Um4
	eoXg==
X-Gm-Message-State: AEkoousFEW+mLMbj9fw+jJVMCRz27bqYNU5vm23wbTFsTktQArhnimvx+ifP71+q32B6+w==
X-Received: by 10.55.92.135 with SMTP id q129mr33221369qkb.52.1471288855610;
	Mon, 15 Aug 2016 12:20:55 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	s52sm13171506qtc.4.2016.08.15.12.20.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 12:20:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 15:20:46 -0400
Message-Id: <1471288847-15080-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-jsonpatch: update to version 1.14
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
X-List-Received-Date: Mon, 15 Aug 2016 19:20:55 -0000

 * Use inspect.signature()

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-jsonpatch_1.13.bb => python-jsonpatch_1.14.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.13.bb => python-jsonpatch_1.14.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.13.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-jsonpatch_1.13.bb
rename to meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb
index 085ba59..bc64ffc 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.13.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "4d6650ced683f632e117bafe5d9f093b"
-SRC_URI[sha256sum] = "9470656a08002e309632b59772b206ce0564c9a77b44c25f05f49dd2cad248d5"
+SRC_URI[md5sum] = "cf4fbad8188f1389363433dbf867109f"
+SRC_URI[sha256sum] = "776d828d6f7b4581862529cf413439a652d74b9e3a0261fa08c36fd761a78b4a"
 
 RDEPENDS_${PN} += "python-re python-json python-jsonpointer"
 
-- 
2.7.4


