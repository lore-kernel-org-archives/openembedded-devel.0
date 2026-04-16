Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405ACF433F0
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:09 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7030.1776318662965919492
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IIqO4ePX;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-126ea4b77adso17588006c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318662; x=1776923462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7ZZ11rGeH54jjV1rWUcrznidbqeQPfm/vm+RCuCRKU=;
        b=IIqO4ePXkw4vhqUTCm2sqstZkubG8v+vJ6YLmHQCefm9NwHXr0nRReC4Sp8iY4Ynz0
         wgdczaudn/tp8gJNbLHCDaCCRWT+u9Agbv2Dad55YqRG5Cqgx+GYBkQ+pXlVdc1jB/no
         ctyDv6LBKLWIUyfYpuF+2tmuxWCHOD4fIjxqUoicHLurchnvWUWmhCZKtIDPQCoSh2KK
         fg8c/c2grxkbXUlkF1GrN5jUVFlONk6aQ74yH8RggXaXC10ogL+ZzoB/+e20myKWb3fW
         ACPR7k8WwaZwy65N4TEASbsqc8nR1Md6mDRdEBRN6U05tSoaI+FPRIZlWjLfRf9bfg0W
         4y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318662; x=1776923462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7ZZ11rGeH54jjV1rWUcrznidbqeQPfm/vm+RCuCRKU=;
        b=g+TzOa+v19mv8XuDXOSIwop6Hf7LV8z2S55XDYM0vL636U+f4ld5RZtrR17SifPNHG
         7UGG2QU9un3Ql6um0Z4VkhC+TAtlifqyrWis1/5nb3RGQG8rFZ4CVA+usk89m3joH4zA
         7KImdwRrZeRfEHrHAYdfu69FTaepSev5UmaYRjY+jTOy0Ayr8lotcT/U6sgWFmPK0odz
         vfeFAuVBCBt4ACOXUv/ImF0lrCc3keuZgrzByt42MEllr1Ybap13qnvwBD2p5XhFTP4K
         +oBTMhK+hmQq645prk+0/uafxzmNbYE7WWwQQQnuF8AQiwG/MHEEFC6xbay1i44mWLuQ
         IgIQ==
X-Gm-Message-State: AOJu0YztYSFa/qjnL3llrmhzElI18MtMMCsbxvp734PJCWPJZx1W5l6x
	MiBB0oI2ntFOjygFdsy2HoNpYq1Qe9fy05pKUCiF6FzJx4doecN0l70BL+CCzfq2
X-Gm-Gg: AeBDiesAo43C/Mm5L567iu9VNhETde+JWZh33EmopIytcwtruXFUdEz5yi+c/7fE0ZU
	W+thT5MtOJdRCAWWqYS8n1W+1hk5RMPYO0uVBmv5AFkPxo987hwH8qYqkujdHYuz2iv5ITs9jkW
	GnDzm3AU/emvyJMJ49FYc3H+Gq1KrYb8c1DVrxkPORhttJW3JohzWXbHMsTM7Ndm/cWCITIAUO+
	5H0zKASQtaWcwRzAUzd3P9QeQFx7zRSELqNHrxxlGAqLEWC4aIOdEFDtZRjZkl3Rbq58qwCwarc
	CK+YU7Ys2wLdX/hzOap1PGH97045mXlUJwpVl0sasGZNBSDEXH4A47MGv1g1AAvZ4aWpEcadMky
	T4spQIfDMwT59wOcFUOjj0onVRvI+PkRP/aHcBAh8CcmhDUtiAciMcZAUr8PPzqG0xrfp9Fg7vW
	8xGaPdDHNzWoZHK4uWLUMoO0KF/FAtfB42vOY+xV94kyba16Glva9BRENxdW7Om06dLxvBE3RkB
	/K1ebsPHHrqae/k5SjYVsgxX+dHz8MHs3n4znUc6RbS3wd27tLRSCOncMuSDnuS0b+PaaRjigYr
	sQ0sw27d3PzoqWKOytsRtqsimuzB5V5XsjGhT2dqHPhkFvgP+q8=
X-Received: by 2002:a05:7022:60a0:b0:128:d375:f1d4 with SMTP id a92af1059eb24-12c34eeb96cmr13425409c88.28.1776318661751;
        Wed, 15 Apr 2026 22:51:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 01/18] cheese: Require x11 distro feature
Date: Wed, 15 Apr 2026 22:50:41 -0700
Message-ID: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126380

libcanberra needs to be compiled with gtk3 and x11 support
otherwise cheese fails to find libcanberra-gtk3 package which
makes it hard depend upon x11

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/cheese/cheese_44.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
index 8e78162991..62073ebd13 100644
--- a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
+++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"

 inherit gnomebase gobject-introspection vala itstool gtk-icon-cache gsettings gnome-help gtk-doc

-REQUIRED_DISTRO_FEATURES = "opengl"
+# x11 is needed due to libcanberra dependency which does not compile
+# gtk3 support with out it and cheese look for
+# | aarch64-yoe-linux-ld.lld: error: unable to find library -lcanberra-gtk3
+REQUIRED_DISTRO_FEATURES = "opengl x11"

 SRC_URI += "file://0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch"


