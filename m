Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD9BE63CB9
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 17:06:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42802.1769360790555710542
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 09:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bes+C7bX;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso29438305e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 09:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769360789; x=1769965589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIFYw8pjB1HKiCiuzVhb8usFBlk0FMISGKYz9NLj2Xk=;
        b=Bes+C7bXvzArOsz7ovyEI2wsyWRG1euiB45X5+2V3D7alCLfC3nNGqIL76XHuU6Tsw
         el1cBtrX2M/QW8MRAt/vkpSoUwJuP2NiSv6etZ1RBkky5lZgFO/kgwx6XeOTe2f7ZwLv
         f3Q6416Kz3RBKeSFS4V05SCi5bcig8A1qV7mmI4Y3bnO7nkZnwrQhznWJxRVolDCsWSB
         rt7tq0kjnhKyryS2LBnrALctMIl/EdbIj8p6KI6BHpPvV1mZSM7HtTrG5IC6roEZ/sv3
         P8ZVem/Y2gfJy9P4C17EfaaoErQfpYnzG8xm93w5mQJs0fI2I0QET/TlCWdsCfH41TuI
         HhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769360789; x=1769965589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TIFYw8pjB1HKiCiuzVhb8usFBlk0FMISGKYz9NLj2Xk=;
        b=kHt8pqE3C0rPE6ZXmdcISdeCu7GzBvbd1/S9kUGjmhn1JGp+/NKbYriwxHszxENa3u
         Zekvll8KYleioQ7jIJvPJLKJTS/UpBtDEmYQUQuAeh1w/fSbavIHd37Wpy3eDjMbkBrE
         JlhE0JxUO8/NlQXfjvgVygNfHrkmIBpg9srlCxTUQYvjhvUtN69ec/VGJHou/rH9sNm3
         sYZ0pV++DbwcKsMqPVyB5ijGQ5C0W1tCVPZrfmp4rsZsl76Itnf/QccAh3dwmb9DwyZ1
         i8yQmdQxXhb9D24ViR2COpWVbf2BE5Ig1P8vOy4eX048U9LfhYxKUlhThYuN77CgYoVK
         LYAw==
X-Gm-Message-State: AOJu0YxL2n4VYx7xnmc2RUBBy3pJtyH6J2z1htlx+V64/+HVkOBr0L+3
	FBjiqqNF4h/TlfGxpq+hceE4YGslVot5WC3FGVJsL6Rgy/TSJ+RjVC/vApflMA==
X-Gm-Gg: AZuq6aJqkut7a4OhCm45+5yPsz0yRrHMFE/3Hv8rfOdxXY+jsj2zn2zO+BA/VQ/dfWU
	hFLYXqF9pgfLDIqnEivptRlCv9BBAratteRjG7/pGqqnsyztEGl5ncj7AL+Iho7Ctl41tXkurw6
	Y297zwYOLkSUypwsRPj7fDZtXuLGeQQnxe8/BkUQnRqKNsJtZUrlVxCpXzima30DLzMw7t4ttHt
	+MLqKRRidzI5XAIRR7NPWvls+YHYOAy2EIrbPinDFBPSbkd3Mj7qRfqGSjEMahLOAIeRb+JZgf5
	DCvGhi7xIQNf/ajC3DXmDYHl0yFxgwZfWD4egY3wZINWqXDc+brJnWTcAYpxGcbjGFcj0n2+I0Y
	tR4VOAVEBQ0zGSxx7K0duJbdJdbQaqEWlQfGkEKfJ7O3PMJ3xnkfdS819SFnIZ2RTJOHUUeVUiA
	ufdShVJRd8
X-Received: by 2002:a05:600c:5309:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-4805cd407fdmr35500055e9.3.1769360788830;
        Sun, 25 Jan 2026 09:06:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm23431414f8f.0.2026.01.25.09.06.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:06:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/6] sblim-sfcc: fix SRC_URI
Date: Sun, 25 Jan 2026 18:06:23 +0100
Message-ID: <20260125170625.3178555-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125170625.3178555-1-skandigraun@gmail.com>
References: <20260125170625.3178555-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 17:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123843

The old URL is gone - set a working mirror.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index 733cddc88b..dc6e12fd80 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small Footprint CIM Client Library"
 DESCRIPTION = "Small Footprint CIM Client Library Runtime Libraries"
 HOMEPAGE = "http://www.sblim.org"
 
-SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-cimxml-Include-sys-select.h-for-fd_set.patch \
            file://0001-Fix-implicit-function-declarations.patch \
            file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \

