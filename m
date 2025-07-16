Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D609CC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 22:56:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.35745.1752706583966129856
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 15:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YVAJIHit;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23c8a5053c2so2968575ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 15:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752706583; x=1753311383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AUn3uc1GX5hfllhDfcMF0a4V44RynlAEBbfWR1NLYYA=;
        b=YVAJIHitawUemlQuXFEyQ+GHQGM9G/NizWX99qX7iEL8bUDaWlSYo6w6RZgl1TC63L
         wnkHni653c4xXY3dXFye19gYAtQiy3Fwm0Twpzj8ugtzab9J8FcoP6LzTg7Cuw0TTay9
         JsKJJRE2Y9iJOFaYEX9lWt0oMyxZxdeZyDpVXa+hnlL6YRXxekoNshhtjTMXamakgqL9
         tPsaHS6XFUAdwh3fdg5HvXC2iw+W5r8lqGBz31v26zaPm5t2r4J1fXaJ3FOK/Igfmx6d
         ZHO/zw6Be13PrKgHQ8IsyEC2gnJq2NvZEDErYJyqd2fD9RST0W/cYna6TbMtFKZEySHY
         VPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752706583; x=1753311383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUn3uc1GX5hfllhDfcMF0a4V44RynlAEBbfWR1NLYYA=;
        b=HOGNH3HPiBWzgdS6vQYYJMGfWpwfHk8tSlxDEaSs+1AicB5GLy1FxwpuE1iZ5lJcA7
         1Ynf9Y42aYUOb3pbMztIEJMpwJZOrOErNNBdH8R9DLqQXQayekUPYbqTrXdNlUvJEoRf
         MoGCBxdaLZHUEP+dwYpKbUiHhar0bSJlohDwXdW3RK+fBad3wicZeItPTXwGm29rBGw7
         T1Y050HB82/qbQLKXylgPZDqGiFyZHvvMJd2lg6DNLwwm2Jp8l+cJyR9jy818A8syvtV
         StsrPYRdaBl/LLXFjz+wx2tk0bH7q9bmSb1uLHUmpx9ozb+hwVXLZkT/m/tTjfxZrW02
         DnKg==
X-Gm-Message-State: AOJu0YzkiKHh5RDSmXPKNwAgJFrBbi4npqYbmY1vq3uanG7kROzgZc9z
	VhhGEqFKbm6PPQx3I3Xb1FMJVsLVEPoiBdYVlhVXoD4yAM3TUq8FGjnqr1NhpVNy0bE=
X-Gm-Gg: ASbGncsJiPsRyAFGsei56DD2ecax2eeCNDbB8VqTNuxIc+tj9HCgMz4EnLj+cQ2BDi2
	AJ4MBhSrEXJgWt4yxUpNV64FvsuTx0dOMYGAO62hP8y+Msru4bbB/es/oYFnznufBdDlQJgwa0i
	ztlNcVe+x3AI4RbqRDUiZyCyQ34fEDv7jj2UrqbCiRqCLO7RvpMqz5BSPd4ZTslo6ORqlicqH32
	o6v6SM+1iv4qmp7aCH4sz+MoeNgiiJzIl908RVvUGCcTd+mw+pozrL0GhQHU231gXVzU/jol/dQ
	S24cxmSPLFUxxEmtFXVs7oNvueS0cmibRLvQmxSlz9U/2yllAXHBXx6OFMCR1JIr+Jw01HkhOpD
	P7WCqCQ4ZEbmhJw==
X-Google-Smtp-Source: AGHT+IGOANY/Ge6r57l4Ed3uEPoweemiWC4YdsK5Oc5TZenXGbArEGZKTnYtIo9uJZkWjoGGEHepeA==
X-Received: by 2002:a17:903:46c3:b0:234:a139:1206 with SMTP id d9443c01a7336-23e24fe9e51mr77585655ad.40.1752706582994;
        Wed, 16 Jul 2025 15:56:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::64ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322cbcsm137736665ad.137.2025.07.16.15.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:56:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-screenshooter: Upgrade to 1.11.2
Date: Wed, 16 Jul 2025 15:56:20 -0700
Message-ID: <20250716225620.2602291-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 22:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118602

* Switch build system to use meson
* Download xz compressed tarballs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...enshooter_1.10.6.bb => xfce4-screenshooter_1.11.2.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.10.6.bb => xfce4-screenshooter_1.11.2.bb} (72%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.2.bb
similarity index 72%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.2.bb
index f843b9459e..a55931b9c6 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.2.bb
@@ -5,12 +5,15 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup exo libxfixes xext virtual/libx11 libxml-parser-perl-native"
 
-inherit xfce-app perlnative
+inherit xfce-app perlnative mime-xdg
 
-SRC_URI[sha256sum] = "992066cfecfb44a68681340bfd55d524d40410aac3da6ef25c6c6cb2150a5965"
+XFCEBASEBUILDCLASS = "meson"
+XFCE_COMPRESS_TYPE = "xz"
+
+SRC_URI[sha256sum] = "6ae5bc4823d43e770b3a11700d048d56bdcaafdef37de7deacb8970b55fc1565"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native wayland"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled, -Dwayland=disabled, wayland-native wayland"
 
 EXTRA_OECONF += "WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner"
 

