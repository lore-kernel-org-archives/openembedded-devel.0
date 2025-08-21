Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A5BCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:59:44 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.149.1755791973749198143
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGToQZmS;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb78d5e74so176311666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 08:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755791972; x=1756396772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fs+oWn4AmN2152yPvnwZfxnS6kaxj8Mfh7S2LNTMlOQ=;
        b=WGToQZmSbba6o8H6DCEVQQusODJ8dL2+CUd789TNAELbfPvbXFk1VyqyU6pl60Adp1
         osZUZ9foEqqc65ut+liZCmgYTeTQPvEaWaGZklxKaXa6ZenpShlC51AjCg0JK1mho0LS
         vczqnojGZgtg03ALZSqqtoMQus7H7JzbNuJtVaJ8TC9e2/sB6HIj3qK9g84EUnYd4dRs
         9M67wUWMUkAdGCbO1MGtv29obFI2RK4Y2QRFspl6mnl4cznum2Gzx48fQqwEF1GySE2z
         XBVy0hXfaDrxWxfKLG6udTguY6w8yTCe+AQhxJoP+WFG9J0CChbF5MVb4hHn5XVQjB/r
         NGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755791972; x=1756396772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fs+oWn4AmN2152yPvnwZfxnS6kaxj8Mfh7S2LNTMlOQ=;
        b=bqKCLbjhSOzbUC9nzvzDz+mAqxm3ZqVeUhRtbxmKc7gwyMcAKpSxTK4EEswFVKB7Mr
         oElnqboYXWIOobIaAy1/TFsxFq5bcv8u/fNM8UjD7zLGZRMZdaAWqQeDX1KPLwcEzdPz
         R0jC3JqYXpQNmbe1pOwRzZarOjez83U3j8X6mTB9juMidAGM+Wl/wfxLjLKgJ6+Z0K1T
         fvnIzOiDQQ/nZxlMPpOByvKBCxTkqVOjz4XY8CJ9GZY516TnW9DpAmbiWCqqT0DeA8ah
         c5d8/O5KTlmwx/TvZmQ450PwYKDfjBD0LCfuiIYlGB+O6/OB+TfU/QUazCEe/xtcAih7
         /cPg==
X-Gm-Message-State: AOJu0Yx7ez5kENlrxJNw6MJAjJENCuzqxk7j3k9H7wdb6O9WI52PFrOA
	trT/BQbxuZiuks+VkytWyZHrwhgtR3/O104Xpz0VI4wji6M4wVuZyKeXWHMndQ==
X-Gm-Gg: ASbGncs1lYnVlWYQBx+0HftLgKbMzsNXZk9WVFlXiQINMkRXO/XCzYTQlXCBtIG5VRI
	YDCo4dpsPwIxUl475pRiY2wPZRfTlSyaoFlQP2k+GDE1z4MDen5PJsc/Eggv7MoImb6ly43jI0x
	RTkvx8A5EoS8r55HjOdnUWxVIMLIQ4+J7IbK+fEa6WhsvEOj8WN0KwDr1Kr184CqdSFBD07kRPu
	EVSYuwY8TS7cxo2gXNGIFQyltRJcj20ErC2xY3DGoDLz6jQZq3X/yX427EcbTOR3Zk+SEb9DHVD
	lApYwToT3jjD0GiG7YN0M2b/lkID6Ma7BQbJmiX6V6CU03z44tjVW4Cf7He5yIOWacltKNj+oMk
	KL1IEmUHNYcjTmBNDhpayvG2Ma/SQ+pnG4qCgWFb18fEEix2n7iPuJpBm
X-Google-Smtp-Source: AGHT+IGwVE9t0njh96P2EgaJyq6sBQaxLvtjc+6ybFRc2UouIUfgk8RT7uHw6cNcfIT+lJ3Llibs/w==
X-Received: by 2002:a17:907:7f21:b0:ade:7c6:498a with SMTP id a640c23a62f3a-afe079db247mr290741666b.10.1755791971842;
        Thu, 21 Aug 2025 08:59:31 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded478b13sm421812566b.71.2025.08.21.08.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:59:31 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] hunspell-dictionaries: switch branch from master to main
Date: Thu, 21 Aug 2025 17:59:26 +0200
Message-ID: <20250821155926.1312052-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 15:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119076

From: Alexandre Truong <alexandre.truong@smile.fr>

The repository of dictionaries doesn't have a branch named master. So, the
branch is switched to main.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
index 0ec426afb9..12231443a4 100644
--- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
@@ -135,7 +135,7 @@ RDEPENDS:${PN} = "hunspell"
 
 PV = "0.0.0+git"
 SRCREV = "820a65e539e34a3a8c2a855d2450b84745c624ee"
-SRC_URI = "git://github.com/wooorm/dictionaries.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/wooorm/dictionaries.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 

