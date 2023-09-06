Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A10EB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 10:56:31 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.5766.1693997786314196240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 03:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DBLtpc38;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d7eccc1b8c6so3099817276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693997785; x=1694602585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzGFAARHO8K4aMXbafRgrkReagm/7Fr3E4+gIm8512Y=;
        b=DBLtpc38i0vy2urjJMMrfkpmm9bjkhRSPmxHcEdtWQ3VMxhfEhmYSmW8Sf4cjur8PB
         BKjPxsCHK1+yGJCIirfL++nfwK7cFwjqyPW0ROLpSxkpJ1QT6trZXKJZHW6oX0SNsHw+
         zRbE4lo9mrww8J0K0i8j3rbrQBYhgw1Hbc4pNe2w9F5Rs2MHTvAmy7vweGwjoqhVxT1A
         SpmqeJyp/g23nggaaNBPqVD7XrPRBquKmYd7t1Ba7PwsmwDMechNHYKk3oN0V3567luZ
         uDm5rlYl8ODpyWc2gd8XVp+bWVBe0z16Lu0Glk5bMj5XGD0paZ/GwarivhbtMqrXwKCY
         b+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997785; x=1694602585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzGFAARHO8K4aMXbafRgrkReagm/7Fr3E4+gIm8512Y=;
        b=kxpaGD2gW0dBlr3ynkX2VFbj0M3xxEThNwAY6qPutYKXt6Wyp3sjYMNvodGmVxpt+7
         XSfWiEk/Ca2EnzBa2Y2TSLVknVCmnD83rZG1aEN5l+IacbtX2HVAxdeQ4kcJnV0mveK2
         zaVg49QQBWnuspqyyFRDjD3OI5qKFly3e6i9ZHdMZt9gmvKNSijdkyGiA99nTZ3yQzOe
         63FhNQ99wyiqLY6lAAvldgHXuu308Q9gNtvK/OC1kf2hxtJnI9Jfdy0we9Mt9TAHzZqX
         rADymE+MaDHc3k1bZVox8y9Q7kUaChZFiX9OfUzfNVp1UHQBxKL7nO0/u8SBup330mRg
         7ATw==
X-Gm-Message-State: AOJu0Yw107Bvd5crq5HIXh1WSs6I74CKPQNb3MVEB9fq6zjQrGSe1b9U
	b1xHH0t0nNcTFL+m0HC/0MSHkrpgBa8=
X-Google-Smtp-Source: AGHT+IHSbtrWJa/8IQMY2QGqSUA4rYn9+qwJg6n1NhG75Lfnb+tWdKTfptC+FSyutAElnHVlTZWTzA==
X-Received: by 2002:a25:da0a:0:b0:d78:f1d:2e23 with SMTP id n10-20020a25da0a000000b00d780f1d2e23mr18252985ybf.53.1693997785131;
        Wed, 06 Sep 2023 03:56:25 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:5654:1c56:e678:3eb1])
        by smtp.gmail.com with ESMTPSA id f126-20020a25cf84000000b00d780f43b66dsm3221991ybg.63.2023.09.06.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 03:56:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH] tcpdump: upgrade 4.99.3 -> 4.99.4
Date: Wed,  6 Sep 2023 06:56:24 -0400
Message-Id: <20230906105624.847543-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 10:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104774

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Source code:
----------------
  Fix spaces before tabs in indentation.
Updated printers:
-----------------
  LSP ping: Fix "Unused value" warnings from Coverity.
  CVE-2023-1801: Fix an out-of-bounds write in the SMB printer.
  DNS: sync resource types with IANA.
  ICMPv6: Update the output to show a RPL DAO field name.
  Geneve: Fix the Geneve UDP port test.
Building and testing:
----------------------
  Require at least autoconf 2.69.
  Don't check for strftime(), as it's in C90 and beyond.
  Update config.{guess,sub}, timestamps 2023-01-01,2023-01-21.
Documentation:
-------------
  man: Document TCP flag names better.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2e782260d0b6018614dbdea95899a4a0921915e0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
index 03f1b76f97..803a9bb5f5 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
+SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


