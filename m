Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5384F3383D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:33:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77430.1773758004244160519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 07:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WRW1HyGL;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so34324525e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773758003; x=1774362803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VA0iO0sqIh/zMpaMZd1Vw+ZSgOVn6k/QZLTah+FSfEw=;
        b=WRW1HyGLHzA5a0rWptLsDQPpVmN0/LcDwqdk9qjEuz+LeN9R/EOtDPcKvFFNAkRvPM
         30Y0P6tshRoh6Kl3SPfy9u9RYgy6jCc/ttaO872KksRI3oUeTWp7iMjlH57T9jOSNwQu
         nM3OZmU8aZf9s+/D2G37WvFPeKfZAqhwPU0S0cHNYYk6R6YfQgBTR6oY9g54mFxxkMVn
         hx65nf9eEWqhSjrThOwt/Q5uo3eSXAE0p9RBPRt/AE+SRNxkcmB5w+lFJyoxrCkEuejl
         ON4HWKitU7w7OcMpKGua7HpMn+cKbOAZgDRKudgo7uVLB9QRgjRJUVaJ5UwyTjYs9/xm
         Pm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758003; x=1774362803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VA0iO0sqIh/zMpaMZd1Vw+ZSgOVn6k/QZLTah+FSfEw=;
        b=NeFotx+5VfRa+7NgD8pJ1bchy+mhQBHoWqct5LAqmpMmketbUhRf7kzLx+Xm8HAxOu
         NQoZLPj4Lw2LgtAS3WwQMbMfJ0J0buTqSvtatSrj8busxYhj0MyrydDKGoxc9bOSN4YW
         swTSgK1LTYtcdC/dV5t4NYUAR4sle6NLKn3VwL8gPgo+T2khrpQalVW2x1RozeUDjxJj
         qPsGp18edzJAUdcLPIYydmIR2UIxpij1lNINHCYyDUre5+JbJgYszAfnCB5ti2gEJRUi
         wmr7ZKZ39dK07kHvvQAQyiu2i47hTPrWlE+gxkrBRtY87qSHf+3FdctgdsTlny/zoy7Y
         4Vdg==
X-Gm-Message-State: AOJu0YyMumLHe+LyZSkWgBEK1kpMTN6XlxUQ5uvcGzmmVH3DUg9toThG
	EuNMqcHfXC3PRx8DMs2cq3wBJylu3KwgbozpqStWTKX7KKWpurwXQOnYq0w9Cw==
X-Gm-Gg: ATEYQzwc5CB2oDjlLMOqVL2+427AxcHGOT+SrK5Q/87d7TgbQTb3+U/7U6+IbqN6hdC
	bXDHB1DUhD4UJAapz9dlwm3jsxEyl8ZKi2vTKUfYVEVvwwWck+1cmuGJnR40OP5XGCPh6I8bnoa
	CkJ3lLYld6opk0OPwf+yaEjppynIhvTbBSTZoSSDhZDBMPIzHtSBxpG24OaR9UzuwVIHC5yurln
	JVkrexomVp/SiktSwjkcKQZyqAeJFzoe66ihzNNjBe/sIAHE+QUhu3eGiOeY8jIHWFz7h6o0PkW
	FzbFcXFm9A9+bTrBY/0QS37zNhLelXYV70QZf8k3mgGl6FV9DBaN1arSsun6pgBkYUykxIhQFeU
	EUB5s3sQXbeLFaOcHSqC0xxnH6UNhdOZqcG+Uf883iivnDMhDch22HWfcGQ7CkNvnskYzmTtu8e
	tgIxRUOS4AxCgRAwUMFMV6
X-Received: by 2002:a05:600c:3ba4:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-485566d936dmr308194575e9.15.1773758002291;
        Tue, 17 Mar 2026 07:33:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b45e5c233sm16012288f8f.33.2026.03.17.07.33.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:33:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/2] imagemagick: upgrade 7.1.2-16 -> 7.1.2-17
Date: Tue, 17 Mar 2026 15:33:20 +0100
Message-ID: <20260317143320.2615598-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317143320.2615598-1-skandigraun@gmail.com>
References: <20260317143320.2615598-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 14:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125317

Contains bugfixes and a couple of CVE fixes:
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-16...7.1.2-17

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-16.bb => imagemagick_7.1.2-17.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-16.bb => imagemagick_7.1.2-17.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
index beeb11f970..989e87af3d 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "70563ce3759b7a55801900a11e69978a9301fbeb"
+SRCREV = "3f2f629405c62106d3569547c03634bc46fcd07d"
 
 
 inherit autotools pkgconfig update-alternatives ptest

