Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01B1C46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6837.1702967267124050213
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOccdKLd;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3ac28ae81so18848655ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967266; x=1703572066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0xSsLubQacPXDcVjPmE6mbaFIxMRcjMcK8QEa3rI2Y=;
        b=dOccdKLdSNEhooMa4jN+FDSEk0F/U7ayQF+FQRjS8eXiEitH60xPnc1lPCXMdVN97i
         Q89dGRolz3RGPQ2fWsapvyHXOGb/T7vaw/Lhg5iAq9WA0TxdacvV/B8PY4EG5796+vP+
         GSgbVLMSmpi7ZTXfb6mLJTKIrpBqvnXRtgsQlMeouumkBJthxYRg1LR44IZwbNU9wCSC
         tutf4neHX9aK23rweiFH9Tx0StbYv+6JkNpNVKIyWRbNdHr4S7okJcz/CDBUnKDHBplU
         st1YZHQfAPyOQv9FvT5iaovMgFWn/jIlKxtgcVpHeUjbFmRjQDUUhkrV2Ez0IdGNFMG9
         LCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967266; x=1703572066;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0xSsLubQacPXDcVjPmE6mbaFIxMRcjMcK8QEa3rI2Y=;
        b=Gbjb1huzKr9DUmPl5P9n8hKHlMiZOOZchBF8lhACA17My0X9lopKFbcEvC6XFm0t/b
         Q8JCXfKmjNjbCHIp7qUX1LQ2wobpSiFfnRql7Vs9yfg3+zqvZNUj9ZcRYYa7I+iEd9/u
         lRyUuce+DnC3fdNmz3haiLc9Q5feiCzrAnF2jnLRGV8NXM8bKdUjpQPmk5kuAijmqT5A
         smFBTIgItrtZ6DojoAlHkSf1v9wQ9NJOfWogEzWOB4ftxxZrA8XeBvZZxQUNenlOvomS
         vVp1oDJ/4vscLQGH2h1z6EX9AqBYVz5BTN1AgYPYuiIwxY4MI4bbgNREdIWko41pQZoi
         5cMw==
X-Gm-Message-State: AOJu0YychyRMhvAoT8oRFAJvVKQjvSUYQKpCiVu4Q8A7lt2htirRVzin
	qAPaVFjDn0b1dEB6jdJd8e/N0L0XSVc=
X-Google-Smtp-Source: AGHT+IEJ5Azt5FpnB2CgNfe9pRw+8pL5tTVjLch2WDMRYpUzBYELnvnoUBt/0a25Gt7qoRfj14KESQ==
X-Received: by 2002:a17:903:2303:b0:1d0:6ffd:e2c5 with SMTP id d3-20020a170903230300b001d06ffde2c5mr21320272plh.95.1702967266467;
        Mon, 18 Dec 2023 22:27:46 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702600158-1901-1-git-send-email-wangmy@fujitsu.com>
References: <1702600158-1901-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade
 1.6.4 -> 1.7.0
Message-Id: <170296726553.1627685.1368327201546461522.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107606


On Fri, 15 Dec 2023 08:29:18 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> - Renamed 'mask' variable in ABNF to prevent name collision with 'mask()' function
> - Fixed old http import of HTTPStatus in _handshake.py
> - Add 'send_text()' and 'send_bytes()' to _app.py
> - Improved typehint support
> - General readability improvements, made all string concatenations use f-strings
> - Applied black formatting style to code
> 
> [...]

Applied, thanks!

[1/1] python3-websocket-client: upgrade 1.6.4 -> 1.7.0
      commit: 3723fd45fa9d3c95446375136af657a929c963a0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


