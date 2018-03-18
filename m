Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AEE53788E6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:17:27 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id h187so2583404qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 07:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1cRpcT2/C5/m7rYWpnYi9qkRIE+M/eUTmi9TQhHyZcA=;
	b=umCmPhtyRGB9abMiXITcOcaRiXRj7YMaAL40ozjxu8BRxWUqOrhlgDXGCLZ73RgqN5
	c6pTgBK7QAal20lhI0wonTZbu6zIVrwpBBjey+5Qz17Yf5npVgZFN5UaUdIvHJu3Fxpk
	mLC98PG+OWe2TYqev9HCvYO3HEvQUzGQFocFYVPvaJ63I2xwKNnvABQFzbYEkDbQ9C5N
	dYJB0GSuQaXzmu8NR4roUOMfsbqEF426m9QcFY7dG7F81BhX4QZS/hbLEMfLIpLRMvyM
	9CU0MnjjZbRvQRNZ9kwgWAafpsaB8vVeMvGPEp7qJjuQbbinZz30V/EfPmzv58eTjV0d
	H0FQ==
X-Gm-Message-State: AElRT7GVd6WZ06Awcl6GTx9dLeD/MKr2Jx8hI7znPf/sLgQrViJMrVcM
	W0J/H8UBzJilDRC14g2SaLva/Nk5
X-Google-Smtp-Source: AG47ELuwb7KynwSclZPvEhrehb0zPVJpHXsdSOpAaDe0aJ+KIZkw+11LInE6iUEOlaZ0is8ejmwoEg==
X-Received: by 10.55.160.135 with SMTP id j129mr12739869qke.126.1521382648363; 
	Sun, 18 Mar 2018 07:17:28 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t68sm7966952qkf.62.2018.03.18.07.17.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 07:17:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 10:17:21 -0400
Message-Id: <1521382641-2777-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 4.2.0
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
X-List-Received-Date: Sun, 18 Mar 2018 14:17:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.1.1.bb => python-lxml_4.2.0.bb}             | 0
 .../python/{python3-lxml_4.1.1.bb => python3-lxml_4.2.0.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.1.1.bb => python-lxml_4.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.1.1.bb => python3-lxml_4.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 98a1af4..a0fe140 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "0265ad6701951347f2dbbb470e3d1512"
-SRC_URI[sha256sum] = "940caef1ec7c78e0c34b0f6b94fe42d0f2022915ffc78643d28538a5cfd0f40e"
+SRC_URI[md5sum] = "04455d43fd587bd11ccef6315258c3ce"
+SRC_URI[sha256sum] = "7d96fbb5f23a62300aa9bef7d286cd61aca8902357619c8708c0290aba5df73f"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.1.1.bb b/meta-python/recipes-devtools/python/python-lxml_4.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.1.1.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.1.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.2.0.bb
-- 
2.7.4


