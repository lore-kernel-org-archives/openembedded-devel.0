Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id DACFA71B57
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:07:39 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s188so16768129qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0kzgl96bSkEl8QXAXFNyLG4hhdYj2/X9M3DYRRUnCeg=;
	b=JnlkTNraYyInIjcymS+u6juoZdrJjZ6tV5V3GqSnBT8u0B0Uly0YokQmjf0gT6wlmW
	cKnU7NNgzoQ0rbaKS7azPs6b/Tx3qmnENaWdUTnJvn66i+8yEauPTsAl+7sLsTe7GmfX
	6KBRWKIRMlaWmn+bqBFa+BrbgQXcdwEDuGgN6hxRgfY+7EfUcbvizB+9KgC7z5eW62KE
	/2YG5ucHQZBmFV/4YtUPYgI0YlRRf9zmR9Orc78GO1z9CUl9chXdmIPV66XdU2zw3gZf
	LQF4sBhcjYBqK0trqd7nKWZJACClaXM9sAxC9NDXIba7HpW0wl4Q45/tFHyl3+t0Bjej
	6Xlg==
X-Gm-Message-State: APf1xPClPD+bTdQFAwRO09B5nfreZ1dZFOTkZ03RlBI6hPMDrB/31+Sr
	RvXYQRzcWn/VDkAr2RpE7VnFrXdC
X-Google-Smtp-Source: AG47ELtrue8BErHUeIOgfShFnkIjSd2k+U2RPANmgDcPHW8WK1StBVu6wvqJARKhdAM85+gpwlzaYQ==
X-Received: by 10.55.23.214 with SMTP id 83mr14030914qkx.262.1519589260493;
	Sun, 25 Feb 2018 12:07:40 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id n66sm3779353qka.0.2018.02.25.12.07.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:07:40 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:07:24 -0500
Message-Id: <1519589244-17793-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-msg: update to version 0.5.5
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
X-List-Received-Date: Sun, 25 Feb 2018 20:07:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-msgpack.inc                | 4 ++--
 .../python/{python-msgpack_0.5.2.bb => python-msgpack_0.5.5.bb}       | 0
 .../python/{python3-msgpack_0.5.2.bb => python3-msgpack_0.5.5.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.5.2.bb => python-msgpack_0.5.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-msgpack_0.5.2.bb => python3-msgpack_0.5.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
index e6f6681..2e852cc 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -2,8 +2,8 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-SRC_URI[md5sum] = "b7759a382dc6309b35e0a0eecc1f23f1"
-SRC_URI[sha256sum] = "23f688905bb9fbf00faa7346e72a72e670e68f3f5d94aeea5c123dd0e07de49c"
+SRC_URI[md5sum] = "62640290ea856420d83b7f9dc1dd789d"
+SRC_URI[sha256sum] = "7f5d6e59228b65c47cfdae76a4aea71f6902525f18256862cda69888a686b5f9"
 
 PYPI_PACKAGE = "msgpack-python"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.5.2.bb b/meta-python/recipes-devtools/python/python-msgpack_0.5.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-msgpack_0.5.2.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.5.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.5.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.5.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-msgpack_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_0.5.5.bb
-- 
2.7.4


