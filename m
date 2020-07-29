Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.1663.1596010230318905082
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=eo+NufyN;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id s9so12522241lfs.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 01:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=St1vRyI8jSwscpOnJ5OKRqZk00x+igq0UFPN/gDj6Go=;
        b=eo+NufyNkD26kmFKlaF3nRUnNL/K5mQbUpPXYxdh3dFj653G0xITOY362O8X7r0vrd
         yb85vZApmCsD9o4bPdxyK9M/HNVb/lukViUqJY4hyszsDaaJJ+E7re1n9xIfSml/hOX0
         zIdZDfT4XgluRJDWdbI9eWfiCD2OST3A62PIX1Xqb3irLlcEMkGprqcXDl25B0iQmZA5
         FaLEDfRfz3I1LeKlftoeWlM3skKtNQBe5DChUA9z22V51zhEx1yDk2VAlR2G1BNUzPgD
         CeLi0/BaWCvOx260h6aeZF2Z+9pCetq2VH18cVdebt7FEvt6P12ZmUd5Ryd0uMfj6mPS
         /cpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=St1vRyI8jSwscpOnJ5OKRqZk00x+igq0UFPN/gDj6Go=;
        b=f2B2nBI5xmDlH3zBpMVNlKKp0M2Zn8ZBYLZ/2qmScSmS0IrgYNPIvAoUzrSSzWAvcO
         Y7zHPq0K7hopooiabeSYMSC37AxPnrh1cgYG8VizZb/iNvCucbTXj3LyUp5CmpDSuSz8
         cMMdyUsMSJRLq22yoNA00/4TsDVvlsPErNR6hh80BUVH2CXZlCRQmsiBV10cgGHFn0kc
         ygoydMWqBJ25QaZRsX8+WFzMcrlvDu403twjVB+FIDE1L/AcFAlorET/hzahblflVbTF
         94S0MRZVan3IScjgwVNPNdOkfjwEUmLZzD3Yjg3tC1RTag8m2gLx40mLzc9UXSHscbkB
         dN+g==
X-Gm-Message-State: AOAM530Cn070CK8GZFfPNMF4xMUaWwDbXOf9C5hnsThB97gGtXTL8kY6
	XLfylWKao/ve98FtO7tim+XM0hmXGIY=
X-Google-Smtp-Source: ABdhPJw33r9iCGjb3SSc39u8FM/JeycmpAwS+M8GOZi5zzgUdc6Af+2r30SAF3G/aKqF/guLvEPKvQ==
X-Received: by 2002:a19:be53:: with SMTP id o80mr16523165lff.33.1596010227684;
        Wed, 29 Jul 2020 01:10:27 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b18sm347928lfp.36.2020.07.29.01.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:10:27 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2][meta-oe 1/5] python3-coverage: Upgrade 5.1 -> 5.2
Date: Wed, 29 Jul 2020 10:10:20 +0200
Message-Id: <20200729081024.2701842-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 5.2:

- The HTML report has been redesigned by Vince Salvino. There is
  now a dark mode, the code text is larger, and system sans serif
  fonts are used, in addition to other small changes.
- The coverage report and coverage html commands now accept a
  --precision option to control the number of decimal points
  displayed. Thanks, Teake Nutma.
- The coverage report and coverage html commands now accept a
  --no-skip-covered option to negate --skip-covered.
  Thanks, Anthony Sottile.
- The --skip-empty option is now available for the XML report.
- The coverage report command now accepts a --sort option to
  specify how to sort the results. Thanks, Jerin Peter George.
- If coverage fails due to the coverage total not reaching the
  --fail-under value, it will now print a message making the
  condition clear. Thanks, Naveen Yadav.
- TOML configuration files with non-ASCII characters would cause
  errors on Windows. This is now fixed.
- The output of --debug=trace now includes information about how
  the --source option is being interpreted, and the module names
  being considered.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-coverage_5.1.bb => python3-coverage_5.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.1.bb => python3-coverage_5.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.2.bb
index 7265d2c97..72558e10c 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "506e30fb011158abe5ce92f39866b271"
-SRC_URI[sha256sum] = "f90bfc4ad18450c80b024036eaf91e4a246ae287701aaa88eaebebf150868052"
+SRC_URI[md5sum] = "bfe80a336636160a3916467f55842bc5"
+SRC_URI[sha256sum] = "1874bdc943654ba46d28f179c1846f5710eda3aeb265ff029e0ac2b52daae404"
 
 inherit pypi setuptools3
 
-- 
2.25.1

