Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1A0CD8C8C
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 15:00:38 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17489.1780758031114560714
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2026 08:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mJ0R8ypF;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7e8b45dfb3dso37147517b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2026 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758030; x=1781362830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+qHN2prSDtQOaTKfkzf7M4kHdj+ndd5RNYhxtiaaCw=;
        b=mJ0R8ypFXnjs2G9rPfWJOm5jYQr57J7TSAPm416gAi28/t7QiG9Rax+Y0PCGotDEyU
         Z90wF3o09WirQIDC/C2em3EPm+Ed0xbU9RXrGoENXidfZSffrD2neGFYMQaSac7jpU2w
         qKMqcRMZwOnmVQQDvOgs+PDfCxfcAKmORJFc33VVGw3z5iUp18sT4Tkshw2Ariv3h9Q4
         /dt6WtARS/fikam+g//PIKtk3fWxxoshQWX/zxiaSh+mVbm3FgDXXBEBovVgVPUJO9JZ
         Psi68Zkghd4QR8rCqaw6Ms3VA9ugK1aKozSymDQYW6L8ite2F6Rgfd2+UaIhkOzNbF2d
         +aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758030; x=1781362830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+qHN2prSDtQOaTKfkzf7M4kHdj+ndd5RNYhxtiaaCw=;
        b=FcQhjuQSVScN0Gs3NlNlea0+0Bxw1janhWYwD/A7zmGZCFJpoZ1z6G4birK0kRx4yH
         uQvwv/gS066AaFINv+vts4oH0p9V9Aa4E1fccU/AnVMV5WN2EOb8QHbaPvXgpft2C2Mg
         sT82duAea/sYaMOhZJl3ocfzX/y8HqUUhrWw87d88BsxKGJLnj0xy2mP/X362Mq0cQxJ
         poZyp0zv03cky5dhPwDSKEkJu+HZqRq7LkNFFNXPfnnu09tBFa4qbfO64Fkwd238FLxK
         sTgyUbc68egfc9vJTeKLHJjURCcyaxXnbnCTmCaEp40tGP48cKK0e09qelqoWwUYPLMw
         N4qg==
X-Gm-Message-State: AOJu0YwRohpSwWfUrC4XfqcxuZM65kFaeF5zbMcOWyIQSe1RZaHcN8LH
	FeYjAAO4UHUZvZR/N5vnnAb+3l/I/eFQmnUovRK/NEtVNsJPhxp29hjYsJWA6Nig
X-Gm-Gg: Acq92OEudoz8dXGScVcUFcBuUDCRFcA+oBbLGW3tSROGwUApzTOX86Lwc+61ulqe2Gx
	Kci5SNxvzVldtOY4jiehyesKIm8cg2wqsFNTuJYgYFu4TJJjU05G0TLdsX1XoqHkrMuDjDL7U+b
	7fnh0VmiRrrWEyoox01n6xMOXYKQ9qtJtfDyn0z0TNrRTEYsmkBImF5ugg8ph/ohbOH+ShcZwJq
	5oCbqLsnlMi0z50JDel7Zpz3ARDxMBTDnvJIhsIkLe1OYkRrRMw/8gSOmHEQSl7KLsjh5Jn7/cQ
	m9kmtlex0nQ4YfMFBSMeFHJqqiChhjhW4VKiygpINUwIwkmg60/uiIDWZN88EnoRlX4wJ9CBcJL
	M0XvQIrRehkWcJYv0dqv54vOaRSKYNVOKdLFlL+nUxXaT7V2xJ23MT0PKY5bkiAB2egYwaOjBWi
	TYAVWwAvLjnzn5fx1I8L7QPeAmLuiP7E05w8podlbH3ONl1uz4p2KZrF1nnh5hgJndiyxrrclqm
	fegA9KzxQG6EHmyVkizOMvNZGs+pCwl0LV2cFI8lLXKLT1ufyU0gPljeQVPHg==
X-Received: by 2002:a05:690c:b15:b0:7d1:cd93:c8f1 with SMTP id 00721157ae682-7ed0c22f784mr80744647b3.21.1780758029844;
        Sat, 06 Jun 2026 08:00:29 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea2167b40bsm62202497b3.17.2026.06.06.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:00:29 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 2/2] php: upgrade 8.5.6 -> 8.5.7
Date: Sat,  6 Jun 2026 11:00:03 -0400
Message-ID: <20260606150003.1054238-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260606150003.1054238-1-schonm@gmail.com>
References: <20260606150003.1054238-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2026 15:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127409

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.7

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.5.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.7.bb b/meta-oe/recipes-devtools/php/php_8.5.7.bb
index db5bba9ccc..7c714c17a1 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.7.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "4457240f65f0c59a620920d66cdab1b12100a431e03ad9febe38b13a1b25957f"
+SRC_URI[sha256sum] = "4ef9355f784d4b320151eb3f31c5941c0da297025eedb97f2838b2ce73dd59bf"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


