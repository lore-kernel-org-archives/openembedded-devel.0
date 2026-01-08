Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDC4D148BF
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:46:29 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1638.1767858381190948696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ch0pm2Kh;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc3056afso1521089f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 23:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767858379; x=1768463179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0EDuBPGXyouZ8HXrrDK8bjVUiwGSbz8oCjSOMmQIN4=;
        b=Ch0pm2Khy2I1CwhNR13wyhp0Z1n2yL3Z8GayHYNMbyNbdana5yolmND/XwwYJOGRQi
         ZpwKnDcBLkQ6ofIqhSO76kGWCr2ybQmAFSWBnap9u4aX0iGhY8Tyu2vr4+W733qQq9Sk
         KOaP+/oPPkCfJTU7y8b5xS4RdY8SYgXpc2VkPelq2tGSTLaGmyUVlonmN8F10yczdhEf
         a3Xv/AQcpibnoZWMXBWv6kGFHvR7KL+4hq5isPIyqnvxM0Da1NXHw+iTDVhF6zGBTO/R
         fo28+DwdZCSKI9AqrFkVZU9cpE/xDDCojGFLJO1GuEjmEmGyT2+qRYX4BKh9Si9XBg1e
         tAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858379; x=1768463179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0EDuBPGXyouZ8HXrrDK8bjVUiwGSbz8oCjSOMmQIN4=;
        b=lERFqkJxd4lyFX5ag9unHLtx9CdqdCT2Fpj9HYEbc+Wlp7py1gVPb/bqB2lv0JoEU7
         SexWDPQObScRpEXVOHlaX2NSr/H22O8WNWsArbBsxhlJri0WU94dwLK8SGkj4Earofvi
         lwKL9Hg03mfaFekr0cc3uDqwYLae4HhurWnCgX0l/F6Dmd23HnXNKTvCkN1JTqez8AJP
         Btwb8rh6nhxNO4M28PQaeSUp42/oxCxysxeURnaHdRZehZW41+OOEDc6dW38c2u66JbZ
         N2+LGjbcUrEBy2wXvZOImhFGwdiPyUXA/xPWkKQQmh9YhvkvuoQivv+eMW836TargvCP
         NM7w==
X-Gm-Message-State: AOJu0Yy+Sw5YIVOOIvr2WAKsaZdQucVr8VsRoHu0mGUDHDHUrzy5hCrT
	wniqoLLJPV8QlKJfTH3MPmOuxtQoeXe5TwwYTLME1P2dSwiWttJligirJWUg9Q==
X-Gm-Gg: AY/fxX5ge4avb485pnOSvq0g19mB+cWmnk1Nwm6r8e/Yf2DQjTRIvQTKj+FL05didGH
	WEKBbesRqJcHxv2M3l4YFHVQ6sfwPJ1CngeDCT1GItsPD4rVzt66FaX5VlVVimLDsPsb7ZHy1qc
	o0wwEIt4oyKciT3lmgH90f/lQc+t7sOOZsFNLPupJsdFQQZlng992lko6XFak3aital8mPwFXx1
	n/K9fFVt2cPaXDOX2KK5OWI+3HogRb6yCyhvSii9qC6v8xJ/6hnbuxN6lCC9CwSCPIvH0Z8ElPz
	qOGl36XROmWq1JwGVr37Jvgw7NjvIYtbglWJ2Bh5PE7ibjqIihq9WwaxdjqS6t96D0kwN0Fx+Tl
	tf7EqQ9r4a1PTvvqGx4GOj7fpR2C+q5XvfYlWmpCQV8ogVj1hJJpsgrqXtzfM0eU6iTa6HRNu19
	WXnK8eEaGH
X-Google-Smtp-Source: AGHT+IFL9NcAtlH6ZSlp5zrCeFu+5QL8iYKB9DX8pMFjy37FBs6fFIjiaRmkwgmycSp0HqmlDsX2pw==
X-Received: by 2002:a5d:53d2:0:b0:430:ff41:5c91 with SMTP id ffacd0b85a97d-432c3765641mr5439952f8f.52.1767858379359;
        Wed, 07 Jan 2026 23:46:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm15200292f8f.11.2026.01.07.23.46.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 23:46:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] php: ignore CVE-2024-3566
Date: Thu,  8 Jan 2026 08:46:13 +0100
Message-ID: <20260108074618.2782232-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123248

From: Jeroen Hofstee <jhofstee@victronenergy.com>

CVE-2024-3566 only effects Microsoft Windows.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d68c56e1ed2adc8246a18424ed5d9ede5e8254a0)

Adapted to Kirkstone.
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.1.34.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.34.bb b/meta-oe/recipes-devtools/php/php_8.1.34.bb
index a734c2458a..86b59a909c 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.34.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.34.bb
@@ -39,6 +39,7 @@ CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
     CVE-2007-3205 \
     CVE-2007-4596 \
+    CVE-2024-3566 \
 "
 
 inherit autotools pkgconfig python3native gettext multilib_header multilib_script systemd

