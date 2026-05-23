Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB2ECD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3032.1779512468828877905
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oDGuM7H1;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so3319265b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512468; x=1780117268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E98wFPxvqooEBBMacGE0AnE6Tbr+wgLuBuLuhrP4bg4=;
        b=oDGuM7H1/i4k/yPVFGjZoKt6L9PsjrK/zvqF+zvE8CYM7NpIbwy/PJt5iq7QzmsAFu
         8YPwBJLeqIaHWIaymDrrK+OnRJiwzSdho2YF+lc3ixQflhSl9hrFFykeDVYAHfoLACP0
         QK3IVENxNtu1mL6kcSuY0QviZ7jJgQ1jPdLv/6U52UjsWMxPdeoc/gNKxul6zktL2nX0
         23Mu4nPrUWgkaVCh7w3W1lvrL/0qMoWzXZZJnXVZx/Au8ia9d2HjhrVy5ZygQZUixmAP
         IwKfMtBZ9F/DaQgzDNbwJIXHbcF34M687XljuvTmkWHZiuGGt3Qb70T7xExkM/BN/g3X
         BZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512468; x=1780117268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E98wFPxvqooEBBMacGE0AnE6Tbr+wgLuBuLuhrP4bg4=;
        b=BNqQbbYZPpCiz2cdeGV082NoBLab9wmJZ+ES/emy76UKV6qPsFTV1qwxA7ZsOUZX5H
         twsc7GdZ1/JrikTCf73G1q8GhmoWz0Frhx6irvUXjxXIHV/u2b1lKrm6sibiS+Q3PjtC
         bUb8S/e9BtR3aKh4Z0Rji7DHVe/vtXEXi8x2UFNSo07P9BUhNeK8upy8+umIjOxpXG3L
         qcgF7HWYY2aqFoAZ9zaNzKJUAFjAzIkuyk12p2+UkEp7ENAUE2d5vSakpmQNwbrYGOVh
         2rSwYds91B+kCXslhupiAFBziDbYMFChxQa2fpF0n1nASnIi+Dl1XQAEMo1Ugr4H69AX
         KuAg==
X-Gm-Message-State: AOJu0Ywf38drNp6wqzBTKNIVQqittmSpwRp8FfhbzuSOOv/i4VnYOhPx
	FxmbphvpUUS0iCKuNNGeGe+tgwoVtKEOysr4uAP+rMzhBerVJeqWWU/HR5TWugx3
X-Gm-Gg: Acq92OEoynxC6f3RZbLN6PVIfSESn991G7M/ZEJU+kyeH8TiuQV0qQ07Et43iPJkKQR
	SOZxi1+0gcLxRJlSeB9429BBgetMC88CtNMs8+GsEFZj/16c+YxRvADLYH374kF1GNYqOMAl6AA
	tGMW8y/ZULS3B9jN9wn3iextu06IgK1iFUmH0CKuzSuh76KsUpV+U88aUQ9OCIBTx3l6Fyexlgw
	fbPEWg6NMPXm8LCR8QWhUeJx3hL03PtZd/QlKwTeAKWr50qtdbS/zkgtRx/dXbJgWhC5UUNV5R8
	/F5boheN5CMCSL8ZoZMgepBr5jyo+Vq+pjIATOiFxBjuVUH7Ko7xHKDJHvVPFagQrTfHqGzdRLN
	wYcQhL5LM82gMQnOsZ3JSBbVboXjKqgH8/V5MpTY3lG8UhJVUEUq4bSXlBNKQJ3HqF9xF94qNBJ
	dPGteT+nfjsmwv1e2O9MznLlF9yZsnXM79jvTc
X-Received: by 2002:a05:6a00:2308:b0:83e:ccd6:2dc8 with SMTP id d2e1a72fcca58-8415f5a63c9mr6472163b3a.27.1779512468202;
        Fri, 22 May 2026 22:01:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 11/25] imagemagick: upgrade 7.1.2-21 -> 7.1.2-22
Date: Sat, 23 May 2026 17:00:13 +1200
Message-ID: <20260523050028.848327-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127161

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 5063ac8e48bf20c7a889614410a3685e3950ddd7)

Bug and security fixes
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-21...7.1.2-22

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-21.bb => imagemagick_7.1.2-22.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-21.bb => imagemagick_7.1.2-22.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
index bfcdb2495d..dababfbfac 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "c86de049cefb8dd739e16f0e2fdc1ef8d2006d59"
+SRCREV = "ccf56fb3edd41389a02e4fe7a1a11a18f2b13389"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

