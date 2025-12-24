Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89508E7848C
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:34:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126493.1766604886223790734
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B6Jaaapg;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so3846959f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604885; x=1767209685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeoTxWekxaUxlltQvnSL66qSSxOO1WbTv7pRczoKDos=;
        b=B6JaaapgpiLggBaQqn66IKamTmJ9q6dVpP1msiGE6NJHsk+cIZSKcaskIMdTfeIV3u
         z9dY7PKUyG9VkFqrwu9OadpnuFkCV06sNh5sN9PD3G6YznH+wVtfhWC0Jtk9BoPrXOQl
         qSpRqu3/1uDwS2bWPAc0wGi2HT8AxfDyXTc1I2dpUZ7W8aIuFtJU5OXgUZvNav0Wz2k2
         twaJpaK+7ZWI521qcvwrakrOTZsAtNtEzfGh0vSvKBdiXPTK7p+ba9yakmFdaZgBIFJG
         /O5HaMN36LcHE07GATMwwn47JiL1HDm8LxmKKXqtZw7Ncp+RAxjR8xtNKDRmTlbLs/SG
         pK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604885; x=1767209685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SeoTxWekxaUxlltQvnSL66qSSxOO1WbTv7pRczoKDos=;
        b=JKA8yLKeeD+5AhMRZyxb6+A6vOwQxX1aJwK61CErCfRImupVCDM+T9Dj5QZLQD6ytW
         EC9pKa1zhg5HCW0pmzYyfF5SY2pISKcFV/uZhizs9H9oTsl/v4K1dNDnZy0aWXQF1xP6
         TUe8plXovvNxGAckvAMejGJOZn8ytzRdGJYesDJciiRaGBNhDnIVlNMEYIw46FatHLaH
         RXus4let6aEBfU7y2Up7FTLF06wQ7S6UeoQOZZUgNs3xzu8KxxdKltK6KbjtP9Mu7h/4
         mHAa0iw1C5AWbSmefNt/n+Tap9HzeA81Ts7qXwJh5KavhlM29f7t9Bs/bZl/tjlKVgeX
         iKRQ==
X-Gm-Message-State: AOJu0YxVtVy8t4tAfN46pBo/d5lqHqZSZsLD59iHeCU14kxLKHoinUP0
	3iYSfuGlJ5RQjDFm63/eX3tFDqxxHUV+Z3rRLZNdM94cBQZIqE7oIuAYHamnyQ==
X-Gm-Gg: AY/fxX71vptu/p9g3wG7lDMqMuD9ekOjtX1N11AL9fNxMXEpsMFTlxkMLKwII53gWQx
	61CGn7oQUlejFcJQrgJGmpokVGKxprCBLvHtWRt3fpyxN4gMHZRISRg3b+EanS++Ahnqa+oLMix
	V3x6GItvq7GcMErelV38Aux48xoC/d/pcq2LT+CUTCYhYXy7zhlvA4R8PhDYcxvFQFBp+PD1Svo
	kLotY6YqQY866ve5CRUk5kyC9ooxub0kCtk3eq4MDHGO6/S+QMpa7kysTUV/EWF9VxUX65brsA3
	c9GhfWh9MkFMRdGHXKJJ5Fr+o/KR6bUozfSiLz/NJYQIGUHWuU8S3EpT0JS9Z/5EiwWVp4vPkPm
	mcTiHBnWaP17phCuYu5qgIGEyCfsgRIVuq3+4mxcn07Lrc0CodJcXGKkRzbjOx8JaxWy0YbKP8l
	vu+7ei/HIkwPOjC7s+pkU=
X-Google-Smtp-Source: AGHT+IFCCdmXwGM/MaAmKtyBOOKtl8C310rrscauWrBGKKWR6j+E0L7KzNnTquIn2cgum8TUFlEGvA==
X-Received: by 2002:a05:6000:200e:b0:431:9dd:2cca with SMTP id ffacd0b85a97d-4324e4c126fmr19182335f8f.7.1766604884567;
        Wed, 24 Dec 2025 11:34:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33750665f8f.2.2025.12.24.11.34.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:34:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 5/5] libmediaart-2.0: upgrade 1.9.6 -> 1.9.7
Date: Wed, 24 Dec 2025 20:34:34 +0100
Message-ID: <20251224193434.2631122-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224193434.2631122-1-skandigraun@gmail.com>
References: <20251224193434.2631122-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122896

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
index 90dc6ab498..7058fa0bab 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
@@ -12,7 +12,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection vala features_check
 
 SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17"
+SRC_URI[sha256sum] = "2b43dd9f54f0d8d0b89e2addb83341ab06d7b98cb1b2e704383584af9c560f6b"
 
 S = "${WORKDIR}/libmediaart-${PV}"
 

