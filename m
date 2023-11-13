Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659B2C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:10:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.1436.1699906197781965338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tgY6PyRF;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507a29c7eefso6772124e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699906196; x=1700510996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NIXRg4okyF7tDK77q/R8cxnZGHaA3wB3XXyIv/rnC/8=;
        b=tgY6PyRFKGSLA/WJ7pWwZqBTFxDtkDlQwNsMOZ7AvzKzRG9mSBLymZTzmHiR3gM9LW
         y6zG5XPomvu8s+Hp/5rs+neJ/uG1J6cDQFiEr9BbD0tg+kNmEDIeMhcfwqHwS1QsyqDu
         pVz1iU+8wdg42j7FLXG42U3khV5SsdvxidFqfeIMu0KNy5+cV4TBGUPEizlG/JfarTfW
         muSQOHK2rOgRz77E+W5ARk/cMbfXQIByjA2GmC0b2nK3sYwMGjo4TbDp0gXgT9VCJxui
         WEAthyVdhkYSf5mRBa2yqOa2PCTI9GudBFt01EKgCz3mN5tlMEUj6wkY+rTnoNLcYbjC
         mYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906196; x=1700510996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIXRg4okyF7tDK77q/R8cxnZGHaA3wB3XXyIv/rnC/8=;
        b=KJIrd9Up51Polu7gOqEmDViedtH22W0Ny3sie1spnai7d5SjBTkT5ohfOljO2Gx39A
         Qr1F/9CqerLyO8D+A5qWG1ml2joOwddBCqfNpLFWYHQXMQCPJHFO6d1uZfccFKlOxSYJ
         vLQhCB3ef6QQLfkGqtnLl3aQFRtduUn44HKOULIM3Zg7ajBWJ9XKRt8yFDN5iVReJWtU
         UR8LNcfBVB+EXNOyH+s2B5ArGcibRnsnvEwVzbOCiyWfGLFawLXVIxWBETVPjxRipFdB
         7GqWwF69l1pVWravhO/3DZWg7QR4glv0dUim9ECYEGIQOaBtGuv9ffAu8P16toWSTDoh
         yOVw==
X-Gm-Message-State: AOJu0YzSHKfDEItpsmVrQ4M42e4U9qviuMASWgrG62+s4r1pfN9n6AlN
	Ogdneh+53pfiJ+4NwPuBF64rl27OgKr4OKzpNtkanw==
X-Google-Smtp-Source: AGHT+IFik6ugLsk65ypRM9pGuIJe7LCitpFjcwNrtlSpxAsWb4Vwhk3ySQ7JJnuTBGLj/VysWPX/Hw==
X-Received: by 2002:a05:6512:3a8c:b0:503:28cb:c087 with SMTP id q12-20020a0565123a8c00b0050328cbc087mr6986458lfu.29.1699906195570;
        Mon, 13 Nov 2023 12:09:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi19-20020a0565120e9300b0050958802a70sm1070006lfb.122.2023.11.13.12.09.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:09:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gnome-themes-extra: tell gnomebase to use autotools build system
Date: Mon, 13 Nov 2023 23:09:54 +0300
Message-Id: <20231113200954.736200-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 20:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106681

gnome-menus source does not provide meson.build, so switch it back to
using autotools.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
index 227422d90c41..453839358a58 100644
--- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
@@ -6,6 +6,8 @@ SECTION = "x11/gnome"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
+GNOMEBASEBUILDCLASS = "autotools"
+
 inherit gnomebase gettext gtk-icon-cache upstream-version-is-even features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-- 
2.39.2


