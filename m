Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0F4CCD18E
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 17:43:18 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.6518.1760031175823359767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 10:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V5uOuppi;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: joao.raul.434@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso1428719e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 10:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760031174; x=1760635974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mR4wIkyAOU5v+A/5eTZduimgnd9YYI9ACyqkljW+rI=;
        b=V5uOuppiI52h1MDHGVsC2S/ndY0W6GAQDR4pidOf/hbVy/Xuawcmt9UWZ1lA0plioj
         8lTStc8D2j290VWDmyOdRQLnPewHqH9wg1GfVm8CIwXgFo+/+dExozkmSCDhNpc1vr2I
         aFXhG9W2rSIGW5R5abagxbFkKc9LoD/YpCgMOgbyZBufzEa6ab/Cwy4s0HdG2G0RO7dE
         E3Htmw15Av/VN1Cd6WiiuBTfeeHs8WpBnl4zUcnQZoTc/B3/Dk4Hgrkd9HYIp+2LNt+C
         Nt8HfT8/i7Bdi0aC+BcHSCBT1KXwF2jzDe25fBBwkykffuHSxT/+vLGHpcHFQs2ZESAS
         0oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760031174; x=1760635974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mR4wIkyAOU5v+A/5eTZduimgnd9YYI9ACyqkljW+rI=;
        b=jlsY5bvNPDztkmvFNXhAsBkIPDxWo0zUJVNH7tabSszCJZ4s3w1MRWYoyK14SrSBqc
         Jt9dJj9DobqYpgcND283Sw+hu2tNuAEi+pLHN4iy4i7Phq9tViJeabEbXWwC/IUcAp5H
         j/qghFzSnLp6VACz/Vsc7UVpLQ/ZOGh3BobEdEpwPWG8x3D9/MTI4z3wYk28Gmd2jFsQ
         IVf4/lCeIUHqBcIlfuYlHE+aEHA6rtcvXsvsBiV4C+v1pKycDw2ywl3eEKzpK3ZPdyUw
         USw8I385NIRmdxdwNwZkqUffGe5cjCm1mqlOpEykQ2hPRnSzgV3QeJmcPXcgirO5RU1v
         sRIQ==
X-Gm-Message-State: AOJu0YxZ8YjyufaKtJbu6jhRcE+kCsmcXD+HDK6tfEk90qDFHRhZGJEv
	ql4j9RDqPeNFxgfWtis514j85/4NBD9JOZAewWOyZgSHJnlAqZvokYu3WF5Idg==
X-Gm-Gg: ASbGncstw2lkTdfeKhjtN/CB7dCHTcBiSHKF+UEovucWUXOci8WVL2JroPSEd+kUc1a
	E2W2bUh26rwBO8cuR83jRFOBZdYW6skKcV96wtM4+eCHjkLf4CShtOhK1zMAEJoGbyWnWoiSpd/
	jw+dpo3rmg6zmsg5XDXT1zpJkc6DBIuypQFQb5nKK18zZR3kK9ELz3c44+CRIvP1Iqp3cbQhInJ
	2xD0KToLinVt0fKBKO0Oz8XbnYbpkmsSs3PABkUncDMlPRDgfz5J/egi1rF0v0IAxdIBWXGSyYU
	v980Dmp3iOcFGtQ2BPpTusNZTFe24/PUqWenIYC/hKkXWFBmha3Rr3AETsLYlV4+rYFRY68llF8
	m5XlqeC/jOq7RsBh/ibFeKblvAXGfaCpcMQyUaCXy9iOCJasNg/6PdALEYNVJBlSasSK3Du8CmO
	YD15bRnBgJjH5E7tljlGqi7qhT8zrQSyqVUTHPkmrlEJG2TQ==
X-Google-Smtp-Source: AGHT+IG6GfTq4nZb+9vpfT19DtxMiBMi0rVt8i4v5b7pPi6nuB8hrRY7XF4Awr/8n9lyYlF4EC6v7w==
X-Received: by 2002:a05:600c:502c:b0:46e:45d3:82fa with SMTP id 5b1f17b1804b1-46fa9aa0eacmr59142895e9.10.1760030677739;
        Thu, 09 Oct 2025 10:24:37 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582581sm51681f8f.13.2025.10.09.10.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:24:37 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com,
	joao.raul.434@gmail.com
Subject: [meta-oe][PATCH v3 1/3] openocd: bump the openocd, jimtcl versions
Date: Thu,  9 Oct 2025 18:23:43 +0100
Message-ID: <20251009172345.1026-2-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251009172345.1026-1-joao.lima@hbkworld.com>
References: <20251009172345.1026-1-joao.lima@hbkworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 17:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120441

From: Joao Lima <joao.lima@hbkworld.com>

Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 3bbe33ca1d..eb6ca888ab 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,14 +9,13 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
     git://github.com/msteveb/jimtcl.git;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/jimtcl;name=jimtcl;branch=master \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
-    file://0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "91bd4313444c5a949ce49d88ab487608df7d6c37"
+SRCREV_openocd = "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
-SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
+SRCREV_jimtcl = "f160866171457474f7c4d6ccda70f9b77524407e"
+SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"
 
 PV = "0.12+git"
 
@@ -24,7 +23,7 @@ inherit pkgconfig autotools-brokensep gettext
 
 BBCLASSEXTEND += "native nativesdk"
 
-EXTRA_OECONF = "--enable-ftdi --enable-jtag_vpi --enable-buspirate --disable-doxygen-html --disable-werror"
+EXTRA_OECONF = "--enable-ftdi --enable-jtag_vpi --enable-buspirate --disable-doxygen-html --disable-werror --enable-internal-jimtcl"
 
 do_configure() {
     ./bootstrap nosubmodule

