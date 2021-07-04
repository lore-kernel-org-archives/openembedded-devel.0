Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8236.1625397130052259450
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 04:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eXz81cdM;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: texier.pj2@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id i8so5537527wrp.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jul 2021 04:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yT3W5fS/cDDe2CG/vmTbNA2nUD7Gj1VNpCdieHTdxRA=;
        b=eXz81cdMdXiMofcAvZsNp7b2qZxG2cXp03PRAN+MlTaXh4E22z9e6fS4CmwbWjtC4U
         EOcc5AY/Nngc8ZGRtcO+awirElO9zA6sVDNfRIpFE/Hk6PQuTze/meDuMJD0tWtqI8jc
         Kc9SuKEnuKNP1eLBABiaZw/68QjcQ6tDaNaxsITbqIdRN/U6zP+Fjc3pFHOukT41y4pc
         1x4S8OyJdSDDJb4C6973L0mZyxKlObVAKMBPTEAW2jIUhv61AtLuNeQrCP81MplfsJkQ
         M3W90Ym/e/Sil/vTor7yFvtz2TsD+FIA2Qghmi5bcl7Ad+cTRGsdLB3DDCz3zREFErLB
         4wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yT3W5fS/cDDe2CG/vmTbNA2nUD7Gj1VNpCdieHTdxRA=;
        b=BysDbCRYEIkcFQFY+etp5hsbzxLiaJeMzYpf0paRGCZBDnap/q5e2gT0+GvQUFiCcV
         xANHZgfEpZkXJn1xK2g0zfpqkadX+eQ/WxBTYZMvVyjoi1uRlWOlSgZqEoKIGNlgqwYq
         x6WqdY2AiDXtdLREqAaiclAPV+IoQJxTN8RybK2/H8DZ3vwgjkcRPkc7+81JIR3HGaaf
         L5N/mYZT+z7rvNa8jmarT6my7jxuFHdXKJQUzYrFqCw/Z6qYnr9FqI7Bl560kw/Js5jw
         9RGhzBbgboudPs14w979VCTX/Y+U/Wu9oDGSQJ2Ue4+0KCLAMmYUkgfRTFzHojdaPQsG
         MrsA==
X-Gm-Message-State: AOAM533dwVgRAxx9/9OhsN0Y/86H1sMKsbDhhIfidw6do2+LiQclbeqt
	Z3DHHXdSEvmc0luVe2pDmYTzAMZ2Jgw=
X-Google-Smtp-Source: ABdhPJwQzKqtfRtfbV52qKiHYBMhj6XHfcYtV42OGUHrxx7harDUddsL0prmG02fi0PelVWr9lejRg==
X-Received: by 2002:adf:e101:: with SMTP id t1mr9793631wrz.215.1625397128395;
        Sun, 04 Jul 2021 04:12:08 -0700 (PDT)
Return-Path: <texier.pj2@gmail.com>
Received: from menoah.home ([2a01:cb19:190:c500:2c58:8722:1f6a:989b])
        by smtp.gmail.com with ESMTPSA id b8sm19349818wmb.20.2021.07.04.04.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 04:12:08 -0700 (PDT)
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Subject: [meta-oe][PATCH] fmt: upgrade 7.1.3 -> 8.0.1
Date: Sun,  4 Jul 2021 13:11:41 +0200
Message-Id: <20210704111141.13875-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1

See full changelog https://github.com/fmtlib/fmt/releases/tag/8.0.1

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 meta-oe/recipes-support/fmt/{fmt_7.1.3.bb => fmt_8.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_7.1.3.bb => fmt_8.0.1.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_7.1.3.bb b/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_7.1.3.bb
rename to meta-oe/recipes-support/fmt/fmt_8.0.1.bb
index 9820b86470..6a10e0c9c3 100644
--- a/meta-oe/recipes-support/fmt/fmt_7.1.3.bb
+++ b/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "7bdf0628b1276379886c7f6dda2cef2b3b374f0b"
+SRCREV = "d141cdbeb0fb422a3fb7173b285fd38e0d1772dc"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

