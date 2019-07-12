Return-Path: <parthitce@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3A57F01F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 10:23:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g67so4321864wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L+CYaBhNMbrbbOQBV1RXi2EFeidIQ8PcP3rorNDd9u4=;
	b=b5O2Yoi9TuA+wLwCFyC0gbV25bWImSgA4+UJGZ3uCYMiXzXBBMkyRnCvtaQ3/R+HMF
	HqysndYWSkl+pVzLZy/24Zzd0BPh3a/BsaXG2Cizj/pYBVxCRVcDEZeDQEfCRbUEX6qP
	xR103hvElb0ln+9a+Zy/TurPfS/S6Y3zch644WPF/E+9fxUbbPWOKfOYIAlRiU/g0xm1
	3h/Gk1THPb1eWQfT6dLpVtBFb80tpc861LQu9V/XVUDCAfvLQlhlU+EUz44pEWjWyKdg
	SNy/54X1w5XOb6SFl/KsY570WsluM3sw1VeG7InbyET2JCAHekU3seeR7FvErh98PPlg
	8yQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L+CYaBhNMbrbbOQBV1RXi2EFeidIQ8PcP3rorNDd9u4=;
	b=piQ8e4NZsTRmY4u95ok7/xalv7ajOOBWo/c7ELKoc07kzmoUT45XPF9cvAKrYDKDIb
	BSCxZyzR5TlYYwjIvAOG9mikiZ6odjStKkYFDKu2I5MY+iPMwpR5N2rAw/6wxTax7qGL
	46kcwOegr7Uhjyj8h8ROfcIVZ2Hzeq9pXSTIDGx163XwijTaiFVkrVsvGnhMm8ncXtpw
	ztvaVLiMioaHFlFLRQW4TXMuiEM1z6Y1UOsiFRhfmY7hDdIirYYi7AoA7iqNkSPF3oNb
	nhUev9hdfUMTelp1R8FK99GaZjVwLwiHsWvc7i8+9PRrWjhFmBUoNV604xK8Gc0Eac/J
	xvfw==
X-Gm-Message-State: APjAAAXa3Qfom2vK/15iJJwxJrmUbkGm4ADhHqyfmwCVcGRk8cmxv5we
	sEVeveiFRhexeUIPmrWQlHInAO8fqA==
X-Google-Smtp-Source: APXvYqxScGw3Af/kUOhY725OPvfvi+f3h3Hcv8LHTB3bBh/33sJXRfViEOOPUEXJ1+iFw+jA0kPhJw==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr8506720wma.123.1562926991457; 
	Fri, 12 Jul 2019 03:23:11 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180])
	by smtp.gmail.com with ESMTPSA id r5sm8397551wmh.35.2019.07.12.03.23.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 03:23:10 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 12:23:03 +0200
Message-Id: <20190712102303.460567-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH v2] python3-matplotlib: add version 3.1.1
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
X-List-Received-Date: Fri, 12 Jul 2019 10:23:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---

Notes:
    Changes in v2:
    - removed .inc and merged into one single recipe

 .../python/python3-matplotlib_3.1.1.bb          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
new file mode 100644
index 000000000..9b86ccc83
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "matplotlib: plotting with Python"
+DESCRIPTION = "\
+Matplotlib is a Python 2D plotting library which produces \
+publication-quality figures in a variety of hardcopy formats \
+and interactive environments across platforms."
+HOMEPAGE = "https://github.com/matplotlib/matplotlib"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
+
+DEPENDS = "python3-numpy-native python3-numpy freetype libpng python3-dateutil python3-pytz"
+RDEPENDS_${PN} = "python3-numpy freetype libpng python3-dateutil python3-pytz"
+
+SRC_URI[md5sum] = "f894af5564a588e880644123237251b7"
+SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812080c93"
+
+PYPI_PACKAGE = "matplotlib"
+inherit pypi setuptools3
-- 
2.21.0


