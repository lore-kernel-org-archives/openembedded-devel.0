Return-Path: <nick83ola@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9C97F7D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 17:19:32 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id n14so2454785oie.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 09:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4r2pPeO5uQggj+lLv35GESveNb7zLufYEJqwS4ecvx8=;
	b=pAays9rdiQOQy8BIxIppkrI64FFhoIntXxaeXX7/DqeWwFWhvL0cfI4uVLILHR42my
	E4WyIfRicLj2vHTGdIq+eV/NqaoFlYnU29QyYHdzsX422A4l+Wa69ntK4AjZvq7fb0eu
	FGt9itrEKYSgPRuO41Vsh0WFShsww8NQZNZOx8ew8H6PG4+oN3/sr9+1x+DNgEgAxMWN
	LeE4jnFie93ZgiYTfAhCJ6X+XhgII8Xb7+h1kcwHGGAwKyBzpL9urHptiHwDWM50gD68
	ivq/TXIIRZswDRk+cRlRQi5vAeolGWeYnBZBVbWvYx6rKClZOmFoysGij9BeTKJGeybi
	ij+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4r2pPeO5uQggj+lLv35GESveNb7zLufYEJqwS4ecvx8=;
	b=EIK24jdrslrIDiRy9j+YArWUNurh71BKIciICoy3Q3npo6t7zo153jS+gUH3w6tPGk
	A7y2axXSE1KxjVQ7xte99T5va8lHjSkHOJPRruzeEq3LLzM4hMEfMVfMrM9JTn5mXyhz
	YMmJGmO2ZD+LHb3NgvN150Te9nzKvD0rDaOkhFi6aurqDsXyagxslJgkduZ2N/G/9nGP
	B27YzL/iBaU/iJfuE9OCuLkqGC8RGLcEtd2qN9uN1sTSLuEHN0WdluCU5a2CiLJncSLC
	n9TvfpwKDs7D8eIg+PMc0NSKTrr1dWk18zqIobxwV3lvb0CCqs1CRPlUIlgYOqSKcoat
	RdnQ==
X-Gm-Message-State: APjAAAUCuwJf5ssYktdIdt+UyuNHmoYip6CmMmlcudJ5h+Xcr87UDbDy
	X4k3Uj6Kt5UmiN+77+ld0jkh1E8k6Vs=
X-Google-Smtp-Source: APXvYqyeSxgyzwReVTGlBsuNI5dH88bll96gudosTDRfVi9U7YWEncr/Wv/RD5BCNty79PDHWA83Zg==
X-Received: by 2002:aca:5145:: with SMTP id f66mr4038819oib.0.1573665572360;
	Wed, 13 Nov 2019 09:19:32 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 38sm925838oth.19.2019.11.13.09.19.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 09:19:31 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 17:19:00 +0000
Message-Id: <20191113171859.35167-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-backports-abc: update to 0.5.0
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
X-List-Received-Date: Wed, 13 Nov 2019 17:19:32 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python-backports-abc_0.4.bb         | 18 ------------------
 .../python/python-backports-abc_0.5.bb         | 11 +++++++++++
 2 files changed, 11 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python-backports-abc_0.5.bb

diff --git a/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb b/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
deleted file mode 100644
index 6a4d267bc7..0000000000
--- a/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "collections.abc from Python 3.4"
-DESCRIPTION = "A backport of recent additions to the 'collections.abc' module"
-
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
-
-# pypi package doesn't have valid entry for license
-SRC_URI += "https://raw.githubusercontent.com/cython/backports_abc/master/LICENSE;name=license"
-
-SRC_URI[md5sum] = "0b65a216ce9dc9c1a7e20a729dd7c05b"
-SRC_URI[sha256sum] = "8b3e4092ba3d541c7a2f9b7d0d9c0275b21c6a01c53a61c731eba6686939d0a5"
-SRC_URI[license.md5sum] = "dd98d01d471fac8d8dbdd975229dba03"
-SRC_URI[license.sha256sum] = "0a4f3b38055f50f047a42521568fa6ddb9a5976c2884f6ae138796d0f71150ca"
-
-
-
-PYPI_PACKAGE = "backports_abc"
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-backports-abc_0.5.bb b/meta-python/recipes-devtools/python/python-backports-abc_0.5.bb
new file mode 100644
index 0000000000..b588a31a30
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-backports-abc_0.5.bb
@@ -0,0 +1,11 @@
+SUMMARY = "collections.abc from Python 3.5"
+DESCRIPTION = "A backport of recent additions to the 'collections.abc' module"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
+
+PYPI_PACKAGE = "backports_abc"
+
+SRC_URI[md5sum] = "7d1936ec183a3586290adf60f6f96764"
+SRC_URI[sha256sum] = "033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde"
+
+inherit pypi setuptools
-- 
2.20.1


