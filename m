Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7B0CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 20:44:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.28926.1695501887197056305
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 13:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U/iPrRGS;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c3cbfa40d6so36256775ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 13:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695501886; x=1696106686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y874uDNqwdKmrQzacTq74otL17gbZoIqSS5QU5Iy93Q=;
        b=U/iPrRGS/b8Vtvp+/sRqe065IKC3/vfIGoKWskVwRWFDlMZ4yZrJL+7ZM1YMFO7Rwa
         5NyMjxf/bwx15aspw8JuFWoh9iceHDJ1BC8vr/XcKQaGEIneE4yqQfYeNmvsWARxD0H5
         P7aJA/i9XhqnfqqaK5ruwbBSInsCqx+KHXoyEVla6bAGiRgcQqenceZZlLsP1FLcN1R4
         c+W2K7fTE3nSz0Pvm+KXJhPZLdEDHNbtzMCZHVfAU10fIuJVwwsbjf+lbsxZuC2HNMoP
         cl8AMwAN4ynSCXtpT3aVblTUWfza2S3Mg6ppdtUJAM6tdkX3TIzEaKBFlEvNq3rd0TSb
         yEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695501886; x=1696106686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y874uDNqwdKmrQzacTq74otL17gbZoIqSS5QU5Iy93Q=;
        b=EKabJei2Id04HZOtx3+32RmY7ploq5EPidYu/iBro39C8SEu6lkww6hCRr4ZZVmlFI
         V5vxn5ev7yNJ+NXjDZ/2HPumfG/TT8TeLHVi4cZmKPzvZrb649WHPH6CdsgHY1LnURxi
         DOwnsElcvVYKYQrwLatL6mLV31rXhLUPUO8bvRRPFHbVoV7CQhG6yn2UmD+MvXQ1pu8r
         124Qrr/cpULeYSRL9T3EAkE7FtzYUpdCoqQgJjWKCXc3muB5GiiEitqiuJsypy65x+Bd
         Sv+U7MjLAhQ7TVYw2aeNu7h/Llq9fOTirnvUxdcJU7I0l5QGUwbx8JoKWhl8rJIVptQ9
         sy6g==
X-Gm-Message-State: AOJu0Yztt/mFTKgYP6ri/WAqeM56XMkgHryawD9FcLGbDVAKTIDvSDaS
	AFkKdqNafm2yuySe/AUP8uqs5rZYiDZtTg==
X-Google-Smtp-Source: AGHT+IE0FwEwZycyn5A43LXdJIxCuIKFQg7OG4b2YLbkZJsOrZTbyRqiMjdSU7OvkkEmCqeBIbPvGA==
X-Received: by 2002:a17:902:7685:b0:1c3:6705:bcee with SMTP id m5-20020a170902768500b001c36705bceemr3026473pll.57.1695501886391;
        Sat, 23 Sep 2023 13:44:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id ja2-20020a170902efc200b001c0c79b386esm5790395plb.95.2023.09.23.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 13:44:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xscreensaver: Add osuosl backup MIRROR
Date: Sat, 23 Sep 2023 13:44:43 -0700
Message-ID: <20230923204443.882346-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 20:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105101

old tarballs disappear from main location, use a backup location to
fetch it in such cases.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
index d24f666bcf..dc909ed78c 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
@@ -9,6 +9,8 @@ SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz \
     file://0002-build-Do-not-build-po-files.patch \
     file://0001-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch \
 "
+MIRRORS += "https://www.jwz.org/${BPN} https://ftp.osuosl.org/pub/blfs/conglomeration/${BPN}"
+
 SRC_URI[sha256sum] = "787014b29f0c5793ecc2d93e1109a049ff48ab0c29b851dab34f683ceef6b152"
 
 DEPENDS = "intltool-native libx11 libxext libxt libxft libxi glib-2.0-native bc-native libpam jpeg"
-- 
2.42.0


