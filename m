Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F141DC61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 04:07:40 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.548.1787890057932596011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 21:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fC642wlV;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66d116f0de8so886243d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 21:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890057; x=1788494857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fo8l2fgCfY8bPAshKz3aM+bnE7i5HmDsgNjKMx1ez7s=;
        b=fC642wlVo+FBK1U9X86vs77H8aVTgecBOZM4T+s7HRtpGLhpkk7B2D3gcGRS76p23a
         3aUTPm8YQSCL5zkedB0KKxwsJKksccsbMu0aRGv/iQLuEVIpHrbJ1IL4Rs2BJWH1k2Y4
         Z6wwiX3gCF0NzYLM1MyIKo3p+q4SnOFEmlD5n674q7BcwizGeo4q5r46cM0dJDbPONd0
         lG8skEMa643k/9AOCaESdlP0zC5IXRzX7QP3ANE1mrxN5XgUR3iInDEups/EU0/4FtBl
         Ke1o6CZ0CQzuQJNU944/lsH9destYLtb+Nhlm8EUQEoRsuyaLtTAeUWyVDv5hUGJc8xj
         xFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890057; x=1788494857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo8l2fgCfY8bPAshKz3aM+bnE7i5HmDsgNjKMx1ez7s=;
        b=W0pJ9dTVH46zqRw74IoS8ztthuBBCZ0cSjDG/JcYLt8SYl92FIycxZN3jaqv8E6NlR
         kR28QEcf9Wf+NDIjTqMg0aAUZ6fDEbtA/8imOocBr43sEyKKvUiLeeWwR4yt4ZlFuo7d
         fN/YrJtME6Ko3MVdr5RlGQUPw9hRvLmX+Oz3dHnHfV/y2WFubFzCV7tzQj51puO4AMLn
         yG9DxCLozgvG0clL5a/564a6PyX3NfvD/XHV9XCdqQxC+wb6tpTOKk/BrbCHphoIyZSK
         159DEW/C+ljQ7QxIREn63SxMDKgWY+t6GUtiCBtd8Oi93n9TC25GE/ZGWZWR/jIh1vne
         px/Q==
X-Gm-Message-State: AFuF++nq6G4Nv2CXNQAtmLULs6hC5txqF8JVEKRH+yVsa9h3V8IpXEXW
	SfEtkchLN37vqdLL7FMZnVA/G40+6RR2/HW62jqTKMnBRBnheX///9cPcr9k1vBy
X-Gm-Gg: AR+sD108V9qQQZjZI4EFWyOuwRgt03JYRkDh01xRZiF2VEyLr+mLYRaMNUxniDn7UQa
	By9HmZdE/zFetsM68VQLbt6LZ/1IHxwN4k/r6+kOTPu6syUB27HSi+gTh+9e1FLzw8BUbUwIHxA
	quoTbJAmOcGmp5OGdccfM9Ym26kyReL0RVW+qhzUQsU0dPUZwMHIQ7tF309BvqKOX/loFdQTSNW
	0THKiAJZgpmTjadPyAAU5ueTMMDO5J6Vupf396y5DTJkCcUPo/AAnKyGcJu3chZK0t4LNqns5+U
	8i8zQKL0yE9a0t91J73kQxa4SQsggVjL4VFzN9fHN/LuO/2VVBusYvllYQ6QNFfGtlakeQkX3eA
	M+MbQ+lxGqsDxu6bg0VyqPnmvh6SgbOepCi33NIfnEiTgt0JQ/kKi/p8rdii46o/WJ+SqULLCXA
	v/J2zR0JiuAemiNHYw/McW0bYpQ9+Q4coMzXxwBZDTio8ZNciXUZDYVlVE8dJRiyThpwv6isCa+
	Ylz3dpWeTd10IVlrtctWAUJzV5hgl9K5RB1dAvXNPLlfrhjbOFev26+n9dEUHfv7aA2w14/rTt/
	B1XKTOAk8pU=
X-Received: by 2002:a05:690e:16a0:b0:66e:3f45:b7fe with SMTP id 956f58d0204a3-66e4c680f5emr1086377d50.20.1787890056675;
        Thu, 27 Aug 2026 21:07:36 -0700 (PDT)
Received: from localhost.localdomain ([67.7.72.170])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed163bcsm275050d50.16.2026.08.27.21.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:07:36 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.9 -> 8.5.10
Date: Fri, 28 Aug 2026 00:07:14 -0400
Message-ID: <20260828040714.618944-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 04:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129556

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.10

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.9.bb => php_8.5.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.9.bb => php_8.5.10.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.9.bb b/meta-oe/recipes-devtools/php/php_8.5.10.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.9.bb
rename to meta-oe/recipes-devtools/php/php_8.5.10.bb
index 710d5b0506..130a98f634 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.9.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.10.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "703c082ad9d2946ac647f3596812300d2c62b360d2f31a999021692a9b39476c"
+SRC_URI[sha256sum] = "d79bd4f3a9248e5cb5833766ba0d51cd35dd01b8727f23f30bcdba6fabc51d3e"
 
 CVE_PRODUCT = "php:php php_group:php"
 
-- 
2.43.0


