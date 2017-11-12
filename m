Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id D08CA782CC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 17:18:55 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 78so17212532qkz.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 09:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MaOBqNBCJNIFVDy7M2NsCzA2pWYfj9k1AIjEUfmgKvY=;
	b=O1F/hidVbCx/MSrSjrLE78ZVt/IJuY79DOBQUF7T4lYTP66fKt3hTIedXepkuzzxsr
	HMy0AWjRPQhPzZdUgPUVhdi/NvhTgB9+sYiIevc5o0uh0rRpGIMzla9o78oUkXJUA65+
	EtUJXylEykdLkdEYXSdHuqanGFaE9UYWXxPo3HWmXNF9Szg1Il4zXRAA9S7/V8k2BRQf
	5lKGiYGDMQKntjVrp2fiBHCpN5zvrYYbOUryRS7UlvVB3iaWeNHlHD3TdE2oOl0PyOvH
	eaWhRdIjDtGgmBtFTjvzdUorpGgLr+Ra2mSLltGV5kEoW/469vRqHkiA1jfwU0P5bkQE
	WjbQ==
X-Gm-Message-State: AJaThX7hGEBfoBJj1tpay7hD5+1CDkUehxwF407mUCNrZRxSZrgzeXKs
	PcS4DdVmpRG3tN2GzG4JZdsYzi3g
X-Google-Smtp-Source: AGs4zMb0kNlWqM+VXi5GYPVaW/HuDNW+58OHkPc88f6QcooXhFCougQerNSYJFAa/moIAnoA13tn+w==
X-Received: by 10.55.149.70 with SMTP id x67mr10216844qkd.62.1510507136708;
	Sun, 12 Nov 2017 09:18:56 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	q49sm9771564qtq.80.2017.11.12.09.18.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 09:18:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 12:18:50 -0500
Message-Id: <1510507130-5043-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attrs: update to version 17.3.0
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
X-List-Received-Date: Sun, 12 Nov 2017 17:18:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attrs.inc                  | 4 ++--
 .../python/{python-attrs_17.2.0.bb => python-attrs_17.3.0.bb}         | 0
 .../python/{python3-attrs_17.2.0.bb => python3-attrs_17.3.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-attrs_17.2.0.bb => python-attrs_17.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-attrs_17.2.0.bb => python3-attrs_17.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index 85073e9..edde79e 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[md5sum] = "3b7136a570f3ff8a4ff42e7360073f9f"
-SRC_URI[sha256sum] = "5d4d1b99f94d69338f485984127e4473b3ab9e20f43821b0e546cc3b2302fd11"
+SRC_URI[md5sum] = "4314f784ca3174d91956da9828248960"
+SRC_URI[sha256sum] = "c78f53e32d7cf36d8597c8a2c7e3c0ad210f97b9509e152e4c37fa80869f823c"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-attrs_17.2.0.bb b/meta-python/recipes-devtools/python/python-attrs_17.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-attrs_17.2.0.bb
rename to meta-python/recipes-devtools/python/python-attrs_17.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb b/meta-python/recipes-devtools/python/python3-attrs_17.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_17.3.0.bb
-- 
2.7.4


