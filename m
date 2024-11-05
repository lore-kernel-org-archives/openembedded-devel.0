Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877B9D3E793
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.30064.1730837378906624924
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CWWt4SL2;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e33c65d104so49708167b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730837378; x=1731442178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhNgT29qsSXSk2798XVRdp6/EMmGq7x2ZWOl8/ky+QQ=;
        b=CWWt4SL2ZVrVHms5nuUPhycQLO4hLjRJzhy7vp1Otkoo/zR9ZXb3Bs1t+jBtgSNGHa
         TcRKwcYVOzZGlZy5MaqFytMCcJQspTQ3uTFtB13Re2sVDwYZ8UsghaQNDGvWQ7/wRgp/
         6EbtduumXT7ujcu9WwMup/Q0a+xs2HhMyIF2JDClXj2c8gxA5YItGdCrTB2lStNon01k
         WGnNkZO/ZP3a8LkQz4jT8xKds6pifLKfMCbpRVkK4JFRiMi1LgUK7bY71xJ3LIUC1zOk
         U0B86itaG/HLdqjPvKohRYDZ4iOPFOxOFS90tZOFTKwAItXoYtJ0JdqSaX+ri19OVJHB
         BLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837378; x=1731442178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhNgT29qsSXSk2798XVRdp6/EMmGq7x2ZWOl8/ky+QQ=;
        b=WKG7HgyQTxFfAJxOh9VITaWD9cm5u0ilXtbR+0mET10vbW04bh0+d/x2pIEvtMagX5
         DZ0QVm64KmG6OgE/Lp8Ci8am+pVqWrrCtFDnZBXTlqD2Pm27S6OvKsAw03tnNdlyP4uv
         qcoDJ8iETIAocECjVjOZ8TPY97oVsrYjqI4YXSj5AvhdSQO3io3r4v5lEW9iRYEMUsRg
         PMYIu2yp3fo/ABMMKWR8FMjWZjgrtLwq38/FDEu0UkVPnS37924yO7UlcmQq7A2A+DFF
         A3GJDiunwboQiW07GkZYJTWwDUC8vBtSoIjSMRL1d8cMLJVoSKKf2Z83cE9FAGh4qK5B
         Vq1w==
X-Gm-Message-State: AOJu0Yz+tmJbrxOV5qTsT7NDMp1X3XXBgD+e4ZUyDm4w5zN6LhHrOJhW
	1fOVK7s2HzwSsl+wif9mnfafZAXX7Q5uy0IOCO8aPeNZ84D9BMf0GcUwrF5+
X-Google-Smtp-Source: AGHT+IHchm7umPkkAmzscuuKh8hNcqonpFbE8W+Ow1xynoTLXaNBHNjlxxKIsLmSHPdld/+EZtC0ig==
X-Received: by 2002:a05:690c:4612:b0:6e7:e68b:f883 with SMTP id 00721157ae682-6e9d8b0c799mr276836687b3.39.1730837377546;
        Tue, 05 Nov 2024 12:09:37 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9788sm24384527b3.9.2024.11.05.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:09:37 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 103/161] cdrkit: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:05:53 -0500
Message-ID: <20241105200651.39395-103-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105200651.39395-100-schonm@gmail.com>
References: <20241105200651.39395-100-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113621

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 225bc8ecb..4b57957cf 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -18,7 +18,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
 SRC_URI:append:class-nativesdk = " \
            file://0001-install-netscsid-to-bin-for-nativesdk.patch \
 "
-SRC_URI[md5sum] = "efe08e2f3ca478486037b053acd512e9"
 SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da"
 
 inherit cmake
-- 
2.43.0


