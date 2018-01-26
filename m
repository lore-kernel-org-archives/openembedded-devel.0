Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC716076F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:21:04 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id i1so1134396qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 05:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r0WtATRaXblOnsND5N7mh+1tQVyzdsEx1SZOxQONDWk=;
	b=egsUy5fmLvFhM2T66Xnq+lWotl2pBd1wz2V/v/0abwWMhP2CfrcO/bH4fLDmdbFrlU
	iL+5Aph0D+TEM/toZcfyQwjZzValYOZx8lr7KtEQp4iMlW8rE/WTEOyDt/9JLPHEul3c
	d3tTpSqWN7n24eYJCmg/0X11c/Br8YgLjtzj8h3cLiKEYx1aw6iQplbYWtR3S94KBH3B
	QO913v/K9ZzDCF9uCicmn5PhRM0KC1KQZG4lHwhY/tUreQn4nvj62+TvdxpS4s/J0nsp
	CeJpIw5ZckJaGxEs2J39H5U70JJLx4A1qpCjcgHSXtsgzwal2E6Jg2zcyUMMq2WSS54Z
	fO/A==
X-Gm-Message-State: AKwxytdnENQswDISBXtEZGnYW8hUN5UNdmx9iPU0OgzcsM1YSX3SqXzf
	lV9vbVeDZWqjBkCmXA/1Qn7OztAz
X-Google-Smtp-Source: AH8x226ylsuA9NlH8Q7wVdPlgPDbvIp4NyRpn1i/3WW8EJHPh4jn0vqMRVsN0CF/k5605fs4pAoBuQ==
X-Received: by 10.237.48.2 with SMTP id 2mr22575443qte.232.1516972866081;
	Fri, 26 Jan 2018 05:21:06 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f56sm5577167qtk.93.2018.01.26.05.21.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 05:21:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 08:20:51 -0500
Message-Id: <1516972851-22282-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-astroid: update to version 1.6.1
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
X-List-Received-Date: Fri, 26 Jan 2018 13:21:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-astroid.inc                | 4 ++--
 .../python/{python-astroid_1.6.0.bb => python-astroid_1.6.1.bb}       | 0
 .../python/{python3-astroid_1.6.0.bb => python3-astroid_1.6.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-astroid_1.6.0.bb => python-astroid_1.6.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-astroid_1.6.0.bb => python3-astroid_1.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index 213dde5..a01acf9 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "6f8f60b316218455726958f08c6e17f1"
-SRC_URI[sha256sum] = "71dadba2110008e2c03f9fde662ddd2053db3c0489d0e03c94e828a0399edd4f"
+SRC_URI[md5sum] = "a40b1724b586f3cd29e213a5d2109c17"
+SRC_URI[sha256sum] = "f0a0e386dbca9f93ea9f3ea6f32b37a24720502b7baa9cb17c3976a680d43a06"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb b/meta-python/recipes-devtools/python/python-astroid_1.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
rename to meta-python/recipes-devtools/python/python-astroid_1.6.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-astroid_1.6.0.bb b/meta-python/recipes-devtools/python/python3-astroid_1.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-astroid_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_1.6.1.bb
-- 
2.7.4


