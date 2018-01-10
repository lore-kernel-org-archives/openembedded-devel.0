Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B855B7881B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:03:07 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r8so520043qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vZrSRU637PVmsAGNw+k9qIFrIsSOI0h3qkLPgEN0h6M=;
	b=mJjkX4Tuy1pL2K/U6VU3e7/sSZgMUXJj6PpjXtA03UXKF4kuwFyeP5YYMqsgXPnkbh
	o61tni0U2UjFZM7xD7cOcjM6rvzMJd4DB6duIKuryBCYz7V5AuD8tXEANjrUVgdxKkSI
	uW5ZbQ2ApZJdbTRIdl3Zrzyo3Mxi5NTwFN941oWMza0ytwUxFnJ5mYSAUYCsewwY4tum
	PD+35mFZlPg7MSrBvrEWXtSGWornxOkHNSeYnIkCX8EPMHG9tsfu5rpNiRD/hC8aeKU3
	pDIwBIsWbJKl/mSHJmJXOuDSY8iQJTf5HV3SZ7AzGYcyn3CNxuk5eSA1lwV7WPUxhi4d
	Fbyw==
X-Gm-Message-State: AKwxyteSsOFxAM9BGyNcvzF3UCdZshRfVm/RddBB0DyCu+9bIbAmG+KL
	P0Mpp8vQ7Bu6yRVrP2qo/gw67Rwe
X-Google-Smtp-Source: ACJfBotPFWoYAFIN461YrFs13RV3vepkg2795u6knopXkjHFRiCxY/TFvcdakzVu1Ib4pzgz8QZgYQ==
X-Received: by 10.237.49.195 with SMTP id 61mr28902868qth.27.1515614588520;
	Wed, 10 Jan 2018 12:03:08 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	c2sm11298052qkf.39.2018.01.10.12.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 12:03:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 15:03:01 -0500
Message-Id: <1515614581-13525-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.3.2
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
X-List-Received-Date: Wed, 10 Jan 2018 20:03:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.3.1.bb => python-pytest_3.3.2.bb}         | 0
 .../python/{python3-pytest_3.3.1.bb => python3-pytest_3.3.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.3.1.bb => python-pytest_3.3.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.3.1.bb => python3-pytest_3.3.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 90d1a56..17d8233 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "6c056c2c41dfd2a0766682b942abf39c"
-SRC_URI[sha256sum] = "cf8436dc59d8695346fcd3ab296de46425ecab00d64096cebe79fb51ecb2eb93"
+SRC_URI[md5sum] = "c3757fbdfebd5d8f402fdd5fc1dcb9b5"
+SRC_URI[sha256sum] = "53548280ede7818f4dc2ad96608b9f08ae2cc2ca3874f2ceb6f97e3583f25bc4"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    file://pytest_version_fix.patch "
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.3.1.bb b/meta-python/recipes-devtools/python/python-pytest_3.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.3.1.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.3.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest_3.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.3.2.bb
-- 
2.7.4


