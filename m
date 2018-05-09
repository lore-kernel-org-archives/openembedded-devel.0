Return-Path: <sipke.vriend@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A94C674E1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 01:39:46 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m21-v6so21942862pgv.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2018 18:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=W9AVAasm+fpqQWwjx/maunlx1aFn4K0Gsr+xgdBlpiY=;
	b=FBSShPDdS1pHXLyFno3GGTVr/7a7fjKt+fyjeOkI5ulDOGZ24V2tvbzOqxBDkEPwIO
	+nmkIQE1FhSnlujwtnhCZVfOpss/LGa/14aPi0ewwMcykSHpJnCcCeHi5e3Wzv/4qvOK
	Wv01JNwDCO7DlgOiuzLdxe850q0yu8/8cWhUBP200Ljigjsnm+UjvA1TIrhv7ZyZFj2F
	637bA57hLc9B5us4umLoV6qQmJjD3IPBB6JlW2ftlIZr2Z/RWzgsmAxfksDuNCUvmLbl
	OsVxV2slS5TXv5L+/ZGlIJV1sIiFSRTul61f2yVHyvpG4Wb+LJiCdMkQGMe6djRrrLiv
	E/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W9AVAasm+fpqQWwjx/maunlx1aFn4K0Gsr+xgdBlpiY=;
	b=Ekv1m5+7Y5agMz5PDe9SLbwrayiLgpCsIsXoeEQu9Cs71309OCPGMfhN0AJ1d6Sn9p
	1Wxlog9015C5iiMpxgT/Lej7BJ86Ghh9Udp/LRNWj1IYABMcL2E3ngW0xlIEawtUXUYr
	9HAie0nbmVJJx273cFXB0jtXuIihK0RsEVXXHmaKJx99Wdd5HNfgDogqgs4khfNtbgQ/
	vWGZ73QRT/bDGs165vAfwF0soOrFHhfuiUewCQ+FcXFGzh1gO/yDq/Gus1DNUgMPYg54
	4XJyKkM3vIXLyeJ6UnumJDsBJfsOlER+NGrAqxNGWK/q6OQPDTy5y1pwHPhgj/Q6zEFL
	P9qw==
X-Gm-Message-State: ALQs6tAARx/GPauF2t+XWv2zEom9YpQFMEymyen/3xbi2cWoWl6OGQew
	pVsXm9gb4lNcWYvTiYsKUGQVPw==
X-Google-Smtp-Source: AB8JxZoypfxSh2jl48byfddj8SnsW+fGbUHPgsg1xYE6yx26dPwobXCWe9KoQ37Eogc/lYun25aFgQ==
X-Received: by 10.98.246.25 with SMTP id x25mr34199414pfh.106.1525829987420;
	Tue, 08 May 2018 18:39:47 -0700 (PDT)
Received: from sipke-dt.bne.opengear.com ([59.167.150.161])
	by smtp.gmail.com with ESMTPSA id
	t80sm57203928pfg.0.2018.05.08.18.39.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 May 2018 18:39:46 -0700 (PDT)
From: Sipke Vriend <sipke.vriend@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 11:39:33 +1000
Message-Id: <1525829973-22804-1-git-send-email-sipke.vriend@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-robotframework: Add robot framework serial library
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
X-List-Received-Date: Wed, 09 May 2018 01:39:46 -0000

Add the robotframework serial library which provides the python library
and associated robot keywords to open and communicate with serial devices.

Signed-off-by: Sipke Vriend <sipke.vriend@gmail.com>
---
 .../python/python-robotframework-seriallibrary.inc        | 15 +++++++++++++++
 .../python/python-robotframework-seriallibrary_0.3.1.bb   |  2 ++
 .../python/python3-robotframework-seriallibrary_0.3.1.bb  |  2 ++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc
 create mode 100644 meta-python/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc b/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc
new file mode 100644
index 0000000..9f07b65
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Robot Framework test library for serial connection"
+HOMEPAGE = "https://github.com/whosaysni/robotframework-seriallibrary"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+SRC_URI[md5sum] = "b7c9565d54c30df7cd3f3c0e29adffa3"
+SRC_URI[sha256sum] = "256ad60fc0b7df4be44d82c302f5ed8fad4935cda99e4b45942e3c88179d1e19"
+
+SRC_URI = "https://files.pythonhosted.org/packages/ce/e1/1e337dc84a20b9d92d7b243d16bb9f6fc0084967eca7454228bb546efec7/robotframework-seriallibrary-0.3.1.tar.gz"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pyserial \
+    ${PYTHON_PN}-robotframework \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
new file mode 100644
index 0000000..440f69c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-robotframework-seriallibrary.inc
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
new file mode 100644
index 0000000..440f69c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-robotframework-seriallibrary.inc
-- 
2.7.4


