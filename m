Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 13B276067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:10:32 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id z10so1077220qti.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 05:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XZ9K1H1G8r2lSjHLo6ywcdLSyHyqoLeQ/n2+sla9x+M=;
	b=Py2P3WMR8GHFCOxF+dEwJ+QRvsOViLa0zVlus8phXHfTxO+Si8hXcnvIYgjGAriaUF
	fXQFMo4oPnPD9wufGtq4C6/rwnly9TbfFtWHwLpTko40YZAzZThreus6XJptVMFTZ7Ru
	pZd66rrk3TF/rW3MzDSL3GuecpJgL7CkbEdWjSyG81Dh3c9Ufo6RovlOlybZDmMmKNxv
	7Atcc6SSUFNGf+okjfML5gssWLXNQni28ja8g2SjF++RotRXOA7SUBQKAqqO9ra/+NC9
	ADAqfu74C0bJEOCamyu7NhMeIAaPwMzoZiETFu0Vr3I7EeBz9YEDucuk7Z/eEC1rugbi
	ZakQ==
X-Gm-Message-State: AKwxyteO2vZoDkVkx3dlTBV5iTNk4R5FldMHqbJnYx9U/1Rj9oib9258
	gIU1f1eWV+Cqd0nSnAt/XzP1AEuf
X-Google-Smtp-Source: AH8x224sZCV+ST+mGgBaP9tKQbfxW+QIRMOw0JxlDWuH0LQjdWhePsSvQym4MRDX1ruTTBFDNlm5Ww==
X-Received: by 10.200.37.216 with SMTP id f24mr22806140qtf.165.1516972233625; 
	Fri, 26 Jan 2018 05:10:33 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v20sm5186499qtg.79.2018.01.26.05.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 05:10:32 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 08:10:26 -0500
Message-Id: <1516972226-22174-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pylint: update to version 1.8.2
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
X-List-Received-Date: Fri, 26 Jan 2018 13:10:33 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pylint.inc                 | 4 ++--
 .../python/{python-pylint_1.8.1.bb => python-pylint_1.8.2.bb}         | 0
 .../python/{python3-pylint_1.8.1.bb => python3-pylint_1.8.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pylint_1.8.1.bb => python-pylint_1.8.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pylint_1.8.1.bb => python3-pylint_1.8.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pylint.inc b/meta-python/recipes-devtools/python/python-pylint.inc
index 9dd1d65..fd4739f 100644
--- a/meta-python/recipes-devtools/python/python-pylint.inc
+++ b/meta-python/recipes-devtools/python/python-pylint.inc
@@ -3,8 +3,8 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI[md5sum] = "b7cca873fb60d420a4db8d3bfa4824b1"
-SRC_URI[sha256sum] = "3035e44e37cd09919e9edad5573af01d7c6b9c52a0ebb4781185ae7ab690458b"
+SRC_URI[md5sum] = "f6c290e2ff171e83694e82096f13fd4f"
+SRC_URI[sha256sum] = "4fe3b99da7e789545327b75548cee6b511e4faa98afe268130fea1af4b5ec022"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pylint_1.8.1.bb b/meta-python/recipes-devtools/python/python-pylint_1.8.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pylint_1.8.1.bb
rename to meta-python/recipes-devtools/python/python-pylint_1.8.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.8.1.bb b/meta-python/recipes-devtools/python/python3-pylint_1.8.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pylint_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pylint_1.8.2.bb
-- 
2.7.4


