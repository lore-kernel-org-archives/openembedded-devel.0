Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19124C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:22 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.5224.1669792761054388898
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TW68nINg;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so1087251pjg.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnA6hhDy4oLZ+V1L6BXuAHP1USgcnjQJb784ksVJnBs=;
        b=TW68nINgPl+hyRrj5QsGqnFCy+XNOFjXvyV7hDMeIdfHXQIE/0oRtW8oXit2bTywmd
         j9YBIXVHC5eqqSwxYzU9gL1xr090UoTQcisCp/x4u2B6R7gNsfGiudg+OfVltWVYz2m3
         sv799aaOe+livvIviC9sI2D8Afv3U3vlINpMhWI+iEEXtUcFxyf+GiEfacedWyCYG60L
         mtARy6z6cnMcCNjYysajGCVAFFJJdFzlZIlnbU+Yqvnn2RISdpQrT6E95yxmN68YavLK
         02jiF817XI2SrOOIhurgK+lcRPeq6hZzDhB4SGR98xO/tnA3KNDKBHT9UPwos9Rgl+mq
         yZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnA6hhDy4oLZ+V1L6BXuAHP1USgcnjQJb784ksVJnBs=;
        b=5EYPSr8lIQddulSDv3c0lyvrE1trHt35jKe9wquuquMuqbQs1aB+7Mt38yy0Pl7N0g
         2ZUoZmqnsbStqYSi31gihKWCH883/GBvdwu6j0oRlP9wDMHelaSoAA1JhUOHS4HFrPgA
         ilxWhqJwevft8U5rK5/IKwS6owW+13Br5C2OdnrHlKdZxKv6g1EFf1Z/aBnjbK2gHV5G
         FYkHvoiRyyQPn2BzCTLDJGPSbId4lbgMuo1Vsdbq/Uji928zGgKA6ue2E7AyKX9+RBn2
         Hv/GvO5l3KDOfsW2UTAYxg3qbEyWi64bs5EhEEbD86HlAJxo15MXZeF7X+dQR7h6ukeF
         bNwg==
X-Gm-Message-State: ANoB5plup2N1U5sq/wR/IhUMasjj7EZdV33VfZfT2k/8S/yMpp9xjJ6c
	VWS1b4Mia+ORtWlsmLpbiQG8yQmJJD0=
X-Google-Smtp-Source: AA0mqf54Y7CfKdZSy7TkrjxbKkRgJyRkgSZoUB2iZ+KevSK6VQ+SGC8dJuDUZWkswjCW60IQ32tpqw==
X-Received: by 2002:a17:902:b493:b0:189:1120:17ab with SMTP id y19-20020a170902b49300b00189112017abmr40074514plr.52.1669792760256;
        Tue, 29 Nov 2022 23:19:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 06/10] rest: Re-add 0.8.1
Date: Tue, 29 Nov 2022 23:19:09 -0800
Message-Id: <20221130071913.1805812-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99863

Its needed by gfbgraph

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/rest/librest_0.8.1.bb       | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb

diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb b/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
new file mode 100644
index 0000000000..23849783cc
--- /dev/null
+++ b/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
@@ -0,0 +1,35 @@
+SUMMARY = "library to access web services that claim to be "RESTful""
+HOMEPAGE = "https://wiki.gnome.org/Projects/Librest"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+DEPENDS = " \
+    gi-docgen \
+    gi-docgen-native \
+    glib-2.0 \
+    glib-2.0-native \
+    json-glib \
+    libsoup-2.4 \
+    libxml2-native \
+"
+
+inherit gnomebase gobject-introspection vala pkgconfig
+
+GNOMEBN = "rest"
+
+SRC_URI[archive.sha256sum] = "0513aad38e5d3cedd4ae3c551634e3be1b9baaa79775e53b2dba9456f15b01c9"
+
+S = "${WORKDIR}/${GNOMEBN}-${PV}"
+# * gnome environment requires libsoup build with in gnome PACKAGECONFIG
+# * libsoup-gnome support was removed upstream three years ago [1]
+# [1] https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2bb38a7bf72245cdf2f1ecad17e9a720
+EXTRA_OECONF = "--without-gnome"
+
+do_configure:prepend() {
+    # rest expects introspection.m4 at custom location (see aclocal.m4).
+    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/build
+}
+
+do_compile:prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/rest/.libs"
+}
-- 
2.38.1


