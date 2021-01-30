Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.8540.1612035476180702444
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ulml2Igq;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id z9so24956pjl.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=D00DdBI7oUu+u1DvEY+DrLnZDNqR2a9p3t2HMDWLsXo=;
        b=Ulml2Igq5xcXpuP7Y+TsOU124IubvDeH9PVSwisw37CBtA2N2YYyP61vPrGkqmP0CP
         +l13lx6OA6gPrDIUQziTi+hGuCvg9WaL7KDUF47wx2A9n79GBc5e6D+e6hv0VT3I/mmn
         xjLUfWec81ujjriSOSG7bT9wtXmhCQ+uJVx/52mPxlpEl4MsDxGA4y7/zd0Osq4srtnP
         Tg9cFykHLRSgoqsK7cE/9Ovdv9I42L1BVBZzcVnxSavy7+SMMKgYuqAN7I8RK0km4Alo
         3Qa8tcr7zK7s7lnG3dJZRDebzJHUkZn5H6bOtl3yQIdWBHzozmrzmRgKEicbT8s/TcZ6
         Izkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=D00DdBI7oUu+u1DvEY+DrLnZDNqR2a9p3t2HMDWLsXo=;
        b=ZSnI0V49xxHs5ZcggWsRX1qBSGvFbOSmxcXL8o/rjMzJexxjnZaq11u008bqXnfxUl
         gQyIEjFOuurUJMStrv24WjqydbJ41jVTT5P+oAtTyviH0CqGxX+Jvm8emklpPPo75GMG
         8qADF4Pfsl2gCP3I4+Ul8g2IqphccDr2RGJQ+NTYAUSlorarAVaJ8bUTte0p8DHNDLg2
         TM1F1qvnVMxdfKsTIFZLGkzSIk3mhDWHUC7uQMco+oqtI61Ofqq36LDjc1kwPuXLH0hO
         MpOwfVRmCCicPEFQ+FU9MJrgl6snrAqR0Srwnjn+AF+1N62OAKjO06xRq53q1t9CwAyk
         cJpA==
X-Gm-Message-State: AOAM530COBL7Jz7aQTvmoVSQpPT76Dj1kX7GU4xLg6qqRduRpxskJrUa
	/Q2mIVJODKyWBYmDp3sq5a5i3stcOaweUQ==
X-Google-Smtp-Source: ABdhPJxQQfbamMr63pAQTkl9zm/fPvvjjAjpP1gEMw8lQ/GocNA1M1yq+DzSzRyKC8h43qleobHFIA==
X-Received: by 2002:a17:902:c1cc:b029:e1:3159:8c08 with SMTP id c12-20020a170902c1ccb02900e131598c08mr4844955plc.69.1612035475604;
        Sat, 30 Jan 2021 11:37:55 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:55 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/13] sip3: Upgrade 4.19.19 -> 4.19.23
Date: Sat, 30 Jan 2021 11:37:35 -0800
Message-Id: <52967af42380080a89f70c4c91bbaeca2a37b9f9.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 4.19.23:

- Added some missing quotes to configure.py
- Fixed a race condition when calling the PyQt5-specific meta-call
  helper.
- Fixed the wrapping of methods that return a Py_Ssize_t.
- The code generator now distinguishes between the copy/assignment
  helper and the array helper when determining which helpers can
  be generated.
- Fixed the code generation when making a copy of C++ object on
  the stack to the heap when the class has no suitable ctor.
- Check there is a public copy ctor when we can't using an
  assigment operator as a workaround.
- Preserve any current exception in the implementation of the
  wrapper dealloc functions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 358b3982583c93fdc0a4cebdab31f923d77b7f8b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/sip/{sip3_4.19.19.bb => sip3_4.19.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip3_4.19.19.bb => sip3_4.19.23.bb} (92%)

diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
similarity index 92%
rename from meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
rename to meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
index e6a4653b59..320755b844 100644
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
 SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
-SRC_URI[sha256sum] = "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
+SRC_URI[md5sum] = "70adc0c9734e2d9dcd241d3f931dfc74"
+SRC_URI[sha256sum] = "22ca9bcec5388114e40d4aafd7ccd0c4fe072297b628d0c5cdfa2f010c0bc7e7"
 
 inherit python3-dir python3native
 
-- 
2.17.1

