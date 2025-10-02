Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E681CCD183
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7969.1759409984739677392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EVuMgZIV;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a16441so176847066b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409983; x=1760014783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCnB0iKvj/ZaDwe/Z2x1qjO9pl4ewu9H1Syghq+CyWw=;
        b=EVuMgZIVW9ertzsX5K3CPub28J4gVECdRsTxJOPHpEyreDP1Dd+8PYqMEKzi/oDMl8
         nYVSA5psMbMmnEz+hprAbchkyD4e7uDjRp5c+jOTwsKz+a/7YIhpNM5E/J9hLwll/u1d
         UGXUfCS2Rr+q5yvMvdwWc/V9UOrqKDcJ7gxePbXXnZp3Qla4ek+dHwkhBhnpoEzzyGUJ
         522pXTl0++L0yJQR0gLD25nwU9f2cZSfpxaOKaTxNtPgYCZ09DzzQtXH/lHzAu3Aiaib
         4VZ5LzghyU7JM1gJ+KNmXa3W38OdHc2Sk+3az/W9Lcd9Qm0fz+BXiuHtoxAOBPC13xbf
         T6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409983; x=1760014783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCnB0iKvj/ZaDwe/Z2x1qjO9pl4ewu9H1Syghq+CyWw=;
        b=Q2gMfeUQuo0Mddt23PkRly1kUSok/3uNKGDSelzsgWdW+gsw17qJxBNdvdSSrzfULe
         Kj6cOdG/0uVl36gTJ6RtUCFqQqaKeMTG8TBf+xrDA8doHNDKgeqdOgezc4dg9Afm4iZC
         wstM3Cui/l2ZqRH7BUtC/y9yxT3KAPPxDQxcwrq2whR5JvBfJnjT/wmSV81jcUDHTM0O
         hvaYZBFEZX+sD1aAiam5nCbfTB66YPWmkh8LUOWC4YYlPzZjl5inLFDHuAveDzwAC5oY
         IO//lwQDTRuLPirmHGt330jbBAz2IgC8iFCelJrFImh8nKPCjkYcaace0R8UEdlA/0Hg
         vTeg==
X-Gm-Message-State: AOJu0Yy/IkgTdthdAvpR13+DmTpHIyk87EZIYCBKblLDLx5VvO9fH89b
	s10KkZp2rt2xsPogkyB1lBoQn1aXrKEBi7Z4rS+FvlH7CUGkD60dAe/cahOOpQ==
X-Gm-Gg: ASbGncv/hQbmKVtDFIGtMbDUuMCFr0ZdzaYdE63k+ObvlT1I75C05n7OsQnnDQ88hnd
	49Cvsl7ThVKDxfK1nAkHPY9+n79gh3A89D6/s4TB36HSk/gmzFge+Qy/imMFoTp9B5pV5DXAy+Q
	tu1I1bJ5ju/cQYuZ/CpslRV5g8Vyk5iwyNNFbCfWnCKKbLAGecNlczutfOW2/8U4Vfz1ZbaJ6gA
	rKbmWF6YTOvqC54XuvGIGTakRkAq/kSfES7A1HC+0ZQPmt2GaTOzHGQkJ5vRpc2Q2mhunjiFira
	COrc7S2Xxd95vtHZl6EmNTjPxtefi09uB6G3hlsV4SUUIV5p6kNsjYixdRlZa4Hsw5mRUXpYean
	1reBTKUm3wRS0lrZRPgX+tdHAMr6ISYvSYgF837zMWplR
X-Google-Smtp-Source: AGHT+IE1HIFJf3aIlRtkVvAkLLd6NS5GILw+WwjsTwnoariUcLH5ReWVrm7fqJ/IR7512pHLxYalgw==
X-Received: by 2002:a17:907:96a2:b0:b3b:9931:3aaf with SMTP id a640c23a62f3a-b46e22419f7mr882363366b.28.1759409982988;
        Thu, 02 Oct 2025 05:59:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 21/26] python3-txws: add missing run-time dependencies
Date: Thu,  2 Oct 2025 14:59:21 +0200
Message-ID: <20251002125926.2624522-22-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120190

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d334d496c36f326c9025fbe259f96fce62edaf1f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index c075e42700..ef6375546e 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -6,6 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76699830db7fa9e897f6a1ad05f98ec8"
 
 DEPENDS = "python3-twisted python3-six python3-vcversioner python3-six-native python3-vcversioner-native"
 
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-twisted \
+"
+
 SRC_URI = "git://github.com/MostAwesomeDude/txWS.git;branch=master;protocol=https"
 SRCREV= "88cf6d9b9b685ffa1720644bd53c742afb10a414"
 

