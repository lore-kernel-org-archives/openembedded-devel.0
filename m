Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E59FC6179
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:44 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21540.1767430119239111098
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 00:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZNQjpTLJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so20325705e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 00:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430118; x=1768034918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/XbN8DIxsWhzBevWbutP2XRXRkCTytR4mRuiZ6vcoM=;
        b=ZNQjpTLJQIFvs+72IYlDgCxWwD/K/BLtEsbni+43SdsMI8VEGOHykC0SlkZoDkQDaq
         i1KhgY7wLKZGw6mq9dL12AUvGA2q+BRWG91mo212oD/DSwQC5K+LNaBHLm/C4fzQ1msC
         j68j0IZgYbdd9nhfkTu7ohBgW/1ZiZBvmdLjmkC7xGqJRKmNf9yKlOTF24DT6BzotOXq
         /pd3/9JPJzTGXj6rMYWj17wsChyUSsEQrC2paweKY41raPCk49BZOWsuCtVh3zw9vkJ7
         LqNTtia+14vw7iHbYTAvJ+/bFp9fj/GXhGQYizAwFVaUCj3mjqTLcQtm3otmyKkkHsGu
         2/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430118; x=1768034918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O/XbN8DIxsWhzBevWbutP2XRXRkCTytR4mRuiZ6vcoM=;
        b=wpH8lAEj+3WsDJtoQLFpl3fjgFC5ATl+gHEKCEXTA5FTT1p4cmRhmvfK3enG2akGzA
         5qRHO/QCCfdzZy8EV3yGaTLMbcTEE/QTLZ5Z7YH1SsEmzUWW2evKKU2xD3HXK738HQop
         wl1ezuc6+wdsJHopXhkPz/ZiNCNnwZkoCl8w/TR0bnLKBjkA5rIM2Ur2lANt3EUJuOai
         6TlNKx2kaytcqXN77ItgqQoXGfczisyiUxl5rv2uF6XCnmAnS3BTM7WzZONwB4dIwqX/
         opHoBdJZFPxNOVWp9PU4Fmp81mH6XJqR4mCCmWuOkiKEg+Un97dfqxkvchM6aBUGyxn9
         u60A==
X-Gm-Message-State: AOJu0YyQuG2T9zs21yuCD1GDGXwN+RxQKJ7vPVPcutTJsqKc9SHEurNM
	qgckA7wmvEIG5ucIUR3Sml7FL7JVCVtuyiy8oPC4CLg3H9I6xsp0mXd/1Vg6AFiN
X-Gm-Gg: AY/fxX5FpXi0lZ+iR5NfCBqfjghsQ8SfcO3nGUYF1OFwg3l64oXqC7Y6NJsHMwbDgpz
	Ezbuk3eCzyCS59e8SblctlWqokiQ3rMqT/1rXPhKL9ibDrftSfPGKCoyDnU2ig4A8T+TwddJ83V
	mvhX7xxT/DMNjHgJDjT6tyb2g9ROD66FeTye4RDe7x1ERyd6qy1PkGjQhUFLO8yZodXTsCqqFgA
	bbaNjVvHI4zw2GEbtHB6iuWSwEcvdxL3IroIF9Tuf3RV2IBwECk+9n+8ZGSNy3jCxIDu23oHu8n
	RCK/5IlKZqzRfxBaLavy/Qkune0yfGtpSrG6SOvrxE1ScTDI5f0xZIXovJnr6pFOUnvoB67C6yf
	8dBMDG1LgaaWgn4/Bh744hTHffy5CKTQziLYcea8ClIhP4Jt9SPye+1e66b70Iw99RSaM1FLYh8
	IxdIDPk6fV
X-Google-Smtp-Source: AGHT+IHbcloNuMpxszZYiSsMw7z+gZyDH+YA/D39g8bQgG08+X4HixaIQ5OblNtJbGhertxqwVZyVw==
X-Received: by 2002:a05:600c:1c21:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-47d19583142mr648052645e9.31.1767430117568;
        Sat, 03 Jan 2026 00:48:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13ed34sm26491645e9.2.2026.01.03.00.48.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] sassc: ignore CVE-2022-43357
Date: Sat,  3 Jan 2026 09:48:32 +0100
Message-ID: <20260103084835.2022951-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103084835.2022951-1-skandigraun@gmail.com>
References: <20260103084835.2022951-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 08:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123100

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in current libsass recipe version.
So wrapper around it will also not show this problem.
It's usual usecase is to be statically linked with libsass which is
probably the reason why this is listed as vulnerable component.

[1] links [2] as issue tracker which points to [3] as fix.
[4] as base repository for the recipe is not involved and files from [3]
    are not present in this repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-43357
[2] https://github.com/sass/libsass/issues/3177
[3] https://github.com/sass/libsass/pull/3184
[4] https://github.com/sass/sassc/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 576b84263bac4dda26d84d116a9e7628a126f866)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Kirkstone has also the fixed libsass version (3.6.6), the CVE can
be considered fixed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/sass/sassc_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-support/sass/sassc_git.bb
index 9bb8c76e87..12e201a3d7 100644
--- a/meta-oe/recipes-support/sass/sassc_git.bb
+++ b/meta-oe/recipes-support/sass/sassc_git.bb
@@ -11,4 +11,7 @@ SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S = "${WORKDIR}/git"
 PV = "3.6.2"
 
+# cpe-incorrect: this is CVE for libsass, not sassc wrapper
+CVE_CHECK_IGNORE = "CVE-2022-43357"
+
 BBCLASSEXTEND = "native"

