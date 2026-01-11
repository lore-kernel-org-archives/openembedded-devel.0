Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DD1D25030
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 11:50:25 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8997.1768132225358543751
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 03:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WYHA2nLW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2743376f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 03:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132224; x=1768737024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgwC/tcECrrAmc7tD1Fq7kUO98ZWuYhR6KN4mWhIFgE=;
        b=WYHA2nLWRkFVSvaK16jDT8JlmgjMJGFxlAQLQ5K+ObyZe93iPqJntVe5MzjPa7tLMb
         KAaktDvqyS96fGeK4XalhwmVxL+xXk32AEoTf1qN2kVODUZKWdyB0A+4sTfZ0GXeiYt4
         BUmTli60FUDlUwYLHHNOXhrBZKUMV0kYxj2BJZ4DLFUvZO0PhWUG/FyDRHa/DByHEM47
         v03Alm7Y2Cnhg4Pclnbs2eW7LotbPVT1zklV7jKhHY/wRDj+eJkh5r46QkIIN+T0Ygsn
         nvVYuPTd13YS1lfPFkFP306+8XLv7Ec01sSnPoQIKai9WuBYj4OkMFHHenwQb+siJcEz
         xeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132224; x=1768737024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IgwC/tcECrrAmc7tD1Fq7kUO98ZWuYhR6KN4mWhIFgE=;
        b=RAie/Rq8C3Dp4R5lUV+V961BMxhN1YfiNVqRHmgF9Ac5IB9MuoiL+QufcExZVFh5qp
         s8jRZa6WCWFbwuy05eDcesNi7yr3skpqmqUW9kwdiYrPqb7RgLWv2qqxLdf0jD68nu/J
         dMdvNAdyS08Pwp8nEkohikg5r4500v9FPfbMJgzVoUNrH8GuZ8+EnMvpvC3a/TZdTroS
         01jflKp8fSrkI/Fy7qJCZKSSh5Kq5tfkBv1cMX/6si4eKRzwMqPImG/KzlYbzbKh9tJ2
         nZ7g5o6xZMi+VtT6VRBEOjIyF9N7wRRY8dWYi7//nGozBsPByG3vkrUFwMYZZIO9HddH
         nw7Q==
X-Gm-Message-State: AOJu0YyFLrQfT17j62hJlPuDj0XwhrFldrzmblHs4dqRo3cREahaM6Vz
	TRfjX8ArLFpAz08+4pvlcKeQQDXSKM0zHV2m+laVEjsz9oyTevhozK0RO/lrzA==
X-Gm-Gg: AY/fxX6PQiTZAxgt/WqM53IqHugwiTBONSpbsm78wGr6pghDm5nrRHFiGLa5kNCyNuo
	KgYp9KdLkX0f7EYYBZgIZfJ6wCmfZKOx04Q2qBmhe0RNv4kc+1rytV25NANDTPHgF9TKWzXCqLK
	TXRRSzCfhGQzbPdV3jlyO0bYmKSCXFAGJwgzYiY17x/2lCbBXF8U/313QzItiTZXi0NmlI6Fdxv
	vbnsDCCTSaZRf+e9SUkHU3cWMagQg5QulSG2N6J7i81RcKmO2PlpmLgWdYAuXhZxvX5warU5c4Q
	jfVrtwCg3D22CksQ91OMYiorL6ew+Mb3KfTq5WyCEpjbgdfm2pi52CChgc60C8OhrSo43I06Rje
	F2mPvy0p+9Eb7gIfQa2MyTHOGBVb4/KmeyT9ToHhKh3a6og5m3ng//o2rhJbaB9o2MRrnlWPQ7J
	sCG0/HJbUf
X-Google-Smtp-Source: AGHT+IGgbASnOJDRE1c5hwtkGOZflg3Fuv71oJ1dy8Ng/cev195myS1pWuO/kviFHLXzCKc06I2/LQ==
X-Received: by 2002:a05:6000:400c:b0:430:f6bc:2f82 with SMTP id ffacd0b85a97d-432c374f180mr17195381f8f.30.1768132223725;
        Sun, 11 Jan 2026 03:50:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e19bfsm32337836f8f.18.2026.01.11.03.50.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 03:50:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] boinc-client: set CVE_PRODUCT
Date: Sun, 11 Jan 2026 12:50:16 +0100
Message-ID: <20260111115016.2211938-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111115016.2211938-1-skandigraun@gmail.com>
References: <20260111115016.2211938-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 11:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123345

The relevant CVEs are tracked with underscore in their name.

See CVE db query:
sqlite> select vendor, product, count(*) from PRODUCTs where product like '%boinc%' group by 1, 2;
berkeley|boinc_client|2
berkeley|boinc_forum|1
universityofcalifornia|boinc_client|165
universityofcalifornia|boinc_server|5

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index 3e626f32d9..aed6fe6edd 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -29,6 +29,9 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+3 wxwidgets libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
+
+CVE_PRODUCT = "boinc_client"
+
 SRCREV = "4774e1cbe0ad13cb9a6f7fffbb626a417316f61d"
 BRANCH = "client_release/7/7.20"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \

