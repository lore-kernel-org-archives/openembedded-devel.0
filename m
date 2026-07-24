Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92672C53214
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:36 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11215.1784859266599484102
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lovC0cdV;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca80d708489so777468a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859266; x=1785464066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRT+wZ8FkVjAG9mFYGz5r2PslorTA1U5aoWUVRaWJr8=;
        b=lovC0cdVXmnFcJDgELX3G5HliSKehSwXazkxdPXbw1Nf/6S8RTY3uleQt1VGB7Jv+B
         vVkXr3tf+WI/194W2di+tEsZ4ZFxuGmJqYnjQ5fTCl6gREGAZzX5wMXbLQUQJyb8jd2a
         lNAfZRatkNpemVpv6GyY7YkVBUprE55B/XmWBvQejFB6K9XMPq4OZh86yOpBdtpPzV7k
         Cz4/YlW4jT7N+C1xfdodm7lkrg4AOgFwtrLGXIv8Rr/kLDFCoum3++CLqhivH+ZyD1s9
         WIav72lPIdLMuHI5qRxJZIwpWFLfLbikCrhemHzcuge5YeGxFcUvxiffWgAQ7fdFWGV5
         OMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859266; x=1785464066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRT+wZ8FkVjAG9mFYGz5r2PslorTA1U5aoWUVRaWJr8=;
        b=tEn88KUgpUlZsRakYBsMBAyNRedV8VRgyc0BwTOnZ0Y1UY7fUNJ5iBCBiPUXUfFwIi
         pAymysFyyEMXh8Fe1Zyejq8uH4tX8C/tVswimQd0atCi9HyrnVNpjxRz4CZYFEhza4c1
         nHHFh6Xm/m2BIja9cXF/Zj9V41VTsJj+9VYmVnLX7QG+eFH9u4M/HqjwmpFwyVR0hxzt
         jW1svPHcqUgNtJz9rgen2EY8aujVvTIXnq9ZuvmkhqqJLj+OISuiDKNyNBo+FXK9hhba
         k3rkKYOqmbZY4100Pf0f9m85CvcTpLay2gPUHbwaehtg0QyfTsabvTHnBhD3egH0ps/m
         Kqjg==
X-Gm-Message-State: AOJu0Yz/mFnvddQ8vy1367rBUTJJGcgAWAE9+AP3ZExVmsPt+yx3sp07
	CfoGJPI/3GXcT/P3aa7cmbEjZmDJQdY6oTnAsEAJc+IykzXMc+jWbZAeybvLNeE9
X-Gm-Gg: AR+sD11qooCJArJHT2jGZ51jcM5PNMkH1E63KZMwhuxi6zdSlRJXYwpVWR7mPupOlcT
	FrahodVPFr8KU9+URYAnDlNEezBBOMj18cAdRfDAF7PsY1JM7I77Am/fBXylMEUL+Vkkwxn7/h9
	B4v58bF3f2zOxechb1YHkvWx7Xg+rxsFSBSK/5Vpe2ne8NuXj0sSNmEzgvMFVEb7QHQSAfH1681
	vnQK/jvkKx2pFtYo9Lf3ZLmPmkvCFwEolqPNtwyJGDR+uFqULbSOZpsfkI7LR8SJAZaGDMklHgS
	I/gz//cq4CCF1btiw2s+euvsUhz8Hd6k6MiYY4qkJITfUxItP8o9wdLw6QQVz2zPQbdphhgC8uM
	Mig2w3Zde7U77rnaRoGr8iit5H6QUlgUfIgqXk7ZO0YKlVfELlcB0Kc+l3nJ4xzlq0Cv4TSr9ja
	EL2lodM/QRmmkw3/M=
X-Received: by 2002:a05:6a21:6e86:b0:3c3:750f:3cf9 with SMTP id adf61e73a8af0-3c44c99fee1mr5613942637.11.1784859265918;
        Thu, 23 Jul 2026 19:14:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/13] cryptsetup: upgrade 2.8.6 -> 2.8.7
Date: Fri, 24 Jul 2026 14:13:58 +1200
Message-ID: <20260724021407.2840261-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128426

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.7/docs/v2.8.7-ReleaseNotes?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.8.6.bb => cryptsetup_2.8.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.6.bb => cryptsetup_2.8.7.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
index 6491ad4d55..c481c5cc7b 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
@@ -24,7 +24,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8004265fd993885d08f7b633dbe056851de1a210307613a4ebddc743fccefe5a"
+SRC_URI[sha256sum] = "e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da"
 
 inherit autotools gettext pkgconfig
 

