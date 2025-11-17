Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C1BCEBF61
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:57:12 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5998.1763373428391150467
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAMsLXzB;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso7625147a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763373427; x=1763978227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26SgDrS11E0zWXqW6wi7lx2InOevw8RUZ2rmOBLkC2Q=;
        b=lAMsLXzB+hVOXWMFv8QoWzacB6LpoGDvrtwaY6o1FcUxUTIZa1OFvt6d7BqsPsUsDS
         BNNNiPl0QMrwBdiC7heCdcLpUj+ZoELoJOq2FZjlgMVyeoQpVda2NerBL7geYdniEu08
         hroAnzvojuPHWcQ13RuqSifVp6sy3tS+0fcaMuyPkUC6447fB89g9bLd7D4F6Zy2ebgi
         9MRFTxfkO0Be+5bPsNZpT9as8Vg7nfI+CqlamSq4I6oNz9y7oneYO0LzinqkPcF/1THj
         ii8J8A5n2MtA4DXZspKJRnbUbCghiQqMS3oDJKTrWY1gQ7d9RQjaT/gDhr+5WQfxSCcD
         yoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373427; x=1763978227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26SgDrS11E0zWXqW6wi7lx2InOevw8RUZ2rmOBLkC2Q=;
        b=PGSN3biW0uAp1ZV2K08x6QkKZvPYfUuLipPiQ7CvhVSyW/nHdBQwsU6w/cphbIzldd
         4TIvyRygUoxZDSGfd14kzeQdifIKtERIHwRRZKaWn5LwBtIp/x5HYzGilKaPFHjJgrve
         PwBlw6ASLBfDH8CPNSypZLsi/f86N0F0liMOsM5w9+sUZh2u3foe2NiDqPiVVVMZvjyV
         YAf278BpKe9xOOWIhXHV42mWpiz5JXJGblnA09I2rXaKz219UGIP7Kvb/EkF3Vy41C0C
         hFITBt2/F0uYUFf5cWK0DtrhaPuDDh2mV1JQVCwOETLnXdZcK9zUfixUtfOn1Gldiz7I
         2Ayg==
X-Gm-Message-State: AOJu0Ywl00LHy/Jp4t7nsPn0wdt8ZOuCvB7k0xfD4XAOvyVZf9/83bVE
	AJqsGpXgP1S+URlozD1nFQIdO0SvLv7E3mMo6tt5Id6HdgvsOTv2GE5bUjaGbg==
X-Gm-Gg: ASbGncuMzMdOnJnEqF8qPxJ2A54geSJD1pjvHnzrhZY65jpT7j9Ph75A/oWSkWV+kDN
	D/AOdtxxOWuq/hkIms2T8x6cClBLOOeYOsih9asJjTFS7EoqYQH5y/gXEOLqddVXoeYevoCdW6c
	Ygkr4wIPWAtrmYb8c+vxOO//sKXc4+6ZCqUwOX4XwDlvREkboMAjWGM9Rh2A+9A3p3o2xtd/XL2
	neFu9PHi1qeexj3sx8vaqDGMl97UwQKvxjfGVRNyWz8S/+ESLF+vP3WVzhfLi+WXfQ4pJiMryqE
	32LyPPH9qLwkgBSIlnuRvHPTH/N4XfaUV+nraMcOgvdZkpK15pivdN06FM8XzRpxEJEJU8WmEfK
	QwqLa5F59KP05Y9UcADTOVegXLBqhJg8XyYFShsTMVLGuQENsW8qWvbLdP6KW3Q/vLLDOzYa8cK
	dxJNU6fYI03ed4mbuW4m/9NQyR
X-Google-Smtp-Source: AGHT+IFWugq1/8HBJYBHE78uVMCa6c14s5STwALnmg8VhSPjTy/xZQ4Z2Ce+R+25HqUjujW6Shc/9g==
X-Received: by 2002:a05:6402:5188:b0:641:5502:c8e0 with SMTP id 4fb4d7f45d1cf-64350e8a3e6mr11804699a12.20.1763373426677;
        Mon, 17 Nov 2025 01:57:06 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a49806csm9836598a12.18.2025.11.17.01.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:57:06 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gerard Salvatella <gerard.salvatella@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [kirkstone][meta-oe][PATCH 3/5] libwebsockets: fix buildpath warnings
Date: Mon, 17 Nov 2025 10:56:57 +0100
Message-ID: <20251117095659.937489-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117095659.937489-1-martin.jansa@gmail.com>
References: <20251117095659.937489-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 09:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121773

From: Gerard Salvatella <gerard.salvatella@siemens.com>

In order to remove absolute paths from the cmake artifacts, paths from
the `$lib` folder should also be stripped off, otherwise internally
linked libraries (e.g. libz) may appear.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
index 22bf5f1145..721406267a 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
@@ -36,6 +36,8 @@ do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
+    sed -i -e 's|${STAGING_LIBDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
+                                       ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
 }
 
 PACKAGES =+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evlib-ev"

