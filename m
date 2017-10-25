Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4C63371B87
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 13:09:06 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id q83so30370353qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=haTXSHr8vDfsmN6ho+LMw0HJCF+C+W3Z8mmHpg+JiQ4=;
	b=uGuSuWuHkypynQjWbj0vnZJJkSuuMj3xC3o8tAt9qMdvGCCowEbXrBQtwxd0FWrwOi
	PwqJxkRkfT/TndQQ09b+xWGb/78T6BNL7Dk6kCCrbQ0gH3MdJQsQQ1duv9IfcXM8MeP3
	nP6Rq7DtdMzuFEGc/nZMF6euSgzm9y5HtiAPr1oLbhVs6fp48ruAx0gFNkNB/zCDnbOg
	4OwvHOcGGXt+9YCKsdTTqLl9q025O50ZCiRKlI+Z3Lo/oBgPKmE9dPlkhLeqrSUzCEQ6
	QdKgMuw26/FI8xYJZIK3vwufDcE32lPHQKCEpHTnTQuFfOjbRE707VV+R0WTMQGf1mfT
	C3sg==
X-Gm-Message-State: AMCzsaURwmIQ9rmiiYGcW8WPndd5UAWzDcBa5vc2rodOdGgSmHZyzIcb
	rJg8a/5vh8t6pLp3YAEgSTMV30we
X-Google-Smtp-Source: ABhQp+R8VXDdEK878z3ewpUjrAk2jy/9Tv4LWUBvBH2plS/VZkEtIwY9ys+0v9Fs+ZXwq76yghHvyQ==
X-Received: by 10.55.93.7 with SMTP id r7mr2942819qkb.35.1508936948144;
	Wed, 25 Oct 2017 06:09:08 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	f126sm1716308qkd.37.2017.10.25.06.09.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 06:09:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:09:00 -0400
Message-Id: <1508936940-22627-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.2.3
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
X-List-Received-Date: Wed, 25 Oct 2017 13:09:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.2.2.bb => python-pytest_3.2.3.bb}         | 0
 .../python/{python3-pytest_3.2.2.bb => python3-pytest_3.2.3.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.2.2.bb => python-pytest_3.2.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.2.2.bb => python3-pytest_3.2.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 6140250..a2be36b 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "401c005bd57f71e63ba015ab086fe67d"
-SRC_URI[sha256sum] = "f46e49e0340a532764991c498244a60e3a37d7424a532b3ff1a6a7653f1a403a"
+SRC_URI[md5sum] = "698f8929e095a1c37876b5567943be79"
+SRC_URI[sha256sum] = "27fa6617efc2869d3e969a3e75ec060375bfb28831ade8b5cdd68da3a741dc3c"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    file://pytest_version_fix.patch "
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.2.2.bb b/meta-python/recipes-devtools/python/python-pytest_3.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.2.2.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.2.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.2.2.bb b/meta-python/recipes-devtools/python/python3-pytest_3.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.2.3.bb
-- 
2.7.4


