Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9EA780F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 21:19:53 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id u75so163965373qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 14:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FM1C9Ii8tXRPdWqEnfvfwlMA3YgTTKbiy1EDfNIQK7c=;
	b=COag9Cdw9rQIC/5ecTLkPPH6ztE94BWIT85JjlasI9u5QTs71tiaWBMZ0IS0Tj+0Ea
	ddkPhwqcYXOps06f7nMyhEKbBaiEh1RM+nWBBv4aWHVE23B2gYnOZU3HIaJp92qUAJaw
	NdQiYgz+pQU/SRzK05AGx2YqfDDUwklHT7Gw1NJ4nySlJRq6BF1cbZzL0N+H389ASOIP
	veO+LxSqZ1HchXeOwBdEow7a0sis+w9Q/I08PL/gIvZJJsUI0bRtAF4DfJVM8MXfiA7G
	OtfDb/XZ6FMK5KQPcl2Sp8rqvuxf+nzzLffBI1phlAl7IE5+XuLvMSD095I2qsCF+Hqn
	zLxg==
X-Gm-Message-State: AODbwcB4PzsQVGkpRZUmnU2m8YvmQb8+6Xf8fG04Y5C4Is5IqTJ3wfK0
	j+xktjPYTcKhNTG7WKo=
X-Received: by 10.55.15.143 with SMTP id 15mr33827138qkp.44.1495660794848;
	Wed, 24 May 2017 14:19:54 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	b136sm3292970qkc.41.2017.05.24.14.19.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 May 2017 14:19:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 May 2017 17:19:46 -0400
Message-Id: <1495660786-28190-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-progress: update to version 1.3 and add RDEPENDS
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
X-List-Received-Date: Wed, 24 May 2017 21:19:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-progress.inc          | 9 +++++++--
 .../python/{python-progress_1.2.bb => python-progress_1.3.bb}    | 0
 .../python/{python3-progress_1.2.bb => python3-progress_1.3.bb}  | 0
 3 files changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-progress_1.2.bb => python-progress_1.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-progress_1.2.bb => python3-progress_1.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-progress.inc b/meta-python/recipes-devtools/python/python-progress.inc
index 80d0a58..297c0d3 100644
--- a/meta-python/recipes-devtools/python/python-progress.inc
+++ b/meta-python/recipes-devtools/python/python-progress.inc
@@ -3,7 +3,12 @@ HOMEPAGE = "http://github.com/verigak/progress/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
 
-SRC_URI[md5sum] = "c1dbf49a41e80408d3874d976ba894cc"
-SRC_URI[sha256sum] = "5b6a50f9ac76820f619d7789b5354881c8c10060a64047e415868d8f503cc2eb"
+SRC_URI[md5sum] = "f65ccfcc2339d522b2dd5801aaa40dc7"
+SRC_URI[sha256sum] = "c88d89ee3bd06716a0b8b5504d9c3bcb3c1c0ab98f96dc7f1dc5f56812a4f60a"
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-math \
+"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-progress_1.2.bb b/meta-python/recipes-devtools/python/python-progress_1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-progress_1.2.bb
rename to meta-python/recipes-devtools/python/python-progress_1.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.2.bb b/meta-python/recipes-devtools/python/python3-progress_1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-progress_1.2.bb
rename to meta-python/recipes-devtools/python/python3-progress_1.3.bb
-- 
2.7.4


