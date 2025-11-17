Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C979CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:57:12 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6114.1763373430449655664
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCXN++JB;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so7018885a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 01:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763373429; x=1763978229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCP1rZP8ewzwXEx57e79gSamHdpaeWOtU6S2hh6suHA=;
        b=mCXN++JBRwvgkNOXVopBHQq/+rgcpvmBQp2McYZ4itP/a67z4oUev3jdOy8rOQPzht
         Gcyl5jHO/IeBXETZ7baLDxl5UteDPi/peN2yxZM+k4hO+beIY4rZoO/QNoveyLQG9nGf
         horCPYxQFOH8LFQJ7azWhsAHuBog3lXQpP8YQCF821flLdj7UyTo9AqaPeE3y8u4I9hf
         CxfA5vh5XreXC+Z7SdYuDPW+sml3CDvteor0kb98HHASIHraxphNQskM6FwduX2WNB9Q
         RzVRFxGgb4Pj1gi4Xh95dAoSbUCeACI5GfhoJKpa9N6zeU/w6lTgHp5ITNhxkQx5Jw9n
         kazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373429; x=1763978229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCP1rZP8ewzwXEx57e79gSamHdpaeWOtU6S2hh6suHA=;
        b=Q8PmYoe9nUfArDU+s6diyFJAEfbND5exSqj9Leq8e6+MGgxO8kNKqmHiycaay9WFRI
         mmE3BdKCbFx1vEoKrqgvWyumeIstbNAPwToKqUPXRJv0tcFXexRLyElfmL1ykBK+lOBs
         5StTW02+WghWb976clv3d3uy1gU7G5WTon7BmBu27/2RDZHQqz5H0bygiixqAhG+hoYP
         XluowajlkZM/MzumfJTc66z7+E3voB6MXfFW9uzEM9KrBxyDvZS8a+4mcwDYnE8peVkZ
         ScEqWk91MORVS6YFuL+U02ynDqFxbDtXvvEIFmIPMndCSucx2oPoarW7Lt/rtIWUvwae
         c1aQ==
X-Gm-Message-State: AOJu0YyYLnDst4swDz9ojeeRzcO6ITIHCu5UiD2yY+Az/4pcWltJvZh5
	f9bWopQEbzL5PmhpfQCFgInFsva8s2hQ0sKSirxm3wPPd15WoGwnvUIxGaKLLw==
X-Gm-Gg: ASbGncvchc/byqhvi/u35XViUXtx3G9rD3ulgPxGcpyhZj8xDh+oJxO3GM5ClOYo5br
	2SX2CQA+6X7Hr4JATQAc2B1rWJPFkOq/UgRqx6BMW0OcICuYcCCeET1HtKX1Osk396rNlG6MclI
	JvUZFIdV2/eXBf9FfiPJL6FdQjf22I99q2+n92v3S2mFFpB28YkhGh/oVqnR4WX7DOzKJQZwZRA
	XbvVLK6NuZgMPTsgDtzWJplqzoNoatgqMLiabpeugvcroJ48naCVuh3H8jBv4TcTFmHZOcrG05V
	IPQME7xKJr71nO0WphQGfvIvyYduSPHv4vU2M+QeJYlX/TpsDal9/16DZywJObxy3V/WoJflYma
	vBnT8d+eZCuGYQjFwDoKSSRVG/+rPg3ruik9TLXTr4vwF80zKPlzpHsRMGi39j9rTOLGennn8Gg
	Nq9AabdGXBmrtcfw==
X-Google-Smtp-Source: AGHT+IEDVjX0fGGHr+BzcqURSlBUgpOaa5AmDZ5KOeyXi7MOTlXW09W6u/g3g+m17i4jwmgk9o829g==
X-Received: by 2002:a05:6402:50d4:b0:640:c640:98c5 with SMTP id 4fb4d7f45d1cf-64350ebe2abmr10592026a12.34.1763373428716;
        Mon, 17 Nov 2025 01:57:08 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28b0sm9868991a12.30.2025.11.17.01.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:57:08 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][meta-oe][PATCH 5/5] libwebsockets: fix buildpath warnings from libcap.so
Date: Mon, 17 Nov 2025 10:56:59 +0100
Message-ID: <20251117095659.937489-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117095659.937489-1-martin.jansa@gmail.com>
References: <20251117095659.937489-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 09:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121775

From: Martin Jansa <martin.jansa@gmail.com>

The ${STAGING_LIBDIR} used in scarthgap doesn't catch this, because
in kirkstone without usrmerge libcap is installed in base_libdir which
is different from libdir.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
index 67c1bb4421..22434b4493 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
@@ -34,6 +34,7 @@ do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}/libcrypto.so|crypto|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_LIBDIR}/libssl.so|ssl|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
+    sed -i -e 's|${STAGING_BASELIBDIR}/libcap.so|cap|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
     sed -i -e 's|${STAGING_LIBDIR}/||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \

