Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07075E7AD66
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 16:35:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.141137.1766680518800557992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 08:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fwutdQ6R;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so6433775e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766680517; x=1767285317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubWa8PHUEcyIPkaZoPBF9s4fp84qOpFalnjqP3gBDhA=;
        b=fwutdQ6RbTYdPSd4QhrYt6nR3KQb5XsQL3IY1Mi7byXp6nXLeaXH9yu/EUwRhXpCe0
         Y4bVHWPVbzUBDjP8tSiX/92ee70X1Y4wxHCjMuqy87rIhqYdQIU1fBUnkOp/VCkRA6ll
         o+PLKdO8zOXDqMarK+lsDWG+Mo41CpPZ/BkVEeyBoGS2xiw3VSXjKu51FWYyGGd+u5fB
         2QRMSIRibRDC/FVg3I0UoaQyqsQkE2IaQm3tFffisPW/zrFHWcDm1SxdHDchqQ31k3L0
         +ypp1e6nUuorHWwluleG203bIGiIEsBiWXLaSUHgCuTEmWPJLGeSAfNLt25oq99sPvnD
         KRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766680517; x=1767285317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubWa8PHUEcyIPkaZoPBF9s4fp84qOpFalnjqP3gBDhA=;
        b=mLOMqOZaO5qJBi9zwMk9O2dp1FJFS/4W6V4od/sZnQydmr1L7HlQIHs5+UHt6nnKlP
         WBtb5dLdjwJKoILDVyY7DHsQXGaePB7fTNCN3QtaD2LDLiWkz2ImAXvWPbANmX4WKRAZ
         XSnT+Y7n7ZMIJSWOZUfYxjIEkxblx0EhFwxmn10CU/+jZyvo5u/4chXJvKNe9AOYldL/
         oiRJCcKshR4pf+g59AfbzdT7+hD33r2wOjgln+XvOR4mQw5IGVWndT3IObhX4zzLUNZy
         v8EZr30N1fxTewWEF+mvQEogOQB6X6PmyWGvzmj6GFyFkTkiT8xpTiIH3LYxt3jMANMn
         iFjQ==
X-Gm-Message-State: AOJu0Yw6OoSnVwkjfiHJsgD8XcTPIn/1t9yWxEG/d0TdpBQ1wIxJFTIk
	RwPZUbl7R4zOpuujl4IPXZ7yeejnqDoqg+kFIQ1CLHlBAZ+3tCbzwBiKY6vfbQ==
X-Gm-Gg: AY/fxX7UL/58wZAFB/utLecr0kl7WtBwYK51irECKIjorlwNhFLEotT4h44qMDDQrUM
	wHkojuNyjWzfVoxQV2wjd5O94ukQlvuZX3frF5hKBK3hD4JznSGd+/S7Vwl7vWqELYtZFdlNt0v
	xdy86K/3juIvt2CAvtzJpOYK9yi6yXSJIDXnA2QWYtIqpMgXuyFrl8ovHUtFWuadp8Crt6tmx48
	u8kjdwbTWphfg13ZwuPmwTJyO2J89m7lDl2f5vEpzSvm5YR864mntvVS0PKjqdlASxMB6HnKAZB
	4eqwfkyCjDH+XpIteVUBPPRRaUrPp3ObKs8fwHTLhqgaHOGNg2e3tgxGpTKbEbyD5OHoNWMcjRy
	+056c9Pmd+KB6UhvoLzOOrIXfgnTMQr9t3qCKCYuY6TUufCaENsr22DhRKvWbGZaufOw93zsrLp
	6munbttBRQ
X-Google-Smtp-Source: AGHT+IEyK4SnHsFHcmJlxHXYiH0qOgSVu5CabMWhyuQFFZI+NTD9+6UMHi0CUTO4jWt1+yQXbiXa7Q==
X-Received: by 2002:a05:600c:3b05:b0:477:6e02:54a5 with SMTP id 5b1f17b1804b1-47d19594d77mr208088345e9.18.1766680517065;
        Thu, 25 Dec 2025 08:35:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm393937625e9.15.2025.12.25.08.35.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 08:35:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] tigervnc: ignore CVE-2025-26594...26601
Date: Thu, 25 Dec 2025 17:35:11 +0100
Message-ID: <20251225163511.3087783-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225163511.3087783-1-skandigraun@gmail.com>
References: <20251225163511.3087783-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 16:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122930

Ignore the following CVEs: CVE-2025-26594, CVE-2025-26595, CVE-2025-26596,
CVE-2025-26597, CVE-2025-26598, CVE-2025-26599, CVE-2025-26600, CVE-2025-26601

Details:
https://nvd.nist.gov/vuln/detail/CVE-2025-26594
https://nvd.nist.gov/vuln/detail/CVE-2025-26595
https://nvd.nist.gov/vuln/detail/CVE-2025-26596
https://nvd.nist.gov/vuln/detail/CVE-2025-26597
https://nvd.nist.gov/vuln/detail/CVE-2025-26598
https://nvd.nist.gov/vuln/detail/CVE-2025-26599
https://nvd.nist.gov/vuln/detail/CVE-2025-26600
https://nvd.nist.gov/vuln/detail/CVE-2025-26601

TigerVNC compiles its own xserver, this is why these CVEs are associated
with it - despite the vulnerabilities being in xserver.

All of these vulnerabilities were fixed by the same PR[1], which has
been part of xserver since version 21.1.16 (the currently used xserver
version in TigerVNC is 21.1.18).

Due to this, ignore these vulnerabilities, and just mark them as patched.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 89704f421d..9fb7abf8f3 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -89,3 +89,11 @@ SYSTEMD_SERVICE:${PN} = "vncserver@.service"
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
 CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
 CVE_STATUS[CVE-2023-6478] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26594] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26595] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26596] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26597] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26598] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26599] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26600] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26601] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"

