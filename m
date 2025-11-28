Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2652AD116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3262.1764361133915780420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jFCWJ5BB;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1007042f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361132; x=1764965932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qr51pApV/DtFGQ2RQZeUGTOnmlT8G5cHFjDs263J+PE=;
        b=jFCWJ5BBKmu2oUk3w2V8eNlZCSp2IGAgcIP0nBq7tBlGIuBXPcd9xaZrbv/Qn25EXR
         2m9PwfOHaSCWNrP2HDSF3I97sKXHoMi/TaiusyQD+4culpWdVCtnDdYZ3YjBgJYyhTiT
         nkxixNLQFugDeO7xSY7E4y5uEprtn7LzJwvJuir+IDlW25AN9Rd3FpPfkjeQ+bo10vaI
         +Ls1BXHJArFVqzFX8PZPYG43Byv1MyJH1HnzhXYZ/Ie6+sbCaoLx7eai25PhWiJCihJ6
         k0MD13h9MAbOCjwyI59CtcqqcjdDWrtPLv7S9chB78EQKqjBrXuyiDxUuNcT7eXYwcHR
         C/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361132; x=1764965932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qr51pApV/DtFGQ2RQZeUGTOnmlT8G5cHFjDs263J+PE=;
        b=oYFQCnSYQYblfonmd7Q10m79y7VRgA5F+CASazHjs99oP0smDHDjiS0K7hEjpFGSJm
         vkc9q3gQo5qQCjG81KLMU/BwKOFNIxn2Md/y2c4fYKeZHNWhtHEFf3xBo7foTXzO3Rng
         JIJlW9Q6ag8Dfy22craAGMNrA+GzsKfyw20chYhsCHQEDXGm2EnFUThSsUEFA5T+yhYr
         BdhG4qf/CJnj6hNPf1QrIIC3poi/mkzO0HMVRaUvPbeK0COyBrJL/OVtspjJvlpjK1pN
         7U9SvFwhScu59JaPYNJUqQyygxEun6969AUNPGJqQaulfrLvFE2oDXxyjgA5s4osF8A2
         jSvg==
X-Gm-Message-State: AOJu0Ywf01oeC41hi2iXlSQn4ErHug1zyn3LONtcG0fcPlY3sUN+MXn1
	UMOz28/WHLiaFknEjK3miTiy8CojIPXF+mTW87M1uuIRe6sN4RrCTQCkGfhq8g==
X-Gm-Gg: ASbGnctNf2VClAKU0ua03k9HFxJ195Z8IBZ5v+XUim3iTpnk81qnWvYHk02moJ4wJ5c
	BAMwxSSkw/zXXFFThsQh5XYFyhFAgjVPiaMoswwyXG5lw4VFVr/JMZzciyagmAg4jeS0As0qd1L
	8aWLS0dVkz8gXjBkeOFkYOt/fETHnmpRmjoj4+OTXqsfRR4RjxiR1uO8/bOaicaheE8ao+z9WAr
	S7gGFoBpeNYugW2+4bC0mSOdVOCzkQKBd/pNHy1H3lU5mGjIyEL4pic3wsNE3JR8QIyEs5QcRUH
	4mcULvHmkEUFNNHQ/9H0RqNZJb2TowxD/EubU/Ohl77R9rbbZoarm+0TzezpqXbkdE41X+IiSsS
	tJ0Ijvc2+BwJIsDbWBuh2FI3YtWq1gxcXejTOKVQFXe83HBt9ZBMBHSSsXKd5dafzv1TkGyXL0t
	RxYJY6N7TzkWOAXRvwHuI=
X-Google-Smtp-Source: AGHT+IEJCVcBlMWbQFzm9HdcAtiCJUVSAZJaeyvM55OCNrA7JZv7Xil2qfa+3Zh0LwoDwDcjo3n4zg==
X-Received: by 2002:a05:6000:1447:b0:42b:3131:5434 with SMTP id ffacd0b85a97d-42cc1d0cfefmr32155250f8f.38.1764361132163;
        Fri, 28 Nov 2025 12:18:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/14] libraw: ignore CVE-2020-35535
Date: Fri, 28 Nov 2025 21:18:41 +0100
Message-ID: <20251128201845.2578315-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122142

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-35535

The fix is already included in the used revision.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.20.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index c7e83c05f5..51057f97b7 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -17,4 +17,5 @@ CVE_CHECK_IGNORE += " \
     CVE-2020-35532 \
     CVE-2020-35533 \
     CVE-2020-35534 \
+    CVE-2020-35535 \
     "

