Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11965.1794070357639025230
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H4BKfwiW;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e3b22e971so834394f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070356; x=1794675156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEOrdgG268O8o65xX9NwZKptcWkwTstp+Avwu9zPgZg=;
        b=H4BKfwiW0CNxNWMSe5nG/aqEJpla7lgeoT/gisrJP/b3TCmIpRmACHC11r8GdeZwbR
         o3XiswJbSU3oha7AXh9uzBWIycU4tP9Yctz+RWBrQOxUjr7RbD4NGomdX5CRcplcLHeE
         4JvCx795De8CxWHN+AP++mTvFog9/x0BOg3V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070356; x=1794675156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEOrdgG268O8o65xX9NwZKptcWkwTstp+Avwu9zPgZg=;
        b=XkDTj+v74g10MzBKBDiazaeTo3rIj6HiHwbmm9Y8ctBjGPtSIqm9xDCSlWgJT14RJ/
         U7xqRbU57Itewz2Iz/qy9QZ1WDF/Zs8QfO9px++RmOjyhWoa22fzxgk8o55RK4fkyDIu
         +9UGLMfjyPg3cFkmjqxdU52yJdjqicJVq1f0E/I1ge+gJhe47e+xHXCkmHJ090p5Fc8l
         yPOGAtU0aiS1wA5FmzO0ZJqcSo/xOK6t1BbnPiXufxLfgz/3cpM8+BZcHPMnm50AL0Mq
         CsqUlTFtPb1TxZ0gGwGSjLr4bo9Im+oUgJV1cNJTOifecZXT1WK2YCyJp5HN6YytIrZm
         yxRw==
X-Gm-Message-State: APuU4Z+TYkRhgIXDdR6LPVhAyi7VsyFRHJ4WONnAPuVYs4rR0xUNdA9S
	KzivGMZrQ7jXT8Vd5XFwfeyz81pFa3OlePtoXiz9QOTb5iyNDr0zJj7bNPkcuOpTmUvgBAqLrkm
	sCy2d
X-Gm-Gg: AYBFou2m70EbF739LRv4lt1Knu9ms9OBKXqq/WAX3KMzYo29ZTRKYlDbLOeWn0eeAky
	v3bap/7+XqzzASAquaFZuGxTw4uRr7u5CtGV2q9HdyfBn/vvA/Mve/V/k4WVZkjCm5ZrdADSN7s
	jAfW0OLZdd+8YGish1g2Ttgi0ser6KpzfcZeeqJTYVkI+7xlbXIcj7PYLuhXgZIcPXmulhiBDns
	H4mnK14c5UxBpe9/6Xc18GwJ2/VJ5P4wYJCok1R4sVywuckkr5CAaUblJ/PNlOHb2SabrHTr4TE
	EAOOyVPIT00LlD21W0tD7k+oplqHw7NAoe1ttPK7QhCJUstaUt0mVhGBfW/E/6l5A6FGOteYCFG
	9IlvaisRHEpcaGlXJ9NxXdBY72SfwgIU4ahEBQi0v9/4++08JFKqOwvD5OExEyML4Wk/VdDdxsB
	uXBfZRA2DXV2If12nB6KWN5EhDxj4PXUQ44n9wLSChyaI3BnpGnDHfPbnRwHknQHNRYnE/Vmadj
	awSq75cwJrqn405zGrA5L/D/VM8H1/EKhxOWkJhkn3uJLyJICs4fgWceEAAMD4JmL+9D9iTJraQ
	vNnPwPucpK9cmyGg5dvc+oiLdZW+jUiEx+bhLdnbsCorC4JdjyyxTK+H2DDS1hCBVQ9ksdx6Cwg
	jLK7Rz4z2YTX9zgmWz3DequxIisEYjtexzOYEg577ztWypgP6KnDXuw==
X-Received: by 2002:a5d:5d06:0:b0:492:ea10:b073 with SMTP id ffacd0b85a97d-492ea10b327mr10702871f8f.18.1794070355891;
        Sat, 07 Nov 2026 08:52:35 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 12/22] lcms: Upgrade 2.19.1 -> 2.20
Date: Sat,  7 Nov 2026 18:52:11 +0200
Message-ID: <20261107165221.122340-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131997
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.20:

- Added a plug-in type for profile header parsing.
- Fixed premultiplied alpha on planar 16 bit and optimized
  matrix-shaper transforms.
- Fixed planar half float and Lab double formatters, and planar
  strides in fast_float.
- Fixed gamut checking with two profiles and a possible crash with
  malformed profiles.
- Recovered neutrality correction in black point detection.
- Made cmsCreateLab2Profile white point handling consistent with
  cmsCreateLab4Profile.
- Fixed UTF8 buffer size calculation.
- CGATS parser is now more permissive on certain properties.
- Fixed callback type mismatch in resampled CLUT evaluation.
- Fixed a crash in PostScript CSA generation.
- Fixed memory leaks in black preserving intents and .cube loading.
- cmsChangeBuffersFormat now correctly rejects format changes on
  floating point transforms.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.19.1.bb => lcms_2.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.19.1.bb => lcms_2.20.bb} (91%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb b/meta-oe/recipes-support/lcms/lcms_2.20.bb
similarity index 91%
rename from meta-oe/recipes-support/lcms/lcms_2.19.1.bb
rename to meta-oe/recipes-support/lcms/lcms_2.20.bb
index d11203496e..94c0e048e3 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.20.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b76416a8c0b2815c8"
+SRC_URI[sha256sum] = "18ff5504fa9cc8a2b1f3591180d90ead16c8a2ea78e530523b46eab70e1ca6b9"
 
 S = "${UNPACKDIR}/lcms2-${PV}"
 
-- 
2.47.3

