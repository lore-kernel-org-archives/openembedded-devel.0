Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 02DCE71A32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:16:23 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id w134so28546541qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 17:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LkapF1G2cE5oeRL0IAdqRXhsxnOJgkbGN96vRFWVVKo=;
	b=W7+LQioMGH1PN5dcQbYbInnEmLX+AcNQNMxd8+JHw1uSeAuKTEPq4j2Gl+zl2AJ6Oq
	1yAQphuCf/Y61XJe+mMqNaBieF2g7ZxlVfmr4F+RTQ9a5vg04lzs4nTG/06LglOWhdOr
	Zr4ZJLru7bBkfB67aV5ZSza16ZPXXLJviMGPcymRq32UsrnDJws60M4aYEvehSM2ucI1
	J5Lu3THOHcFkB1mEGSrBlrXpCQsE1YaU46RcQuJ1B5qASo8fJH+6yF/cT0EfVixS1jnS
	0h1MUEfuRk9syrI23OGZHfzJEirTmzpwFitXdudgFLleW6SlbSDZi/ZZvI5itoc/zB99
	QHvA==
X-Gm-Message-State: AMCzsaX66OXwzjqjEyjUWWZRkcEXNBmPwH0hfU4sIqI/ziPVL7vKqBPf
	F5bGCAyrPENdLXAfCK9vqQglVLiE
X-Google-Smtp-Source: ABhQp+TO4MYd26TkLBhYOBouy9azE36Bnc1pOs5CmzrH4scVfhtkfc8yw2bLSki9uwoJFaMQP32fGA==
X-Received: by 10.55.103.15 with SMTP id b15mr631880qkc.224.1508890584614;
	Tue, 24 Oct 2017 17:16:24 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	o138sm1005843qke.76.2017.10.24.17.16.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 17:16:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Oct 2017 20:16:16 -0400
Message-Id: <1508890576-20370-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.4.0
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
X-List-Received-Date: Wed, 25 Oct 2017 00:16:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.3.1.bb => python-psutil_5.4.0.bb}         | 0
 .../python/{python3-psutil_5.3.1.bb => python3-psutil_5.4.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.3.1.bb => python-psutil_5.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.3.1.bb => python3-psutil_5.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index c9a7f6d..4170ea4 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "529244aea5d32fb0c2ea46d80ce54abc"
-SRC_URI[sha256sum] = "12dd9c8abbad15f055e9579130035b38617020ce176f4a498b7870e6321ffa67"
+SRC_URI[md5sum] = "01af6219b1e8fcfd53603023967713bf"
+SRC_URI[sha256sum] = "8e6397ec24a2ec09751447d9f169486b68b37ac7a8d794dca003ace4efaafc6a"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.3.1.bb b/meta-python/recipes-devtools/python/python-psutil_5.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.3.1.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.3.1.bb b/meta-python/recipes-devtools/python/python3-psutil_5.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.4.0.bb
-- 
2.7.4


