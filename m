Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A48C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 15:45:09 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.9849.1634139907744500523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uNUP300j;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id s11so2690663pgr.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=63CnG3c1Lv4G19LxT0CyO0OSJrfhPPYdGkB7wa1DPMY=;
        b=uNUP300jQ7vbhWBpdNsDtdRhYv0I3Ziqp1QVG4WMi3Q2GEg4c3XqfkyZLg3cgJEbqp
         Zpm3jv2hp3tJp6mQX6Pd5AhAX+dGB76MlZojuMMaVUOujodUQehgjR5I9iNvHOYs/srO
         V37pweuNQyQVMNA3z2/Ylc6p3ygGmxPcBaNrT5W3lfRh3uFp38/pKxWx5tT4ZUR1uQLB
         h4narct4RpFBOE9fNaKnjkheJYIHo4jDVxPQ3ZHariOFLzKrauCrLFjA8v4dwIv5tLVT
         VxlU+rQwR0PYcp/3VbEh4cTe1mGX3rTRSj/mudJqo/hX+H8thTWJ60VlhxuUL38XZeif
         MpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63CnG3c1Lv4G19LxT0CyO0OSJrfhPPYdGkB7wa1DPMY=;
        b=uvf4d7RIJljlS2jAZlqGpqwigUQdHdd6QSp3jkchb/dE+KXY3ySKwoWJ8HKkvafEqc
         CEGDBDBnygLlaY0dI3NLAquKJVeiD+b6HeRUd3FjKi2N4MLGmmU7MojR8byJPFxZWuJY
         wECzIqDsMAKkMnMY1OxJphhtYmh69qrQeIJPWR8ujDToaN9jvybn1jaCq9pY5gVRdZ8y
         tz68hoxrvuncj8D49rPFVbEg452qAMAy/KplbZAfDB2R+KMfhuDeYFH28R12gIaLHape
         0Gpj5l8B6i4hJ4MSvmdrF5Dzv3dzOxP4bSXWPJXLbrkGqh1905e2vJ+dPmwLF32B9kN5
         rUAw==
X-Gm-Message-State: AOAM531YKKIGTd9Cz0hpnn0ueVPNOgJGxMt46z8prq8p2QecFWZLgnTd
	Qor0XQ67Ypyn70WhgYW/FKnE80jyiYif6Fdgd6A=
X-Google-Smtp-Source: 
 ABdhPJzVAxDY5dxmWNRhE+UxDFaGLs9+HikYczObrVgNnm3CvD2HfNu6AF6QQfRK1/+VLbou6gG92Q==
X-Received: by 2002:a62:1ac4:0:b0:44c:4c4e:1d3c with SMTP id
 a187-20020a621ac4000000b0044c4c4e1d3cmr138534pfa.8.1634139906244;
        Wed, 13 Oct 2021 08:45:06 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 p9sm16542751pfh.162.2021.10.13.08.45.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 08:45:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][dunfell 1/2] gattlib: remove includedir from base
 package
Date: Wed, 13 Oct 2021 05:44:47 -1000
Message-Id: 
 <66fe30c9d07226906f578162b821cdd2d9d87337.1634139781.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634139781.git.steve@sakoman.com>
References: <cover.1634139781.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 15:45:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93283

From: Konrad Weihmann <kweihmann@outlook.com>

as it's already packaged to ${PN}-dev, so the setting was
without any effect anyway

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1d26b2656b87a95b72d674954283ac014da8793b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 6b4decce5..d79dbed87 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -28,5 +28,5 @@ EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
 
 inherit pkgconfig cmake
 
-FILES_${PN} = "${libdir}/* ${includedir}/*"
+FILES_${PN} = "${libdir}/*"
 FILES_${PN}-dev = "${includedir}/*"
-- 
2.25.1


