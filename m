Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.1433.1626834692863815187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 19:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HKOo7dN3;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id h6-20020a17090a6486b029017613554465so157219pjj.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 19:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=spgMKZ4q3qp4uLuOHx9FZlIXsL8Gj9mgRc6A2fSdhv4=;
        b=HKOo7dN3y0gYv3bmUHTdiwHDRYkoDSi9m2ReKy4PzdDjLHCmjwHOiC9IbbPo5C0gVV
         IA9ws7mWfAYehC1w2wVumwoYxEJ3qnz5tbOHWBKoItJ1ojYlifdF/jOfkAbN/mDhuWFn
         6lVHQ04RFIzYnS4LO++6zVcZu9zAw4+lBjjRHyarjt2wQzFyOHyAeqbChYKUij57slh3
         KDe54RgaUg+b/MFc6KqYx4aQfQA/6wD9lnDZtMQPHoPVmSRO2ovRJrTr7Gjqtkt59iwv
         K4CD8OV0EyTG9YqxegvtT89gNazu7VJI3hEkSOZ2hAQlxoMXMw4Budx33m0oHEmrSLI8
         HS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spgMKZ4q3qp4uLuOHx9FZlIXsL8Gj9mgRc6A2fSdhv4=;
        b=fM5rbTiCsZAACwBQVoQuIwRoCrO8ugykRyLljUa6nosAkhXYRaTn+Q10CDquTamd1p
         DLvdJ3nE40E517TPjQ6SVuYU3fnc8cgTrDehbs00bq/G+OVwd3UYIwpRc+jwexON+zK4
         WGD5PmKbpCjmH6b93meSCuLc+gzDy/JPRdUeMpJ3o/KCY1UcNVqBApSU6bzWfr0JvdSa
         4KyFrd7vjTMQ2jrX79ocfdkwuMVwvc6xS0ppr8Y5JUVJDxTa9e6WiYRev9yyWLWvE9/V
         XPF7dGSjdpg5468Bsba3fB4iGC6I9Pmx08faE+cVzKA3BeMG3auVMoOI29s15XR+i0hx
         vjrg==
X-Gm-Message-State: AOAM530ImIOMA3zjE340ElTjXn3swGb2kiMgY2BkDSotbum55TCkENVr
	acWn1Ee9zEHQIDzJVf0SaJvRhL8v60FVug==
X-Google-Smtp-Source: ABdhPJxyRd3WNJpuaEkQ13WFIRlFY7HzjBfzpMEmPI2fe0OYLGZ/tTUK1JCu12GGGw7ID330/8B6Ow==
X-Received: by 2002:a17:902:f546:b029:12b:fd9:3527 with SMTP id h6-20020a170902f546b029012b0fd93527mr26108129plf.74.1626834692259;
        Tue, 20 Jul 2021 19:31:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id m19sm25398747pfa.135.2021.07.20.19.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 19:31:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] netperf: Add systemd unit file
Date: Tue, 20 Jul 2021 19:31:28 -0700
Message-Id: <20210721023128.1089570-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721023128.1089570-1-raj.khem@gmail.com>
References: <20210721023128.1089570-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/netperf/files/netserver.service  |  9 +++++++++
 .../recipes-support/netperf/netperf_git.bb           | 12 ++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/netperf/files/netserver.service

diff --git a/meta-networking/recipes-support/netperf/files/netserver.service b/meta-networking/recipes-support/netperf/files/netserver.service
new file mode 100644
index 0000000000..0876a0d223
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/netserver.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Netperf Benchmark Server
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/netserver -D
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index 9d1e8df8e8..72efcb4f8a 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, socke
 SECTION = "net"
 HOMEPAGE = "http://www.netperf.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e661ab33a2a71ad6652c178dedf8aaa2"

 PV = "2.7.0+git${SRCPV}"

@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/HewlettPackard/netperf.git \
            file://cpu_set.patch \
            file://vfork.patch \
            file://init \
+           file://netserver.service \
            file://0001-netlib.c-Move-including-sched.h-out-og-function.patch \
            file://0001-nettest_omni-Remove-duplicate-variable-definitions.patch \
            "
@@ -19,7 +20,7 @@ SRCREV = "3bc455b23f901dae377ca0a558e1e32aa56b31c4"

 S = "${WORKDIR}/git"

-inherit update-rc.d autotools texinfo
+inherit update-rc.d autotools texinfo systemd

 # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
 CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
@@ -42,8 +43,10 @@ do_configure_prepend() {

 do_install() {
     sed -e 's#/usr/sbin/#${sbindir}/#g' -i ${WORKDIR}/init
-
-    install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d
+    install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d ${D}${systemd_system_unitdir}
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        sed -e 's#/usr/sbin/#${sbindir}/#g' ${WORKDIR}/netserver.service > ${D}${systemd_system_unitdir}/netserver.service
+    fi
     install -m 4755 src/netperf ${D}${bindir}
     install -m 4755 src/netserver ${D}${sbindir}
     install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/netperf
@@ -68,3 +71,4 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'sctp', 'kernel-modu

 INITSCRIPT_NAME="netperf"
 INITSCRIPT_PARAMS="defaults"
+SYSTEMD_SERVICE_${PN} = "netserver.service"
--
2.32.0
