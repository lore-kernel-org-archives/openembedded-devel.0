Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B445CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 16:29:32 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.web10.393.1758904170475487939
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 09:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1qZ6EWx;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-633c1b740c5so1337558d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758904169; x=1759508969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8abQvSbK250OvBfVKC2zSyVLEX/yAstb4qpinjL4nuo=;
        b=d1qZ6EWxX7F3LtotcQAnc0G6UXOSK/QiB6YIUre8384fWbnmrTLHlhQ86qv/EjTs0c
         CHYLjLwCPRJ4VVbg6DwYL9f9alxbWwdqb2a99POwFFm5quZfXDsB6yrNh+Dj7CPqA+Pn
         Y3zeBntPWWQp/LSqKrj4vVZWrXZWoINOdcQQgThMqEIIZYzO3X3VlCZjh1n/ix967GRf
         OOc5SVwH0MZfa0/5LQfEe+HiP9x4D6hnu82189myboTNO0EHXCCxqVmXkpMr0cZMm0MI
         1fPq3fbwD6clIRNGTAOc/Sweq9FdYZCFi0y8ZHqfrFhDDaQ7Isto44iB40zb+a5BOZfB
         SS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758904169; x=1759508969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8abQvSbK250OvBfVKC2zSyVLEX/yAstb4qpinjL4nuo=;
        b=YIL71XWa6CTA0FcMtVwRhfTftnkuT3t/onRzQAFzxfwVBEdHs1cCI9BtL9HtywXlEl
         lKK3bTGHFXHvEDXGofbdvsyqfaRzy+9k3ljWJD5yNMWkVjiK0iUjGbeyf4LqnjfdOIo9
         7rBccmh/sRFAD0kYNZ2hc0Lo26YgpQkVk8JKoxNys4F0pUpZkskvPQhomaEAXqj62bs5
         G0MMgLO4tKQpIfDgjG6C06M+mmXqWcleUolhawo0PB6IvFJGXYRE5IjdWtgg7lbWsXFw
         ngD+QmL/P/XR4cmJbnQRnLDcGR1Gb1fXrlpOXwSkLIKvYgYhiKT8E8wbVsCXFZACKnii
         7V1w==
X-Gm-Message-State: AOJu0YyWBEhhSn0tCMKJBVeo6B4KT/K2nt+7Zl03kyUX8fmqSkTzzgGu
	jHUgQfGeVpDjlb0VRsBG/0FfDv3Hlgr/exrGBvAvayvDotvNSIqTju/mgaYeIg/6
X-Gm-Gg: ASbGnctfZmEq8I0MXZfejHgBUy1Eq0bEL7Db6id6Z06InSnj54RRm306SiTvvV5KCR8
	t9FMhF+JkhFXa9lXfB3SsSSz+lNcBvrITzhWa3GXnUDuaVCyO03XSSsaGxcrPegnPE0en8aOhon
	JdxvGu2pteRLJMcPdsZ6Yg/t7QhJTvU5vHD8gwG6q45lFhVf9D19X3iHOdBXtCYsui4Z0GoW/1U
	4RiNCTqrUT3EJcUNS/ANGRipPylOYmJGdPg7UHW95s+eL/qHBXFmxon03GBb0TzXZqF2DY57k4M
	hH2EQpEJ15RvKhVJy4m6oYsEpKIZAOFnUhIR0pCEpZ6e6fMk661aiFX9qRcx1ebDr0/Ei6SNX4g
	6EVhMeKp+NBf8UrA8u5juyRVXR4Bb
X-Google-Smtp-Source: AGHT+IFrz35ZsmNsXMP+R3w26dygR11McIHA8kopt6Xend13vT00rnigoJAEqav1RF3n9pJBtopQEg==
X-Received: by 2002:a53:e02f:0:b0:628:df16:3193 with SMTP id 956f58d0204a3-6361a802804mr6916343d50.24.1758904168862;
        Fri, 26 Sep 2025 09:29:28 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-eb383929b93sm1469899276.21.2025.09.26.09.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:29:28 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.4.12 -> 8.4.13
Date: Fri, 26 Sep 2025 12:29:19 -0400
Message-ID: <20250926162919.563408-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 16:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119932

This is a bugfix release.  There are integer overflow and memory leak fixes included.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.13

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.12.bb => php_8.4.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.12.bb => php_8.4.13.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.12.bb b/meta-oe/recipes-devtools/php/php_8.4.13.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.12.bb
rename to meta-oe/recipes-devtools/php/php_8.4.13.bb
index ecab93b822..527d825189 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.12.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.13.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "2ebd5382eb090d603087da649ed21de64b079616bc9a02abbc532b89b17e3468"
+SRC_URI[sha256sum] = "85181ddca7b3e03f148521b043bd62411950d468c667db6400479f1b10812194"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


