Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B98CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:44:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.2960.1760600677527337715
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=Xi0E88hN;
 spf=pass (domain: thaumatec.com, ip: 209.85.218.51, mailfrom: dse@thaumatec.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so75134666b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1760600676; x=1761205476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IxaRzKH7yuWwzGjR/lpfD1QJCjorLOgy5X8t8Dqh0M=;
        b=Xi0E88hNt43du4RXPeM9lVSAaDXRIo7OTyqhNymE9FS6mp4NpWPTLI+AO9JBf0Tx+f
         z1/a4jW4gV5W8LiuL0pKekYa3Jnw0e1x5I9SXUvnDle2ZHl0GLSyAgB+8dnNyPxEfNhh
         EThezuQOmoUvbeuGkWGi1oBFKqU64Q09wBmEuwZAYAB4kuOPLyaQwiliwdBh8DzA1xhX
         lahZvCk0p5Uz2DAwTAp2xS+FmQovtwXuhfHdNVYixcVTy1Az4gijoNykJ1jqR89sC/4t
         rkZXuaJjMZP7m+YARo88v6wB+kWB8j37wqzFn8HnXtGpTNbqHrgxp0blt5r+iWl+nKM5
         EO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600676; x=1761205476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IxaRzKH7yuWwzGjR/lpfD1QJCjorLOgy5X8t8Dqh0M=;
        b=knXKZOKRTFg5mVthklIfLkEVoShuouU+3v1ObP+9FNChcbFZg64FU3r61EygyjvVGg
         ZuhJljkieSvfXD7KNPCRjTJIxeNTzun8TwTAvJo7gwvCfaEJAQts8WZ1h7eDCPvytJL5
         8iDeNIIoLta+iYH31iB6a5C0LsoA0gVCMeBEtK2yKhxJh7vDW3TMq88l98/torx3I+zl
         /Ijd2nHiO7d63DZY/f+SiJX30y2Yp1Q2poiBR5iZoNoYug77UMdz8WpxXlHm1d37BwyE
         yoKZKw4yyy0mWD1XtvYf8vixVCy+MVAjtOiQxx5kB0cU/UA9DvjYtqZznKpHkQ9txP/E
         fdVA==
X-Gm-Message-State: AOJu0Yy/KyyH4wOIXJosMyTyK7OikWyZAgSbbrTsUehW2M3IlEj0o9/8
	UFXqFCZI1ZKTw9i121V5djlT12hxDqbtWd+X3M1LiVUTw92LlfbvV0HpBJz7zwnJtj4vM7bDBn8
	dE8m2
X-Gm-Gg: ASbGncuiAXLg9u69vKilg7gIf91N/sGZgzwBi0svL4gL8QHT5OlAWF3sjzOkVXgx2rc
	x+R71ot0svCLco4jmynKPtB0Dk4kPegXFZoZG4m4NyOBi1+ChrmCy8kC9ViSeNeL/mv1Cwj9Pe0
	2MtvDKwS6IsYru8gXrDXqpZbbEUL5qe5WGA6z33x+ZOudRkrut+teGzoaHVzxBezHaw835PHRSq
	8KILme0laetDP08yO5eutcK4nFbNMP1/4qWbcZBybMvCCrt01RVqJnaYP8eRUokBf6IEp8ZBnnB
	FraJyz5OYslYrFMeKv5lfXIO11ASFWsfjhKfDHMQfWwG1CHe0n6TtUtgT/YRUYcCLzgF/eCybao
	3Az+bZhpMGB5mlR/9n9fSeout6rSmHu+VfEupIAJQV+GQc/qnmW6Xh8c4d4Xbxufb74uxxXRgIb
	dMwVA=
X-Google-Smtp-Source: AGHT+IG8vUGfcnFjj35qklp9nOTfm6x+GExaLVLclkII/xnQukgNDvYrQunCLdIrhXbZFRPavCmsAQ==
X-Received: by 2002:a17:906:84d:b0:b59:5520:533c with SMTP id a640c23a62f3a-b59552056ccmr1414061666b.40.1760600675852;
        Thu, 16 Oct 2025 00:44:35 -0700 (PDT)
Received: from fedora ([185.186.156.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba459ba2sm447667366b.34.2025.10.16.00.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:44:35 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH 1/3] cockpit: Remove old-bridge leftovers
Date: Thu, 16 Oct 2025 09:37:43 +0200
Message-ID: <20251016074104.85537-2-dse@thaumatec.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016074104.85537-1-dse@thaumatec.com>
References: <20251016074104.85537-1-dse@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120720

The old-bridge package config option was removed from the recipe,
but the usage of this option was left in some places.

Remove any reference to old-bridge. Only the Python bridge is currently
supported by Cockpit.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
index 986a924fb5..c9619d835a 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
@@ -12,11 +12,9 @@ SRC_URI += " \
     "
 SRC_URI[sha256sum] = "df51ef5920fae69e1b435f657376aa93772c0c1720b954a3bac10ebba26bfedf"
 
-inherit gettext pkgconfig autotools systemd features_check
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3targetconfig', d)}
+inherit gettext pkgconfig autotools systemd features_check python3targetconfig
 
-DEPENDS += "glib-2.0-native intltool-native gnutls virtual/gettext json-glib krb5 libpam systemd python3-setuptools-native"
-DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3-pip-native', d)}"
+DEPENDS += "glib-2.0-native intltool-native gnutls virtual/gettext json-glib krb5 libpam systemd python3-pip-native python3-setuptools-native"
 
 COMPATIBLE_HOST:libc-musl = "null"
 
@@ -112,7 +110,7 @@ FILES:${PN}-bridge = " \
     ${libexecdir}/cockpit-askpass \
     ${PYTHON_SITEPACKAGES_DIR} \
 "
-RDEPENDS:${PN}-bridge = "${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3', d)}"
+RDEPENDS:${PN}-bridge = "python3"
 
 FILES:${PN}-desktop = "${libexecdir}/cockpit-desktop"
 RDEPENDS:${PN}-desktop += "bash"

