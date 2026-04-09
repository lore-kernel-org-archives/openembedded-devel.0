Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353DEE9DE58
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:33 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127058.1775718623109459147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Tb5WYVel;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c742d4df00cso210394a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718622; x=1776323422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWEIfbsbChUU8POWayIxl2uZ7uUioNnzk3f2JuTbX+w=;
        b=Tb5WYVeloJExwtcSaKvhJgZG6q/csKo3OWzh0YwCqHgyX9YORLAs1jGs7H0/1P+5Bg
         wFOmLMG42rXmyO4comcSDBrG7/Hq0/pozTncl0ygJuz4gyXBIaSw+i9d8glo9dssVWnu
         VQH9xf6/612ar+0QLxK5Sq683fGPxNrRAIvlyAo2dm78eisYieAeuWw30QfClGczJWTm
         wrLaa+jNmw8fnL5br9kU0yoviU9z9I+P9rI0T5QOaEuTCf/5D1xhOs+rbuy9SfHx9VJM
         mU6FVYDyd5h+IDBphZPcqhk2S/YmudDDsIlHWso+M4dq6Zsv1gcMYH2VmamyIabntR9z
         t6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718622; x=1776323422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BWEIfbsbChUU8POWayIxl2uZ7uUioNnzk3f2JuTbX+w=;
        b=J8K3RCSBqaXV/ZJ9AWUBPvNsJBYbt283zWkTroOEiXtDfshbCkvJX1C226L9k4x/xK
         /f9rIoPPzlkzOG39QxoaFutIzOxfgMKY/JtX8UmxH6sEChG42cn9pIrZI6KxwgmT7WsU
         E8KzRm9QCl+P9bl85NHWvLDRL/jG2sxjt6F5su3qWCF+B897QI8WD5WN0neKE0vBl2Sl
         /Z0CtjpNNV7PEBp/aG6RcDP4wpbEPihASYWYRoHv506dhj5+FSLKHsK5jdx0T9xo+FFN
         PJx5cbPQiJs7pBgpdkIVb5qzRRNCNbT5qfhxcRADJwZtnACIAE3+WVvi2WSwVcQ2Tcq2
         OzvA==
X-Gm-Message-State: AOJu0YyWoNahX7AeHqIAt9zjWqzROmfU9QBAkycry3Li1/6GLMv1SMyr
	FVT/7MGATQ8NGBJFpGOxxTdzzk3Lwy/NDsj9c3RGuEhR3fTW4a28TY6tqZlVWg==
X-Gm-Gg: AeBDieslaidRW3Qlr4pfC394dOcAtOneI67OkVZP3rR8HC6V7hryjj46xK43RkadmZK
	6SrCWIbNYcXMMVZ8tWAuNCIeUaQy4Ysi0jl5KjXTX3wmbhl/Byxai9Eu3GoHcWLwvHw/xc8hs0z
	tnuuejPIu6AZ7BlR0MCucuUKu9+2yFsGqYqRLixxE7/ccMkMxzYMVmAg67o/NHR6B9bE/yI31xi
	MxM5X8wsXqUxCGz7eMOVNyrQoADBZH1C3u4750LLfJL/Um/S312DQDvv35xgD14xMdlCgULV5PX
	eBqYOGLBoT1C/djOJFX58KXomiOCQj07SLsJ/ALgZvOvtwPXCdSiY1xw6CCupVjAo0LnS7qHyS7
	s6Pke/ZI+OO1r0jwpDRUAbN6JA/asYt0Hr7Iy9W7m87MVE9N5+ZQPc4Ht6GnS2RpK/6tyJRL06H
	ACyj4pEiFF7BUjef+JycDjwlEdw7MJRHwg0FQ=
X-Received: by 2002:a05:6a20:6a1a:b0:398:7daf:6d7e with SMTP id adf61e73a8af0-39fc943b254mr2407837637.17.1775718622357;
        Thu, 09 Apr 2026 00:10:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 22/22] libraw: ignore CVE-2026-5318
Date: Thu,  9 Apr 2026 19:09:19 +1200
Message-ID: <20260409070919.3968586-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126144

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Vulnerability exists in the function which was added in version 0.22.0[1]

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-5318

[1] https://github.com/LibRaw/LibRaw/commit/12b0e5d60c57bb795382fda8494fc45f683550b8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.21.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
index 1303c0e8ac..d285dcefff 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -14,3 +14,5 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 DEPENDS = "jpeg jasper lcms"
+
+CVE_STATUS[CVE-2026-5318] = "cpe-incorrect: The current version (0.21.2) is not affected."

