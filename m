Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B6F3171B57
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:15:00 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b130so16771564qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nug4U329CjxVZ1JGrJnLz0dlpn6PelBv/eR/nGTdtVk=;
	b=WtLDxSburga/lCYX0COlT85Gn+xk26rjDd5NcQQtsR5BgmRicLUNe0Qd0jq4SV/B+u
	Dy+JO5C2RfGgZ2ZkBS+xF/qTkczJuU4Tfd0AbCa8t9RHv/CXqrgJuQNmDR6DwJad5Y4U
	0bD1xKYlLourqrFhKfaBX8ZC/aDSSdiPlKkcPFlEtsVWZFqP0KWHD+Iq7SA3dzmOqh0D
	VML8+7Vh2pqsdaRv13IsDK/AkB6CVwg7ddnZ8BYyqk2gDV0+u4i81G+ue6wHLXS/lJ3J
	6aMCbwTo5zSsTqiGtBIPDO1A/Sli+yWto0qsGBGNDsi4pxHk6G2IjA/RhU4n1XqpVvSY
	HlWg==
X-Gm-Message-State: APf1xPDas1hvvPYTn+abkF7PuT6EJa08G+ozfZ+RiD1Q69pWBXcVkQuL
	ZbNuEOFOQh9NwIWTGPQWqb/9xSUS
X-Google-Smtp-Source: AG47ELs4vmb5FAZKzdWsZBZyJZSPbC/KRoxGDp8UaLYYR9R0gDMaZaCNm5vYcYZFuFtZsHxfkYbXJw==
X-Received: by 10.55.176.195 with SMTP id z186mr13906873qke.140.1519589701331; 
	Sun, 25 Feb 2018 12:15:01 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z128sm4431976qkz.25.2018.02.25.12.15.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:15:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:14:49 -0500
Message-Id: <1519589689-23741-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: update to version 2018.3
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
X-List-Received-Date: Sun, 25 Feb 2018 20:15:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz.inc                  | 5 ++---
 .../python/{python-pytz_2017.3.bb => python-pytz_2018.3.bb}          | 0
 .../python/{python3-pytz_2017.3.bb => python3-pytz_2018.3.bb}        | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2017.3.bb => python-pytz_2018.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2017.3.bb => python3-pytz_2018.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index e79f433..1390b91 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -4,10 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=39ea92752a35cf67d8a885d8e3af3c69"
 
 inherit pypi
-PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[md5sum] = "7006b56c0d68a162d9fe57d4249c3171"
-SRC_URI[sha256sum] = "fae4cffc040921b8a2d60c6cf0b5d662c1190fe54d718271db4eb17d44a185b7"
+SRC_URI[md5sum] = "abb07c09c79f78d7c04f222a550c99ef"
+SRC_URI[sha256sum] = "410bcd1d6409026fbaa65d9ed33bf6dd8b1e94a499e32168acfc7b332e4095c0"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2017.3.bb b/meta-python/recipes-devtools/python/python-pytz_2018.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2017.3.bb
rename to meta-python/recipes-devtools/python/python-pytz_2018.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2017.3.bb b/meta-python/recipes-devtools/python/python3-pytz_2018.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2017.3.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2018.3.bb
-- 
2.7.4


