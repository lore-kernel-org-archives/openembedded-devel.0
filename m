Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9028474FE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 17:24:21 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c131-v6so10095836qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 10:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xBiCrJMdKhFHoUWIAdu5gg3VAlYCHPozl3jTL9V10v0=;
	b=qPhkyD4NgOuzftDX10bRkSkYmCdqpxht218XJtZmJQ4acdHfN8wsw14M54Q3aBWloH
	fHWCR+xPudWxAd0UMCHvAiZ//NSFPT6dwP/eflv0qcyFQbH6MwmVfNwm7CPvs30bG0tH
	iLDgiiXvIZLkOA5d9vUvuSc12gnQerslZLxfu73gmFTSniLOzuLFt9PjsySNmInqavu+
	cMOCVBV+DAt4g+4Oy25Rp6AmMJiFI0MZPclz34pPG8oH0OSIo+YbrhEC/MmIZ4hP94mQ
	Yn4gaLgHJsPj2kvdeAEcNJ9MaYwDrof+R6yNuvCkkMcIrZHFYwy4VRFxrynNmEyWoxG5
	krMA==
X-Gm-Message-State: APt69E1OeSmxasskMoyJm53g4lWYKOeVZxvCNccKCihDyUFUb0OXtrJD
	LotgYw0ff6CFcu7Ba0haS2XKpxi7
X-Google-Smtp-Source: AAOMgpcx24KhLV77F2V/sb71t06cgIc0mNKL04+kyDS002ggEseVp58i2SSvZLMiYvm5XjXGIyTdOw==
X-Received: by 2002:a37:26d2:: with SMTP id
	m79-v6mr18642465qkm.212.1531157062207; 
	Mon, 09 Jul 2018 10:24:22 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	j20-v6sm12464843qtc.71.2018.07.09.10.24.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 10:24:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 13:24:14 -0400
Message-Id: <1531157054-23314-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.28.4
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
X-List-Received-Date: Mon, 09 Jul 2018 17:24:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.28.3.bb => python-cython_0.28.4.bb}       | 0
 .../python/{python3-cython_0.28.3.bb => python3-cython_0.28.4.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.28.3.bb => python-cython_0.28.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.28.3.bb => python3-cython_0.28.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 33873c9..713fd2f 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "586f0eb70ba1fcc34334e9e10c5e68c0"
-SRC_URI[sha256sum] = "1aae6d6e9858888144cea147eb5e677830f45faaff3d305d77378c3cba55f526"
+SRC_URI[md5sum] = "fa01ba71b1e3136b0f12e3ed8958ea02"
+SRC_URI[sha256sum] = "76ac2b08d3d956d77b574bb43cbf1d37bd58b9d50c04ba281303e695854ebc46"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.28.3.bb b/meta-python/recipes-devtools/python/python-cython_0.28.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.28.3.bb
rename to meta-python/recipes-devtools/python/python-cython_0.28.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.28.3.bb b/meta-python/recipes-devtools/python/python3-cython_0.28.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.28.3.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.28.4.bb
-- 
2.7.4


