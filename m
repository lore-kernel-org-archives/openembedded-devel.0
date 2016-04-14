Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id E2A1F73192
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:37:37 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id j11so111075425lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=HX8FKS5AsE6hkvEWCoTQAbWQObqb07VwvMlS0jqW+to=;
	b=k2qFJbTcs0uFFlVo9fVMLSHIf7GpiOzZv1nePt9f7SzBMsHViLtwFR3BKC5NYQ0WdY
	qFOtrUxR/JX2RUR1e9DNRSK93/Lh8s4S7eDlGMx0rmeDDVDv4VOiemA0CEGWxldIe4VD
	wX9M/OFhMIB+jnGhJzzYmd7Rz9qFfY2uUIUL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HX8FKS5AsE6hkvEWCoTQAbWQObqb07VwvMlS0jqW+to=;
	b=fFeUKm4WdMJQjIl+1DJATKCf5bKaJNwYvt/ABZFwBjU9t4Zfdg4rsanrDMCywGEMWA
	CLCd+dnf4OPpgdH0RHkW3gz/PRG+OTXuznQ9RwH+pO/ZiDYeisL5r9LR7YwVw9EwjmTu
	hFy7vC+QshdBYddWDe1v/desSJ1AKMNZszeShaVACYyqIyoN5cnM+T1XvDpntqZwk3+u
	1PhQ2/ZN0cdn7XYUoTCP+7tatPo4on7czmx/THWBlFFmeOTS1SMJW70ywYDZInYFjnA+
	eAyTzD90mVAamEB5GO8xbyqexLBe/g6k+fMNQcL1xmeNsIKHt5Lw5CzalfCKu2ZF/lSn
	HV+w==
X-Gm-Message-State: AOPr4FWIc2w51FvvFuIxOr6uHKOuUTkvsvU6l5xRc4RGex9WDaU5QWX88QFmnpACXLzWkPFS
X-Received: by 10.112.87.169 with SMTP id az9mr6818982lbb.49.1460644657085;
	Thu, 14 Apr 2016 07:37:37 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	e141sm7168371lfe.18.2016.04.14.07.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 07:37:36 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2016 17:37:27 +0300
Message-Id: <1460644647-28383-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.8.1
Cc: Brendan Le Foll <brendan.le.foll@intel.com>,
	Kevron Rees <kevron.m.rees@intel.com>,
	Thomas Ingleby <thomas.c.ingleby@intel.com>
Subject: [PATCH][meta-intel-iot-middleware] mraa: update to 0.10.1 release
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
X-List-Received-Date: Thu, 14 Apr 2016 14:37:38 -0000

* update SRC_URI to 0.10.1 revision
* update license file checksum: same license (MIT), only year update

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-devtools/mraa/mraa.inc                          | 2 +-
 recipes-devtools/mraa/{mraa_0.9.0.bb => mraa_0.10.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/mraa/{mraa_0.9.0.bb => mraa_0.10.1.bb} (62%)

diff --git a/recipes-devtools/mraa/mraa.inc b/recipes-devtools/mraa/mraa.inc
index 7a3dbfd..24e3cd1 100644
--- a/recipes-devtools/mraa/mraa.inc
+++ b/recipes-devtools/mraa/mraa.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 AUTHOR = "Brendan Le Foll, Tom Ingleby"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e8db6501ed294e65418a933925d12058"
+LIC_FILES_CHKSUM = "file://COPYING;md5=66493d54e65bfc12c7983ff2e884f37f"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/mraa/mraa_0.9.0.bb b/recipes-devtools/mraa/mraa_0.10.1.bb
similarity index 62%
rename from recipes-devtools/mraa/mraa_0.9.0.bb
rename to recipes-devtools/mraa/mraa_0.10.1.bb
index a2c02b9..1baef7a 100644
--- a/recipes-devtools/mraa/mraa_0.9.0.bb
+++ b/recipes-devtools/mraa/mraa_0.10.1.bb
@@ -1,3 +1,3 @@
 require mraa.inc
 
-SRC_URI = "git://github.com/intel-iot-devkit/mraa.git;protocol=git;rev=d430b5c2b5b282e40bc705a28158b3d682d722f5"
+SRC_URI = "git://github.com/intel-iot-devkit/mraa.git;protocol=git;rev=a9429204e38416e04edbc1a6b5fe6ba49379493d"
-- 
2.8.1


