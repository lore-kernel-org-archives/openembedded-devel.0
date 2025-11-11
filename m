Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0D3CD1297
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:37:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13801.1762853874561418597
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZVZjmaKI;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29844c68068so2421585ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853874; x=1763458674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70trVGe3ksepdOZCVwMgu+vnBMXqsKayWv01Re5zK+o=;
        b=ZVZjmaKIACG9PUDoEEQq95MEZ2ApqnxSr3KptUpK8q8hzIoWpk3tK7VEv4BsOeLjXE
         ir8axDt3kQYB5dT4MhUiU5JQIu149oSJWKI8mAroCTIXdhKcwfTxYjDBsAhwp0UO2+Md
         b+DioakaSIaJUhyTOw065xWU77dkfRTGWO/rCqu2eQgRgtnpa59qEbAyftHk+5i/W6Nd
         YZFKUC4dnBrSXbYATgpwZ2zlsf3JM/nje+8WrTVNkgG4peSesgW1oQNATBIRwwAtqMIt
         0inaEB4MN7BoPB7qqhtxgWyRtcjabfD2JXlf4c8d5rJGKF9p5sspbSvTqnLwmU/YnueN
         as4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853874; x=1763458674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=70trVGe3ksepdOZCVwMgu+vnBMXqsKayWv01Re5zK+o=;
        b=ejJ55nH3G7pMXPyxB/YKw39kpKAR4hTZR16NYQ9wfCi6l//1aanGMaJmqp0DOvSL9H
         Hzr8A2Fnz6pp6nlpD1fyK52bbmZQsUGjrWSwb6dtx9FDrQtX6UTAJqoPUz1U+/OxD60E
         cHc8MGSizoBua6+jy7IGmQllS9DOc6ROtCpLtPRxGEUVzD3h72E5In4pNSeplw6p+E28
         Pqw9z55wTuCNVevoJ2bY48TnwDlfIZr/5ug0YXbzadjgMIJPlWiMu3FIZZ2wTBQ40XSC
         h9DO37hCgGK89d/aL1K+qV1+R832ka+2i6fTYfjsvwl4Dy+rsBuGK64GI3T/JONNrxas
         n7kA==
X-Gm-Message-State: AOJu0YyovSjTBakvqiJyCYE2HVpN9+gCkA6mHcPPms+Rxh0GsQ126Z3P
	W/WgvbxNL1zUCeGwcOshtWzXfYeW7roRNKw4YnQn1cdC3EW7DMcBu0A8NTSYjzzqAcw=
X-Gm-Gg: ASbGncsZBd5426D6a/dBPJVuDI33nUh9HdF/dumPoBtNimimCm8ZwyTkCUE9i1o+ZsY
	BX2gQf3yD5jyWTw//uK5UcqfTlLUxDB0+5nZqwOXQwgegpXmjucoxgoHoaxPwRptdKxo/sLYUdx
	/eTPJqk/gMnyDnvnMRfAlRsxVCe0dhG6s1ApMCNiL6hj7YVv6+KXQt8i80oDg4qhlBYvhzJDPBp
	/ZFe5byyBh0xarUtzdAqxESW7zUNWydT26/LqDLHM/t7YJATI9iJ23a1AZ3YVqIdWDvIc+f/K72
	1pbQtynytnRs1Y4omdIwr5y3r8jpm/2DXlBO//nKX0jwI32kqlWnQphH8Z/es16V1irkx7gM0yM
	XCEVxpPAyMWCJIzBwXR5PJi29ylxjmD3vK5/OLI3/0++pIf0Iouky3B0aHCep7plA4VDsYy2l26
	UZRNooUcrqRFrqYCZidTVyURRE
X-Google-Smtp-Source: AGHT+IENxIgJp8uRIy6p6lnXCpzsw1XHI323tKK02ObJzTm/TlFtb6Ji+h7Acy9jkkmqh9B1SPki8A==
X-Received: by 2002:a17:902:da84:b0:295:73f:90d0 with SMTP id d9443c01a7336-297e56e1cb2mr153463855ad.50.1762853873608;
        Tue, 11 Nov 2025 01:37:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:37:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 05/18] squid: Upgrade to 6.10
Date: Tue, 11 Nov 2025 22:37:20 +1300
Message-ID: <20251111093733.1393568-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121508

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-37894

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c393973c8516d56d547297902ef27c02d16a54b1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch | 2 +-
 .../recipes-daemons/squid/{squid_6.9.bb => squid_6.10.bb}      | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_6.9.bb => squid_6.10.bb} (97%)

diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index e0d002c68c..489850e3bd 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -37,7 +37,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    ])
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
-@@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_
+@@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
    [
     AC_MSG_RESULT([no])
    ],
diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.10.bb
similarity index 97%
rename from meta-networking/recipes-daemons/squid/squid_6.9.bb
rename to meta-networking/recipes-daemons/squid/squid_6.10.bb
index 490a5401c3..332390d365 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.10.bb
@@ -20,11 +20,10 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://volatiles.03_squid \
            file://0002-squid-make-squid-conf-tests-run-on-target-device.patch \
            file://squid.nm \
-           file://CVE-2024-37894.patch \
            file://CVE-2025-59362.patch \
            "
 
-SRC_URI[sha256sum] = "1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882"
+SRC_URI[sha256sum] = "0b07b187e723f04770dd25beb89aec12030a158696aa8892d87c8b26853408a7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=d324bc1f9447d1d1588d75b22a678dc4 \

