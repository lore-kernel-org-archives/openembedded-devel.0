Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23374E92734
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44425.1767019918308988452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fKoEZSUS;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so7186159f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019917; x=1767624717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roRoPMc5wdX+RATEJdCG2rhBgEk1oI2Qd+VrjHlRai8=;
        b=fKoEZSUSd/hmvFF+6/vkmS+uxL099nlVjxXW3Lurtdo6AtYOW5bgBxPSOutsNjq74H
         V75r6h2DyAFvwrdHY78da5iUA3TnzgYSl1lYvAtjgojMLZlbyp9DlL3Frn1Z8rwICNE2
         agS35iX59eZxNXuN/RUWcEhnG5vSwGTd+I4ubw6tsrWfo2+iMk61Y3/ZRvuDgXAx6MYQ
         14BXDAqmb5HAMQ+21TvWuB1hYKzK3aL71Fk+fHx1mRPru+2FzS7orJhYMWHZEcfaD/s3
         5GPPJBVx0oS0SMgIZtSl3p7gzSjT9P39kHN/loEgPkzJMOF1AiuhQGHO6z7pkgxeifYC
         NuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019917; x=1767624717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=roRoPMc5wdX+RATEJdCG2rhBgEk1oI2Qd+VrjHlRai8=;
        b=LMmy7tnkaNZO6InEz8VHJSDmNOqxcAs7ZyxUjTVzAKKgZ+3vv8TUFus/SMAyWfu/xS
         a4nRrkxD90mQLHxP+ZMr6hyamLaaEcMmSfWqo1PJu1E8APTPbK4DNF20m/zhXMaL1xFj
         hmYsqCVtC1dgYUMeH8vyp7a/GVJM2ApVWHIoUqMkp7SGru3iamwnhWPf71jiz764aIrY
         b7ExefD0gDqx/BJNKKhEJKPd2nZOmWRg6qc8db5ci4VWoVHDVRqc31/7rD4B10y+3j42
         onBkwhUm8+VFWhitRbbHXFynF5qFXLwALY8EJjhoUOJGi33AvJwCDYDbK+dS5kVODF3d
         so8g==
X-Gm-Message-State: AOJu0YzwHPk4vkWd6kTPn/d64gTSihJtYetmxakwuLtlJzJe5dPpHl2r
	DFyRvcC1KLR6l0YJzRXI/yAllSQFu2ptWa6wzR02kquqBqwtYH/P7UBe0/GeWw==
X-Gm-Gg: AY/fxX4kjDbZPkck7R7gxPjuoxfziDqkApIaTTtwnuiidOtlbFzSm9gbAgXwwaUKUl1
	jpvOfqNt7Mr/fivz4ZhlWyVeuXE3q/RfHKS7SxDHFgshIWhysrYAbKRbNdg+N8QXd6kfYuHGh1f
	3LFVVGdzHgbu6K9VQ9O4L0PpZi1vA1ZeieW4tsjQpiTclHk6YlTvVAxt8uQczzC72fd66w6U2WI
	WWVKmlaxeT5TVhFp9l5lytY/Q9FkmAGuI8/XyGhIeo+haTSkPVnaLaTkg05fi0TBAaFAYX/PdpF
	P9QmSOUVa/UGC3B234bZx0cMZBZQDDaKgJBUpwCmZglavzaYSn+v/wA40M5meQj0im5zOqY/a8f
	1atRfVsoFMh9D+1W7Em6dIhAbteVrDHIDf5H18ar/rMmw2TaQccobwjfTFeTphiCt9XoVSMCwHP
	q096uKs27m
X-Google-Smtp-Source: AGHT+IGh5Fs+Qq52Or6xe8C4ZkW3L3s5p46tk8mOdtSkiycEmtXjTOAB9biGcF2ud3AVrFm/KveILA==
X-Received: by 2002:a05:6000:178f:b0:431:344:5a2d with SMTP id ffacd0b85a97d-4324e4fd90cmr34801005f8f.41.1767019916618;
        Mon, 29 Dec 2025 06:51:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 06/11] fio: ignore CVE-2025-10824
Date: Mon, 29 Dec 2025 15:51:47 +0100
Message-ID: <20251229145152.489068-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122985

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-10824

The upstream maintainer wasn't able to reproduce the issue[1],
and the related bug is closed without further action.

[1]: https://github.com/axboe/fio/issues/1981

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a275078cbeaa0fafcfa4eb60ca69f05a8fe3df99)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.39.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
index 4a94aadf42..2ca52aaecf 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
@@ -45,3 +45,5 @@ do_install() {
     install -d ${D}/${docdir}/${PN}
     cp -R --no-dereference --preserve=mode,links -v ${S}/examples ${D}/${docdir}/${PN}/
 }
+
+CVE_STATUS[CVE-2025-10824] = "disputed: Maintainer could not reproduce the issue, issue is closed without change."

