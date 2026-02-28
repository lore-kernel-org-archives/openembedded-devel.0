Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A245FEE4F4
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 18:29:31 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123719.1772300782306922374
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 09:46:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CiOwt9IR;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: gitbeam@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38709888abeso42037061fa.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772300780; x=1772905580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOf6i67G7vU2ag3JbfCdqRNZ/IPRN2b9ddhT3wLEQlc=;
        b=CiOwt9IR2x2vz97zIdXx/sDBntfM2pbYBuuiVlByP7u3+YAVzPRK7nEgGxbIsNqjE5
         fAX1YlYN7wbm7l9tGLgqv0EUYMwfMvzjb2vuaVY75wUsy6N7r/dfJKhfNzKyZq5s75pU
         iqPH6gtToSsXdQS40LF4SrH5MpqNHfjhSdXXXPnQZmadKEVdehgxM3HKGOSiWthepAv6
         Mb76C/pxpaHguFXuLgGMW/QUJeXR71Uc0/jM4+OntTwlcgCVeIwWXGOWFYUUU6ZedmL+
         AbUC7GDgDfiM/s12YBgBL9o1PVtx2jTyJbxb8Hrsz7q6wNHpmDRZKWVKCnp7D1+L+bNg
         zwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772300780; x=1772905580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOf6i67G7vU2ag3JbfCdqRNZ/IPRN2b9ddhT3wLEQlc=;
        b=jOyiJB9oZhJT6twagkWbvBpCzG3CwGnn/HRX1+B+aikj6/G69Q331SjqltJuy4yFsa
         eCK0XJyWu2QMt1cFOiweTzYHC4MZ0EGXHysriN3bOg8nRcc7qy22vR3BTEBWDMYtn2nR
         CGhCJ7wS1uPSPhOSfNsDmIQx60Ub2vyBx4pmz8BTDdmQqZgC+L9cyxTULHF63gqXmdsJ
         xuv1p1CIo70mQ7MSnXhUpY5lFgLRWymHS31dToqU+lZhB1ES+KVS/df5K4IdZwD159rU
         /pwFhzJt9PX1IZfK1O7FMVfSMp/rgOqvZRgwhLWn7CCGxUMgPnpj9+r+/ZgFAgQ6/ajW
         I1Sg==
X-Gm-Message-State: AOJu0Yzruj5J3P0p25sErLlJckKy0XKSUBvwTLGbSPXp6Xtk7xlYGyR4
	C+2JUnMoa2MaqZ2/tR4k+zlFyCHPH+IylellMcrTjv0Z7f1XFz3NKIxBfJ9rVFfagzWfXQ==
X-Gm-Gg: ATEYQzwisnHzNn/cR8bPWL+qKqGl1Y9/VYbZHdVicTRTaM25j2qC5kQ0+xg85vwAAeP
	vFPdWtec0ET43U6zSDNR3/OYs6KdlLttowkSs/cvkuFnL84x1yLDVIfHEE4AsQ708erB0YmjzWz
	NeZ3NaL2mBo5wtRYQMMGoUI05yRwYYXOkHDZKAR6pHfEZYB9waJz2zuFC8WM6XXeylun14nfzwI
	cyhOp39/KNG8Br56OOPTyPGdvr37TmUb2bW9Ikz1lNa1q+Go1opEsan+stjp4s70b+DMJouQICT
	GLIaVhvQ92LvLHknKtHAT8H5efA0MAcm9n5UmeLrKSZLbwbzuMZZ970pnBwpd/TcvsPsmzuuLRL
	Ga5NYDfcDI+Y3TWaV6MxQFHKuNerqND4KyAGzE9o+6YpMWCY8rBsAsP2efXvbHtuyrcrY9Rlei4
	6MSrBtIXfL09jBv1wq280iUKP4fZ//N0j9KZM796hxxnp05kJfvYo5X4xb42N79aw2PkROco3q4
	ekSyAY=
X-Received: by 2002:a05:600c:4eca:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-483c9beac6cmr124456815e9.16.1772300339895;
        Sat, 28 Feb 2026 09:38:59 -0800 (PST)
Received: from DESKTOP-SJHFTAC.localdomain (dynamic-077-014-022-198.77.14.pool.telefonica.de. [77.14.22.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f2f88sm284634445e9.2.2026.02.28.09.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 09:38:59 -0800 (PST)
From: G B <gitbeam@gmail.com>
X-Google-Original-From: G B <gitbeam@proton.me>
To: openembedded-devel@lists.openembedded.org
Cc: G B <gitbeam@proton.me>
Subject: [PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
Date: Sat, 28 Feb 2026 18:38:54 +0100
Message-ID: <20260228173854.111416-1-gitbeam@proton.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 18:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124782

Upgrade to latest upstream release 1.2.4.

Release notes: https://docs.ntpsec.org/latest/CHANGES.html

Signed-off-by: G B <gitbeam@proton.me>
---
 .../ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb} (98%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
similarity index 98%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 9ad97e7689..4f71cd2298 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
+SRC_URI[sha256sum] = "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
-- 
2.47.3


