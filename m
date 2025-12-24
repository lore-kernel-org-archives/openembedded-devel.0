Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F93E78484
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:25:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126345.1766604322978200900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0PGl/hx;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so45114875e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604321; x=1767209121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4jKD2H53hRX5RVatj9DipvYgJT2duSN8SSqdztsBL8=;
        b=H0PGl/hxMXqaWazPRKcU31J4N/wdA4HlUhiDO3CBEEuWYXTMb/0M0xjcqGQVSd6Lyg
         HEbewCGP9D3d4Tp34PFBgY0RvRGKYViPOE5ZR8I+VTG+TzjxZIisHP+BBwbb/HwkMWeB
         rM3O65Yqo9EBeVXdiuZ0GsC8tpXp8e5qAv42SEIR4NWGPayeetStCFYIFy/+bCU9Kxnp
         eBtLl9uWv8TwYhXFVsSpooGRL3FdWQDSXO+Solewc8r/VRiD4ewJhObgDUE73H6rN7c5
         kqMljnNeII25Lh64mBlWhCWdx+A1m24TEC8DvR6OcqSWlM7QNAtWUEvWNzb1s1324oX6
         khXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604321; x=1767209121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4jKD2H53hRX5RVatj9DipvYgJT2duSN8SSqdztsBL8=;
        b=McbjjDva+2cQwwAzghP0Vg1i0AKPgXB5INBhgtEFJNRdd4pkD7DmfZdHiLElegPbhq
         OAklIgeiRNDcdeM777I+HHoDHMTz9qex4s7PpPzeBqzPMP4qAtAolof54/CiwS+02qlq
         ogGiMXJ0+DfgGq1Edhm2qcm2LKqvC3BWWhPLOKXGdszDeSHS61LmYDGopbbdWQCo/HAM
         Rx1dvHPPG4tcZQiRDAHBt5gHdZc9tWx1lmRANwM5qhRPPfUYk+y2zP0qPYLVqit/lUY1
         cLsZMQS0Kes/k5Ae/Z3tTpqhtENHf5HIo21e8IaGwBeQQZLZWE+u7eGmlCWbdUGJMD3m
         J2aQ==
X-Gm-Message-State: AOJu0Yw0v6+eykLRlAWqoUALNK2X2e7c1sr62/fU/77NGZzisuzjnTLr
	eXU6HieqzQ6PeAO2ceq/ev9uijtQVK05S+upJhDVzWdlP1KfC+blqHsyg7OEwQ==
X-Gm-Gg: AY/fxX5HcWBfM2eogJI0WmWpYx2Bb/zMNxktLYj1Mle4DzuE+JqM/oc6iKn595nTnqe
	AEuWHszghBd6//aaCrHhxNtcHqqPOmepbzF+7iHBvl1AwaNHm3mUoht/KtixE8Dc9r43x1GGuBy
	9Rqd3Y+lbXhTlK8JhDzozPMxIaGYcg7tZGO1eJsgmrVbrUIQ9P8mDAGlWgqCs0J2EY5e/H7amMo
	r1o6wGsOlyn35OdVTfPemLP7K/S2ZYKBJ9/dR+/pQ2iqnjFnW9AVKuwYa5RiFmkB+ReDHh6VKU3
	yL6A6jt6vbPHjBvOmu1f1V5EWuv7tTGI9sHC9/ElJovuM9yfMMJFhM/mfQKo8XT6IO2YFYM4vm9
	e4DqDO3uZydewfcAnxjdxylyh8zD4PywCbzRXz3h/eia4iiPPuOZgbpV8Frtk6Rqv5KMODt/hf9
	13M/AwOOPg
X-Google-Smtp-Source: AGHT+IG8rNIQ+dt6925v3ktbFETQ/qg5FIvybxRFX/t0+KhoF2MozVHA/w8AFjn1/uwQq8L60erABA==
X-Received: by 2002:a05:600c:848d:b0:479:3a87:208f with SMTP id 5b1f17b1804b1-47d38848706mr62402455e9.36.1766604321310;
        Wed, 24 Dec 2025 11:25:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm36782038f8f.17.2025.12.24.11.25.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:25:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/6] libmediaart-2.0: upgrade 1.9.6 -> 1.9.7
Date: Wed, 24 Dec 2025 20:25:15 +0100
Message-ID: <20251224192519.2630037-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224192519.2630037-1-skandigraun@gmail.com>
References: <20251224192519.2630037-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122887

This is a bugfix release, fixing some memory leaks and compiler warning
(and it also has a couple of commits related to the project's own CI system,
which doesn't affect the application)

Changelog: https://gitlab.gnome.org/GNOME/libmediaart/-/blob/master/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{libmediaart-2.0_1.9.6.bb => libmediaart-2.0_1.9.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/libmediaart/{libmediaart-2.0_1.9.6.bb => libmediaart-2.0_1.9.7.bb} (90%)

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
similarity index 90%
rename from meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
rename to meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
index c5d497c468..e52ee61b74 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0 gdk-pixbuf"
 inherit gnomebase gobject-introspection vala features_check
 
 SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17"
+SRC_URI[sha256sum] = "2b43dd9f54f0d8d0b89e2addb83341ab06d7b98cb1b2e704383584af9c560f6b"
 
 S = "${UNPACKDIR}/libmediaart-${PV}"
 

