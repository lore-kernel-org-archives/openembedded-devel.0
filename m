Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25587FC97F8
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:05 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37635.1774820341434863117
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c0YdrXzf;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66aed966c7eso6107681a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820340; x=1775425140; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hbnb6zd330Fpx7pxOcXaoVjLc2N2/eJD4jbu3dd9TBo=;
        b=c0YdrXzfEtfI6jxOO4x5EItJv64iibxHph8ehB0JAAmZ4grcdjZGKiU+DXnE4hdXuO
         G5v+m4DfeCifYgwFFpA0cUPXQqRCJlk5vev6Qolh32CL0ISF4KFrBP4/PDJXeeqznnJw
         4Kdj04Fk7CAdnX/mYWvr16HRKjzWX8VV3ib3CSa+lZ3BYO5ZiU7wVlt0bUYhTe+2xab7
         +tCb6kIqvyo3yiBY3n4o35e7rJWuPcocEObZLw5y5/b8qWAouswppkq1xPo5bMds07Jm
         iicNR9OU0uASqA+F6+GS2WmboK5Hu7rEQggxdMzBOrj7EQXgvJu8kbClfpiNqjtdcfzo
         za1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820340; x=1775425140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hbnb6zd330Fpx7pxOcXaoVjLc2N2/eJD4jbu3dd9TBo=;
        b=ilv7aaIXkZfen84g2tXpfMp1i4YRbGJ+7CsJPbVLUilqSEWzwP7XtxTIhMOGpyqbwF
         zuJwH97pF9qowQSRjRuMWqFJNZlad6zJuR6FSW70vwuAj2GV6KcVG2OhPm9mBvx9Z6tU
         O45Q1Xte8k20nrSoGIuvOLH3BBrgQc/nMfiuM40QPZ9A27Tp4iBAFjHN83AeHfeDDe+z
         +P9MqXabLXJ5FdXt74ygxSc9lsiIpXSheCVNXQmUK7mwSpXr7eqyt62LmI86IAXmy9K4
         PxKLtKM0qPEzKAqTaLVtXbVeTDaQj+mhx8AlWaoUvs9v1AWNHZ7DLm0YSYM5qHiJMZN/
         FriA==
X-Gm-Message-State: AOJu0YybkeJWlFhG9C3qilYniHpkqy2fDsjGQ9U/3MDYULZ58VIw7Ugc
	E0VCFXIZej2fL1QM9QG9qqmk3ufvAAfve/2mo92Z6BEbmVlLpz7003w3eR1Qqg==
X-Gm-Gg: ATEYQzzNMrqEEWH2GmuVa/m5k/rrCa2ROz8x1BFWI37fSJPrYRyg5TwULhOdu098M0t
	Nu6262/uMyc4NVXnu+TWyHUL3acwoZFPElvKo1gS0TyMB72XVLRqi+4V2FrPrCjd6ZBjiWEpKpV
	gbPb5Ulqd/WfBfXv4LLoR/8ThgXWHoSbknZkdd4+QwcBRLNnLAQnmM3F5Wd3o088uv3ZsBAKLCc
	jQqBQ3sMaSf0wKn1mOgvrfwIXqBRDKco7FhBj/eQZVinA2XfcgJvdNrU7FgYgmlF2Oznhsn1WX7
	EwZ6/NI2zZVKsIezJJB3mbe+UV+YXr+AwNkh0zyMPfEt6rkXMJup8W2OvRkonvvchmw71DpRQD3
	djK0aXoXM8smnmUNu+v351DwyDPiall2waz1ednfYS4A19HFfXGHyD7vPlCuo4slVMVsRO2cDOd
	Yna0a/VvSRCvqX8h2tvuwCYZH4nXnyR10ZeUmrslONhfT500xDZ7FyT4CmCsdW
X-Received: by 2002:a17:907:928d:b0:b96:ecc3:783e with SMTP id a640c23a62f3a-b9b5033e725mr641077466b.17.1774820339683;
        Sun, 29 Mar 2026 14:38:59 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:59 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:13 +0200
Subject: [PATCH 12/13] pcsc-lite: Convert confusing append to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-12-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125821

While in this case `RPROVIDES:${PN}:class-native +=` wouldn't
result in any unwanted override, there is no guarantee there won't be a
change, which would be hidden by this override. To avoid any surprises
in the future let's use `:append:class-native =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
index 169630d319..9e3c98bb97 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
@@ -34,7 +34,7 @@ PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-de
 
 RRECOMMENDS:${PN} = "ccid"
 RRECOMMENDS:${PN}:class-native = ""
-RPROVIDES:${PN}:class-native += "pcsc-lite-lib-native"
+RPROVIDES:${PN}:append:class-native = " pcsc-lite-lib-native"
 
 FILES:${PN} = "${sbindir}/pcscd \
                ${datadir}/polkit-1"

-- 
2.53.0


