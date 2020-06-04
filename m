Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.20776.1591295334010526933
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 11:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=SCk1nIXV;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.210.195, mailfrom: rahulk@mvista.com)
Received: by mail-pf1-f195.google.com with SMTP id a127so3630922pfa.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2020 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=HSK08U+muU/joXr3MEuspOPpv911yvbfpkv1+xsBO7k=;
        b=SCk1nIXV8E6L2QWQfMtrnT2XoYXXEy6+dJBziZbgyugdzwEM5kfJcI+riYktsAc5Sf
         OGB1khfIhJVIqRpGRHGneJIhHpHYurmLD3xz/W5dMPbqSqBBvzBMV3S4ZPseez3eWEj4
         zYlEeZyaVFeVk/ltpz6Wg9dPKVDUezz9dJOF64czCSj0tCDMb1KQmWx8yhZuJpiaKJZd
         7WXZWgBW6njntBb5SOrh3jwx2MFXRa7J4ngn4J2hBODoyJpQXkhmgkl7J+2C/7RzOyjM
         lWS829Lnah/8gWCqRY9EIS75vBnHILu70QssCEVkt0F96URrqbSIKfzdcXZFspdq2H8w
         ROFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HSK08U+muU/joXr3MEuspOPpv911yvbfpkv1+xsBO7k=;
        b=iunrP504AhLBMuktJWQfGxZHSYmyvqgLYdkFTuP4AYi1uo2Jz+bw35JFqLUN/tQjf1
         988UkXWwUkIhjdK+IW9Cq7W74ibtW/Uma3gSPv1H8Jfwqsah3t/hzkZTwl1XldaywVaV
         fAsuBhRRmOSalFN5aPvx7sJJ14yEZU0lIGCXtCobHdTBFVdLSFZqpVsozTdZhNHKCiKt
         CMC47CUgO05aOBN2JQdFCCS82dmuIzN+PSuz0zNCjIdDfG3l4kYi97Xx+ngklXT9ME2E
         oiGnDVtGt2oHEaaNM75MYNsTwz7XFTtOVFgM8qljM4wh7senKMEX/+XuiHsktjL3jD3i
         MjfA==
X-Gm-Message-State: AOAM533rfCTPsri2aoK+Om5+7GHhs50rUP23kD0xe7IfiOSeceiwEeCO
	IQk+C30crpdkMj3/yPyiqyuD8cB3jZgFsw==
X-Google-Smtp-Source: ABdhPJwMp3pviXX73YHaknArqTj8737lEReVnO8TLddoyNzHDeKkaZFJ6DZjouHAx0RMzr/Q7u4Kkg==
X-Received: by 2002:a63:1d08:: with SMTP id d8mr5598234pgd.306.1591295332969;
        Thu, 04 Jun 2020 11:28:52 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from CelSys065.mvista.com ([36.255.87.199])
        by smtp.gmail.com with ESMTPSA id z23sm4551383pga.86.2020.06.04.11.28.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2020 11:28:52 -0700 (PDT)
From: "Rahul Kumar" <rahulk@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Rahul Kumar <rahulk@mvista.com>
Subject: [meta-multimedia][zeus][PATCH] tremor: update SRC_URI as project moved to gitlab
Date: Thu,  4 Jun 2020 23:58:28 +0530
Message-Id: <1591295308-26420-1-git-send-email-rahulk@mvista.com>
X-Mailer: git-send-email 2.7.4

From: Armin Kuster <akuster808@gmail.com>

It appears Xiph.Org is now on gitlab
https://gitlab.xiph.org/xiph

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc6e59fdff71e47ef5b9b40aab3bcd9438960ea4)
Signed-off-by: Rahul Kumar <rahulk@mvista.com>
---
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index beeb23a..d2ad961 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
 DEPENDS = "libogg"
 
-SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
-- 
2.7.4

