Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9A5C47073
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.218943.1704025421519499349
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JJ35Ijsr;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a27cc66d67eso76468666b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025420; x=1704630220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scrbgmprLNLAsavBwKZkOZW90dxnS6dg3Ts7cTRBxKw=;
        b=JJ35IjsrECU0SiltpXCdJHnS/7EBEBxkHYrcT9elxOf8NOyt9IrRRidR/ks2hKHvpQ
         5EENJntLGvnUjUObR/hQt9NXFx7S1ux+j6mNswCkaSuRXvVtQCmCrReWWYIBmIUu2jh9
         VEMWUDIAP0y5msmg/VMzE5SZPF/2MQPidAvbiEUQ8rDkzOQi/sA+CY2s3or+Q95qzJnb
         K/5SY1zUG2hmkHg6MpyoBZOvvXeHD3e9EpdMAEiC8YsT0qTrLGftOQivmr8lGfs83Uos
         AcclrlRMW1WJr5NJxh/f64QEVw/UiYmXYI0zEQyQLnoOeS59bMRmkiKCUdt86F46jnje
         qScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025420; x=1704630220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scrbgmprLNLAsavBwKZkOZW90dxnS6dg3Ts7cTRBxKw=;
        b=YjdhadK97hDERQzNXgPgu76MZpCO55dHP2SxSaDhS/2EjYF4te4NaNJX3Kx1cJbuoQ
         4NMG+QjdkBZddtDIisfrVK4/qccYpRSw3dpgLSE74ffHRI1at8GHao0mZA28SzO0P+JJ
         fEztc/WY0pgLL4kl8DtKIMubgLNz0WisU3uc1UiN7BfIFsRxuKviPmnCA03192EW3JAY
         LpISP8prJJ6DU1iaVd5UQiDnENbYvc4W9PiiDQ1RnJp2VmBDvEEg7soQXQ5XkSN5Y5tC
         HXDTgCh1qiGrWecE/LTk14FLUlFKD/rXCe3lLt1hkhkaHHXqrRt8byIbALqyxG/JPHGk
         4R3g==
X-Gm-Message-State: AOJu0Yxxsfpd0b1d9QGRpeYuTtAMtZ+d3SnUs7TW3ulNCL/2gvu/KcSd
	DsoFxICfdYUbDezkE59LKeGUvyhyCSs=
X-Google-Smtp-Source: AGHT+IGdUQYb3t9Ur4reok744W9yx137BFlrajxOmDzsWnzFDKpixINCWJRNT1iyn2E0BLY4Otaoeg==
X-Received: by 2002:a17:907:9709:b0:a27:7dd8:5674 with SMTP id jg9-20020a170907970900b00a277dd85674mr2609720ejc.133.1704025419999;
        Sun, 31 Dec 2023 04:23:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/23] system-config-printer: rely on setuptools to obtain distutils copy
Date: Sun, 31 Dec 2023 13:23:14 +0100
Message-Id: <20231231122329.405225-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107959

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../system-config-printer/system-config-printer_1.5.18.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
index ead875824..cee907884 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
@@ -11,7 +11,7 @@ inherit autotools gettext pkgconfig python3native features_check
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-DEPENDS = "cups glib-2.0 libusb xmlto-native desktop-file-utils-native autoconf-archive-native"
+DEPENDS = "cups glib-2.0 libusb xmlto-native desktop-file-utils-native autoconf-archive-native python3-setuptools-native"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)}"
 PACKAGECONFIG[systemd] = ",--without-systemdsystemunitdir,systemd"
-- 
2.39.2


