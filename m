Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36083.1793161583802097880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tviFzxVJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso405362a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161583; x=1793766383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgHhFatbRtW33acQKC7ipwW7T/BNqa2AranbMop6hCE=;
        b=tviFzxVJPnkrsbCc2b2IbZ1YK76kn37kLURjHVCLsWBmDiur8Q6Cnh5DxWF9hGpMsO
         Yk0OwelRk6NkAhvk9dtFOv7WC5zDNFzeC73EkVG10Ijkd+goIG6oH17I5mX2s165rLyL
         xYd5Myxwq92APZs7382kixtO4xaWBPWsScHXPwXoPRq13xT2Z0k3+5E23gJKVkiwxjyQ
         31XDj5i+LTjNALk6gUM7ZJ715WYBiqnXK4Z4xfJImSdliDwtBvHFMkUK4VafeR02yrJR
         TNpsMqcIK2Y4846eX1jh0NHMXiVDc0IeY5Hz7qP9jzvjXIrHOsg4yLhMj+t7nmOcHOJy
         +QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161583; x=1793766383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgHhFatbRtW33acQKC7ipwW7T/BNqa2AranbMop6hCE=;
        b=xqZuBi+MiU6BTvW8ftVgCkevvUYOSVzhqGG+QZhtDT3GCG3FS8KUusCA/hRyJ6jWcF
         HvD3ONpn14QZli9gXxeufVMQMjhP1F+Zxn8RDsu5cYKqyzgpRM6PdofOg0wrAbaXFdS+
         wt7v9ySHFyVi1i5S5UmNbz1feTpuVdaKWh2QHv+3EtUyK+a7sap98SkhgX5KtX3DYsqP
         pZu271DSCTT4mTDVpY055mv89r+Y9mDmrWf4BAGVhlaCzy0PvqiyiLbMZoyf6WYm4agt
         UO9WxDjnWaWLtoyIyajyiDuterD0bm11VGib4xx8+cGMgHUEku1x7Ap4aK9czlPad1s9
         dDbQ==
X-Gm-Message-State: AFq9FYIvDjetkB88qYNVFh4sf2a2Ct/ME7Kze1cw5phiuFrBvZ96ngKh
	cPnZZVl0zD6fhcQteWBsgREAEUdx5+WW0SiR8MHDLz7wIbDxcIazArVNv7v7RQ==
X-Gm-Gg: AYBFou23JtaP2EwG2eK3e4FBsiqHn0FLZAI8OBD313bxQ7/nSu3jxLKQjP0Dafa7VGK
	BhoyxXQ8bH0RfCFVEvDMlDqt1F8sfJ9qV0dy2FZukxLggcm8kZEupkqa4Zokw2Ngz3miPKmjNEk
	Rtl1SZZoIr2hFwqKYUqTYko5glu8KSgDMrS17KANdAil0Ndz2MX/89h25Ir9sG74lkHriVqZAJR
	K6hY4oPJybp1rBsdpyT+Cp4gCbb0E4P7cyUYuAWqpFjxHUL/LAO9WYYIXv1Nj226ZTOuK6wHGsh
	LjsYIzXVMetFZV6WtzhMOuc/AZ74l/w1Jua2AutXz2sHh3k/JEaD/TZlsM53ZhWIw/z6wH6c8ls
	nDALseIHW00nUhxT0tKOcac91H+cAfVGYLXHMejC4JhWzehkWV26XeVQK0+1WwmvNl6EjuLex7u
	+gB9qqNdBp4cG1+LOFm+k8OAOVfIY/2u2zW32QNjn7f89KtJcg0eOFqD3oS6baEQBqQcr8c+Vek
	2GzvU8+fpECADXeCcNOkg1Kl1htM1kxxyiiXQNBYaBSQlqo/4Urm8g0DyIE3I/hlJ34ZDE5J/DR
	0TtiacmVjMwlC4/hhmgv5/bQ5vv830rqBLVs4Lq54WMsWXJp3GqEllvc1C3LaQ==
X-Received: by 2002:a17:90b:1644:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3ae580ae5f8mr691641a91.17.1793161583228;
        Tue, 27 Oct 2026 21:26:23 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 54/60] 7zip: upgrade 26.03 -> 26.04
Date: Wed, 28 Oct 2026 17:23:52 +1300
Message-ID: <e5a8e3e2987c4d9bd8f52b35fe843b5b1a55ef79.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131606
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.04

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1c45c216f647175c121e7b7f5fb19c8a042ed99e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.03.bb => 7zip_26.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.03.bb => 7zip_26.04.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.03.bb b/meta-oe/recipes-extended/7zip/7zip_26.04.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.03.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.04.bb
index ca50aed8ea..49437b807d 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.03.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.04.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "0766b733fe3e06dd2a7f9a3cfbf2108ac73abd17"
+SRCREV = "9128b80e3a471108678e2b3ec3c985861c8d7b0f"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
