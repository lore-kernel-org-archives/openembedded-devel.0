Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2FED278798
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 16:06:24 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d15so7244085qte.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 08:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a3VsfSS1eJuQEsCsczU7oVCzHe3ISvhWwI4iBVXDbg0=;
	b=Q/cpCxvs7IZ7o/2koB5uyz6S1nMrZKJbHxvmyKAdlwIonLqHlYFg7YCpAK/e4FRjxt
	WwS/xpVTFgZkcRZFav1BHN4G/iwVEL5gbH5W1qucKulTRf28cruwUcxxPQKbMSbG2HQR
	jWowB2dWXxayXC5Lx6r36fLJBE+7lmbN938+/8MFH/iHNX1ahtiJWrdJGKtkdc31hSrc
	6GznUenq5LeKov18kkBp3KpP/KJUiiqNBYa+fPCy/mC7xRWOMdbORJwaOELPyJ7uPXhS
	n7lsIRGo7bGe85MLMG0NgJEMEfnKj+jVFjyBvBiMFTIlFces4SRNWYgkJNJjQLh/MxXF
	qOlQ==
X-Gm-Message-State: AJaThX6BwNC7z5C4T0rrm4lu2jeRLolz9diSaTgrjrQJ6fDmMORNOJR8
	+R/H0v68dw778fxpweRHWNUI3IuK
X-Google-Smtp-Source: AGs4zMZAelGmI3nMKJ99681gPmKlu9jm4DrZETtPML30HbjWhiRayOOBSm2U+iSr0kis4tATEBClEQ==
X-Received: by 10.200.37.133 with SMTP id e5mr7665920qte.35.1510934785831;
	Fri, 17 Nov 2017 08:06:25 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y135sm2628610qka.48.2017.11.17.08.06.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 08:06:25 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 11:06:18 -0500
Message-Id: <1510934778-16388-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.2.5
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
X-List-Received-Date: Fri, 17 Nov 2017 16:06:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.2.3.bb => python-pytest_3.2.5.bb}         | 0
 .../python/{python3-pytest_3.2.3.bb => python3-pytest_3.2.5.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.2.3.bb => python-pytest_3.2.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.2.3.bb => python3-pytest_3.2.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index a2be36b..2f68343 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "698f8929e095a1c37876b5567943be79"
-SRC_URI[sha256sum] = "27fa6617efc2869d3e969a3e75ec060375bfb28831ade8b5cdd68da3a741dc3c"
+SRC_URI[md5sum] = "6dbe9bb093883f75394a689a1426ac6f"
+SRC_URI[sha256sum] = "6d5bd4f7113b444c55a3bbb5c738a3dd80d43563d063fc42dcb0aaefbdd78b81"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    file://pytest_version_fix.patch "
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.2.3.bb b/meta-python/recipes-devtools/python/python-pytest_3.2.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.2.3.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.2.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.2.3.bb b/meta-python/recipes-devtools/python/python3-pytest_3.2.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.2.5.bb
-- 
2.7.4


