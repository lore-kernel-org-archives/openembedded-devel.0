Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBBD7850C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 19:18:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id p13so7833214qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 11:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5/Dg0j0bF/CfpZlJ2btVFmBHvWPHzFwiBfAnGopC5d4=;
	b=HyoN9DJ+NiLXBkKKL7s6T21bFyx+coxVlo8TR3ZVj6HhXkERgh7XL2XwWTIb9P543r
	FUkIqiFJqC1ss2ayBWn3oBnjt0cmbAk20C25Ltes7ZcpYr4lRwXVWbS4EGs8g/dK7gUw
	ivwn2+GWcVFn/biqUAKV6KDfgMA9Rz6+Xv1ezgVrvDS7QtW1Go9SR2NQV+grsJ5T8XTZ
	vWNvEadd+SpYxxDRxWkcyPiJsalST93MgUL3ZQc8abwRSw2wjYLSsDRo4maeYB7IjozH
	LkSBIfV0INWVxs8VD+DAhe8MKfQm6kDKt5mIj8HCdZb/KYVXWNQDL7NvoMrU6rGA9trb
	1W/A==
X-Gm-Message-State: AKGB3mLsdkuY6St6N3XXZtN+WWJfeP7+BhdC8OZ3YvVJNSp0TYGH1qxh
	aKh8Ov3I/oLWOJueP/UeYQfUIS27
X-Google-Smtp-Source: ACJfBovCKWDrgCh58MNrUT3Z+H0GzCxvlV8WI9BFrlU6c1FGxRUYLczDrPsvgJx6eADabwR4k3Go2w==
X-Received: by 10.55.108.6 with SMTP id h6mr3094611qkc.290.1513711135991;
	Tue, 19 Dec 2017 11:18:55 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	k34sm10105044qtk.5.2017.12.19.11.18.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 11:18:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:18:43 -0500
Message-Id: <1513711123-14770-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-aws-iot-device-sdk-python: update to version 1.3.1
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
X-List-Received-Date: Tue, 19 Dec 2017 19:18:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-aws-iot-device-sdk-python.inc      | 4 ++--
 ...-sdk-python_1.2.0.bb => python-aws-iot-device-sdk-python_1.3.1.bb} | 0
 ...sdk-python_1.2.0.bb => python3-aws-iot-device-sdk-python_1.3.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-aws-iot-device-sdk-python_1.2.0.bb => python-aws-iot-device-sdk-python_1.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.2.0.bb => python3-aws-iot-device-sdk-python_1.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index eaeb020..177b819 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30"
 
-SRC_URI[md5sum] = "e6781f6c42bbc547d508d6fa6720ac8f"
-SRC_URI[sha256sum] = "6b2865d4f518794b96a834fc81b568428daa0ef92037da2e9288b4af5d8dd736"
+SRC_URI[md5sum] = "97e8cf0d40ef3765d979c19b534a716d"
+SRC_URI[sha256sum] = "d68cbff396143e837b4c23b6621d3b7ae374281afc75eed8e51a28625d9125ba"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.2.0.bb b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.2.0.bb
rename to meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.2.0.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.3.1.bb
-- 
2.7.4


