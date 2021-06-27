Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.2636.1624825339828659918
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=si11C7oH;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id g4so8746933pjk.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cqLGrySs8XtJcCRRMFuFxnKHeSqcdNoexLXLaECkstM=;
        b=si11C7oHZBc27g07s+gojnRkfQ2NTfCnlrb6Axi5xdzs9SFvILkTUSqM8Jj9spPB5v
         8dl+YZdXPFC/VT33kn3/2Bz/qoaUQlvtli1vTKOpftuePYT9WABEnA1hpZ4FGQlXITpM
         Q8UaJbCdjLOhx4YVELZ7xTgQtozgNK0eUk7/eDxBKAIHWj2RyweTjj+26N3CQeZx+5kP
         9rCqW5gEAjtp5vi4cV6SvjP7vqhmOU8QApWXcywCJVSmW22dnFxTrZ/NuQY4FMlt34zN
         yNreWiT6bPZscCAzlKpxSfZB1FfDWObGcyAEqexTbgCbeKEYuDtI+209lCozxFF0mS5A
         lBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cqLGrySs8XtJcCRRMFuFxnKHeSqcdNoexLXLaECkstM=;
        b=IrLqNLoyW8Vtk/jQp0dlWePcKE8gTgCpkZ9DPwPow9NNaAKS+xRlQzPdLl6dcXcAb5
         42kaPZ4ebi9ACx0Wb4BJ2vFOAbikq14yhWod/RMJsHQIbhiRfdl2muM9G6cmC4CLeX9c
         4hUBcdqMqa98rG4+Lsalwi7UxwX4bkKJcEUinuN9TrTOefoQlfGBfTC3+HfFPR/mH0nB
         XSfEh6TgiQN0w1KlNkMCYWszW3iUYUpKQo+PE7SNb2+39Ml6Jxf+5CFhxV5opiWJ/5gM
         qU9Q21jpEoT24y8BUTft9Xf/UYEV+LGyUBD3WsFnMpgqbUKqEhwH0f0zynOYCPNxM1yk
         c2Cw==
X-Gm-Message-State: AOAM532Ta/PPJBy//QsdQBryy5u3mcwiwV2T7ypZHUAemveV5XudndTg
	vVXwIvoBHlPuz06FULIo/i1vwkrb1qOsAg==
X-Google-Smtp-Source: ABdhPJzFV7HwiFS+yiQifWG2q9IIOQh5B3AKrZIapBeIBJTrJ8SVcMw+oI0oh8eAP3Pgwr3rKcJm5g==
X-Received: by 2002:a17:90a:c911:: with SMTP id v17mr14031639pjt.26.1624825339309;
        Sun, 27 Jun 2021 13:22:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 01/20] libpfm4 4.10.1 : enable arm64 host platform
Date: Sun, 27 Jun 2021 13:21:56 -0700
Message-Id: <4516ddc0a21539ad6afc9c1c6b63b7a24f71ddd9.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Olivier Georget <ogeorget@prophesee.ai>

libpfm4 is only enabled for powerpc arch as of now.
This enables the lib on Arm 64bit platform as well.

Signed-off-by: Olivier Georget <olivier.georget@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d02bd486736ba7cc552312849cea4fa33b1e1259)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb b/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
index ff56d48043..6da0f5d9a0 100644
--- a/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de488f3bd4424e308e2e399cb99c788"
 
 SECTION = "devel"
 
-COMPATIBLE_HOST = "powerpc64"
+COMPATIBLE_HOST = "powerpc64|aarch64"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/perfmon2/${BPN}/libpfm-${PV}.tar.gz \
            file://0001-Include-poll.h-instead-of-sys-poll.h.patch \
@@ -24,6 +24,7 @@ EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCON
 EXTRA_OEMAKE_append_powerpc = " ARCH=\"powerpc\""
 EXTRA_OEMAKE_append_powerpc64 = " ARCH=\"powerpc\" BITMODE=\"64\""
 EXTRA_OEMAKE_append_powerpc64le = " ARCH=\"powerpc\" BITMODE=\"64\""
+EXTRA_OEMAKE_append_aarch64 = " ARCH=\"arm64\""
 
 S = "${WORKDIR}/libpfm-${PV}"
 
-- 
2.17.1

