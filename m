Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FBFC5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:58 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13154.1787485969918636776
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S346jSxk;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2123355a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485969; x=1788090769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUnNBYYfv6uaCX9U6HIWa4DNxDI2FXUDlAghEusxXjc=;
        b=S346jSxkVlCp7uumXXgksHD7b0DcPFzuOtkswzwsWP3SBjKUSzVIM1iLR41WPEDzJP
         JIBb4UIb0NPHVQCrFR6yU3579CmBPcn46nLfQJv7SeMm7qPVfDc3VTEqfaaWhOGMucpt
         WYqlF89Kq1384JChssGHPu7hBlBdOXTnF2IeHSh3nXDQxi8+Qphbpal0yjTcBTwMdAd8
         1/8Ytzfpm4aUsSDeAwZP2poACg6fYrgcqUN1aAhuFc4X5omdF/tvqRNCLqegv1UfX7Cz
         t/A0MVcDinxU/5GRtvySJi09k35kt1ObXiDkgyBGliLPA+lQPCVjm+mNjY8Q7roMql++
         V5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485969; x=1788090769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uUnNBYYfv6uaCX9U6HIWa4DNxDI2FXUDlAghEusxXjc=;
        b=HabpavLQFOr7AjI8TuszuTDkBazvURuVd1qxdZjoFdHq8wBVdDhaWP4wa10RXt4D8k
         z8qkqV7k6w/acDTiFTyTcF+GLpsEUDk3ZcwX50LH/mXuHLtFtYvwwDG7Wm5WzoSsPWNK
         kZ9JZq+LkOWFw2IpdqMFyJeCTHDC0U+ayj66mBSAHPsjfxL8uXWAO9G64xkDbGJojGkp
         rhsMk65WZb5uw9WYLRkgMFfPoUFicCHkM6CBOtphklwp9eS3Wl49Be0ooI0cKjrqI8mm
         9w/zAYsPPcL+ml5Nq6azG6FLxUTbxl6bDezuz35Y/PrQxnLdOZqcAgSteGVOAiZOHp2j
         ccSw==
X-Gm-Message-State: AFuF++kBuijo79QFUwC/RxRCL1o3MX8D94SE8VvfKCZSjlO2F4DE2rV8
	Mwh5c/CQblnT7IEt1OUdwFM9JMjG/2/ViiqKu8ORaYcaeEWCKawSbquW0Fv2fA==
X-Gm-Gg: AR+sD11jJrmz8eJF8P8Z6egbvoEdBxYwI64mYe5TlYeELP/sa9pWsU7/1zf8Lspg/Gi
	kvVkFJTjRnrwzdzgDQ7BLL50d7I+SDOOVcOtbON0ZpPIhsjV3XzzBpHfZON9tYrIg5Dyi1ktzTw
	ye2E3gcQjxil8yVVm2fNtMcPz3tqh538zjcQvV4XO5IiJguIFTZS8Q3Ag/Rq6dyLbnJ6SFnd7Ga
	KOgvvYK3rimlXsQf2WI4X2thNkYGjsjKqwiwnn4y/tY/P4JOb6RgjtYP19l3+rXQyVboRdnkaAE
	VQUAenEWw0w2Jzr60axuhPgSNy05gY3nNozgg01pnp0eD0NrAHgcOTHaM/SLPCatEyrMBFB1V+I
	WOC8iL6rfa6s4DAAEGWSZjEaqUZicmgD344jxwOkLNoPjKO2aUlCboJN9orUaaI114lMYpCUuio
	HffwxkcCXss0q1YZHelEkYNLH4DNqY7rIl237AL4nX2D1Kkdi5chaZ/lR2uvE/zpCxs6s/5f5Gv
	w==
X-Received: by 2002:a17:90b:39ab:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395df686f1dmr18297089a91.16.1787485969285;
        Sun, 23 Aug 2026 04:52:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][wrynose][PATCH 16/20] cjose: upgrade 0.6.2.7 -> 0.6.2.8
Date: Sun, 23 Aug 2026 23:51:54 +1200
Message-ID: <20260823115158.1582363-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129450

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patch that is part of the upstream version.

Changelog:
https://github.com/OpenIDC/cjose/releases/tag/v0.6.2.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b7c1c19585d7614fcc51e368405835c3abd9c740)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cjose/{cjose_0.6.2.7.bb => cjose_0.6.2.8.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cjose/{cjose_0.6.2.7.bb => cjose_0.6.2.8.bb} (88%)

diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb b/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
similarity index 88%
rename from meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
rename to meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
index b35cf349f1..492ee0d143 100644
--- a/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7249e2f9437adfb8c88d870438042f0e"
 
 SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV}"
 
-SRCREV = "10af8915a666b50caa5500cdc3f2523b916be720"
+SRCREV = "e787ace6a203d483038a793fd58f958a2f9b48c1"
 
 DEPENDS = "openssl libcheck jansson"
 

