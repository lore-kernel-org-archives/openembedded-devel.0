Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B5ACAC5BE
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.9707.1758801832909662331
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F6q74U0x;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b2d92b52149so176988366b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801831; x=1759406631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2PRnjUHwlndnVJm3HqxdmzhrPwo0C3ltQYcvNTqa+0=;
        b=F6q74U0xxsvVSpIVMAtWSR05iju4UCGK80CllrQhR7iYnNvv5yIsw4Xyxbkth8dt40
         a7OdiWFZQIG8ze2/Vmjcsxc6Ffa3CjEAuWMrwCapt3exZfaXM8N0Yilg/UTzifqeiqmK
         QA6ptutbBPh1kJRrZoQsteu9ugUsOL6pHbPEgXCZnhzss0c2j1Kq4sWjMYilt3xlxdS6
         Ky77OUdNkaXlsCo/06dp8b8xMQDwVDLDxGmXsIBroBxIYX3XWr6Xjs0OJQNJ2p/861UU
         CzF7rP9aJ0iTKB5m4jmw+J0iZdiRQY1fV4iaTMf7APzbVfsxdx2fZaifYOeV6wwa0Aht
         iEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801831; x=1759406631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2PRnjUHwlndnVJm3HqxdmzhrPwo0C3ltQYcvNTqa+0=;
        b=cL+B7/GnuS4AC0KfNn2vq0FEg/fZVRj/7NIjIDr4NGshwCuyi5vxCooiRVnFPXh+Q4
         PsY38uhFsgR0x0TWLm0x1jQU0T4RwcBgX6okYtzZ/lk1WYKw6ql4RF8k0aX3JvYL/tx4
         wRCV2wfPd1C1WvjN13mMpLdEExfmVjwUlNINR5Tx20UyBKvAB9+F8Uq40pENUZgYFLtw
         ixGvewai2vBy6behoEblLE2hPH+P/04dhcssoQXJKzqovHGhJOh1vXm0Z5Y9NrIInEJF
         dA6ZcQ7gdNdrupebazbP4OakVZ8ZIjAxG/FtQBiGww6l34hn2jU+sH1Ye21k8jlfAoxK
         vEXg==
X-Gm-Message-State: AOJu0Yw1E02dejeXYhSw4YR3haj7GyvGBcpVniBPvSW09oFFCSOGj8NT
	DzfJRMc1mbVu+GbZa97IXsS6HyYW0fEBxHjASLtuS1J0uubIf9bR/HyiIH5vEitM
X-Gm-Gg: ASbGnctWnTLqbv5AD69J4N76SVg8k5geG7lWQgpZ5a2ZmixAJR28edkVA7Fvm1TJFQD
	adDm4cGDp4fNlqKeZEOnxpoCZFSDo/QX5cmKFfFCYNXyURkJpsDmlXP9aWPAkdAHIgxEAjFRWlB
	2EMpyrBZcZhol8emBdA6FEGKU1QTf6pn9RcWCCNQ/+BSlxQYfq8d+Exo55QYb/wLaBRCHqaL0ko
	7QyuE1uB/bwr0lGvSFSrtrSsfwHckwMCx+eXpmaOfc35jDMAq9Y1lnCnYZFVdKzKlonhMrs6Jw0
	w+AzMieE8WbT1mVS3mHMXz8HEOv+I6/HJXDBZBt12VHSe+VFk9GwlanYsWa7xFSVJbxJ9uWxumm
	RS2PaaUIG8ftkVSyRS1nZ
X-Google-Smtp-Source: AGHT+IEXsiG1klz6UxQYm1JgfjodBNhh14JvM2KA52WfU5XZA69Yhkzt+FhdDbQyMvrVTDob+gNgjg==
X-Received: by 2002:a17:907:2da8:b0:b04:1edf:a42b with SMTP id a640c23a62f3a-b34b74ef450mr378954166b.11.1758801831053;
        Thu, 25 Sep 2025 05:03:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 09/21] gssdp: check opengl is enabled or not
Date: Thu, 25 Sep 2025 14:03:21 +0200
Message-ID: <20250925120334.1670367-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119869

From: Mingli Yu <mingli.yu@windriver.com>

The sniffer PACKAGECONFIG will make gssdp depend on gtk4 as below.
PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk4,"

But gtk4 needs the opengl DISTRO_FEATURES enabled, so also check
opengl in gssdp recipe to keep consistent.

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gssdp', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 491a703c41644b6ab4db62920774e6ea23bc8308)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
index 1d8cbb1aea..ad99bbffa3 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
@@ -16,14 +16,16 @@ DEPENDS = " \
     libsoup-2.4 \
 "
 
-inherit meson pkgconfig gobject-introspection vala gtk-doc
+inherit meson pkgconfig gobject-introspection vala gtk-doc features_check
 
 SNIFFER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "gnome-layer", "sniffer", "", d)}"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', "${SNIFFER}", "", d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', "${SNIFFER}", "", d)}"
 
 PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk4,"
 
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'sniffer', 'opengl', '', d)}"
+
 PACKAGES =+ "gssdp-tools"
 
 FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"

