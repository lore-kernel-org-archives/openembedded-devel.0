Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C1DC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:04:31 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.19858.1750169069664901164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 07:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hc+2fBnP;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e75f30452so35952977b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750169069; x=1750773869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i85EMlxWw0jIHp/3orXFIFrfFzho6Vv1w5XIuFxs9sg=;
        b=Hc+2fBnPYmLIZh1hkSeb/vAyTvxe3Xp4Y36Xlc/X9xj8X+Mw6UJ7XUDWAJCGOtdOyR
         G7W/SlZQVJ3gje0VyIPG4hdRlkqn5ZwIOpFC2PNWRywttl4ff9mHkWbOEtBrZe2QIKt6
         251S6pRpT10XvJlpc2CCtxh9YfXtOKz5LbVgiCqScKwM5PViGXhXC6rJONgXMwWmLnEI
         MXjKoSXJof3GRObE1QKgEDWyC55o7s7SdRk92c/0DTRM08YBhUmhZ7hSRJV6TggyiOil
         1P87ULER/0M7RZ0H2sfswMgagVVqnnrSB5bOJK234rwwgEKsS3Cj9scklR2FsNy01D2X
         A3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169069; x=1750773869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i85EMlxWw0jIHp/3orXFIFrfFzho6Vv1w5XIuFxs9sg=;
        b=QNiVNiT40ahAJPgBaZVpjvcuW6ZIc9v/Ybg5NQ3zWnVsXH8iQgX+T2kdwqFrF8LwJ6
         1xrr22381dwQUqEDge0wxYNnmFIrZxaSI2SNqc3BHyBaFRqZIcRpnn9s5qli+Y5sQQ/S
         ipIdODJkKeu6rJrvh8NG/5Hv8W+B03kp0vOijkjETyKR0FHx/yk/cZ5NRj+c9Fph2YA0
         aY0AsepZkkgSrrow+UBruRBlPrAkuZwW0XUzur86cSR+BtHjR7LWeS/riJlUnEOr1c/H
         yj0WUelRNWFbW9iZjHl5s1r1YKHD1DwEpxvAU+oUwK7DzidgwmtWmOw0VtJQOwWE/Vt1
         Yq4g==
X-Gm-Message-State: AOJu0YzPv2j5tJ2oqLa+5bo8WDYe7u8wtGnvZFGw8/6VCRB6yahJbw6N
	p4f9P6ej3WcdcaCHkToX4BEW2QlAJM7/Zt9350yoIU32FXVsLav+STDzehf4VTEx
X-Gm-Gg: ASbGncuHYpbwkDMoafx0Bqb7WEGXd/PueEn9iT1X5WtAA0DdDAnPtmQWo3Xk9awb8OB
	e4P4TD7FjAcsnAT78InCyVkFU+vq2Y5MchnjnqBC8lN77GX/mY4I98Ved/KU82E1830G/i1ShXU
	mgl03NYFdOCM9ikFdhEZjaqTAB6l4fmjt3/PIt4YQB93wou1XUbzyttj0SSyI/atHHSJ6fBTXdi
	H/gsREXHiTt+qit3OIMUk8GPD2yeIXXgh+nw68E4SC/mNT+jiFDmS189yb+gKsSV9fJUYsywkj0
	ZdFfh2KqffKqToz2THiWI+69lA89ptHJjaipbM4VJt4XfPR8vFEBMly17WWWHBmVlNY5IpteBpN
	Nt/849sKy2ROZjxCX66g5
X-Google-Smtp-Source: AGHT+IEilHigd6HXQam/Wf2XSmZaQdEgauFWFcNGJupZl0nOXJ72iqnY9DBb4pzbI+hcjwU8GmZBnw==
X-Received: by 2002:a05:690c:ec7:b0:70f:6ec6:62b3 with SMTP id 00721157ae682-71175471b27mr196950157b3.26.1750169068081;
        Tue, 17 Jun 2025 07:04:28 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71179645e78sm13850487b3.74.2025.06.17.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:04:27 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-gnome][PATCH] Use GNOME_MIRROR
Date: Tue, 17 Jun 2025 10:04:17 -0400
Message-ID: <20250617140417.727483-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 14:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117926

http://ftp.gnome.org/pub/gnome --> https://download.gnome.org
https://download.gnome.org/sources --> ${GNOME_MIRROR}

Drop the SRC_URI[md5sum] while we are here.  SRC_URI[sha256sum] is
already in use.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb      | 3 +--
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb | 2 +-
 .../recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb       | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index 0ab9b14692..d3fa032fcd 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -18,8 +18,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 EXTRA_OECONF += "--disable-glade-catalog --disable-gtk-doc --disable-Werror"
 
 CFLAGS += "-Wno-error=incompatible-pointer-types"
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "b748da426a7d64e1304f0c532b0f2a67"
+SRC_URI = "${GNOME_MIRROR}/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "691b074a37b2a307f7f48edc5b8c7afa7301709be56378ccf9cc9735909077fd"
 
 FILES:${PN} += " ${datadir}/gtksourceview-3.0"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index 38ca4a39e6..109050397c 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -14,7 +14,7 @@ inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspecti
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI = "https://download.gnome.org/sources/gtksourceview/4.8/${PNAME}-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/gtksourceview/4.8/${PNAME}-${PV}.tar.xz \
            file://0001-remove-pointless-check.patch"
 SRC_URI[sha256sum] = "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3fbabbb5958420a87d"
 
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
index deab259299..939d053a75 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
@@ -23,7 +23,7 @@ inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-cache go
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.16/${PNAME}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/gtksourceview/5.16/${PNAME}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "ab35d420102f3e8b055dd3b8642d3a48209f888189e6254d0ffb4b6a7e8c3566"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.43.0


