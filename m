Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA0CC83F25
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 17:26:57 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.40754.1752341213767800488
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 10:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IOI9jxdH;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso2576195a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752341213; x=1752946013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSOkp0BMLhaRGZO8esUclkk8spNZ0NOzsgiDUakRAKQ=;
        b=IOI9jxdHcf1qN0ygvWPEvyxVDT988ReHuSSAFyHiJpWxYA96Vtt4YsDZzA10tS7TCu
         VdJ65b78fvgDhE/SnozfOWNud1AJSZHpXT1C3L9XYy15JTdPksz62eglc5lnXPTz7+ZZ
         6x2DWyrjMdlDIyTzfZI6e6ouhDIe27txbDPJOm1odVmpOL2tNbLwO68b8/Aa7dGFa5OQ
         gNnLCJO/kZm1c3X2AOJLGXYswqeGiNZOySrnQJ5nUTRzNe8vIOK3SFCyoYlhhyQ+WHJG
         ETtkgPP5NEpsGV7LKSce7WxvGZgAiNoLZMwUvuj5WYGqBv8fpfI3qoIPQVNPXMYswGIL
         dMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752341213; x=1752946013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSOkp0BMLhaRGZO8esUclkk8spNZ0NOzsgiDUakRAKQ=;
        b=eCvnW7V5rsAEfcvruevOcKcNqamCMrc0ZtRMZnODjz1+2fafPa/9/8htsnkf8lvGlV
         QSj4+lXoQwcTs7jhk25LS81NOSDGKpNejl6glr759lKQTF0/cEiVGnK7WU152XQTkqkH
         mIFcVZ79pdiPquEbK6ccNgYDqr/S8qxTH7sXsun3Zztiiq4KmGqUlOiBFJrodJU7ahV4
         EtO+7np0Fj21A6uhJILdsXh3fotU2742UJ2XTkAHqYv/Nkdp2V/BQssf2DROcU4xhFzK
         1YzzjggMSOTJkWws6us+4+PAIujUIPfsdNHeJfPwNx3sYJfZQ5P0Y9z5rYRS/V8V4PDU
         gBzg==
X-Gm-Message-State: AOJu0YximL9zFm5e12HcUkn/iYtqteWu1xYLtTr7WYfX71dnrv2YpkKv
	DvO+hy2/UPkjdIOyTlSSjFw1eYJNF+QA36G+TSYZM3thoS5snBFxnwMggftEFAZB
X-Gm-Gg: ASbGnct8LDp0aSojVqrf/cuNyZUj57QTKI0yCEQf9PEaCpeb3sMguKDeYLSRJ541+0s
	4iZfSEd0NNXuQj5io8qjAaOHDNjxka/t5ZeuQ1EUVZcIcvW1HFG4aZ+vf7IVf9b0SffrbFh6geX
	MTK8fVWvRKIvDHCuJoxz/pRGuEtln5dTQF4zbdaei/jGN2OtZax3BFl1S9YFTI/zJXM1UF6Lz/q
	u4Np0neCqJI/H2NVVREv+uWH3cis4kbV0gtpQ3d39aBinhjIQa0/Cmb7Y+F4ILDv+c+TTvI/zd9
	1KE3sVriWiGTtTRIzBFY53JO6dA+B72ZDF+GKhaEBHSwzPzcbzUZggkW3hd3zuf01I3+xpUJaCu
	aVlaDpedz1rjrpLddvc5yYVAX
X-Google-Smtp-Source: AGHT+IEWHhLsRPULIR8V0ML37LOMpLHK4KVQj/r48b1z0DWUdOx+uzhMxTFJEG51A/omgk2Z8AL2sQ==
X-Received: by 2002:a17:90b:268b:b0:312:25dd:1c86 with SMTP id 98e67ed59e1d1-31c4cd65841mr13055638a91.18.1752341212735;
        Sat, 12 Jul 2025 10:26:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435c2e3sm67021875ad.226.2025.07.12.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 10:26:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH v2 4/6] xfce4-clipman-plugin: Use meson for building this recipe
Date: Sat, 12 Jul 2025 10:26:44 -0700
Message-ID: <20250712172646.3899204-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712172646.3899204-1-raj.khem@gmail.com>
References: <20250712172646.3899204-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 17:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118482

autotools is still supported upstream but meson is preferred starting
with 1.7 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clipman/xfce4-clipman-plugin_1.7.0.bb            | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb
index c2e2f32d5c..2f007e11c3 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb
@@ -8,14 +8,16 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst glib-2.0-native"
 
+XFCEBASEBUILDCLASS = "meson"
 XFCE_COMPRESS_TYPE = "xz"
 SRC_URI[sha256sum] = "903302c3070a951d44ee17a84fa3cf21d36c6787678af8fbfc79e469fd00cb46"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native wayland"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)} \
+"
 
-EXTRA_OECONF += "WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner \
-				 GLIB_COMPILE_RESOURCES=${STAGING_BINDIR_NATIVE}/glib-compile-resources"
+PACKAGECONFIG[ptest] = "-Dtests=true,-Dtests=false,"
+PACKAGECONFIG[qrencode] = "-Dqrencode=enabled,-Dqrencode=disabled,qrencode"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland"
 
 FILES:${PN} += "${datadir}/metainfo"

