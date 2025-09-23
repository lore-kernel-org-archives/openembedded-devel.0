Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AB2CAC5B7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.14128.1758625609657742089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nm7vHEvy;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso973674366b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625608; x=1759230408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qCVsOPW3vKD0xXsZn6C/s8xqkHM8yY7a8++WgxsFg8=;
        b=nm7vHEvyzMlBDHezeDNOIeo5kU7zZPIwRKbCyweHi+lxoCsttSk6okAqRLJlwrRc0A
         2rD0j1X7qqQdrGS/pkILdV24F1vRY8YFVrGfjJoMs1+P9BmFu15Jqy3N8UMMEJTH2oDT
         028QDYPdP1OYSMRyHtScZlTsaIklM+lEQ7iNttIcax/I2I4tJeyvWnHRRqxLhOHWJLW/
         1uGSP/SGYlKatnysAEtwqUYhyOUZ2WwzT5P+16zqLwsVdJclHN3LkwmgTTvkj5HQV1SE
         iuUaD5SLZfZKK+dSUA2aGr/j2IxBywWyliOUVYmPGI4Kwr3tW++GG9e5VNCExnJBwQMN
         0Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625608; x=1759230408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qCVsOPW3vKD0xXsZn6C/s8xqkHM8yY7a8++WgxsFg8=;
        b=iyQonblbBTZG/5+Et8mUIKSjZpE+DHHEDobPsHQwBCcH7/VrpBcp2RWS+j4GqCUKob
         2igaH/TAYoa3WqY7laCt609XOG4jvxh2s7Hz2A8S535Ma0pgN/kmk1oJy1PGOHaphKrv
         K92l1zwIxgoZ01qw/WjKVNnoCrAE+vr869KqWSRhXzpo158VjnjOtK9a80npYPu+6Edr
         ekdRw68Ic1iUZjUvO/Jgc7xhVXobPxU8NY975pOrFogCmkR+QpovT9IvW6X5r6fkfBNg
         M/X0+tNSRqLBX+zQuzwenu1TKmiFLHK12+bCzE/KKxtHrcqervYRIYZEO7ETAie8iX7B
         OGwg==
X-Gm-Message-State: AOJu0YxlNEP1JFd5mYIMGAIYXHolUiF/OooBHHW8YKDlpE9wdmmYLszY
	0CuWrAaZHTygRhLgYk7DnS8fPlN5n8grbokTu0SfwTGXzxyD0t1yqLwmgqSTzQ==
X-Gm-Gg: ASbGncuMSRIwh8suHliANAKCixPR/QvHT9NNYfZOAeoPCKmBBW4lzpX8CgXs3aDmVBC
	rIcD1iQPOcxSn24D6T+3kMFb/yfC+RX5jW+yCCCtvWceqRMYQOI2y3BFum16kClGSPfsdB1wSOj
	1jVJYO78Rkn5GNKAXKRti2zQt567Gd0SXOXEJ/fZwEWfKUG36OuffSfSFnuGTS9OiQm/6UD59s3
	R7SSnBGLk4KUsUBCNo25W/6o5jnaJ8T94bCn2zAXr1aCv+7hN5AZLgjskb6wYpgY0ZO6b6B9YzW
	pzbM0mvHtjCC5/vggDulHeKqYbfkNWI2coqOR6NV6NidU3kV+65zFiKJ+4QQG7wdpnZriRffhVE
	kgn6LsQcByO13czIYuLUN
X-Google-Smtp-Source: AGHT+IETT4bp5KwM8WeeD42gCzdIYwWqK6mELfY7DByjj8HKnP9u44JrYC6wEXcJEejNIF1lXabuZQ==
X-Received: by 2002:a17:907:3f9d:b0:b2a:7f08:23d5 with SMTP id a640c23a62f3a-b302c2f813amr207772766b.63.1758625607851;
        Tue, 23 Sep 2025 04:06:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 16/22] gtksourceview5: add opengl to REQUIRED_DISTRO_FEATURES
Date: Tue, 23 Sep 2025 13:06:30 +0200
Message-ID: <20250923110636.3413021-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119680

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtksourceview5', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 259faa90f703d6d3528b5392b813c772c1f995c3)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
index f667238e65..e270c56d9b 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
@@ -23,6 +23,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gettext features_check gtk-doc gtk-icon-cache gobject-introspection vala
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.4/${PNAME}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "eb3584099cfa0adc9a0b1ede08def6320bd099e79e74a2d0aefb4057cd93d68e"

