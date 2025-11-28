Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EE8D116F5
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3256.1764361130729063453
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kgCeVzwn;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b31507ed8so2031220f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361129; x=1764965929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRntGkGhKIVlSKqgqCXOQVHmcIr1ZFo3IIklKgUO8pY=;
        b=kgCeVzwndzKphmzDAjmQ6PPNUO/EofHhxrrAuE/D9p7YjQcGRFL6W4yWSqr53NgXj3
         EGoi+U5MnTIQtNZGqpRwXcYqiucYxRXeE7LrwtLqLnKHl92K23Ic8MFBpoytq2ED/bhw
         dKKI9y87nGmdxHYsyVrHpjRxlvUOs+mLSVZ7IhS0vRQALeZGBezXFnIf7Z7sCkExNuH3
         N2ErRc1my5RWLHUcVfxYtf3wUHamRSLNEIm9i4T4RF5vKAsUCZhxkjTdSItqzGen8a4Y
         jr/oW3/US0G+yAu2OnNfVuSi14TuK/wtjJSzMhJHefjIYRy0wQxCh0nnbNFjFziCJDP4
         V4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361129; x=1764965929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XRntGkGhKIVlSKqgqCXOQVHmcIr1ZFo3IIklKgUO8pY=;
        b=kqNY3tJvWhmddeWFY/zedkeqRGhr6ZhuAR0ej/eM5/CTnvD9pcVezPgMVkyMv43zzI
         dEOvQqe9pMdV2tqxiEZdz9UIpsaLOPMrcQkLqBJVLLe9tE2pT3ZquDJ9xmu27O2JE0KY
         uMuwoafVcWzur36/exkTUX6rFWI/oVG2wYszs/nBfabN7Qp9buHMezFt13/UcL3PQb8i
         ocIJBHjeuUKXIoxlIR2aWkjb7bHWiBgk1Rht73rN9CRGog50AksljaWZ8+Ox2JrlagGV
         VAuW0+eSAQRpuMGhTLZVwpv7hsZWwhZ0TaMVXfOCBe2ESsyHmg3aVRd4ZP8iq2DyLl6o
         OsPA==
X-Gm-Message-State: AOJu0YyF1xEgEjYXUfec/9Zr3TsAY9MUMh7HZVYYhbjJsdxkXm0J0uje
	trlUlVIv/dvpptcvkknHkafHc6FxUf2miNhEDAlgWyz28zs9zXcV3kvjezFFMw==
X-Gm-Gg: ASbGncsboUK94aDf2xpSWIjO+hfVYiySkLG1fMJMT1ha7ouURS7TP7fpAp9qyxdWXXE
	UNZCvrsNHlDApp7ojGKGBqVsvMc7nXWn5/3gNVYM/CXKb2nKRU6EGbMKy08fThWsAtkj1ECAPL7
	6W/9yYmU52IPes4n2J/XyrV/AxNrS4M0lAAP+VWZHBARTOnbNG4mVXjZD45O5sexz+PzMJNnc2c
	TxXJ9cWmfNg0gs0OfLlRbInnc0Er/8VLIcn4yO0On00rbb45QVfTPKXEvK0cHBfIuRlLIk9sap9
	kVxRdg5mk9lDm9Zw8pLnbXDd6DlQUSTff/VEYj6zfwL3BnOwnPMBqAQo06gyHfPdurW5FsZIL4n
	FYo8nO//HhBMYOjDosPnUnTF8z2sndli5KSssCYpOu7qkVCcBBuUXxda7r/lJdTLja95CC12kFa
	vDdZng8iAt
X-Google-Smtp-Source: AGHT+IFMxmnLj2d5a4MSqFLYDqfe21G1KdQSElBFmDd2lUfIOCDwbUB55E8+qltHVavs9xgv0egomA==
X-Received: by 2002:a05:6000:420a:b0:42b:5603:3d03 with SMTP id ffacd0b85a97d-42e0f2317e6mr18105873f8f.25.1764361128869;
        Fri, 28 Nov 2025 12:18:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/14] libraw: ignore CVE-2020-35530
Date: Fri, 28 Nov 2025 21:18:36 +0100
Message-ID: <20251128201845.2578315-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122137

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-35530

The fix is already included in the currently used revision.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.20.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index 1940864a20..d842501ab4 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -9,3 +9,6 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 DEPENDS = "jpeg jasper lcms"
+
+# The fix is already included in the current versin (0.20.2)
+CVE_CHECK_IGNORE += "CVE-2020-35530"

