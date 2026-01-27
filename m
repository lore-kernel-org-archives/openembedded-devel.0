Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F42D2F01F
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10166.1769518882151440015
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghOdqOEO;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327555464cso3950189f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518880; x=1770123680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKNZaPHwrC8K8QLtmpfDGKWFrdvgIpyvtT5z3PyZA9k=;
        b=ghOdqOEO6SF0NZ/v5vwo8JycnHiqpmdcmlPNCYEO4j6dgR1cHXW+JgqyvMd8Gs5FjT
         2JJaP9xfF+4/pdRL9liXrV0YuIkehztjAjWIckbFEIZMst5yZj5JBoRXBcgQuo6HvBNW
         5F6/nMIm8tJqcXHgQViuIqcyYOGtWf4y0t+80DPpXXvaofD88ctzaKJOniqlxIte+10g
         +sGOr1DV1BLc+NaqPsN3W7YGzWdasa1TLBIhC6x9JsHocvNPxEixr2coCfDD9KbhNQRt
         E2t+WBRpn8k8zeXAEtseQyD5QH6Ov3zraaG9txBE38FRce2b21nPM9piS29JoBfbqQoz
         bg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518880; x=1770123680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKNZaPHwrC8K8QLtmpfDGKWFrdvgIpyvtT5z3PyZA9k=;
        b=BnKubYN/fQ/3Ofw5rc7hbV4P9m9e23ZhFtzcqS68vrs+ccZqVAXcTPgLXtikbdzwCP
         maza3OKa9MU3VeRZIdwz8o2Y1dRRUkarpEcMtFzAIW2yUsI7lh+g+PD9PFSTovK8mRHD
         vwq0bz7Oy7TsbKDo0NPykcRMDfTFolygtE35nwQ8ti7LI5DXN0BKOWu3/ZEznGl0P1Kc
         ZQbLwfshGAvrWB1cyRJpRqoyR7sE3X/MGm/bbhtJ5NmP0K/GzCl+KL18z2iv2AN46hZI
         pmEg1pAHsgAxHi1zzVqGt/AK0goF1XNlGRg9QMRLXPx0SyRN+utM6rGsCc5uQgENkB2Y
         u3xQ==
X-Gm-Message-State: AOJu0YwLsAjkYB/RWLu+THhZvWedM1bvHPs2cH/y1gHo6pdFP7NjJUE/
	B8nax24SjDBSY+SfXv40bBav2X3dJQbsXyf1bPSeGQByWScYS/hycvXyOk74Jg==
X-Gm-Gg: AZuq6aJ+PEPUOn8qr4kbDmflyyXX+zoOa99efz/FmzStpnbYZf+CG8YYnBok+gwhN4K
	Z1nqZJpig0apXBDrJQUqhlcwnEaMiV9K1P+W3/9YxGFbbjwQA8PMzgIfqED6aM+DdUc89IOX1JB
	PklfaJ98wB1bX6Jy4+tzq3wLGHOZzPBo3t87sd8FaVfwOS28vIvZxqzOSLkEZJeqF4QkB1NgVMa
	zbPCkuvkTsrzFD1XtVxJ4GqTNoq9OVSeU8FJEHKRdcpDLB2zxoysLNdtL8c/++CZB5b7eK28lVH
	DnlmP/9YIyw74Uaf6V2qHWDga63K7u9VpIHdRyCSRqr9Wy1LkvsBTt8hQEmVEciXa6wFPlvPzkG
	ux/cpFWgTOZygykxMuDUfG7wFnfp9cvrIIHPN7o8xOKxzSvpYz9VXhVUSOEjPgYwZ5OY4Mjz3T2
	TmxikDYmSx
X-Received: by 2002:a05:6000:26cc:b0:430:fd84:3175 with SMTP id ffacd0b85a97d-435dd0bb419mr2670987f8f.38.1769518880177;
        Tue, 27 Jan 2026 05:01:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 02/14] tigervnc: ignore CVE-2014-8241
Date: Tue, 27 Jan 2026 14:01:02 +0100
Message-ID: <20260127130116.1902238-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123942

Details: https://nvd.nist.gov/vuln/detail/CVE-2014-8241

The vulnerability is about a potential null-pointer dereference, because
of a malloc result is not verified[1].

The vulnerable code has been refactored since completely[2], and the code isn't
present anymore in the codebase.

[1]: https://github.com/TigerVNC/tigervnc/issues/993#issuecomment-612874972 - attachment
[2]: https://github.com/TigerVNC/tigervnc/commit/b8a24f055f1a29886d8b18bb3f0902144dc5bd14

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ed8a1038d227ee521cf2349d9f7f8e37eec6a64a)

Fixed typo in CVE ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index e3e2b6ee16..fa0661dffe 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -131,3 +131,5 @@ FILES:${PN} += " \
 "
 
 FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
+
+CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.11.0)"

