Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C01971AEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:23:52 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id z190so7242803qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WJ8CTYHGCx2jrZY9mzUvDSsoQgw9gTHDRtcbXoBnRUQ=;
	b=U9e/W+BrJWHfJau98y5N7Ys+ZnxNpFRN+QlyCOBkaRbbgrh7PeZGkuVmW1nWDsp39g
	NTaDDCKjEXYDu+xBa+oMarhbAkyJ4WN7m7/1UT6e5eiTiIWN4pqofo9JeIkvHb/UccIM
	b09HgSQl264NSJFG5EGyEK76FurDofPxE6v/EWcBy8u6tGmf/7zmWAs0IaJsa7cHD1S2
	4d+9AOQuV0R+ouGhkoZGYpbWK+fYn2r/DhexRapoVaLNNfjWQcqLznHQH0yxJnxbEFWk
	CO0XXuUqy4d3Ae5AFmAmQRdcTK+A4tAiVhgc67/0gjGqM0pyBSXTLn3ILveVzdqHPvvs
	AzFQ==
X-Gm-Message-State: AA6/9RnrFM5nGnFPBVISwok8opgabHUF1Ml64h0bImqNLyXUJGBPvFMBEOhY2T/kcHaDOQ==
X-Received: by 10.55.20.78 with SMTP id e75mr8361291qkh.267.1476397433929;
	Thu, 13 Oct 2016 15:23:53 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id u44sm5947799qtu.5.2016.10.13.15.23.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:23:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:23:46 -0400
Message-Id: <1476397426-2775-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.3.0
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
X-List-Received-Date: Thu, 13 Oct 2016 22:23:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc                | 4 ++--
 .../python/{python-pymongo_3.2.2.bb => python-pymongo_3.3.0.bb}       | 0
 .../python/{python3-pymongo_3.2.2.bb => python3-pymongo_3.3.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.2.2.bb => python-pymongo_3.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.2.2.bb => python3-pymongo_3.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index e0f52dd..0a256a7 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,5 +8,5 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
 
-SRC_URI[md5sum] = "70408f8115d7aa52fb6eef0e552834a6"
-SRC_URI[sha256sum] = "f2018165823b341d83d398165d1c625e5db5cc779e7c44c107034407808463b6"
+SRC_URI[md5sum] = "42cd12a5014fb7d3e1987ca04f5c651f"
+SRC_URI[sha256sum] = "3d45302fc2622fabf34356ba274c69df41285bac71bbd229f1587283b851b91e"
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.2.2.bb b/meta-python/recipes-devtools/python/python-pymongo_3.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.2.2.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.2.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.3.0.bb
-- 
2.7.4


