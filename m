Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0186D780A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:16:23 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id a77so7265079qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n48IyeeSu5ZzOGlY/W310TLUBpC83E8kBuhUGZ4uUV4=;
	b=LSsLCa32b75BAz3HPnvWOz0RkX1K2imfwmhNSRsdVrat1E2yQmPAI1F65f90dEzxDp
	cYKLbfU10ZsUpVksoe2bl0FxbBbzsEjIHR8TdHw6BdQFWu1FOXBqLZre9MuxGotkeUAd
	GO7JTrZi6a6aLNXMZ4+WBox9q9UamYyTc3c/4wjw5s1EJ8LiBXwwD4d5Y7IDOI4ylYHL
	dy5a20WOpubvl1FVoUXP3WDV6vEp83ymqsATtLLNKBjkS7N4fjYjxq1TxV9Bh2NmKSbm
	IfdpM9hB9Dn2vf57/0fbHN22Kn4Zks1Gv+uVtyzxnRDjEsJAXalj04+jwAxwNcEEREA/
	vrGg==
X-Gm-Message-State: AHYfb5ilzXonpvggb5jnz5eg0Z0680yH7c5+2r8cT4sueYWrBsIPVwzN
	qrZINW0dUxRZrr7ZDkM=
X-Received: by 10.55.165.65 with SMTP id o62mr12125773qke.347.1502327785036;
	Wed, 09 Aug 2017 18:16:25 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	x49sm3029545qtc.96.2017.08.09.18.16.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:16:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:16:16 -0400
Message-Id: <1502327776-1056-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-sdnotify: update to version 0.3.2
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
X-List-Received-Date: Thu, 10 Aug 2017 01:16:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sdnotify.inc           | 8 ++------
 .../python/{python-sdnotify_0.3.1.bb => python-sdnotify_0.3.2.bb} | 0
 .../{python3-sdnotify_0.3.1.bb => python3-sdnotify_0.3.2.bb}      | 0
 3 files changed, 2 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sdnotify_0.3.1.bb => python-sdnotify_0.3.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sdnotify_0.3.1.bb => python3-sdnotify_0.3.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sdnotify.inc b/meta-python/recipes-devtools/python/python-sdnotify.inc
index 661ee6d..ea0e575 100644
--- a/meta-python/recipes-devtools/python/python-sdnotify.inc
+++ b/meta-python/recipes-devtools/python/python-sdnotify.inc
@@ -12,9 +12,5 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
 
-SRC_URI[md5sum] = "a182c1ef47e1c6c965771aa3029da16f"
-SRC_URI[sha256sum] = "e69220d4f6cbb02130f43f929350a80cf51033fde47dcb056fbda71e2dff2d5a"
-
-do_install_append() {
-	rm -r ${D}/${datadir}
-}
+SRC_URI[md5sum] = "749ddca1c70be1697fecc443fb1fdb16"
+SRC_URI[sha256sum] = "73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c56bb9f1"
diff --git a/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python-sdnotify_0.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
rename to meta-python/recipes-devtools/python/python-sdnotify_0.3.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb
rename to meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
-- 
2.7.4


