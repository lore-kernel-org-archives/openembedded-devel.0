Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web08.1664.1613001903728999838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 16:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=ULe1Jemt;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id h26so5628565lfm.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 16:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9kGxGPLur4iy8H0AsXtgCYbDS0axhUEM3GCr0OJyptE=;
        b=ULe1Jemt2KzEfS6r8TyJ+PDI6nSIH/qsRtcndvSF0YSvlkOFN4s1d4rNvTdBI8yUNv
         clUzSegSruCjo7bqhqqj1pQazlMZDwTLvYKu9up46PIOKrj6ENllDLnA1i5mjTBWLySY
         6VUDBZTRKjCrp6mHoNWWu1QU8GV1mM+rCpDaAaG5XnNyJIMeQ0XIbupxR6nDg82Ej+FD
         lCnrokVTdiS1apToDFau+cSZLMNT5myfR0B3Vj6eZFstuw9dPChiiipBHsxuH1MSG1NF
         PqQ3lOYGM8aBnYOCLgHYfjWI+u8zAboiU1RMyqUt0u74J7MaLKhi3gRgaVLRKxivhkEf
         i8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9kGxGPLur4iy8H0AsXtgCYbDS0axhUEM3GCr0OJyptE=;
        b=sbosI39GhAH5kLHbb2rtCEpw0/KH+GHfg9rp+iLN7WBR6KjbeORKa/vdk5WJtCuDXr
         IuRd2nscjVD3GbOYZKeIeRrCRxzu5Gw4mR97pvRIGvsnmLaossX+q42glu1PxTI8Cmab
         A5RnE2dKv5qu+fZDEf2L9/+ZbsVZSJ7G9nxqTBgqhcHqM0Ksd68J/KRAKvWFp3TzTC/J
         lUgMbBwEtXr46WOADBzeYBISCCONeP+xlBd7OppWCcpYcwiMBeKct2BqkmsPGx5SWx5c
         nD1pFpy/Q83rgVOONs2grDFHO2vPyTLFLJXqaoRwaY+lPK8Lc2k2fAaQWmqkkS0exIz6
         sYNQ==
X-Gm-Message-State: AOAM531O7LXBOUvR7l/Lfxv0y67bVLhxpt7f6/MT8rxbKlPeQFKfjd9A
	NJ6G1kuLo4Pfb7A4NlrNz/xTFGCeoZ6XGwCc
X-Google-Smtp-Source: ABdhPJzWdsQ3H81Xjeal77rppVKO3XYhMyObCjX+xCxv4O8DdoS4pTPoWplozBCr0tA+rLXT6hcKVg==
X-Received: by 2002:a19:c504:: with SMTP id w4mr2921464lfe.193.1613001901231;
        Wed, 10 Feb 2021 16:05:01 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id l16sm486006lfc.184.2021.02.10.16.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 16:05:00 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python[PATCH] python3-idna: update to 3.1
Date: Thu, 11 Feb 2021 01:04:57 +0100
Message-Id: <20210211000457.1922320-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-python/recipes-devtools/python/python3-idna_2.10.bb     | 2 --
 .../python/{python-idna.inc => python3-idna_3.1.bb}          | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-idna_2.10.bb
 rename meta-python/recipes-devtools/python/{python-idna.inc => python3-idna_3.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-idna_2.10.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
deleted file mode 100644
index a08ca714a..000000000
--- a/meta-python/recipes-devtools/python/python3-idna_2.10.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-idna.inc
diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python-idna.inc
rename to meta-python/recipes-devtools/python/python3-idna_3.1.bb
index 4968f1072..0b64bb2ee 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
 
-SRC_URI[md5sum] = "7a910c706db30d758f377db2762c0f9a"
-SRC_URI[sha256sum] = "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
+SRC_URI[sha256sum] = "c5b02147e01ea9920e6b0a3f1f7bb833612d507592c837a6c49552768f4054e1"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
-- 
2.25.1

