Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C94957808D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 21:01:18 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id x7so2655366qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 13:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z8LGIrqlCQvo8ttBel1OroQ3sfYF2lMjOC2W63hQOYU=;
	b=cGiBMmn7inD7etFHoF4Mbq+QYdmAqocQHRUkit2sBY3+YZSzRKlGIEuZbwEtsdi1c1
	CMDroXJgpkz1yO1J84mSf9bAxAHCuxmj9533b6RB8To6C4mmFc2I4j4dm0XxGe2wLaSV
	sJyvcMS2ET9SmkT/RoVPS6eMsQtzoBOo2wuUXREV8S+gnLw5xUuHv4FSfGy9AvSojINY
	lfAOtFPf6yHURJdRFncimvqoZAafileYqoW5Ypw1DCEN1fYaIz4OwadQOHyP+nR87oJK
	bNmgOorjMBDyL9jGTGSwkxe6cAmT9mHq+EkmGpKo9b7lFoF5HUZwDkjbYgqM1PPpOMkN
	5wtQ==
X-Gm-Message-State: AKGB3mKEP9AUU+ADJLKi55BaRfpXWM/rjtoBlW2yw3Yf4r9xlFWf/EpL
	O73/IXB5X9Grqhqtb+8cJHV32ec4
X-Google-Smtp-Source: ACJfBouqmPhXxUivw4C1eUCqvIZsuU+rjvn+T2W7sZEJbO7ZflkxDgfstAeSMPvB/h7PLwlMxGrCvA==
X-Received: by 10.55.43.89 with SMTP id r86mr1520088qkh.33.1513630879498;
	Mon, 18 Dec 2017 13:01:19 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	d205sm8534157qke.21.2017.12.18.13.01.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Dec 2017 13:01:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Dec 2017 16:00:50 -0500
Message-Id: <1513630850-17087-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pexpect: update to version 4.3.1
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
X-List-Received-Date: Mon, 18 Dec 2017 21:01:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pexpect.inc            | 8 ++------
 .../python/{python-pexpect_4.3.0.bb => python-pexpect_4.3.1.bb}   | 0
 .../python/{python3-pexpect_4.3.0.bb => python3-pexpect_4.3.1.bb} | 0
 3 files changed, 2 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pexpect_4.3.0.bb => python-pexpect_4.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pexpect_4.3.0.bb => python3-pexpect_4.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
index dc8bcc9..28d7b60 100644
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -4,15 +4,11 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
-SRCNAME = "pexpect"
-
-SRC_URI[md5sum] = "047a486dcd26134b74f2e67046bb61a0"
-SRC_URI[sha256sum] = "00ab0872f80f5db740499e7a1283a7c3b97bea542d72df84d83dea17d0afd2d9"
+SRC_URI[md5sum] = "16aa4549136b2d1b2bf1e0e9788d75a6"
+SRC_URI[sha256sum] = "8e287b171dbaf249d0b06b5f2e88cb7e694651d2d0b8c15bccb83170d3c55575"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-io \
diff --git a/meta-python/recipes-devtools/python/python-pexpect_4.3.0.bb b/meta-python/recipes-devtools/python/python-pexpect_4.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pexpect_4.3.0.bb
rename to meta-python/recipes-devtools/python/python-pexpect_4.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.3.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pexpect_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pexpect_4.3.1.bb
-- 
2.7.4


