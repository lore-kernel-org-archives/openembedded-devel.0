Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741EBC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:12:25 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.57142.1749467537068456734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQCbbrT2;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7086dcab64bso34397697b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749467536; x=1750072336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9w4ReJYDzIjWKgGnIyFXDNI8R0LKOS2RdDjEzkGryg=;
        b=mQCbbrT2VgLn0sMoAsn1zQRk9YxvduIS5hG5B9dP0qfxLBTzGLqShEeybRrMcEkI36
         obe/0L7SAalktaCdxmqB+Eg7oMwnKdSu3CeQkYeBbHwc+O2ZpmQz0petYGwY/ZwuAHik
         atlpKmL+Wp1pBQevbfxBo3oAgULvy1ARi33toa6apkYKG3dowQ2JIOCupjfQQAEGd4qD
         +yKgqIiM+pdX62dDTRatRIDXDHZb44Rhjb7BjrktI+f9VU2TtHkXlBIJ5FWiHaLqv3hD
         ktYVdzBYEOi+rWZjTGDy0yiwpiynh7/NystT3hvuFDzu1s7e/XcCxY1rDfLUUV6p3Qtw
         vmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749467536; x=1750072336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9w4ReJYDzIjWKgGnIyFXDNI8R0LKOS2RdDjEzkGryg=;
        b=NLnTjse+vNepgalsJaI7gblXBVZW/FH6YSsvbmaqek04irFNEn4qGOOUYnl7mHkRpU
         /c92p5/SP9OGWBjK9yxCsFVcqaNhlTd9QHnqGvY99zl+HVrqfqfHzwAdoGpSx65hYz6E
         JWeSqtgfLXNeHppJRraon6U150x0sijpCG61XY8rfgaTimbG8GaDxPWYFxvvUo56GlNJ
         +XtSNYZygl5kHln7gIJeXv6DtHXRSwyQoh1hTOXufhnSN5+ZlnPBko8vCKSeYbq0gApp
         kQQe40dqnSctreHy5XrcbdUobHVTF3yZ02XpqJUow5aIfxIoaGBk7OnIfMTTvDf0ynmg
         u4bQ==
X-Gm-Message-State: AOJu0YyowGJlbT1dLsWthPqop5Tl86ijd7N8byUKrIv9JYai2SvPZR3d
	5ry62CM7GgS1b31FDCIDFWTJfAL7wGNj7ZISxcZu8KdOcIAdA6Sl2uYWco3cg2xt
X-Gm-Gg: ASbGnctTnYt49JL53ex/fKTEfDb6jAgbjStdvxFXi6YNfFqjNAP279yc+lPxvZbdGSw
	xNTPoZjkmrCaxOmQBaWSfBgqgOMYdutFNE4/4QJ0jYh02hzLmbI74mIuS/Vjcf17IpWfI9E40kh
	KC8YPucf1xUfqdPeSYmc6VkvrcgCE4s2iDshvYWQNz2Ca0sexBqiDqKDCVyqiTjbT6FrOVgThmu
	/K/Vktp08HtWQnKoNEzVVHT18mv7GoUQ+bZQ2FLEXyl+6B4x+nqIqAIAtJHK2sYM8oVJs9scvpm
	BpomyHzBcn7/Gig9dTbhqqUU9TrKtcxsXtgvWbczvqL6L+95nMPbBPREn2HReSkDuMY1m+krA8/
	PHUELh6sCwQ==
X-Google-Smtp-Source: AGHT+IGy4kVL4/wvV8txU7ObJMn/m5Y4PaEKN9QAf+CglLXxC2X5xjpCksoXm9GWTq+L+7wjXOUf8A==
X-Received: by 2002:a05:690c:45ca:b0:70c:bb54:ccfb with SMTP id 00721157ae682-710f76c4a02mr176969227b3.21.1749467535650;
        Mon, 09 Jun 2025 04:12:15 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a2e5aesm11979157b3.125.2025.06.09.04.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 04:12:15 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/3] xfmpc: upgrade 0.3.1 -> 0.3.2
Date: Mon,  9 Jun 2025 07:11:54 -0400
Message-ID: <20250609111154.1056573-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609111154.1056573-1-schonm@gmail.com>
References: <20250609111154.1056573-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 11:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117787

Changelog: https://gitlab.xfce.org/apps/xfmpc/-/blob/master/NEWS#L19

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-multimedia/xfmpc/{xfmpc_0.3.1.bb => xfmpc_0.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-multimedia/xfmpc/{xfmpc_0.3.1.bb => xfmpc_0.3.2.bb} (87%)

diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.2.bb
similarity index 87%
rename from meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb
rename to meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.2.bb
index 73eafeebcf..f92618bfc7 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.2.bb
@@ -12,7 +12,7 @@ RRECOMMENDS:${PN} = "mpd"
 
 inherit xfce-app
 
-SRC_URI[sha256sum] = "4867d5dd100fa42ab39ebde6c784ec21ee31717f1adb3f4da070dafb3848d96d"
+SRC_URI[sha256sum] = "4a58bd9e9c14c391943bb35b57ed8eb49000655da176639e7245da7286b07825"
 
 # Fixes build with GCC-14 which enables incompatible-pointer-types as error
 CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.43.0


