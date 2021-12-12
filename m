Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF19AC433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 17:08:02 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.293.1639328882317667624
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 09:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=awce+TGX;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id g14so44283623edb.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 09:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5GlslLkryAdbs3P3SKNjmEMpRM4w++AZDmh+AZwYDZs=;
        b=awce+TGX3+krc+CYFaJy0RPrrU24yQB1qFbgH7rK1GPwogdtbA38dDYMCG43Hc5LOd
         gI4YZJm2kZl05C7Wxgd29uZcmliq2Jnh3L5KCOxdlrnZ/am/qNFmbGjLDEOhmMrvvP1m
         b7mmSTkjSV8+RPnEAiKuYC9FOPlr0oB2mkUCpq2ze32DGbLumZ6/8ba8T8vQnRa5qfpD
         DaM2EDu6u+ud2JCaCLx3OYojRJUc+a8MZUt0mryL8xtrjfs9Xu7O9lQ3DKeVNxtwqASX
         0eUEtUtOuLxGvwSuRsUvrpjqXr4eclbEF3P6W60LGodxrZ8rrgjqKQegQDKIFfdCplPF
         aDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5GlslLkryAdbs3P3SKNjmEMpRM4w++AZDmh+AZwYDZs=;
        b=jIcrL7ZIghgcJkfZW3BFPqb0+YjfM4FMhig8kzZLVT60QTR1kqRQtA80bgpwc1fP1m
         zpYj+JSYgLRx5AMMaE19V0zMvTqgUr+2/uizLixE7kwNm5TBlW3y+i4dnwWuULVKOxWs
         zRhWGub4F0JqEVP18qNVzoEfqZ4F9d5G0LTzfFOtfdMGwmBzFFST2wJph7KcNTVgIDCc
         9IGLow1GelU4gEgjPHr1SSEmP9Bz48cid8+840IpNR0xL9VPOarxvxeM9hAKSx8+DWdV
         7v/2KVh1f4+y/pZadeUc/a0N7FPM0Iz/iGEO0lgzWpJQTa409++MI16dmDxdPFAxs1jl
         eB9A==
X-Gm-Message-State: AOAM533Hufl937GyaBm8popy6zaerGkzQOdXXR8S2jjGk7WIGrvUjWd+
	JGVUUe0kbn9BkX2xbp6iiHspF8hFz4c=
X-Google-Smtp-Source: 
 ABdhPJyVZPWXFdR+AJY3TFwJSzClik3v48SJpllLSxYXhX75Y3wW5Q83XUtg+YOqSFh7fscj3utuMA==
X-Received: by 2002:a05:6402:5158:: with SMTP id
 n24mr56734809edd.230.1639328880546;
        Sun, 12 Dec 2021 09:08:00 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 t20sm4939869edv.81.2021.12.12.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 09:07:59 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: from 1.22.1 to 1.32.0
Date: Sun, 12 Dec 2021 18:07:40 +0100
Message-Id: <20211212170740.3085705-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Dec 2021 17:08:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94303

* Added openssl so it can compile with default configuration.

* ebpf I had to disable.  It seems to have issues with cross-compiling.
And the libbpf isn't available at all platforms.

Tested on raspberrypy4-64

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/{netdata_1.22.1.bb => netdata_1.32.0.bb}       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.22.1.bb => netdata_1.32.0.bb} (91%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
similarity index 91%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
index fb643be61..d06eb8762 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
 SRC_URI = "https://github.com/netdata/netdata/releases/download/v${PV}/netdata-v${PV}.tar.gz"
-SRC_URI[sha256sum] = "f169c8615a6823448c2f1923c87c286d798132ea29d26f366e96d26e0aec3697"
+SRC_URI[sha256sum] = "5e066d322f88013cea78eb9bb42bca64599278b9db8d46593777e4258743fefd"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_URI = "https://github.com/netdata/netdata/releases"
 
 S = "${WORKDIR}/netdata-v${PV}"
 
-DEPENDS += "zlib util-linux libuv"
+DEPENDS += "libuv openssl util-linux zlib "
 
 inherit pkgconfig autotools-brokensep useradd systemd
 
@@ -36,6 +36,9 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
+# ebpf doesn't compile (or detect) the cross compilation well
+EXTRA_OECONF += "--disable-ebpf"
+
 do_install:append() {
     #set S UID for plugins
     chmod 4755 ${D}${libexecdir}/netdata/plugins.d/apps.plugin
-- 
2.25.1


