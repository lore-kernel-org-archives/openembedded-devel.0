Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.34593.1611569667291496692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 02:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=shIWms2s;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id m2so10081545wmm.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 02:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uu9EA4amTD5/TeI9dplCWzWm8LCHYNwjwTbNk+gKibA=;
        b=shIWms2sEdLhUnt2WlJrRAVgiX+lysDSF8fPawwla2bZ6CJs4XOxBrTj/quW9oL/gN
         K85l0m9HezU8vPdKm8TrjkSpThYpilTOWD+44+21AtDhxskIvFVXKSbvu4S3Tl3IUdxW
         hxV194nMwKkmbiCcSfNjShCELTaqR60YOsqBd9gDpmX7OAElCyE0BvoMpSKd8wL+mVoJ
         MYyT9YSBmBKLlXJTO8PY0g5jK6gRr1uSshVJypH1y47kw8X9I9J7c8q0Dwuq5JVq1og/
         7qAI5WFh2dWcbi5DzPXGyglsH7rFXm/Yb6xDWvC8BxNeyXjmQBoLNsrTh8wEYXfezVr1
         GDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uu9EA4amTD5/TeI9dplCWzWm8LCHYNwjwTbNk+gKibA=;
        b=el7U5bejvPE+UMkKOKHd7+gZ+qKQLb1glWKYLfkav26LRdBXs5VteTtg4CoKCRsj/n
         WMjmZlqC3rIQT0BGVRCXy7q3MCLhnShxPx3+umhiASP2AOw1164xH66tdNOsWwJ/nd2O
         aN+fRCXsZYm64vYsidEWkakj4sWA8IhINoHFpDDz7nJXomtzDmrvpL159i6PPfLXieUu
         1yvNTHeV+whxovSxG6ylNhEAi2e9MIztFopYpW8AeB+ftLUbUQ2y9jPBUQswA9wCUXou
         ot3SjdCriJvcaVHTjVttZKut6aY6H5o+g7uaKJiwpm/wFe1cEjMJwbyYXBtYLe+v0azQ
         r/RQ==
X-Gm-Message-State: AOAM5321fZz6cAjtRSN5HcwTDFcM2nBDXJ936bg2GLkCbfzoRFyZ+/gi
	dcYWnq7PAX8ajRfO4TPtA850h26T8vg=
X-Google-Smtp-Source: ABdhPJyw/YkPtaiL3liMhbZfFzJ9S3IAhBrEPPUCdUd3UzB0w53wsJwWakFCwSJwwTRgvvCzH1vY3Q==
X-Received: by 2002:a1c:e4c5:: with SMTP id b188mr4869244wmh.78.1611569665707;
        Mon, 25 Jan 2021 02:14:25 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id s4sm21990183wrt.85.2021.01.25.02.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 02:14:25 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [oe][meta-networking][PATCH 2/3] nftables: upgrade 0.9.7 -> 0.9.8
Date: Mon, 25 Jan 2021 11:14:11 +0100
Message-Id: <20210125101412.265244-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125101412.265244-1-adrian.freihofer@siemens.com>
References: <20210125101412.265244-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added missing RDEPENDS to the libnft library from nftables-python to
libnftable.so.1 which is loaded dynamically by LibraryLoader into
python.

Added json to default PACKAGECONFIG which is probably used as well when
compiled with python support. For example firewalld crashes at runtime
if nftables is compiled without json support.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../nftables/{nftables_0.9.7.bb => nftables_0.9.8.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.7.bb => nftables_0.9.8.bb} (86%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.7.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.8.bb
similarity index 86%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.7.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.8.bb
index e5dfef92b..6990ae3ae 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.7.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.8.bb
@@ -10,11 +10,11 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "fe6b8a8c326a2c09c02ca162b840d7d4aadb043ce7a367c166d6455b0e112cb0"
+SRC_URI[sha256sum] = "60fc004656dae4fefc4901c939c9d64120b4dedb49738e420a9a34989f108fe4"
 
 inherit autotools manpages pkgconfig
 
-PACKAGECONFIG ??= "python readline"
+PACKAGECONFIG ??= "python readline json"
 PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
 PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
 PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
@@ -28,4 +28,4 @@ RRECOMMENDS_${PN} += "kernel-module-nf-tables"
 
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
-RDEPENDS_${PN}-python = "python3-core python3-json"
+RDEPENDS_${PN}-python = "python3-core python3-json ${PN}"
-- 
2.26.2

