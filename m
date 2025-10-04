Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665F7CAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 17:30:08 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.13790.1759599000426346425
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 10:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HaG0dtgW;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso6111440a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759598999; x=1760203799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DbfDcWTmDtMhXhXpOoVY6CiQY4vxXORQTYrY1Q32z4=;
        b=HaG0dtgWkBxyL7DAjPzXTRSTsmo97X3Sp1NDkXHWAWvIDTIaeE9h7Stbaxpqb3PTVN
         9oEOGb6dpme5xd+dWRVeleBM85LBbAU1uKSRExbGfT2xVmLv6WiQ7LuHAIyLcmD/EaQ8
         P8pY+Rqd0WPJFb2Bh+zcH3qzRi5v0C1N2/jnDCjy9kPp1rzf73p0WPCTWdBGp2NUYk+t
         LZs3M1S0ov9chRyLoTWytPQ9HYUIwkdJfzuW/hBBNR347jXzsPfSCPkGMzt64L78hDQ2
         aLslSEBw3w34Wq4cgMDSY6XSI4DPKegwknuaKF8fpTMPVAPj4XPzIzSxLSv3gDkoD5DT
         NJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759598999; x=1760203799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DbfDcWTmDtMhXhXpOoVY6CiQY4vxXORQTYrY1Q32z4=;
        b=bfxW7OlrCWbgLhV7oiVfgnjbi3nCRbOgarqom3ORRcN1m/k8YaKK/NcpaLSN6bvsQZ
         N7rQXXuFtYH2a6QGA3Hwc92VKBOTVE3cUL1OKH26Lz6Z3eoaqPSdEqYAXTLWb1+jqh6v
         RnXf3gLdDdBG4lo6PgX5mfdtQuqUio6JPL9RnDH3/XV9ELQ25jfbN9o6b+ZiUIGJJkeA
         jTu6YTSOaI1sCdrRpVWvWYMpT7NbgGDaNb8W8WGbR+YGd7hjoez6U3pcxLRmf9iVL8a4
         Ck6NoJGdncA6owMpfUmfYEZBcYs8iEYPh6q3UFt14W/ufgxssGPxgDP49SUaOelIOj0H
         U3Pw==
X-Gm-Message-State: AOJu0Yxr0NRg8BLeEqJ0lFs2n5hi3GQIb1W14p+iMV2LnuTPDiGYFMh8
	n+TpRgqcnZ0A5luapvkSTL+dXQAxSuQwVP8ETbZFH1gBNGkTFtY2M8kC013kkw==
X-Gm-Gg: ASbGncs4vZXaAIVHtUE5Oj2v8bJLEvNiKYStffq/PkqDXGKB4o6GlsoWGckxjc1L2MX
	bcZPafgmvQt1K/1ibgQp6lvRaoP8REkBPZqr6lw1+BBaHIZY8yFPNRmTBvIwkIxfT0XbiajUgQf
	/IoTSrRarFG1lPGZAcuKFPEVeRqiw+TveVuhRhjJgMriTeg6FnfGYtmFpUYZIyfW7QucQQVTUqR
	O8BtATiDLTznpxKAqH5ShTVonHy7r+iQWZ7UPxpP3OoYKBb8Wi6kkxUbtcC8X5B3W2q3xgJ5GL0
	ByQYMwyAyJGWVKkGrfgXfNrxx40HvxyGGL5leZIjn70lIFpcDDraPVyX8XPQBCOOMLGiKEn2VHn
	Cizvvw8gSfeQer0hvXSPlCG0U3dpUmOkw9PEzxF4LoUdzfEQTfTpwufo=
X-Google-Smtp-Source: AGHT+IG/ldQgaohp33We269PFVElp4AKH0xx0fYZ+JraFN7lQlQnUwPqtdqXi2VgTCOOxSz9l0lr8w==
X-Received: by 2002:a17:906:c14f:b0:b30:ed1f:894c with SMTP id a640c23a62f3a-b49c3f77bd6mr910646466b.43.1759598998233;
        Sat, 04 Oct 2025 10:29:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e78242sm728327366b.35.2025.10.04.10.29.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 10:29:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] ace: ignore CVE-2009-1147
Date: Sat,  4 Oct 2025 19:29:57 +0200
Message-ID: <20251004172957.2072820-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 17:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120228

The CVE is for another product, for VMWare ACE, not for this one.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/ace/ace_6.5.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.12.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.12.bb
index 6c68aede03..31389585fa 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.12.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.12.bb
@@ -40,3 +40,6 @@ do_install() {
 }
 
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
+
+# The CVE is for another application, for VMWare "Assured Computing Environment"
+CVE_CHECK_IGNORE += "CVE-2009-1147"

