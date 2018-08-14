Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D48679057
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 20:24:25 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n6-v6so22580195qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 13:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E3w5VVLJ2F0JpL1NaIvDqj4pxTm7isYyfMjS02oIa6k=;
	b=VH2UTo26xsxYJonWaGRpCJ6YQ3azTxUL8D6tBubgerh9+7bjDthMB3AvslKR75BKAZ
	WyUQiAu3lUw9iJq1vmAwjMyC+NLnmni0aRmuD2yCzkpVr01cFcZNAT5oV6NUIcY7B56B
	TlndpiAENNwsj+Ag00Wddo9JT0p6L+GBPu/4mezdJjfR2D8jmWyfgfZolTHIOyHNHys+
	GetwD6YuQIY4snq+84gvS3xY8CBCvm709y9m0BwWQu4L+6uRscDWsOJTFo3vBOje/HNU
	6PZOZnEC4cnjM7cYSHfElhIkfsp9OWumEHHCrl3WOnhq5XiM8A63t5gxA1TJFJdZivXP
	a1VQ==
X-Gm-Message-State: AOUpUlEet6VrTu3sPgLitzY0dQMapXDNxr6AX6icKIWiG4ekeQKlXKmO
	0K9Bb9s5esspGuUpSUEBhEggN4WKrTk=
X-Google-Smtp-Source: AA+uWPwbEb2MPLQN5v4ycalwIm20NW1VQ/wE4TyamUV/JkiwcR3oWH7mcu+AuuK7lW+csc2X3aytrQ==
X-Received: by 2002:ac8:4102:: with SMTP id
	q2-v6mr23058854qtl.222.1534278265706; 
	Tue, 14 Aug 2018 13:24:25 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	d137-v6sm13045251qkg.91.2018.08.14.13.24.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 13:24:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 16:24:03 -0400
Message-Id: <1534278243-7774-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pandas: update to version 0.23.4
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
X-List-Received-Date: Tue, 14 Aug 2018 20:24:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pandas.inc                 | 4 ++--
 .../python/{python-pandas_0.23.3.bb => python-pandas_0.23.4.bb}       | 0
 .../python/{python3-pandas_0.23.3.bb => python3-pandas_0.23.4.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pandas_0.23.3.bb => python-pandas_0.23.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pandas_0.23.3.bb => python3-pandas_0.23.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
index 8b4914f..d6ca243 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "ed532e0cdc2aebe190f01e2ae84162f6"
-SRC_URI[sha256sum] = "9cd3614b4e31a0889388ff1bd19ae857ad52658b33f776065793c293a29cf612"
+SRC_URI[md5sum] = "7b597c7f989652e0c9af5f09a157e3ae"
+SRC_URI[sha256sum] = "5b24ca47acf69222e82530e89111dd9d14f9b970ab2cd3a1c2c78f0c4fbba4f4"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.23.3.bb b/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pandas_0.23.3.bb
rename to meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.23.3.bb b/meta-python/recipes-devtools/python/python3-pandas_0.23.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pandas_0.23.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_0.23.4.bb
-- 
2.7.4


