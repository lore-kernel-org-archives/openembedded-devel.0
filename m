Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAC8CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:42:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32791.1792042975481727279
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E6Eyk5uf;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8455755f3so25496125ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042975; x=1792647775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WdpT7UjNmsfxPYoCphuPVuL7XK/Fr3qj/oS92gc0yt0=;
        b=E6Eyk5ufGpNp/k+eMB3hsaFPtQeTWPKYvNVNVab0seshpw0voDjdiPxUydgVxwKBjs
         IxMWxRQBOM1Umqmi7OB4ZZGYcjpaBBfmxOqon27IlsDj0r7jraYeZzQ+dIrIMYrQvuXx
         XV0LL9ZYzGzhZ2ktlLMLwDvA+2yoaXb7F7tv3NFA/RE2wVD1mGBibNF00Y/KetaHT+mI
         jsrNH6rYM3mshJNWAb/pMljJXyuQd2KoSUQ8+djRfDB3ibxQlp2sa1vah5q67BfBXlKN
         x4XPxJnRuY5QfBiNMfk/wiz8vFDPMd3tLPiOa3qFpY4ArtqIRbpbOa4atSVPHcKiz2R3
         WIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042975; x=1792647775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WdpT7UjNmsfxPYoCphuPVuL7XK/Fr3qj/oS92gc0yt0=;
        b=u2wP3JPQwLr/ja9MVxQ4kFUZ+DwYc2Z0qiiTwaNuz0npSOs7Ic0sQl0V1AtrJt1izv
         3+CRkA+Vdc//GOeYtQUIdadZd2HOeHcctGlqxkqgtSXtoG/U7mW+bN0ef1exEOHg1THW
         7fhtI/YIwpDavE2U+D3nQAY3Cd4t5TWTsZ610MpyoX+jRjVzakuzsKScS0XiUuslL7Jc
         diYw39eFCOvwlaMk5m23pInosr3T1/ftw6mHsfdGX5ChmjYnjZk35BNWHMGKPQDRG8xI
         BOF0BALZiPeN1MP8UoGYBdLvGoSSXqvLjn3I4LH/btdCdyS5HmCt2guOwW1kytShThnY
         COUQ==
X-Gm-Message-State: AFq9FYK1XPti3jsCogyYPZ38vsocFpiTaZJYB5I6hlFeQCYGPyGLlR7/
	m15DHat1/sCGd4C4/d3Ix0intvH57GyEnRFu38YZXvve6N/G0xj6he2x8JjE6Q==
X-Gm-Gg: AYBFou37Wzi7/I62OxDxSurDr0otblFBLnSxg8JGGbCK3MwyJVOsNIcWK7gjeVgFpQ2
	49bu5jceWqFBywhubJ1eRBLZR2OJP9hWtS+5AU/vdp1EHBuWYT0RvKmGTCCIc/4lWYPpHjzM9zh
	e9DiBqCnlpAVhSPm5g+0vYCLDnzqNAvWYUn/SSl6kpH6N/tCuCbNYvohi3IzxMG4E9KNF4ieEHW
	DLwZ4iOHug9PX04LxCQpV5wdLqlm2iND+8HvxTtiqJ/rNfkHRYUSZQmt2eL40goVR68fAkELIzd
	BYnm5GK6BRgf7hlEBLfSvIGv7R65BXckYl60jlLSOMK3NYsrC7W9LwWvV+mvlLJdD+8sqVGf6kw
	SW8PLBLW14IW6Lnd2K2YisB+ILVVpgIJcK8sU1Ym/ZNbnEe4fmVk9/PbqEiQyGi+crGmM9Emfqv
	FSEJRjsTWZYn0op6im4YTylEw+nQJO/zgLLcG1YmC6+eJYzl0nkK54M8s8yhzlAlmKENEBWGK02
	wj61l75iPLUnDcP3SS3HIs=
X-Received: by 2002:a17:903:41d0:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2e8429a9fb0mr162022125ad.10.1792042974774;
        Wed, 14 Oct 2026 22:42:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.42.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:42:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/82] pcsc-lite: create pcscd user and group also via useradd
Date: Thu, 15 Oct 2026 18:40:51 +1300
Message-ID: <82effe671227815a2c64aa2a7431e074961d20d7.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130923

From: Bastian Krause <bst@pengutronix.de>

The recipe currently only does this via systemd-sysusers. This does not
work for read-only root filesystems, though. So use useradd to create
the pcscd user and group.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
index a8735a449f..daa1b78304 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "autoconf-archive-native flex-native"
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.xz"
 SRC_URI[sha256sum] = "bfcfe38a20afc49849c6bf55325e38f449fc4b26d3923fdc32b969ae41a8741b"
 
-inherit meson systemd pkgconfig perlnative
+inherit meson systemd pkgconfig perlnative useradd
 
 EXTRA_OEMESON = " \
     -Dlibusb=false \
@@ -37,6 +37,9 @@ RRECOMMENDS:${PN} = "ccid"
 RRECOMMENDS:${PN}:class-native = ""
 RPROVIDES:${PN}:append:class-native = " pcsc-lite-lib-native"
 
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --no-create-home --shell /sbin/nologin --user-group pcscd"
+
 FILES:${PN} = "${sbindir}/pcscd \
                ${datadir}/polkit-1 \
                ${systemd_system_unitdir}/pcscd.service \

