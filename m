Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B04F433F7
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:49 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6951.1776318708158336083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UzwmEprM;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c55e3858cso6337576c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318707; x=1776923507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgFG2pDn/AJy53joIr9hPueZHYxypeKN8zfZtb46RVg=;
        b=UzwmEprM/Tft6sCSV30/L5c5Dh3CIWbJF1BmMsGU7FEJbr2kyyF1OK3D0hCJ6UIjfh
         oYyBL9LyuVOavXi1kxvR/f11CJT6At7IfLnV/5JFgD+7iIC7z5GbIXkch2wu4QQHPapu
         2aq07eVmI9TGiV61sqHv7T5HKvN0qx93/nDwDvHovsuAq3aEa2gno3W3h42WG3v8L9Ts
         2lEgbdhZyx0/+TyBS1y9sTkRuIgFfaNpQ3ZPhpScvt1e6ievcyI5Cl0wQ4vyGnjlQBJ5
         QgC1jwNdjhKRogC7+IXr0Xkt9FVsVNfSH0g+/RetV1RtvZ/9O3UJC3lNa3XxU3tSsn05
         /pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318707; x=1776923507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgFG2pDn/AJy53joIr9hPueZHYxypeKN8zfZtb46RVg=;
        b=cQRGEGgq7MiZGpNOqfdnyMyqiAy+qG6gF/F5S7pyTD2rj112X5H/Xt99kP/X+LhZHE
         2DGNHg663N3Ye/rmqVp5dpc1bVHjjKL3hUNKnT4fBnAp3hmqKYh80g50ti7qvAqqASfD
         fIlxQN+rEr/Tg7APObGD+u6dtjF1W37L7OfUxZmLf5S/mf07OMOp8HmcSWqUs5XbJ8SH
         bJXcn78xpZWpYU0doF+dULpXUo/TaFgro28mTEvha//q37sWGfJU1ywco1kbUMlqzCys
         z03AKycADqVNm4QXpKPO2wI9mZOnynmkenX0R8RxbIVj/04tosB7azhBbwWpYV9htmH3
         k6gQ==
X-Gm-Message-State: AOJu0YzMqpbUGGFQQeKeQ6NFNt4dRDSS+qQhsMgnyoVuYCPsC8yPtKJq
	qQ03ZBhs4UfXpHGOoDKvLIx8p/njt3onzhb5Dxqej7WnRLyr4lh+kroucs4/D0oQ
X-Gm-Gg: AeBDieukAuexHTSysMLpbpCo+VE5uKrLkHGieeSeGep8rZP/WK5M1BeSLBR2JnBNVC8
	H5O/cqQWv9bfcUyr3B/oshcZF8ShYBGd7ebLq3pxM42yNB+seeWno1P5XCvxx4MSUHEEkC3QCGY
	cWRJ4VlQVYvAcGF1DTR5/i+xGTHf1XlAOCZRfV8QuG4y404YUERJjEgreQ823kEXYEs/mmMPf68
	CFQM6z0rKf9I8gap8Jr2ZUZoDoG760sTT/Vp/0frWVAHq5NK02QwHKWe9sPisGmrRIto+VZZ0rX
	JEpD9uLEGJ+mBvTeRGaveJTbGetTwa3V82L9YUt9TD/tUn0RnKaVj4gZq6Ws0jS4hGbre7Pn+a6
	YYhmAZUwdIR2wBvPr47GmLEz8ssUlxRoObFFn1vdQV4sFYodKTaOmXKUUrKqHdITvC2GM5X4Wwm
	hVKgXs+kQkOyuNmBbrQUYI35nr0UOBNpfvfKRIlkpB7MXGpqkSUyGFLOZogVWlOyQoZWUE8pYv5
	zRm77HIbap8ij0xOsvlwrXPBOU/5/Ka3iYtg/MRk/dcZTZvWmhGTEMf3zQ5gRvxyLMpCWiwCSVY
	THbHLAnNOdd5jjJYqj1/e/ZAgF05Xtha4l8Rmq2m8NC0jNNeqks=
X-Received: by 2002:a05:7022:6088:b0:11b:f056:a19b with SMTP id a92af1059eb24-12c34eedbbamr15136694c88.18.1776318678609;
        Wed, 15 Apr 2026 22:51:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 15/18] hiawatha: Upgrade to 12.1 release
Date: Wed, 15 Apr 2026 22:50:55 -0700
Message-ID: <20260416055058.792189-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126397

- HTTP/2 support added via the nghttp2 library
  (credits to Heiko Zimmermann) — noted as experimental, so
  testing carefully before enabling on production servers is
  recommended.
- mbed TLS updated from 4.0.0 to 4.1.0.
- ssi-cgi removed — the release notes suggest using
  Hiawatha's XSLT support as a more advanced alternative.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../hiawatha/{hiawatha_12.0.bb => hiawatha_12.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_12.0.bb => hiawatha_12.1.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.1.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_12.1.bb
index d6fa250cb9..8299e58263 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-${PV}.tar.gz \
            file://hiawatha.service \
           "

-SRC_URI[sha256sum] = "57b61a6d2640e72601d5ba0a063d6f1639613b910287871216f7ea06c75bfb96"
+SRC_URI[sha256sum] = "e93e5964e69d98061d366fa4a0ec7b5d33d3e92e6c02efa8b291a79c646006b1"

 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"

