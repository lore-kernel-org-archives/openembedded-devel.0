Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B18CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:35:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.40913.1761590153261931448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 11:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aO94MTVc;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4710683a644so42025015e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761590151; x=1762194951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUcaT9A+lzF4/nIWLBOWT9P9jzuFKCSUMR93y2Jhj+M=;
        b=aO94MTVcwBML9U+HaTIENoR1aXby1TdLtpIas/CYl3KqhXvZdSivle07F+Y1P4rTCc
         0CqRcbt+EAyM5U9XMxIG/KzFqEhbhVZmin8dj1fwtyeEv5e5adiyOHhx0WsO/iuDQBCH
         0HPpg3m4bZm32ao2BcbRN3UwRNab0lF97Mi3ubpXrrXdHlkKsh75zqYKtUlPfvZx0eGF
         eWTmA7aT48x6JboMH3C0rQY9RzGJF4QJCrI4u1pDpV51kfWt7W0sFa5LCLoySB6OZ7G9
         XZ364K2oxwlt2oZZhwq5rmSTfm5b6diZoV+QYanG2eX1yhM8ZsHW+JPXmfe3RefTNsrh
         rR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761590151; x=1762194951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUcaT9A+lzF4/nIWLBOWT9P9jzuFKCSUMR93y2Jhj+M=;
        b=E5OqlCJxSIjG0WyvZUdis6sZGvcdosbW+vUglyY48oic4Pf8jvsTmoG1McuMhY8JUX
         xPAcz0llf49D2mZYY+bb5C9J+ZGOuNBw6f9jOWANHfXpbmEq7Ao4Wr9xUKhVzFYCVejc
         iFKliZMNt7W8r8ejOXvjlb+nIwVQDZ8T2Amu80O+VbDa4MBbFiPQ/Svw/fwRO7sQ5nXb
         LKGc9CDtXzBqBKqidPfR74XmbxZzpCdB7BKFz7D4uTzQmqYDY87Ldlebe6x7bPl5RzBm
         AVgvYMFNvBcLpcp+mSnA4ysaD/9XNFfE3eBIvfS1uwEUVaJq5leZWtvytMsZZBIjLJVq
         bsxw==
X-Gm-Message-State: AOJu0Yy0iVhUZJe820onoLGziUaNvdqCUNGRFZuLTvXvWeu9hG8R6XwQ
	5unLAuzQIG5+JyT4O9XNsAQLE8+ymv27Kq2Nb4BN4ArY3dA/C1nGjn6ZA3atQA==
X-Gm-Gg: ASbGncuIx551ya+rVmToKm6LOxgJL3g5wwoNr6eFnHMw7c34V5UrGR8l2fXBqVSkePV
	Jz+SgbevMnjTb+QgArepyS0RkWvAH5+T3XeIiGM5vzehI5n2hv/QJP3TnnA/FawjI5xtWVWTEwU
	DIiOZkMNbQCw+/ny+Rl8+4dNmDiB7d5gHQ9XQc37IofI2gOAZYkPUet0AH4ABtgYpUvbF2MNwZh
	cqtPwZMq5bvHy0vlWlSCFBG5avEIk4ckp4/hnRwP8Mhcy5Xe6tB3Ar7qv0YnaIgeupSLek30Nii
	zbmp8nM9IuBmO9/UMWPzLu3Acp6Gh2iHhEfuiDQYwqbOKFHJkQ0fUXu/m+82/PLtQmLNzG4m+xI
	g4KojT8dq4FLAx9lmh7PWP84lZGEFVFy9MBD05FIWF6uxDLS0GwQ1o3Y7JUs6w0jmwTTz+idtXq
	3US8E8fQZMBAlxD7IoOf577B1vUX6plYLh0Ha/YNl8zjx4iR+OFumX7l4G2wbT0Aeaana4kaC+N
	tnHrmR6eAmkYWQUdw3dFXJmvjBoQdmqiVdf9A==
X-Google-Smtp-Source: AGHT+IFwqqdt9fWXqYHzyiICH1VUQHv3CvTxPvwwgnW24SnXs76PYFGY9+1c/8inahy633Gok27Ylg==
X-Received: by 2002:a05:600c:1e0f:b0:471:665:e688 with SMTP id 5b1f17b1804b1-4771816aeb7mr4018715e9.17.1761590151188;
        Mon, 27 Oct 2025 11:35:51 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475dd02cd5dsm149250985e9.4.2025.10.27.11.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:35:50 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH 2/3] freerdp3: fix typo WITH_ADD --> WITH_AAD
Date: Mon, 27 Oct 2025 14:35:34 -0400
Message-Id: <20251027183535.2058067-2-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027183535.2058067-1-marc.ferland@sonatest.com>
References: <20251027183535.2058067-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 18:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121053

From: Marc Ferland <marc.ferland@sonatest.com>

The WITH_ADD option does not exist. What was probably meant is
WITH_AAD (Azure AD auth).

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
index ace07798e0..ae87bd0925 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG ??= " \
 EXTRA_OECMAKE = " \
     -DRDTK_FORCE_STATIC_BUILD=ON \
     -DUWAC_FORCE_STATIC_BUILD=ON \
-    -DWITH_ADD=ON \
+    -DWITH_AAD=ON \
     -DWITH_BINARY_VERSIONING=ON \
     -DWITH_CHANNELS=ON \
     -DWITH_CLIENT_CHANNELS=ON \
-- 
2.34.1


