Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D203F531C4
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:51:14 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81.1776106269783335001
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IFqFsWZZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso4848474f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776106268; x=1776711068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aAqyqeWVfksuv03rAqb86znBlCJpHvTcqFd6YNK+Yl0=;
        b=IFqFsWZZxKdEyM9XJl8w5zsfKg0PwQ0cuWYhGwGfAff/rKR4H/X/p5SUGzzaICJBls
         9rwEU5RXKUsjbiKIox9FGDHRSAvW5BhWk5uJi0I4r4kpZksWe9hXNvvxqbBrJoDK2VKL
         RT+ZMU5Wi88zfUBbqO6nVjpBZSHLVze+K4iQpxRstKEcXl7le4iGmRvI02RnNm5tn+EB
         hO9BlTzI3RKV0isiDM1plBVo78AQEqjhxbeZl45Vrvs9mWkwswn5oGtQ71HZWl4sfJYG
         8w3gs6T5/U92gWMzXfN3v5MA08BG1rqU9FXJV1WzVvYHsXksyITkcXTzAseK+LNvKqjH
         8Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776106268; x=1776711068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAqyqeWVfksuv03rAqb86znBlCJpHvTcqFd6YNK+Yl0=;
        b=F74uk0FNnu8kLnknaHfJ5LIvgL4CWK1pPNFpQVgFtaewx6bIKSv/n2Gjgz8E5+gkvy
         ZU+BH2nYtgSqunAWgvUnFKs79yeNNNoDy4Ft94AKnwe9Lu3m2+caz7EOAC0K7lE6CkRK
         q+MCddYPyapY1HAM1jbxmJOzj2xBIoLGkQyaZm+BQH7MkvECEJQ9Svyczk42rB6u3CII
         XHu35rPzleuaDdlIAei36JaBFJp+h2X5RJ3Zv2szTkXx27JiEDSAhw3o95AUDMl+I0rq
         2RfQjXZGt0mTrz2GjkM9mVHU0cgQMk7fW6DyuiUolhBalhSl4pStBZ4zRoKBnqiijDKs
         sJeA==
X-Gm-Message-State: AOJu0Yyt/3gh6GGECpv5jxRTzlTpetelQ0sa7tGnWGD3Xxhj/xrbm/Dx
	5qSza9Vx/NDjn+JMNBRc35onYYwxDdd2mHS29cu4/MsWGaE/Ld6o24vPQnQ+BQ==
X-Gm-Gg: AeBDieuCAEmIoQz8ZbKYBdT81EIRy6+P9PU7y8fqWwcCiR+NfKdYODzPaLp2pqaf0Rz
	s2FjCbk0ofpQyPai/ItdlRuWFfxNukg+8KI3AN8I94JN5I36qbhY5kCF8yV8RghntJf+D88cqcm
	rWk9qN1NP4ROroNjHacpZLuSxj4l9/4+ZUY5Ctjsvoyv1e1pYWuuuypxa4fHrOxSwTIgZnbVreu
	Kw/xmKHai3tXFQp/LRPDm940jWX9pRuYLQffj6nDz2yoP6kCrLk97NVC4trEeWqHAzwOly51SM0
	Tshydk3PlA5ciz7IUSsoTUosvJGCrdhiku7u0jCd8pG+hB8C9gRBkUzxF07SQWkRnXJMsk05rCs
	falplEMC5yMU9L/p/aNX9pADEn7t3322Um6mc0N1plghnllFdz8Iwgd9Rao+eQ7ShMErFymnOne
	LPrnS9jx9hdxnG88xkDPLHeTq/IuK0c5A=
X-Received: by 2002:a05:6000:26c8:b0:43d:77a8:3baa with SMTP id ffacd0b85a97d-43d77a83d14mr8007138f8f.3.1776106267761;
        Mon, 13 Apr 2026 11:51:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e4f16bsm33544682f8f.26.2026.04.13.11.51.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:51:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] nodejs: mark CVE-2026-21710 patched
Date: Mon, 13 Apr 2026 20:51:04 +0200
Message-ID: <20260413185106.1098314-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126287

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-21710

The CVE is fixed in the current recipe version[1], but NVD tracks it
without verison info.

Mark it as patched in the recipe.

[1]: https://github.com/nodejs/node/blob/v22.x/doc/changelogs/CHANGELOG_V22.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
index e6dbc866a1..3a1385f70a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
@@ -215,6 +215,7 @@ python __anonymous () {
 
 BBCLASSEXTEND = "native"
 
+CVE_STATUS[CVE-2026-21710] = "fixed-version: fixed since v22.22.2"
 CVE_STATUS[CVE-2026-21712] = "cpe-incorrect: only v24 and v25 are affected"
 CVE_STATUS[CVE-2026-21713] = "fixed-version: fixed since v22.22.2"
 CVE_STATUS[CVE-2026-21714] = "fixed-version: fixed since v22.22.2"

