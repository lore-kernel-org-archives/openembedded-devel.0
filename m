Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BBAC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 18:49:52 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7422.1784746188659465238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 11:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=adr1Vxu9;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so7560256a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 11:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746188; x=1785350988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eq3yrdpTgNAMJj+lK5+dg5vnuODNJ1jViRD+xSkHyTQ=;
        b=adr1Vxu9DYAdVk5RuEghcgAHPoqQd60x6NpcYVvZTgv+hSIZjkwhtigR7MEnNIE8sx
         nYRXEVqwYkbjknJb99G08KCa1KySvy0FvPD5fZq4HaPU//3kABKj0BIMVYjG3mwzGCnJ
         YY5cBFuK3Owmp//5J38bpAUt4bnKbIaRbPMZlDtpI7uTDiA5Ia5iu3V+4MymO8vJ9Oij
         xKz9R/Cjuu9yCicQoj9pMIieYVrts9WuU0RA/7+76hxS0ASKCgdDH+FfPZl8bngl+OJa
         TvDEyYY54ML1dYelUCIXelKVMkIEOrGBV1/eLWSavlg+dYiRPqAyRRnkJlNi8IJVSP73
         hBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746188; x=1785350988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eq3yrdpTgNAMJj+lK5+dg5vnuODNJ1jViRD+xSkHyTQ=;
        b=KQ8TjNAx7grnMb9L5mdWfM1Rt8O6oifR1NNasHWHmBWga07se7El3wArIdd/DYAWDW
         RqcCdv/X61csUSBt1UKPPfFGBymdtWnIFo4KztCbHGnQxefTFnvh4qDlJ70Dc7kvBLMi
         Urqd1sAEHffQ6eBybNehQne8d86gnuj1yIYZUTPDQM7XZBlcT2Ts9itZbM5XjhoZyKbW
         XJB503ty6IiGLteF+/rT9FDUzli6HJsA1RBCLKHyyIRcpBSD1AJBI0d+2VN/4HrWrvJc
         OolQF5Te3SoUTOpn2p5fl2hAQBwQXjFDJEwfVrSLnimTBS2uVvFEsKm7sS6vlYRbcO9u
         5hwg==
X-Gm-Message-State: AOJu0YwlnfXj/tDz6UAYxWBLjrmFLBiFRZFh2mV4dQXgTJoFdrwS6uyw
	OkxEgq5p6XPU8W61CiCDBk4qfFCd+9zFUM5zHQw5bh7Jergubnn48mZK34Fq5g==
X-Gm-Gg: AR+sD12YctJzlUOlUX5FDQFgVdDQwRINRtjgAUvwp1lSFpf1EUYxWKMXUli3dgjJPe/
	flRCwjui1zc6j8PaxrWRopN49Wb7kWy/srbzxkHINJavMHZqwpgKpHLo28o/f3AmtgTxB/miufw
	J9DYrPxRkZX2waqKGGIY2LOd8de5LtmVd9pByzzM8R4k48p4LCdvZC77JtUq3s7Qjfryok8apH4
	d56fkCjlEyqsm4fRVgl4oAT6cgO6YD4RS7tMhjn8J7jiJ9BvHME6oaP3hJFhjPX4xcrUFYFgoE5
	jzbKt2auujn/FmhMmqF3D2B1gJKbcOGpOp3eCOxGTiXfhZ7FesmXTMnc/ZiL4ErpR3aQ7zyI4Ze
	fobVDVIjXwETFOx/StIGnbwPTv1hTebV4MHLKTW3l9FPwNVTDni+0VJmR0SSe2jGvH+hIv2BsAs
	pgNICickS2rNgFKQh1aeB6QksyshS99o1UA5kzRmaEyZ07Dh7JzxwxtEJ+Adf1pun6YIN4Dieji
	MfZEIqw0nurbZYU2QSmp2/DmF/QzZrnd9t6V4WwpqhnaSy3MU2OjAv7JNm5k2VjDCMfYnCTKEGQ
	XJMTLy/uneqQ6bXDvBO2+SO35UvVHw==
X-Received: by 2002:a05:6300:2289:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3c3ad79feffmr24945911637.7.1784746187975;
        Wed, 22 Jul 2026 11:49:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm11115841eec.26.2026.07.22.11.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 11:49:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/5] xterm: Explicitly specify directories for gnu-configize
Date: Wed, 22 Jul 2026 11:49:38 -0700
Message-ID: <20260722184939.495321-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
References: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 18:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128411

xterm do_configure runs gnu-configize (to refresh config.sub/config.guess),
newer versions of gnu-config needs to specify the directory for configure scripts

Fixes a build error abort in do_configure:

  gnu-configize: error: 'configure.ac' is required

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_410.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_410.bb b/meta-oe/recipes-graphics/xorg-app/xterm_410.bb
index d10fb999fe..e116eedad2 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_410.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_410.bb
@@ -30,8 +30,8 @@ B = "${S}"
 CFLAGS += "-D_GNU_SOURCE"

 do_configure() {
-    gnu-configize --force
-    sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
+    gnu-configize --force ${S}
+    sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i ${S}/configure
     oe_runconf
 }


