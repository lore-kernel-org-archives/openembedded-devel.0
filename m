Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4ACD87ED81
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id t8so25940092lfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=QOU0iuruHmUpsnHfk5MVOqjgKyZpRYFLXk70yGB/t5s=;
	b=IyqhJZm8a4d4CNlDFQkkca8DjgFXXSbYqdSUNfw3xr+5oT/8g5y+Y1fWimGUAgdZrs
	T/7Aa5Qv4VkwUa9DAOYQoD5vjmVbojiUa/7L2O6pxqFX+Jt4i/KhMjS+r2kfu051/HeV
	8wM62iCAn4mkHLenDpSty0l/IdZxSqWX1c67Pkn0katBqQrWiWmPeBOFbMFhbg4P5Jae
	mJJ+RG1d6aoNyNplc1xwYyyWUJswdSs3LB67B8lres+k9CwsriqKf/+OMxz0Qt+U4LaX
	SDQzLbmNu2cy/3qzfzvYkEJC2c4+xJ28shCpXss9qKmGiXWfo/nfdQq+SOWwbPGwlHZY
	ONeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QOU0iuruHmUpsnHfk5MVOqjgKyZpRYFLXk70yGB/t5s=;
	b=cqoipPbJxHzOJ2aSdvanD2vuy8rMKRPn23hXTJoesWMAh3anM4xbERCqP/a0GaTbir
	lJ2xYCcsmCT7K3v2Rby8R2KO5/e7jjuvCOjeJ6hUQI8bqT50ccPOZGZ6ccRG/skLViZs
	Em5cBjlXipxb/PRNOoslt+ea5DWoCYAfByRZUGi4+gKN9c0lZ1OU3nVrrt362j5d4ekq
	pmV7hNl5/k8OnDQ4WbvlobGyiw69VfFgyzggc9uFJXCRkyiMjsWC5eHhkkzH9efyQ8KN
	d1oew84K4aO5xlpJyp0JEPomo9EH8PcPAtSBaoyOGsgAFWGrpoYE/WAHILXFNm6Fjlhz
	zhhw==
X-Gm-Message-State: APjAAAW593koT/ZcwXV+MoZ8RdIRjuLOdD6ZtbqyyNQc9/pByWRNcdca
	PSTJye+aCrxhA09GJqOSus/XSX0ZnXU=
X-Google-Smtp-Source: APXvYqzmb7LssafIQHLrwbAPdTuZiXCG6//9oaqY9OA0s/qfKf1aURSjRhT4rmQYtPHi4EP7YPYHsw==
X-Received: by 2002:ac2:5bde:: with SMTP id u30mr35286710lfn.59.1568590896744; 
	Sun, 15 Sep 2019 16:41:36 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	z30sm10117729lfj.63.2019.09.15.16.41.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:34 +0200
Message-Id: <20190915234134.12250-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] python-pytoml: update to 0.1.21
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:36 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-devtools/python/python-pytoml.inc             | 4 ++--
 .../{python-pytoml_0.1.20.bb => python-pytoml_0.1.21.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pytoml_0.1.20.bb => python-pytoml_0.1.21.bb} (100%)

diff --git a/meta-oe/recipes-devtools/python/python-pytoml.inc b/meta-oe/recipes-devtools/python/python-pytoml.inc
index 1019c09d0..180531d75 100644
--- a/meta-oe/recipes-devtools/python/python-pytoml.inc
+++ b/meta-oe/recipes-devtools/python/python-pytoml.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cfff423699bdaef24331933ac4f56078"
 
-SRC_URI[md5sum] = "a11d8a4859b53f6ebe2f782314428911"
-SRC_URI[sha256sum] = "ca2d0cb127c938b8b76a9a0d0f855cf930c1d50cc3a0af6d3595b566519a1013"
+SRC_URI[md5sum] = "e59dd36a559dd2a876e4c149c69e947b"
+SRC_URI[sha256sum] = "8eecf7c8d0adcff3b375b09fe403407aa9b645c499e5ab8cac670ac4a35f61e7"
 
 inherit pypi
 
diff --git a/meta-oe/recipes-devtools/python/python-pytoml_0.1.20.bb b/meta-oe/recipes-devtools/python/python-pytoml_0.1.21.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pytoml_0.1.20.bb
rename to meta-oe/recipes-devtools/python/python-pytoml_0.1.21.bb
-- 
2.17.1


