Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6507469C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2018 02:39:38 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id t17-v6so3046505ply.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 19:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r/duU0DG3qoGfAl1H0UU2hW4L/wWiMSFlrsHBSWWD8M=;
	b=gcqLcssKoDaLWc8gQVS/CMtavFJD7h5lng2Tzg7QRvv/JvKrYcLxAkCvXKPkXFkHdF
	fqyxS9zNnGK7F3oUyOkGdBHgpSusn5iOz8cxzcqNvG1e9kx1O7l9CP05AOQPTvEJlq+m
	M7ilJeh+BZIjfX6PVW+HWOrOAqk1LJO6OZqaUKwBWvcZPo9pKd89GXKvenxfAvp3rlpD
	18H5zK2CoMGAPaN/40UsKN9ypJB7+UPpXl3NoSH33phajvPI+MSwNE6/jF16oSgxqVtN
	W/shENlm9uCl7eeTe5BFCtKWCSUOtBJeKuKfutUh3nLiQvPQpgfyI0N11njpr0X5Zixg
	HoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r/duU0DG3qoGfAl1H0UU2hW4L/wWiMSFlrsHBSWWD8M=;
	b=IMmD9klP74DPZiNVn5YjDeHURO8LYO3YeOD/1W1h0KIZW/aoH1RcUCDgt4N486TV6g
	QHHglKbAXA4WZ+J9NUC9B1dPZWgB7ep4AD3rIhNZORENha2aCiaYlgLV0hsDAeyfmaT6
	4gQwp5LESH/0VZE4Pmv5e2Bf5sTFqOmmGqc0f+iJB/7tZ//GMytZTs98rda9rJbxExvY
	xjh5nTNC+Pei9lsr00srGW+gtA/ysSd5wMhEbWFPVhVgN3aCHxmaxD2kGGgjHTceYC2Z
	yQ9grFw6A2hIOM1prkdoFI/0oMbpZyBV3uDy9y5/ylraD1yaq+y+47J5xrgi0CP7EiLr
	4Tjw==
X-Gm-Message-State: AOUpUlEH4WGERWf1jXhaTT03B1ue9SH4dHdQSJdbAf1eeE5EaT8So4oo
	i8hbvg8WhaAr9pAc75RY6VYhS1rd
X-Google-Smtp-Source: AAOMgpemuf93QhYI1MiFNMZNaWJ1vl4sTCYK60Wdg86RsvFWjSTiecRAXv1Scb1dGTQXCVrU1Iggdw==
X-Received: by 2002:a17:902:b7c6:: with SMTP id
	v6-v6mr7947191plz.49.1532745579352; 
	Fri, 27 Jul 2018 19:39:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::ee7a])
	by smtp.gmail.com with ESMTPSA id
	m20-v6sm8749341pfg.61.2018.07.27.19.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 19:39:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 19:39:29 -0700
Message-Id: <20180728023930.25045-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180728023930.25045-1-raj.khem@gmail.com>
References: <20180728023930.25045-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH] python-stevedore: Upgrade to 1.29.0
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
X-List-Received-Date: Sat, 28 Jul 2018 02:39:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-stevedore.inc    | 6 +++---
 ...ython-stevedore_1.28.0.bb => python-stevedore_1.29.0.bb} | 0
 ...hon3-stevedore_1.28.0.bb => python3-stevedore_1.29.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-stevedore_1.28.0.bb => python-stevedore_1.29.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-stevedore_1.28.0.bb => python3-stevedore_1.29.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-stevedore.inc b/meta-python/recipes-devtools/python/python-stevedore.inc
index b23fb4c8c5..16e4155e10 100644
--- a/meta-python/recipes-devtools/python/python-stevedore.inc
+++ b/meta-python/recipes-devtools/python/python-stevedore.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "https://github.com/dreamhost/stevedore"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "b736a71431a2ff5831bbff4a6ccec0c1"
-SRC_URI[sha256sum] = "f1c7518e7b160336040fee272174f1f7b29a46febb3632502a8f2055f973d60b"
+SRC_URI[md5sum] = "525186cba577852e0408c92c3f8fac65"
+SRC_URI[sha256sum] = "1e153545aca7a6a49d8337acca4f41c212fbfa60bf864ecd056df0cafb9627e8"
 
 inherit pypi
-
+DEPENDS += "${PYTHON_PN}-pbr"
 RDEPENDS_${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-stevedore_1.28.0.bb b/meta-python/recipes-devtools/python/python-stevedore_1.29.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-stevedore_1.28.0.bb
rename to meta-python/recipes-devtools/python/python-stevedore_1.29.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-stevedore_1.28.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_1.29.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-stevedore_1.28.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_1.29.0.bb
-- 
2.18.0


