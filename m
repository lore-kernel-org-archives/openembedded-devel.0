Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34288.1794851652990450495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ufHoQz3M;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380b40312e2so1298064eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851652; x=1795456452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKKjMINjwHLbPxP5hplK5rLAILCFnXJxtFOhpp5m8jE=;
        b=ufHoQz3M9lqK69aBntK8z1GyIxTMjJ+hNduma+06RjJhcUYtFy9Aa0DtGjz/hGNVG5
         X4LvQW1jX2o4tnf/OfUwS7yyVddKFKOulN6OiIx7LISnKyBQnX2fcx6tKp5SWptgsKxs
         NzzQB7HdrNpcf17dDdoNPjNec06pk0h43aHoGi4egS6lsEOuzzEorci1Xmu+zyDK3j1t
         h+TdR2GYWMydh/F31+g174bIrNQSPP04WrCQ6K83rWGSAR34iPI7h1IV4Xh5s0FQQD8/
         HHJlr2A83q9HIoVpDue7uiE2uhJHnOtRRewI9qQYgolIymCV0DQG9VgH3yg2J46NAppX
         2maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851652; x=1795456452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKKjMINjwHLbPxP5hplK5rLAILCFnXJxtFOhpp5m8jE=;
        b=npeb90VH+KqLv1NXnBznv7TAPmxdpC3amJ3Hfkcnz351+E5c5Cf0hgIQh/tTLhSa73
         pKUxMi/SlCdKooVulufL2vJf6xavuz5kLXA/G9/5Ji/m7Nrc3TH482KpmTbmFqrSQT2j
         pOfo40iOcG+h7ghzf6XJ5yx78kP4i54QA224d4W7eJyAp1SYDAFg4oMMFLEjrPXbf3EE
         w5BORLDmJ/XwSjA5mU05HzSHU8jwVStwfzccW+woA48NUepjUfRp15ckOhwTOuiT1izD
         u7No13ZHin/PJOs16yhrArpqjw15r2AoNtx4V5G+vCaRHtyLJVEyGRiAE5dD5rKoCL84
         QOzQ==
X-Gm-Message-State: APuU4Z9W3oupUZIEL+7Fk0hwI93NiwhtWAxeUkOhCoWYt3I9qJaT6PiW
	WQMzqQ21u15ZVJbCXGi84tedxZ5LM5HYoly5h9neQo4SqbKhoNIyst8DdK7hwXXk
X-Gm-Gg: AZFdTZcc9lry2FUBASOhmmYnXHNoDI0PwL0UAJjEgJBIoQC1TCk/ccD3D+dp4Fcoadc
	VUsQdeaJF+3JbKRg9xAmPrjbZKHT4XYnQutGKY2bZhi2dscyACRojaAjwq1uD3NZu3TGh3MWTWV
	/kEt1kT04e0u5W/EHrLDEnkXvzeLvM3ddXewbKl5eqepf5v6rKMd5r0oqX+ZcytF64ZGVotYuaG
	/MGRB3g3bM9orOqFb8G+Go7+qBvKKICwBJDhdOT6w6xgwmKrYAXTfXnX1I+Ugadzvszb1qt0SDm
	uVfSEDmzBjsHJAyBSu8aX0oVXls6/PnRGdEOaTC5OKR+664cNnTS9L7JR0DuqIClQqmaxwJxIfo
	FIn/Dk+eUVJrMdSN6xgxQ9WGRcvrKH6nrPetCH5HzhWQ7Heo53kajTBKtcC1iPf1hT4ceoQyNOJ
	ehdqxrxu99fTIkGgyPtW/IdmiuvbJiw6ldULQhjgJYwBwjChHHdQjCSNoL4pURFydS6Gd355m4M
	t5K3bHfiz9vcPfloa76mXlfO6EfwbX3AeTFOz6uCkDoSpHogrGuuhFGQpIwW2OH9hXyD4loApDA
	R/HCRBbAelgga/DF+S9UZOLsBooL1zjdwABDQrk7BV5xZLJ2JmH/5rc1l8+Go7ntqmndW4p06A7
	2N6cabvYg2VIZ58pDTpPJsJVpJxFCvRDdkAFhgdSz0Z0E2aqSSuVVZnneSOom3tADm7LsF6pNRZ
	FywQmR72n1je5tbQCCa2BwMfWZAjHU2ZcSb8hdJMPkLhXtig8RhOKdpR8eLCYvr304DcGlqTk8W
	IAkuiI0gBuaurGjxIQrvIDjrXtIESZZeaeFbFd8n+LnWdy7BSsSmCz9yV+Wy33MASmMdcidaQh0
	eas0
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11408272eec.41.1794851652226;
        Mon, 16 Nov 2026 09:54:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 007/105] python3-bitarray: upgrade 3.12.3 -> 3.12.4
Date: Mon, 16 Nov 2026 09:52:19 -0800
Message-ID: <20261116175359.342679-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132463
Content-Type: text/plain; charset="utf-8"

Changes:
- Free-threaded CPython support is now considered stable.
- Require PyPy 7.3.23 or higher.
- Linux wheels built in parallel; RISC-V wheels added.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-bitarray_3.12.3.bb => python3-bitarray_3.12.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.12.3.bb => python3-bitarray_3.12.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.12.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.12.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.12.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.12.4.bb
index dff01f0aa9..e25bfb82fb 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.12.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "919e35a951c0a551631b94bf568f3f5e38d004e0c60866cb2ca51bd8c4778fec"
+SRC_URI[sha256sum] = "1f8bdf27eea32ab5783e32d3df105bab429e8097adc95d6307635238cfb5d366"
 
 inherit python_setuptools_build_meta pypi
 
