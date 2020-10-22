Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.5549.1603343277379029994
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 22:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sQvwuf8j;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: paulohefagundes@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id p10so542027ile.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 22:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RawqCqSfpD0CCwAbKvwuGEohZU0Ews0odnb/2g435EY=;
        b=sQvwuf8jqx8yi9snI3xbBLFo5qx4uQUZuRXyGdksBesOGI8/eegzOkmC7Ji/geiueX
         2ipXebmigQc4n10GCIATQ0VUgF7Evb4VokP6yteZEKW6vATn/j1q55CwWOv8rgLp9Fza
         4h1h4zcxzDffSj7vKzUP8YogLBFc7s0Lk/2ltRdkORd/lo6lxqRqZKA5dR6AuSiOYQ4P
         OKuyTJSNGuG+nxtvEHtNCCP/NOj4MjlTibZjlFEjwCTQP7f/8dFsJshyNZCHZfT9N/oi
         +/se0mm081dVn4ZscxgnOe7bLcehduWK2oZUPLB5VmDCukWmMIjpTFWfOtjlQAacpLFs
         znLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RawqCqSfpD0CCwAbKvwuGEohZU0Ews0odnb/2g435EY=;
        b=hLI6Bi/XDe8ATQ6b4r7LY1HdkZw3kitMbXZIOt1IrezDcYI/xXH0+VIobWp+YRBjky
         1KnFqscKUyTp6oDC/sSKiofI4M4iisMwlIerqk/KuRPXby1xDZARDVurMoakizv0j4A9
         cVFToOnaQ0+kn/joBPyF70nT3bu3hM4ragbFmAxnKucY+rIidJ0LDKo1iNEGJOpWPIlJ
         o0GnRkwQuTY4m2hqLGUiyLXFfErWoGNSEcuWmyPEj7Mj2kQAaOLCW4X2bI+ENBYpRuIz
         wrExPQooBiBLHzUNEleh3lhbNxUjKAKi66mbszHDO3o0zUpoKby4DDoxarP47QBWu6Ce
         w1pw==
X-Gm-Message-State: AOAM531Ho7jyJBluDsJmPJ6YZK1pADDPlO0eKEKgTb1kHXOc8JrHMoii
	qUyN0uCk06zLhOyCJ1Z1Vazr1ybHQW0=
X-Google-Smtp-Source: ABdhPJycqoAvQcAlujm69jncxHASJk5VuwirLZZP5MjIEYe5Ki8lGl8+QPRGHh6QARQXV2P+JuWuUw==
X-Received: by 2002:a92:6410:: with SMTP id y16mr668142ilb.126.1603343276644;
        Wed, 21 Oct 2020 22:07:56 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from localhost.localdomain (c-174-52-8-24.hsd1.ut.comcast.net. [174.52.8.24])
        by smtp.gmail.com with ESMTPSA id t26sm254497ioi.11.2020.10.21.22.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 22:07:56 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-networking][PATCH] vnstat: add recipe
Date: Wed, 21 Oct 2020 23:07:41 -0600
Message-Id: <20201022050741.96065-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vnStat is a console-based network traffic monitor for Linux and BSD
that keeps a log of network traffic for the selected interface(s).

Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
---
 .../recipes-support/vnstat/vnstat_2.6.bb      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-support/vnstat/vnstat_2.6.bb

diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
new file mode 100644
index 0000000000..2d6422b0da
--- /dev/null
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "vnStat is a console-based network traffic monitor for Linux and BSD that keeps a log of network traffic for the selected interface(s)."
+HOMEPAGE = "https://humdi.net/vnstat/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+SECTION = "net"
+DEPENDS = "gd sqlite3"
+
+SRC_URI = "https://github.com/vergoh/vnstat/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "fe2928a81243cc8a532a357f97221736"
+SRC_URI[sha256sum] = "89276e0a7281943edb554b874078278ad947dc312938a2451e03eb80679f7ff7"
+
+inherit autotools pkgconfig systemd
+
+EXTRA_OECONF = "--disable-extra-paths"
+
+do_install_append() {
+    install -Dm644 ${S}/examples/systemd/vnstat.service "${D}${systemd_system_unitdir}/vnstat.service"
+}
+
+FILES_${PN} += "${systemd_system_unitdir}"
-- 
2.29.0

