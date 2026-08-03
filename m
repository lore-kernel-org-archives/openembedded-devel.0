Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD89CC55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:21:22 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40944.1785756075002928582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q/V0e97t;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so2486326a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756074; x=1786360874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nay795pv6ULRkDPgKyOYRj2z/2JoINjxdHRylkaJsv0=;
        b=q/V0e97tmzoWGaupEIBrylnrrjGp1qcQ+xf9TD6HgDEzkfBWNm1FeqRUCnjx2PXlt5
         nrnG/RU0UJ++3DkOxJcM0ljmc6/QvhFdkHV0C3FhCqP1siHzZ0r0nhf8pXZLEB/7Z/6w
         NlFHo8bYSbbxI60ezFqI4ozaPiB52spAoRQQXkOU2zYEnGiO4MqwAqEXzj4BJUN1xhMD
         PHwpNWHTS89wIfbGTfUrO/Go71muS85HXV7PqFCAWSV3w/9+N28aEndnw6UpzXRMIwK6
         +xeN8+a8jfyOwbjizRVtZWAEYM2vTUCweNnJaTmicJhwX989W+FKVBqcZEJ6ppQSDnbM
         iY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756074; x=1786360874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nay795pv6ULRkDPgKyOYRj2z/2JoINjxdHRylkaJsv0=;
        b=OP8TH+eD7vUeztN0pUKzIEyzdVGAZQyEvaf/Xj4A1h8XS6NmPbdCrFyaapS/OCdTZw
         BlRvqtbW2zvm7lB7BUWiLcUZg/J+QRa1l/SrRHOaJe5F18oVWBfcRmQvEYARH8snNAhF
         /k7/5Vz13wJ0zxVTl/4ADQap1wk6Chwd+nIFNFLZTZ51Cod39Nk/qIoNbK7X+i3A1QD4
         Lhi2nMe8dT+kF28d0dgaOKJdF94Q2bcMHuwS/5t+VeRDezoNbuWl6XU2HZQzd/37HYqf
         UduMy4Rhyu8sLFOWV8Feh1LD6w9pZvRphutN/4Up8QwVhi2PfdXHUxlHmartKyNrGWfj
         1U/w==
X-Gm-Message-State: AOJu0Ywy5Gi8aMK6BNsUgeGE6lkCjIC08vf/Pfm5bXDYdloyWjp7JCAd
	qHRYz70aplU/tD+zCxwlm/uK1N7vbLhihQ0Wq30XJqsThVLlntMK1karM7xjvh+2
X-Gm-Gg: AR+sD12MDEh94YKpsrFEmuqn3oC71eVVTHecY8PX3BYHlwfyYy35/GObddTW1EFAdzU
	IQAt0LGDdlj0oukOSL57k/1OtSO2Fa0JD0hv9dWq4CJ0g0Oc+aZHIbr862qCdRnNbUkBApblCKC
	BK05i11AoLUeNJbLbxAEjHuePy6f/6vI819OoUwDW9NuuCMNIp0dG8GlJibrRhNtQKulKf1CI69
	Acts1dZ5TQuLn11CsLv1Zld1Tmaygaffl4wiKyLv78fi+TUaQvBxHY/bjNo3VXV5XIUu5WG70sP
	xnzzWn6Fxu1JDlFf+9n+AhtJXdRQ+ZG/KUFx/3CAeBkgAKb2uhznVMS/SMHrp292M2g8MkYvjmA
	lEIrSkMCw7xPvCnS/Mje+A8yv9X8A3WaCPo+l8B6aHhtmtjWhDqFmDv/9To5xvgNwh1Vj3ty/vU
	kMqCysUMbbmlfV1rRkzJ1YEs+WEDNA9rijgCcXMkb52mz7qE8e1HGJ/EOVK6C7FbqN3shpNE2A6
	Q==
X-Received: by 2002:a05:6a21:4e02:b0:3b4:c9d5:cd5b with SMTP id adf61e73a8af0-3c92a53ef40mr9825223637.13.1785756074385;
        Mon, 03 Aug 2026 04:21:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddcba2bsm42463843eec.11.2026.08.03.04.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/6] liburing: upgrade 2.12 -> 2.15
Date: Mon,  3 Aug 2026 23:20:55 +1200
Message-ID: <20260803112055.3926085-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
References: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 11:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128681

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

Changelog:
https://github.com/axboe/liburing/releases/tag/liburing-2.15

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../liburing/{liburing_2.12.bb => liburing_2.15.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/liburing/{liburing_2.12.bb => liburing_2.15.bb} (95%)

diff --git a/meta-oe/recipes-support/liburing/liburing_2.12.bb b/meta-oe/recipes-support/liburing/liburing_2.15.bb
similarity index 95%
rename from meta-oe/recipes-support/liburing/liburing_2.12.bb
rename to meta-oe/recipes-support/liburing/liburing_2.15.bb
index 5a69731a8f..4f5ec26c8c 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.12.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.15.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only OR MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
-SRCREV = "e907d6a342e80b70874f93abd440b92b8a40b7bc"
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https;tag=${BP}"
+SRCREV = "d41bf9220ec39277ff235379e9089d9e0fd6c2a5"
 
 
 DEPENDS:append:libc-musl = " libucontext"

