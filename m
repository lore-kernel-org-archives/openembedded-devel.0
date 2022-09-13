Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DBDECAAD8
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 19:58:26 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.2349.1663099104287389261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 12:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cXDCVT1P;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id l10so12910100plb.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 12:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=DchPTX07hmW2wAzuBA1fl18ykKSMpnTgk4zrgIyPf9k=;
        b=cXDCVT1Pz1xk8r+sMmtdlMF51gzL+rwWm63hNnMUUfeofkfHXjPKVVCehD+oMx8lwi
         imBWAnIGu2oCrLRaoWI7TPTtzho6fK7ix6CH5dMZ9I4mhXx430sA1+93Szm9SDHFm/s5
         P88neK3SVkIyF9til0j37GO0SloGfx5yUS10aDXuM2rfZcQ/66rRyLUQW7uqG60Nfkjz
         1dXq2+/cTPVZCY0vCbXNU53N01H2tWKupwzLrhTAmuTQ8NT2eb1ODb6VkePBHMSRHwf7
         c+Y92pyo1fKQUOaxMLtzVE2EkuHQwcGwmeREnYs185yf+Et4TNwKKY4k3o2BUskdKRdV
         7SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=DchPTX07hmW2wAzuBA1fl18ykKSMpnTgk4zrgIyPf9k=;
        b=pPrLob5ot0nYHTottprGnGkcqmUo/KdBcXT63U1MxcEh5N1HL0QsuMl+HnnrZMN8KS
         cbEGLYdyXlhjQ8mo2JSY7/x0wmyTWVa5Hz/0K1vFypHllda1FF7HHieIKtd3bbYM6tZX
         YsHc+p0Qz1poOVxeHYQOWJlVl3E+glL9lB6msaHLbwFm9nxCISvv52Kbtpf1zQRh4rNw
         xBb8nE6oPMLTNP0rK56bfyovedojD1kv+z6otppl7ib4aDmEA7YPkcpqCo2vTY8o1fh9
         SooACzVytx9E2fG/OzSsBHUokWdpwrpP7ZsMfVAmeANYa9DyzM1qF2p34vnQ2ED9VZJ2
         1ljg==
X-Gm-Message-State: ACgBeo0L9lnrZ6NVxeQX2zuuZATT9/zHtf3aSYxad143UK7FOlhmqqC8
	pgtXxf68WxT5iavOAbjFtQaikmh5rf8c2w==
X-Google-Smtp-Source: 
 AA6agR7aHE6a38G4ilGJlbDALR9bTUJLf/2Ewu7LipTb5kxRj9zceYjQOsk86hmgr7LdMGFI3pJMVQ==
X-Received: by 2002:a17:90b:17c7:b0:202:95a2:e30f with SMTP id
 me7-20020a17090b17c700b0020295a2e30fmr902732pjb.28.1663099103389;
        Tue, 13 Sep 2022 12:58:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 w187-20020a6282c4000000b0053e156e9475sm8235020pfd.182.2022.09.13.12.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 12:58:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rdfind: Fix patch-fuzz warnings
Date: Tue, 13 Sep 2022 12:58:20 -0700
Message-Id: <20220913195820.841058-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 19:58:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98788

Patch needs to be refreshed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-configure-Fix-check-for-AC_CHECK_LIB.patch      | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
index 754c388ae9..af69c02173 100644
--- a/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
+++ b/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
@@ -12,12 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index be1b2fd..157a7d7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -46,7 +46,7 @@ AC_CHECK_HEADER(nettle/sha.h,,[AC_MSG_ERROR([
-  On Debian-ish systems, use "apt-get install nettle-dev" to get a system
+@@ -46,7 +46,7 @@ AC_CHECK_HEADER(nettle/sha.h,,[AC_MSG_ER
+  On Debian-ish systems, use \"apt-get install nettle-dev\" to get a system
   wide nettle install.
  ])]) 
 -AC_CHECK_LIB(nettle,main,,[AC_MSG_ERROR([
@@ -25,6 +23,3 @@ index be1b2fd..157a7d7 100644
   Could not link to libnettle. Please install nettle
   first. If you have already done so; please run ldconfig
   as root or check whether the path libnettle was installed
--- 
-2.37.3
-
-- 
2.37.3


