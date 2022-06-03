Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289E6C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2395.1654283964607088615
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qdtH9Qcx;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e24so8073012pjt.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+28qliwWQVuyR/4ABWKAxWB17k7vZref0pNPD95/FZ0=;
        b=qdtH9QcxBMLKsPIfMCUnOR5tNX0JhA/gXEDTeGofwKEN8rj4oqmXtOoL7JQRGHxRGV
         byyiJNzRtdGnzfAmxRfCC9+UmuBd81KY+hCZRLKdr3bKpowBeadJFdMa5Tqfczdx6eEn
         Q1VL5jQTWbwZk5+WourcXPbzw2OnljBqkqmDUHYQa1mCcZGDl2ota3u0HX9NJHR22yoS
         bkAYSiZ6c/6iu5VJt0zl8yEE92MvNJ3SSo8tcurq3lNGS0JXjYF9qJ1QPVGCPTUc6Zue
         h93MJFJNZkH2GIncm7jzkCa2sqhuZqNJ6W7Qep0blLN69Frykqa8fWIVebzBTGCgAuPe
         butg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+28qliwWQVuyR/4ABWKAxWB17k7vZref0pNPD95/FZ0=;
        b=z5z0Mi12ernGzV/VOzBgKoofaNq4TsOYo697RdDIFlv1iNzQMMTgSUazI08dXc7Tuu
         uPfpXKEBsYKjUxTwnpd7WFRvOMZ1XxZ7f/1kTTSUlCUfMvQ9fu6IHewCAjaNc7J/aEj7
         IRAQAB/TYUvXNphlQRjvvHkmPc/lGWayrGape97RtJaLBIJxJxMFXpVnkGXovXB9xOYq
         N/zFgQSiFvpeT+wRe1IipzCdiXqMYi/KOTTVrF1QDZsKWEP0KoXI8vEDnRgqpA07vccN
         TUQRcZUh/U6DLQLvSqjjnvwVcbN9zkYIQXsCdgNzGWhWKzu49XZXdIX3OuucXm9SF8Mq
         cQKQ==
X-Gm-Message-State: AOAM531VM30zdI+CQpvwbEi9fKLhAh3mQCsdgOjU5DrFpN569QTTX6zC
	sPksTuTA8GnhQtxo3WZC70vOe7U2cdo=
X-Google-Smtp-Source: 
 ABdhPJwVXPs4FPtTKSE84LTbuOe7zw6hYAY94u9Sja/EayNXLy/B7xJPVxsipgDqWdDjMbuZzPJzcw==
X-Received: by 2002:a17:90b:1646:b0:1e3:15ef:2871 with SMTP id
 il6-20020a17090b164600b001e315ef2871mr27207888pjb.105.1654283963700;
        Fri, 03 Jun 2022 12:19:23 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 01/20] libcamera: fix packaging
Date: Fri,  3 Jun 2022 12:17:00 -0700
Message-Id: 
 <6104aead933382cd1d627bb6b9fe1b68195c878d.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97390

From: Julien STEPHAN <jstephan@baylibre.com>

libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev although
they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf.
This trigger the following error when trying to run the `cam` utility
(packaged inside ${PN}):

$ cam -l
cam: error while loading shared libraries: libcamera.so.0: cannot open shared object file: No such file or directory

$ read-elf -d /usr/bin/cam
Dynamic section at offset 0x2c740 contains 37 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libcamera.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libcamera-base.so.0]
[...]

So package libcamera is broken and need to be installed along with
libcamera-dev to be functionnal. Fix it by packaging libcamera.so.0 and
libcamera-base.so.0 into ${PN}

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3de996474e0b7fdff1d265fcad747bd60851b1eb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 7136260699..0b9f3f7a5d 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {
 
 FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES:${PN}-dev += " ${libdir}/libcamera.so"
-FILES:${PN}-dev += " ${libdir}/libcamera.so.0"
+FILES:${PN} += " ${libdir}/libcamera.so.0"
 FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
 FILES:${PN}-dev += " ${libdir}/libcamera-base.so"
-FILES:${PN}-dev += " ${libdir}/libcamera-base.so.0"
+FILES:${PN} += " ${libdir}/libcamera-base.so.0"
 FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
 FILES:${PN} += " ${libdir}/v4l2-compat.so"
 FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
-- 
2.25.1


