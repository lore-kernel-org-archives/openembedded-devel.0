Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94407E81BA5
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45587.1770637153007132490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FAgaBZhl;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso11860605e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637151; x=1771241951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BintwLvDcCtgAT+7KCneustgdv8UVv2m1G6ImUELGYU=;
        b=FAgaBZhl1uK1y9lfA/awbU2MVR7kahlgtTzHGqVtSCGWM71pbowm0+esT6PEmo0JG7
         VCO4kNO7c7mpFbtRCMDGZQaG59DfN+F6t2HTyFU4hL8a+N9bKWIWW8wzmCGLGOd96rI+
         ele9NIKGT2q88dddUuihqiYgFtg+ytmX4wYk7o2ks4+3LCXbH9pdGzL++5KDfho5+Oac
         CayCFWSwA0HvznJqgNak9PWaiHUDio3alYbOhhqwg58kChQ9B0TArLkNNIvITyA/4tHM
         8xkUQIHv0gCS02MArxkEkR4L7NJglMa6nk5P4CIis6/di4ck3/X/wPtnc01ebcIVPeJF
         1DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637151; x=1771241951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BintwLvDcCtgAT+7KCneustgdv8UVv2m1G6ImUELGYU=;
        b=kdmTe7SzDGNKJOt121XgKVZKv71D2yg1eIXqo7v9+9X46pWOiJyAZtX2AGNj+4fcWB
         3Z8yH2Q3ZIn4eig0bl2AkbRizwtG/Vwrf31/S2o8IM5nnbBaPqUYAqRDL7v1BuVU7p60
         KlBfnn7LoTDI2FpBQ7CtLynzMgRuHHO9x2UI1aQ3BNac0CpI4VQClsFD06NmoLnS6oFR
         otfhCoDgGdkc2XGfpVTqrmY6QGShzDr4OAY6mhM/f1zviPhN9y73skR91pOyDloOy8Rv
         EMCkmGwnFu9J3sBhamSMQs/E617FAqsL+2tsFTVyrkkaNdEd9BO3yytQ9ZaZzrimdolQ
         13yQ==
X-Gm-Message-State: AOJu0YwV+9dEv2J9zKPdGWZQbHkCI1lvwyof3qTLDHbIoo7xGCZZwHSX
	D8gPRqarLKO0bppKGt6e1fzww4mIvchFgd0dNAKtpxR9RUOeq0yjbtcSGabkAw==
X-Gm-Gg: AZuq6aImdSUoyGhFKDCf/qmkGzMI/JbpeEM8SSBT7mo7hQWNbKWXk7LaXdIxWuwFIrP
	FD4KjSYPhyDEUGP+vzEtq2qEnBuTmnGJ2QqHnvan9Qu6iOPN5gWrY+tDW510BT5knw7k4ZHTU1C
	OQ/dSvU8WndrtJujr11fz55klEapTb/OcBbVIyVbZwflov3acXgGp0HRIwicu3XjxIFkrPOyxBy
	ZTxVhfTBVZ4ERNfpojjlUhimZwx9t7MDNQ6b85Vwl6fRdaE+M0QZNPogDy/YTiYA+4dZIkx4zSy
	c5zGDGg3Pqladwu1CYzc+6ZpNHK3Ck5Yt34Ff2+aR7CJ/B2pi+R7fzt4m6rPfu3TGAybE/OkbUb
	u+24HvMnyQvrgdtdrJrhhmI0HVScIbWWI5i3Jt+V5W/49zdXja/f9d50C//A2e3LLh5Jdx37rOe
	WRNuWzrVYxti4J7qB1Y/E=
X-Received: by 2002:a05:600c:348a:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-48337ae7016mr63572145e9.3.1770637151148;
        Mon, 09 Feb 2026 03:39:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 09/16] sox: mark CVE-2019-1010004 as patched
Date: Mon,  9 Feb 2026 12:38:56 +0100
Message-ID: <20260209113904.3442496-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124304

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-1010004

The description mentions that this vulnerability overlaps with CVE-2017-18189,
and Debian's investigation[1] confirms that it is solved by the same commit.

Add the ID to the CVE tag of CVE-2017-18189.patch.

[1]: https://security-tracker.debian.org/tracker/CVE-2019-1010004

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
index 3ca829b230..20af7cdada 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
@@ -8,7 +8,7 @@ into an infinite loop.  Prevent this by sanity checking the channel
 count in open_read().  Also add an upper bound to prevent overflow
 in multiplication.
 
-CVE: CVE-2017-18189
+CVE: CVE-2017-18189 CVE-2019-1010004
 Upstream-Status: Backport [https://github.com/mansr/sox/commit/7a8ceb86212b28243bbb6d0de636f0dfbe833e53]
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---

