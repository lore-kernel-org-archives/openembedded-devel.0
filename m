Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619A8C56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:21 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24795.1785872414624477900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C6fLIIqo;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84867f07d63so228965b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872414; x=1786477214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D43gO1m7C5YyreQKzAi0MXD6omcKNgW/Ub2eXjoBXMg=;
        b=C6fLIIqoMwcOiT28PQfxZpxifUq7EyOhiace430kTljo2c+do2dFLjBXtWfcal6Aum
         tnvY115TO5gjTanVgRUegS15bJdw5rY85EUkhIPtNTy+zL+wMr/jQFFXFCDM5HX7Iv2p
         fMEn58P11K47B+4Is6PjyJubrR33v+dPyurbhRKOSCfM86FwO5ymb8jSImJGTC8HVvb6
         aUdo20QZOyVFSfTxZYcATUaAeujJs1yq4BzaOorAb+ocBq5NxcqYU6Zej7x7Ex/6SVBv
         qgXTPJbHjLKphNz5A5sagL2ytXYDNl7x9iy9sk2FD/beMqXDFc6KxXcB2T7yG17XIwoE
         zBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872414; x=1786477214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D43gO1m7C5YyreQKzAi0MXD6omcKNgW/Ub2eXjoBXMg=;
        b=onlMcfl1KduAtCqVLT6UopE5oegEU2n8zWwEfYGgWAglMS62RJjywxtKqJM1S1o/wH
         gUBm0lxOY96sGo2PeBWCSPbWBh1LwyAtk61Q8HroVD3JDoZ0M9Q3fPI46JMbrtJIbnJI
         sS3W/fJKp4p3wbghfsgzWG/Io8C5R+DGK8pau8mOoCaD9VtD6h5jr/Nma/oh/+LqEXKu
         fQ9Nfh2qquW2ZyG0lXTA1Ph4llPG9kDtIuCS+pa0AqVKBBKCq9uisJJZRRtIc/PRF5X5
         GFrXWhZwmMV9xrfo2Szk7gW1yH6ov3A88BiusOCjntctfwB6wDbXjgQxSgDWxagZ0j6M
         mK0A==
X-Gm-Message-State: AOJu0YyJXwRd/larH8wk+0D1vuhooKwcOsQwEDReaWgb7DBtqb+LAfJe
	16Yv72is2zau3McN6XPIDJIwj2pAyr7yVua4jMbje97vld/Lja+16EFBrIs5WimE
X-Gm-Gg: AR+sD11t70Spl1254HpRJzMAF7+1Yk+1C9MsXfOARUtdDibmw7E/jiiCxFbVXqTfMx8
	XE9i7NEbHXhXkdqi/tYwyM5Hx+hqj7CS4PHGVjmxPQvzVmiqxme6dcFCHmehEzXFpuH3Sn1PsSj
	iXuWKeQ3IO9QZeHdhGna8+VG/gTa/COAiLYxAnoQyUWt/xgj5dXa9adQtgDzly2i6JR8xbqXlyV
	C6SfcjXQqChFfCZMfJweJwDeSZuGZDHw6MAmdrTXvHxroZCWB3/1mQhd55TVYKWahia6mCQv8Jt
	5tpCa2x+7sRrRBXxsKagqcYiCO5bWhdSuHvCS9aF4I88rTpTitt5L94NLOYFEIFLNAzwQpTUTWN
	yWQPh6Evzyj70aOiBeR9wJGQzu/uz5uVdi0ybmfiTv6xKCne3cmQ3TRrAD4+6AUFw1aPxal4kT0
	BPUquLv+OE2qRAsQxvizLp9gRII1qcD8jTe7vIXAIV0PqO9Nc20XzSgMEgUdc+P2QRrw+UZ9lO8
	Q==
X-Received: by 2002:a05:6a21:32a6:b0:3c4:1916:9d46 with SMTP id adf61e73a8af0-3cb85eef9e1mr1070522637.27.1785872413828;
        Tue, 04 Aug 2026 12:40:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/36] valkey: upgrade 9.0.4 -> 9.0.5
Date: Wed,  5 Aug 2026 07:39:28 +1200
Message-ID: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128748

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/valkey-io/valkey/releases#release-9.0.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../valkey/{valkey_9.0.4.bb => valkey_9.0.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.4.bb => valkey_9.0.5.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.5.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.5.bb
index 93e37a922a..d57aa6e1b4 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "1cbee84ba69b54c3510597965fc4320ce716a6f4"
+SRCREV = "a253513ac7ff5790ca119053f3c7fbca4fdaad44"
 
 RPROVIDES:${PN} = "virtual-redis"
 

