Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A35BCC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9263.1791969950013211766
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WYEFOLFE;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8917c712f32so1768433b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969949; x=1792574749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir1fnGM26BmNmRGXAj6WMIJF1W5fPKzWlS66udaBFuE=;
        b=WYEFOLFE1h+2/rAnc9rYcWwtyDOX5TRzmLAa9t/ypufniv9uNRz1FJ7wnux+IPYTpY
         b4a5mJH7utehe/GBxkuc+/ArzzTu7O8oTmubA3hxog+ltvYZ62BDhlkWOxgLRrsXWpiy
         DcpbnS8+PaA8MHsFOMon+9QH4/eOjtNfqwUoTdNQc13clicc5r7W4+FQYj04Ei2kt5+A
         ZclNukObXDuetpYUcmVhG9wP4lSHkjh/kEsUtj1vGWdf/2SK0YDmv6l/6+NExxuxuxCN
         Mcr/k7/GEJ99lWU6pY1C1eFpxW3S/FggBwsGNr+/cERNLT13nNumjBfGphhcBkCRBqRb
         stuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969949; x=1792574749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ir1fnGM26BmNmRGXAj6WMIJF1W5fPKzWlS66udaBFuE=;
        b=VEl4KGHcBQOsok2QO7dGi2oWxJyCBKrreWsOHGnXd6myIvvDDheHGmtJV/0qhex6pX
         9jya9yHpJn4CWce+TdwCTjysF6Zrcp+QFRZTZ74JYQsiIsrx/5CBq9ggKTcHtAdSQ9Ue
         StgqCbzwdMcGBCaYVP/6t7989MM0K2X/c2Z4Pza3iIEz0y4bH20unnkE3n5JJaiuaSQf
         IRpJOKEUfYVtxzDYTYn89yxP78Mc6TOeyCOjEkdhnN4OOZtHjYVc0mrgDt3DMJVhHm5U
         vwUexHiDlEvw9KBlKNNCAPvcTG0QBd9pqb5fp/h6wcz1HZ1SEwF300N7GdihHGr2RDOT
         ObUw==
X-Gm-Message-State: AFq9FYLkxbPqzZdHVAUDzXQubl5PeVsniJbxat65ugEiPueHJ2C3UcRF
	+VMTx9qFgUaMkn39UsZlSbdyTfBKrFLFRWSi3SBu4lp6YsBO8lqLEHbOwHKMEQ==
X-Gm-Gg: AYBFou3+9RpL3FlMlcoJjqt41ywyDDiD7QjgAsVUWfcuhXYVyq0YWvezM+QotxSnTqu
	7dcVBTrNCm0hth2rx8tu1d/R4JHeEgwvBYfCTwopQxrIVQfkC2cgROUVmzLzzHzr5HLuZI2LmZA
	PEbAq7ZXvUdUS1zwOTusixzQRH0qpFzXFjqhkYqwglH90x+JGqDf+MXJJMKz1R6+yuHA1L0Z6tl
	62+7EPhrGFE2M9pPI/O3pLIxqY9zOdkRUUcITT0Ayn7iBEeIu1Hp8ZOKVSKPYEzk25SDXv6kktB
	iIsHPRN0Uro8/sDgWaHAs5cEJnehJrndCVqm6CuyGK8jHwiCrUfC45mlYdbu5LQPsrz/T2DA1JQ
	5h4WiW8/jvrGPxLauftKSNu3N+uvgK3R6P7rNugkpCk1f/3RigVVrK6TX3sIw0DzeTgN5sR/iaX
	mUka555qyJvnFpK8DNNLPL5gtFU0RJt+tSepUBd66Fql29tuO+fyCdRG7J6aFF9w36d6EiizNDL
	+K7BN8PusCxm5naTwNA1ujF9f2zNqSY1aOpw3E=
X-Received: by 2002:a05:6a21:348a:b0:3dd:a195:dd57 with SMTP id adf61e73a8af0-3e16bfc3315mr12090670637.57.1791969949341;
        Wed, 14 Oct 2026 02:25:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/17] hunspell: upgrade 1.7.4 -> 1.7.5
Date: Wed, 14 Oct 2026 22:25:07 +1300
Message-ID: <20261014092514.454505-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130879

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/hunspell/hunspell/releases/tag/v1.7.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hunspell/{hunspell_1.7.4.bb => hunspell_1.7.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.7.4.bb => hunspell_1.7.5.bb} (96%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.4.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.5.bb
similarity index 96%
rename from meta-oe/recipes-support/hunspell/hunspell_1.7.4.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.7.5.bb
index bdfe1bd4b1..ec25dc91e2 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.4.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
-SRCREV = "92aa34b3f378ec115562fb06bd1728d566a339ec"
+SRCREV = "e8342700b4dde06130cdbba75f7e6500ffa58864"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=v${PV} \
            file://run-ptest \
 "

