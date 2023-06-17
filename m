Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101C3EB64DB
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 17:15:06 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.9536.1687022105243208171
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jun 2023 10:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=A+B/yOHH;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-57045429f76so22248067b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 10:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687022104; x=1689614104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uSR+bKyf0N+07uhR9vLRmlZ3C0cksgUR3Zup4kZKk4=;
        b=A+B/yOHHA0sq1B6TgG6/QzMPHV5ldKxQgbnXoYQZQdHcBamf79kSGGFtFfQUkJo4QI
         6eJeL7dE+d7rkhRg4/V/0InyAVvqwljxQ0WMmwDc38GnLKMp+bgUYcmYcGw64NSeHNNj
         mnRO+cpMqPngSfcQPU9r9pe9OF0z9V4Mrp48uZsNGgCqrgSmzr0+sPfOsFIyriM/EQF0
         hjJofWlPJuOtGee/VBE6dy4eW1T7Bp5e+gZx71C1o3vMTtptPHwsyCy8+KKizMhRJJC+
         vXijzCRPmbRDbRWoL+zZ+FpVMceR05ySXXpX1uH6KJov9NXaMKgFsaFU923q6ZL2+eVx
         k5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022104; x=1689614104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uSR+bKyf0N+07uhR9vLRmlZ3C0cksgUR3Zup4kZKk4=;
        b=dDo53tqwf29TSxPxTsvdWZFvo/RmIEjPaWp0dIR88m7SsGr35FGWeLF6vAsl9p200v
         lvZhPoZZTfXQUQ+HU9T+RGkllfTMKOcXGvhH/nvV6AL4g8mv5f85yh9QTWTab9UlFhmi
         a4YPsIfQX1KXAz1NRoT+HfnMErFT6HlYT7fUKJ4FiFHbT6x4T3CASt1GAHWkb5BUF+/7
         qJWeD9ZkNAkzWVNd2d4OIfnQxI6c7DUQqrq/SyxttxfBiohvc38vmtV6VRg/8yu+EkfK
         8+g9E9hiwSx28GIh32H5b/Rf49e7h3GaIM4JwmZffvNch7cugrwRbVj8nCl7zc5lQHWw
         Ksvw==
X-Gm-Message-State: AC+VfDxLgvvy/z3cTlTV8c8XWUpDa64Hr89A58K5TgCJv+/NLJy8h10f
	6gRkk+AGw6GmXKraBOQ+CLVubIJxKnA=
X-Google-Smtp-Source: ACHHUZ76kHnowGicZFgexylPgTEcZq+d+ZtBlyBMJgxKA+mf2LI+SCNAU/DA1g0WZ+ofrnycZYGYWQ==
X-Received: by 2002:a0d:ebca:0:b0:570:362d:84fa with SMTP id u193-20020a0debca000000b00570362d84famr4822890ywe.41.1687022104211;
        Sat, 17 Jun 2023 10:15:04 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:89fd:7ebd:1d10:5272])
        by smtp.gmail.com with ESMTPSA id o125-20020a815a83000000b00545a08184cesm5737043ywb.94.2023.06.17.10.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 5/6] system-config-printer: clean up DEPENDS
Date: Sat, 17 Jun 2023 13:14:59 -0400
Message-Id: <20230617171500.70558-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171500.70558-1-akuster808@gmail.com>
References: <20230617171500.70558-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 17:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103350

From: Ross Burton <ross.burton@arm.com>

Remove intltool-native as it is not used, and add autoconf-archive-native.

Also explicitly disable systemd when not selected to be sure it doesn't
automatically enable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0713297ae90cdf6fc7339ebdcaf5f6f839bcd028)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../system-config-printer/system-config-printer_1.5.18.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
index e70edef271..883d582371 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
@@ -11,10 +11,10 @@ inherit autotools gettext pkgconfig python3native features_check
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-DEPENDS = "cups glib-2.0 libusb xmlto-native intltool-native desktop-file-utils-native"
+DEPENDS = "cups glib-2.0 libusb xmlto-native desktop-file-utils-native autoconf-archive-native"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = ",,systemd"
+PACKAGECONFIG[systemd] = ",--without-systemdsystemunitdir,systemd"
 
 do_configure:prepend() {
     # This file is not provided if fetching from git but required for configure
-- 
2.34.1


