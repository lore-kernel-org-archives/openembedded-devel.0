Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEB3606D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 14:32:34 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id h186so1362943qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 06:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KOBTeM7KDcw45de0FbbAehcXPc53w8ftoaq0v8ZKadI=;
	b=LHk9v+dgaE0siywTYCssENm7DJa9+yWCKBhpyn3ODQrmh/rJUQzybVv97e/7Do2Ffy
	unQEVgMyrZ6ypH8x6BHTRxFLtA1HHlbnEfnrTZ+oTS8/Mjj2UlWLNv5PA+BRlTB4Hidd
	UtLyEfq2vH+Dto7owPhotMrMHQJi5HZMHWqWQkS2FPAkseMUyeTlcatIFb5DDhx5Zjnj
	DiB8VYOhYXq5ZJPbSAJNKNiJTXeiZK1mpkHw0szVs5wIKWk60IBLgRzwVix42ZOLs9WD
	wAIXlXCUiWii+LI3UX9NiWLaJHPa/A3Dom4/+97ceAKi1xuyTcps8h4tNHUlqzo0RnoA
	z5Sw==
X-Gm-Message-State: APf1xPB/ARsH1l5RLkKhisdtqLILhH3n/22jepB4TCgSNzrLwSN2EQM0
	56TvmCWPRtYYeFOHEEKGSYBYAXbj
X-Google-Smtp-Source: AH8x226z65gxMCzPah4CHHjfeNiT7Umzj2F06Nej+WUIsteiTNeUoXkQQESrpXvKtNiVLKqxtfFZLw==
X-Received: by 10.233.237.88 with SMTP id c85mr8939517qkg.347.1518273155336;
	Sat, 10 Feb 2018 06:32:35 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t10sm4194759qkg.39.2018.02.10.06.32.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Feb 2018 06:32:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Feb 2018 09:32:20 -0500
Message-Id: <1518273140-9510-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.4.0
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
X-List-Received-Date: Sat, 10 Feb 2018 14:32:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.3.2.bb => python-pytest_3.4.0.bb}         | 0
 .../python/{python3-pytest_3.3.2.bb => python3-pytest_3.4.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.3.2.bb => python-pytest_3.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.3.2.bb => python3-pytest_3.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index c997da9..a09aec4 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "c3757fbdfebd5d8f402fdd5fc1dcb9b5"
-SRC_URI[sha256sum] = "53548280ede7818f4dc2ad96608b9f08ae2cc2ca3874f2ceb6f97e3583f25bc4"
+SRC_URI[md5sum] = "6f402b2115c2dc97bbf69739990a1d79"
+SRC_URI[sha256sum] = "6074ea3b9c999bd6d0df5fa9d12dd95ccd23550df2a582f5f5b848331d2e82ca"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    file://pytest_version_fix.patch "
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.3.2.bb b/meta-python/recipes-devtools/python/python-pytest_3.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.3.2.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.3.2.bb b/meta-python/recipes-devtools/python/python3-pytest_3.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.4.0.bb
-- 
2.7.4


