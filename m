Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBB4D111B9
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 23:12:32 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6901.1764198747408100306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 15:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m6zsZVrU;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso241388a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 15:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764198746; x=1764803546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au01kT5x0jWpsJZYqLuq2Gy5Zbm9/noBRIkep5xq/7Y=;
        b=m6zsZVrUXvsuC6jiP0NhLn92z0VEstgyN7pRIgAvD2bTBU4RMWEZs8Xvk9K5lG9ykE
         qM6FCmnfuAmVJ0bYVULIsSlOHu1t+s6+tF4cArVWV1cl9FXv8O7blOH8p/gZxmxWLGiO
         LwOk4iDLrRMNMuBBhM72eQtDTH4t5lDsnY/qsLSrgSPBQrjcSqCziOoUV/bN+O72/gnk
         ICNUDatX4cnKFeRPN+NwnzyaBsB4SBJJxTKewabwSe6S5nBUqhBlODSts/IDV6MF1Y08
         I8HcS/Qcp9LAf4cgofko+OY4pwK3ksmvxrNf/oYfwEbsRcQcM10kwNmGhtkt8/pEYUuQ
         H5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764198746; x=1764803546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=au01kT5x0jWpsJZYqLuq2Gy5Zbm9/noBRIkep5xq/7Y=;
        b=Q42BAgY6yKDYCJjs/B6BwMgA9LvL15uYVsEuWusEhVIyFM/WT3D+tXmRU121gijU2n
         O2d1cWLrnEeIrmFsBFgtLI7HbfUi4lO01AnciOvucY5Otfp5CqASl2+/KSokBHzcSlNQ
         mfW5uhkR8vxUigRrJM085rWcuNFUO6q7Ycc7zW/cVvPjugXsPH9J4d9yfvoszzVN150+
         B/uEfbwAy4pQoaGhNLh7s2MaYD63U3pB5z/meiJ2pppMjqyOny628PIjNqfYQcXTRtia
         X0JIB2nClLfAuUdEk6bUqFZslYPXSzpNN+XQOVxxhi0PmFDm+Y4TcRIUloWzPSlM3ytx
         BYgg==
X-Gm-Message-State: AOJu0Yy/eImsAanSPrRnE3XMoar3GM2VBrd6/pkJYTtm7LsFbefXRN47
	+Tfb+g3CCM6uyiPVd+wuloBvtdhtMDHjcb1Tw/Xxr8+uSFZkItO4Ubr9P2D8/w==
X-Gm-Gg: ASbGncsk4ZEf4cDj+aoqu37q9d6RsEc3OSJbov1mRXX0pdIR4/bCdCncoUp6NZKG20f
	UBkFUr6wTFZZ1mrkiiTBPU82TX06st1Q+r//rvETqqalgkhhxwmWg0TlllBLIAHADOqokemzyws
	4tAB7bmNlDGw/Vce2K3oSHj8bNhM1HN3A2L10SFO/AFYvgHLLzWF8m46Pgt/qvtouukK7f/HGrU
	YnjkIlj8VH8AP1S8r059P5hWx8rtmRzBfRIKK5jWJzMxLhUUZJ8GXtcGnHVZxYpWo1YwWSrZb/C
	8yJlWPBlTbYTEju2JEYHczTI5wtxaLl7Nagcr/7yKF8U4NN3EFsO/rd3S/tSNmhzAoAFgB6mC05
	W2DIIrfgbAATeA+aY+10u0lubn0VV79QX6J6VsnAS+bYlGi2GtNl9b64qWdacmrlxp/IyLrzp6i
	BIUi9lYSV3t3uSMKIOrWScH2kZY885CvN1r7cgfv9V37dkXHanm5fgHumPnk5EvlQf0SpW5vVFs
	XMn/eTqq2wo/bcvPnWLVNIzqIZXE5Qewt5ewRhFJOU=
X-Google-Smtp-Source: AGHT+IG//yrD/3mlkSn4APHHjh+JfGoRVq7y8iY1AANillLHUzZwHrYce85ES9QY4LAT3YOK4pH92A==
X-Received: by 2002:a05:7022:62a9:b0:119:e569:f60a with SMTP id a92af1059eb24-11c9d60b97bmr13444470c88.3.1764198746365;
        Wed, 26 Nov 2025 15:12:26 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6dbc8sm102686381c88.10.2025.11.26.15.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 15:12:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-wxgtk4: Upgrade to 4.2.4
Date: Wed, 26 Nov 2025 15:12:22 -0800
Message-ID: <20251126231222.3607808-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126231222.3607808-1-raj.khem@gmail.com>
References: <20251126231222.3607808-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 23:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122096

inherit cython to not rebuild _nanosvg.c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...python3-wxgtk4_4.2.3.bb => python3-wxgtk4_4.2.4.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python3-wxgtk4/{python3-wxgtk4_4.2.3.bb => python3-wxgtk4_4.2.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.3.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.3.bb
rename to meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
index 35bbd3ffc2..2899f6909e 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.3.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "python3-attrdict3-native python3-six-native wxwidgets-native \
            python3-requests-native wxwidgets \
            "

-PYPI_PACKAGE = "wxPython"
+PYPI_PACKAGE = "wxpython"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

 SRC_URI += "file://add-back-option-build-base.patch \
@@ -16,11 +16,11 @@ SRC_URI += "file://add-back-option-build-base.patch \
            file://not-overwrite-cflags-cxxflags.patch \
            file://0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch \
            "
-SRC_URI[sha256sum] = "20d6e0c927e27ced85643719bd63e9f7fd501df6e9a8aab1489b039897fd7c01"
+SRC_URI[sha256sum] = "2eb123979c87bcb329e8a2452269d60ff8f9f651e9bf25c67579e53c4ebbae3c"

-S = "${UNPACKDIR}/wxPython-${PV}"
+inherit pypi setuptools3 cython pkgconfig features_check

-inherit pypi setuptools3 pkgconfig features_check
+S = "${UNPACKDIR}/wxPython-${PV}"

 REQUIRED_DISTRO_FEATURES = "x11"

@@ -37,4 +37,4 @@ RDEPENDS:${PN} = "\
     python3-six \
     python3-xml \
     python3-cairocffi \
-"
+"

