Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39CFD29C3C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 15:37:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37685.1768837032018533582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 07:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mLB4vVmZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so3932519f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 07:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768837030; x=1769441830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR0EQdrHzqNMWncq/jeLY2Isz1ynOyNsnEP5EvAKYQs=;
        b=mLB4vVmZiLPh1a4OPpDxF9PvAxR+3CpFO227pUzsjbE+AfiUcBkEBTjaAg92owK6hr
         L5Wg2sFViVRuzPAyHGqQd2DUrD4luG1rlqbmOD9rCRqZKO3FzhBmU17K9t+jx1wAikmE
         l1Gj5Sq8tYy7fPvbwHFfzwMhpTwBt80geDD81Pcx5dSJll3CCwrgJBnaymD2pD44G6y5
         584ZeDdnjH4oOumQ0/I6nUdfI45n9orW1KbG+5gZwF3/qS6vVeM2ZH6Ci0xktp6DBNUs
         x0jGXmD0imVkPtFyK2oduQt48KPw8XHPMo4rWIpyB8VCYzau9IRfPTFdiBosppZFUNak
         t4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837030; x=1769441830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RR0EQdrHzqNMWncq/jeLY2Isz1ynOyNsnEP5EvAKYQs=;
        b=nUnGYTa6rdNmu2g/1+y+l+BsUgfqTCd5xzuVCI4L9r/MyY7fr/VFTcs+QCj54KtP93
         cXwfxsSGnS9gZLpUZK5LYWXf9sbj5Tt06NAuISCbOCHdN66nOPSBKqAqU+zm5csIZ6g1
         gYIDpqcCZ/9vruylr3Q0VhJcyjtx9mhUtbKtKdH049d0I3oGMG/7OLu57ewxM2i/EsOy
         tXwBtoz+5eJEqKtZpAun16CZ7O3c/eIrrGFSrZhXzZG6UJLwAqyqi852m8bpfdyXBK6Y
         PWoLDUul578ZZY+csfYkyO0cixOTBHwF7c6FAx5H8YOvZYDdMF44dHx7k+G+uucrOjVM
         eE+A==
X-Gm-Message-State: AOJu0Ywg3IlktN3tzTeJBBK9WZqcC9wS1OL10BhjEHX/jKwlDq7bINlT
	fAhdcSr51VzO5p0P+9X6BCwW8tkwb1M6kLgH2yxCp5sfoAPtaiiq5xtcB3bfbQ==
X-Gm-Gg: AZuq6aI/shr0hQSZB7DQ2bPYX/RKYyRyA2En2MIySoYCxI8Bnw9wjdVMbAhzSpAmipP
	WKB4xy/pNJLZtlxK/kcc5UPGkLN4jw9oxm3i9eqk/jWSRlD2IKckqHmUvj5H2NJb3wEgalvRI1q
	cu+lSx+cQm0PWt7+onvX/cBaeRas53eDP589He5lady1ZgeC2f03HcnW1y/p78PY2Gwub0N0u/u
	ypBqYadQfLoCc8SWvZaEJemVtFsbFIYKVSHWfjD/l0t9KNkZqcyrzElQ/DBr0Qr2ZEPvVv4lXKT
	rPjqMYOAR3zZVOiG1/DTtvfO9g8C+tig6e3CxedZZP7WTvzTFoi4fblEfQqaHxD/9ddxcQr60L8
	v89TC/XN9pICFGbVwvk6M9vauomkvI3daTAYDeXxP/a9f+qU1jNQ7z0Nb3kpja3HmAFYO1Qsayh
	bF5Y/t+m9X
X-Received: by 2002:a05:6000:186c:b0:431:9b7:653 with SMTP id ffacd0b85a97d-435699a74a3mr15325874f8f.27.1768837030055;
        Mon, 19 Jan 2026 07:37:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm23662989f8f.9.2026.01.19.07.37.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:37:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] freerdp3: upgrade 3.20.0 -> 3.20.2
Date: Mon, 19 Jan 2026 16:37:08 +0100
Message-ID: <20260119153708.580011-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119153708.580011-1-skandigraun@gmail.com>
References: <20260119153708.580011-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 15:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123642

Contains fixes for the following vulnerabilities:
CVE-2026-22851, CVE-2026-22852, CVE-2026-22853, CVE-2026-22854,
CVE-2026-22855, CVE-2026-22856, CVE-2026-22857, CVE-2026-22858,
CVE-2026-22859

Changelogs:
https://www.freerdp.com/2026/01/14/3_20_1-release
https://www.freerdp.com/2026/01/14/3_20_2-release

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/{freerdp3_3.20.0.bb => freerdp3_3.20.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.20.0.bb => freerdp3_3.20.2.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
index ee3fd8d843..81f160a848 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "b8e790a02ede8dd64ff7177fb9027d1844e66bb6"
+SRCREV = "ef106b0c5adf739085ff4e8f45ef384e5a1c7bb3"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
            file://run-ptest"
 

