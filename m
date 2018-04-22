Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9304260074
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 15:38:44 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j10so13658184qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 08:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4dD3P/Ihp7rfL9Fcq7MiQ89i6NU5FVvx6kwUZv5rXX0=;
	b=rGmnVLA8TtWXu3obdf4LnCWgLkqCpj/Uk90e3AQNr/XsHHe/YPaRjYglGYn63rKtF+
	xoEE4gBdWY2wOopL33++b/Kk4SzoRfYA9HiFj+1shIb9mcGumBTmGWVE7XiR45RUNzvk
	lkI9SN6mhh83xDvLqMD+P3J6KlImrScgrySVvQ0d0//g9IHNwkl6oZ20Yh50K5YqsnJW
	+Gro+JKvl6UiJAd+0Hpi8qKCvjbiPAH8TIZMM941RX3kxL1/fvaLO9YXnj4cng3uPL/S
	83PlR/Kzd8br7/if3E4psShAIWI6XMafqRjagTgZtdkBp8QvhG0otjl7BuuyArD8p63N
	FhsA==
X-Gm-Message-State: ALQs6tCr9txg+Lh6fUYglR0KYJP9IxUTrVUcwOlyKHZCnKqrTwD+lQiA
	5zKX5SfDkZ8oImXGupRi7xP/Eum6
X-Google-Smtp-Source: AB8JxZqWU7JgFc7eGmCtIfy4VBzlkgy9wMSfDKsxc1Ce9yKJ6CUqBAX9bBv6IQciVDiDY+Px7Qq8Dg==
X-Received: by 10.55.19.153 with SMTP id 25mr20010516qkt.37.1524411524965;
	Sun, 22 Apr 2018 08:38:44 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n14sm9559631qkh.14.2018.04.22.08.38.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Apr 2018 08:38:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Apr 2018 11:38:37 -0400
Message-Id: <1524411517-19170-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 4.2.1
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
X-List-Received-Date: Sun, 22 Apr 2018 15:38:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.2.0.bb => python-lxml_4.2.1.bb}             | 0
 .../python/{python3-lxml_4.2.0.bb => python3-lxml_4.2.1.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.2.0.bb => python-lxml_4.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.2.0.bb => python3-lxml_4.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index a0fe140..3f3a1e2 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "04455d43fd587bd11ccef6315258c3ce"
-SRC_URI[sha256sum] = "7d96fbb5f23a62300aa9bef7d286cd61aca8902357619c8708c0290aba5df73f"
+SRC_URI[md5sum] = "c266d9062e23b08f66426979a2b36f51"
+SRC_URI[sha256sum] = "e2629cdbcad82b83922a3488937632a4983ecc0fed3e5cfbf430d069382eeb9b"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.2.0.bb b/meta-python/recipes-devtools/python/python-lxml_4.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.2.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.2.1.bb
-- 
2.7.4


