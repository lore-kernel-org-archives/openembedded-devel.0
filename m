Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CBAC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 21:03:26 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2915.1750107798539305692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jun 2025 14:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nzC/OZAv;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so39831925e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jun 2025 14:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1750107797; x=1750712597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKDK90BLuHqY+8mzNvN42Z9+hfg/OBAiaBEHVT1yBX8=;
        b=nzC/OZAvXqjUNE8V+H8NN5GoZEyJr1oc5l3oyBiFGp9zWDxv3Z/nRDcYVZKlc8Ce/p
         WeCY+s554+dOQjSkL4DxnhCa8Kg0+GQeQehOQ5EB6M0Arpg1EkT7eHpKLXkNepil0jyy
         ZokINKWrmJAr2ay72Hu9+KiYWLeZ7DRt1mC/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107797; x=1750712597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKDK90BLuHqY+8mzNvN42Z9+hfg/OBAiaBEHVT1yBX8=;
        b=OfNikHQBa2QOnS04/tjdmo1GtnHN+O9aA0EqhL3V8Bv6sA8+avFlPd4cm0n76ULrfG
         yq2E1t/W64F2vpSON2g+6AHKdnR5U7L+aLxX8+k1hpbdWJchbKrJt8ef3a/aSlIBvjTc
         01YlLxD9gUtAyBjkVD0T0DClPvx9q5NVQ36K9G0YXnTQbVIlcWIJFta93Q2h53Qxh4qT
         Re+y08e/ydx+O+9Qfs7c9L+ICXcR0n4FkrL5FOrvuhEBY8XgdoAmpR2VCQwRHNapGYss
         7jtI/gbX8jAFoaX/EbTModU+XoWdN8Kjyi/F+GnqYVjl3q9bwgoh/oj+6FwTKCfKR8RN
         sAoA==
X-Gm-Message-State: AOJu0YyNsIbUlE2JeTemuStE5LBZBPK/QY5i7MGjZbbj9YK8BoBc+sXA
	Ll+793ZwQogu4K+/H1CZ3JDINXgbdECnnAXZWApk7lJePkYlqRZuNLGV+b3SliHiZoxAjIdLZSA
	jj3SHL64=
X-Gm-Gg: ASbGncvQREy8ZS8mA5hswGyyyLfdD91ehzbQuXluwwUmmhBcZQmzuwxWVTvjI7sGAVi
	3YrSaflAPPlv5BhFsNTiADT1I9y0PmEe6xwuBUlzvRUBRpAzVYdJdJnNa+JYShdePRytS3hV5t5
	xWvbiUx1NxU2QIeVkhlAOtNJDmAL8h3qoHBoxyTCoT2Y6bv1oOQijBTeghXUka6rWyEINi2o7QG
	VKSIu+iIWKulqp6Fj9JtP15yiylkMFDqDdaHPWfdZZ2BfML6XVxOKhaJ5o+pr9SRAMbgE/WzkU0
	Ek5oYUDRrkEea0H67KlFGIA/sAu9M5/CQh0IKsLHLLQ2IVu6MERdzi+hF49zFukdtsMLCOOvrEF
	HOvRq73qAm9GyaxH0SIh2x0ZG4E5pK7O8/JVAVZo+EcSAVaLaMTN/VqSidfJ9HEExgR22vA==
X-Google-Smtp-Source: AGHT+IGDIRaoFMrFVW7sG9xgiY/jikB7oR34CQJezyy4xjtdtW2+p2/IIwK1CYalx8VhSpuGJ7JzSw==
X-Received: by 2002:a05:600c:3e8d:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-4533cab7786mr78944295e9.25.1750107796552;
        Mon, 16 Jun 2025 14:03:16 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm157338245e9.1.2025.06.16.14.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:03:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [meta-openembedded][PATCH] reproducibility: move known non-repro list to layer.conf
Date: Mon, 16 Jun 2025 23:03:01 +0200
Message-Id: <20250616210301.3657024-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jun 2025 21:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117916

From: Yoann Congal <yoann.congal@smile.fr>

The current include file that stores the known non-reproducible packages
is layer dependent and that forces the user of the layers to maintain
the list of the files (for example, see AB config[0]).

By moving the exclude list to each layer.conf and extending the common
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable, the known non-reproducible
packages will be automatically excluded for each layer used in the
reproducibility test without any special knowledge in the test
environment.

NB: the empty list for meta-initramfs was just removed not moved.

[0]: https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json?id=7d8933e75bdf7fb821a25617cb2dcabf1f3f8700#n322

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Co-Developed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Signed-off-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../include/non-repro-meta-filesystems.inc    |   6 -
 meta-filesystems/conf/layer.conf              |   7 +
 .../conf/include/non-repro-meta-gnome.inc     |  13 --
 meta-gnome/conf/layer.conf                    |  14 ++
 .../conf/include/non-repro-meta-initramfs.inc |   3 -
 .../include/non-repro-meta-multimedia.inc     |  15 --
 meta-multimedia/conf/layer.conf               |  16 ++
 .../include/non-repro-meta-networking.inc     |  40 -----
 meta-networking/conf/layer.conf               |  41 +++++
 meta-oe/conf/include/non-repro-meta-oe.inc    | 142 -----------------
 meta-oe/conf/layer.conf                       | 143 ++++++++++++++++++
 .../conf/include/non-repro-meta-perl.inc      |  10 --
 meta-perl/conf/layer.conf                     |  11 ++
 .../conf/include/non-repro-meta-python.inc    |  31 ----
 meta-python/conf/layer.conf                   |  32 ++++
 .../conf/include/non-repro-meta-webserver.inc |   7 -
 meta-webserver/conf/layer.conf                |   8 +
 .../conf/include/non-repro-meta-xfce.inc      |   7 -
 meta-xfce/conf/layer.conf                     |   8 +
 19 files changed, 280 insertions(+), 274 deletions(-)
 delete mode 100644 meta-filesystems/conf/include/non-repro-meta-filesystems.inc
 delete mode 100755 meta-gnome/conf/include/non-repro-meta-gnome.inc
 delete mode 100755 meta-initramfs/conf/include/non-repro-meta-initramfs.inc
 delete mode 100755 meta-multimedia/conf/include/non-repro-meta-multimedia.inc
 delete mode 100755 meta-networking/conf/include/non-repro-meta-networking.inc
 delete mode 100755 meta-oe/conf/include/non-repro-meta-oe.inc
 delete mode 100755 meta-perl/conf/include/non-repro-meta-perl.inc
 delete mode 100755 meta-python/conf/include/non-repro-meta-python.inc
 delete mode 100755 meta-webserver/conf/include/non-repro-meta-webserver.inc
 delete mode 100755 meta-xfce/conf/include/non-repro-meta-xfce.inc

diff --git a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
deleted file mode 100644
index 509907d889..0000000000
--- a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-# List of known non-reproducible package of the meta-filesystems layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_FILESYSTEMS = " \
-    e2tools-ptest \
-    xfsprogs-doc \
-"
diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 5083a29476..4d147b7139 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -20,3 +20,10 @@ LAYERSERIES_COMPAT_filesystems-layer = "walnascar whinlatter"
 BBFILES_DYNAMIC += " \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
 "
+
+# List of known non-reproducible package of the meta-filesystems layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    e2tools-ptest \
+    xfsprogs-doc \
+"
diff --git a/meta-gnome/conf/include/non-repro-meta-gnome.inc b/meta-gnome/conf/include/non-repro-meta-gnome.inc
deleted file mode 100755
index 553bc32cc6..0000000000
--- a/meta-gnome/conf/include/non-repro-meta-gnome.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-# List of known non-reproducible package of the meta-gnome layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_GNOME = " \
-    geary \
-    geary-dbg \
-    gegl-dev \
-    gimp \
-    gimp-dbg \
-    gnome-terminal-src \
-    grilo-src \
-    gtk-vnc-src \
-    ibus \
-"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index d6c59a80d6..faacba478e 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -29,3 +29,17 @@ BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
     security:${LAYERDIR}/dynamic-layers/meta-security/*/*/*.bb \
 "
+
+# List of known non-reproducible package of the meta-gnome layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    geary \
+    geary-dbg \
+    gegl-dev \
+    gimp \
+    gimp-dbg \
+    gnome-terminal-src \
+    grilo-src \
+    gtk-vnc-src \
+    ibus \
+"
diff --git a/meta-initramfs/conf/include/non-repro-meta-initramfs.inc b/meta-initramfs/conf/include/non-repro-meta-initramfs.inc
deleted file mode 100755
index c05f59d1a2..0000000000
--- a/meta-initramfs/conf/include/non-repro-meta-initramfs.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-# List of known non-reproducible package of the meta-initramfs layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_INITRAMFS = ""
diff --git a/meta-multimedia/conf/include/non-repro-meta-multimedia.inc b/meta-multimedia/conf/include/non-repro-meta-multimedia.inc
deleted file mode 100755
index b02de42eb9..0000000000
--- a/meta-multimedia/conf/include/non-repro-meta-multimedia.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-# List of known non-reproducible package of the meta-multimedia layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_MULTIMEDIA = " \
-    crossguid \
-    libcamera \
-    libcamera-dbg \
-    libcamera-src \
-    libgssdp-1.6-src \
-    libgupnp-1.6-src \
-    libsquish-staticdev \
-    oscam \
-    oscam-dbg \
-    oscam-src \
-    rtmpdump-staticdev \
-"
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 5c9b8fe48b..a01984888d 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -32,3 +32,19 @@ LAYERVERSION_multimedia-layer = "1"
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
 LAYERSERIES_COMPAT_multimedia-layer = "walnascar whinlatter"
+
+# List of known non-reproducible package of the meta-multimedia layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    crossguid \
+    libcamera \
+    libcamera-dbg \
+    libcamera-src \
+    libgssdp-1.6-src \
+    libgupnp-1.6-src \
+    libsquish-staticdev \
+    oscam \
+    oscam-dbg \
+    oscam-src \
+    rtmpdump-staticdev \
+"
diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
deleted file mode 100755
index 16240df059..0000000000
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-# List of known non-reproducible package of the meta-networking layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_NETWORKING = " \
-    babeld \
-    babeld-dbg \
-    dhcp-relay-staticdev \
-    ettercap-src \
-    freediameter \
-    freeradius \
-    htpdate-doc \
-    libbearssl-staticdev \
-    libmosquitto1 \
-    libowfat-staticdev \
-    libruli-staticdev \
-    mosquitto \
-    ncftp \
-    ncp \
-    ncp-dbg \
-    ndisc6-dbg \
-    ndisc6-misc \
-    ndisc6-ndisc6 \
-    ndisc6-rdisc6 \
-    ndisc6-rdnssd \
-    ndisc6-rltraceroute6 \
-    netsniff-ng-doc \
-    ntopng \
-    ntopng-dbg \
-    ntpsec-src \
-    openl2tp \
-    opensaf \
-    phytool \
-    phytool-dbg \
-    postfix-cfg \
-    rp-pppoe \
-    traceroute \
-    traceroute-dbg \
-    udpcast-doc \
-    unbound-doc \
-    znc \
-"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 232d9d4480..58126a575f 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -27,3 +27,44 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 BBFILES_DYNAMIC += " \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
 "
+
+# List of known non-reproducible package of the meta-networking layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    babeld \
+    babeld-dbg \
+    dhcp-relay-staticdev \
+    ettercap-src \
+    freediameter \
+    freeradius \
+    htpdate-doc \
+    libbearssl-staticdev \
+    libmosquitto1 \
+    libowfat-staticdev \
+    libruli-staticdev \
+    mosquitto \
+    ncftp \
+    ncp \
+    ncp-dbg \
+    ndisc6-dbg \
+    ndisc6-misc \
+    ndisc6-ndisc6 \
+    ndisc6-rdisc6 \
+    ndisc6-rdnssd \
+    ndisc6-rltraceroute6 \
+    netsniff-ng-doc \
+    ntopng \
+    ntopng-dbg \
+    ntpsec-src \
+    openl2tp \
+    opensaf \
+    phytool \
+    phytool-dbg \
+    postfix-cfg \
+    rp-pppoe \
+    traceroute \
+    traceroute-dbg \
+    udpcast-doc \
+    unbound-doc \
+    znc \
+"
diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
deleted file mode 100755
index ae4fb1d194..0000000000
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ /dev/null
@@ -1,142 +0,0 @@
-# List of known non-reproducible package of the meta-oe layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_OE = " \
-    apitrace \
-    apitrace-dbg \
-    asio-dbg \
-    asio-ptest \
-    asio-src \
-    cpuid-doc \
-    dhrystone \
-    dhrystone-dbg \
-    dhrystone-dev \
-    dhrystone-src \
-    directfb \
-    directfb-dbg \
-    doxygen-src \
-    edid-decode \
-    edid-decode-dbg \
-    editorconfig-core-c-dev \
-    etcd-cpp-apiv3-dev \
-    evemu-tools-python \
-    fbgrab-doc \
-    fluentbit-src \
-    fsverity-utils-dbg \
-    fsverity-utils-staticdev \
-    fvwm-dbg \
-    fvwm-doc \
-    fvwm-extra \
-    fwupd-dbg \
-    fwupd-ptest \
-    gcab-src \
-    gosu \
-    gosu-dbg \
-    gosu-dev \
-    gosu-staticdev \
-    gphoto2 \
-    gphoto2-dbg \
-    hddtemp-locale-de \
-    hdf5 \
-    hdf5-dbg \
-    hdf5-src \
-    hdf5-staticdev \
-    hplip-dbg \
-    hplip-filter \
-    hplip-src \
-    iotop \
-    iotop-dbg \
-    ipmiutil \
-    ipmiutil-dbg \
-    ipmiutil-dev \
-    jpnevulator-doc \
-    jsonrpc-dev \
-    kpatch-build \
-    kpatch-doc \
-    ldns \
-    libass9 \
-    libass-dbg \
-    libbotan-3-7 \
-    libbotan-3-bin \
-    libbotan-3-dbg \
-    libbotan-3-dev \
-    libck-doc \
-    libdbus-cxx-dev \
-    libforms \
-    libfsverity0 \
-    libhugetlbfs-doc \
-    libiio-src \
-    libjcat-dbg \
-    libjcat-ptest \
-    librelp-dbg \
-    librelp-ptest \
-    libsdl2-compat \
-    libsdl2-compat-dbg \
-    libsource-highlight5 \
-    libsource-highlight-dbg \
-    libsource-highlight-dev \
-    libsource-highlight-src \
-    libthrift-c-glib-zlib-src \
-    libvncserver-dev \
-    libwebsockets-testapps \
-    libwmf \
-    libyui-ncurses-dbg \
-    libyui-ncurses-dev \
-    lmbench-staticdev \
-    log4cpp \
-    lprng \
-    lprng-dbg \
-    lshw \
-    lshw-locale-fr \
-    mariadb-dbg \
-    mariadb-server \
-    mariadb-src \
-    mce-test \
-    mime-support-doc \
-    minifi-cpp \
-    minifi-cpp-dbg \
-    minifi-cpp-src \
-    mpv \
-    mpv-dbg \
-    nana \
-    nbench-byte \
-    nbench-byte-dbg \
-    nbench-byte-src \
-    nspr-staticdev \
-    obconf-locale-es \
-    pcp \
-    pcp-dev \
-    pcp-doc \
-    pcp-src \
-    perfetto \
-    perfetto-dbg \
-    php-phar \
-    pidgin \
-    pidgin-dbg \
-    pim435-staticdev \
-    poco-ptest \
-    postgresql-server-dev \
-    qcbor-staticdev \
-    qperf-doc \
-    sharutils \
-    sharutils-dbg \
-    smemstat-doc \
-    soci-dev \
-    switchtec-user \
-    switchtec-user-dbg \
-    switchtec-user-staticdev \
-    thin-provisioning-tools-dev \
-    toybox-inittab \
-    toybox-inittab-dbg \
-    toybox-inittab-dev \
-    transmission-dbg \
-    transmission-gtk \
-    transmission-src \
-    vulkan-cts \
-    vulkan-cts-dbg \
-    waylandpp-dev \
-    yasm-src \
-    zlog-staticdev \
-    zsh \
-    zsh-dbg \
-    zsh-src \
-"
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bc0d68f156..5501e4315f 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -123,3 +123,146 @@ NON_MULTILIB_RECIPES:append = " crash pahole libbpf"
 
 NON_MULTILIB_RECIPES:remove:x86 = "libbpf"
 NON_MULTILIB_RECIPES:remove:x86-64 = "libbpf"
+
+# List of known non-reproducible package of the meta-oe layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    apitrace \
+    apitrace-dbg \
+    asio-dbg \
+    asio-ptest \
+    asio-src \
+    cpuid-doc \
+    dhrystone \
+    dhrystone-dbg \
+    dhrystone-dev \
+    dhrystone-src \
+    directfb \
+    directfb-dbg \
+    doxygen-src \
+    edid-decode \
+    edid-decode-dbg \
+    editorconfig-core-c-dev \
+    etcd-cpp-apiv3-dev \
+    evemu-tools-python \
+    fbgrab-doc \
+    fluentbit-src \
+    fsverity-utils-dbg \
+    fsverity-utils-staticdev \
+    fvwm-dbg \
+    fvwm-doc \
+    fvwm-extra \
+    fwupd-dbg \
+    fwupd-ptest \
+    gcab-src \
+    gosu \
+    gosu-dbg \
+    gosu-dev \
+    gosu-staticdev \
+    gphoto2 \
+    gphoto2-dbg \
+    hddtemp-locale-de \
+    hdf5 \
+    hdf5-dbg \
+    hdf5-src \
+    hdf5-staticdev \
+    hplip-dbg \
+    hplip-filter \
+    hplip-src \
+    iotop \
+    iotop-dbg \
+    ipmiutil \
+    ipmiutil-dbg \
+    ipmiutil-dev \
+    jpnevulator-doc \
+    jsonrpc-dev \
+    kpatch-build \
+    kpatch-doc \
+    ldns \
+    libass9 \
+    libass-dbg \
+    libbotan-3-7 \
+    libbotan-3-bin \
+    libbotan-3-dbg \
+    libbotan-3-dev \
+    libck-doc \
+    libdbus-cxx-dev \
+    libforms \
+    libfsverity0 \
+    libhugetlbfs-doc \
+    libiio-src \
+    libjcat-dbg \
+    libjcat-ptest \
+    librelp-dbg \
+    librelp-ptest \
+    libsdl2-compat \
+    libsdl2-compat-dbg \
+    libsource-highlight5 \
+    libsource-highlight-dbg \
+    libsource-highlight-dev \
+    libsource-highlight-src \
+    libthrift-c-glib-zlib-src \
+    libvncserver-dev \
+    libwebsockets-testapps \
+    libwmf \
+    libyui-ncurses-dbg \
+    libyui-ncurses-dev \
+    lmbench-staticdev \
+    log4cpp \
+    lprng \
+    lprng-dbg \
+    lshw \
+    lshw-locale-fr \
+    mariadb-dbg \
+    mariadb-server \
+    mariadb-src \
+    mce-test \
+    mime-support-doc \
+    minifi-cpp \
+    minifi-cpp-dbg \
+    minifi-cpp-src \
+    mpv \
+    mpv-dbg \
+    nana \
+    nbench-byte \
+    nbench-byte-dbg \
+    nbench-byte-src \
+    nspr-staticdev \
+    obconf-locale-es \
+    pcp \
+    pcp-dev \
+    pcp-doc \
+    pcp-src \
+    perfetto \
+    perfetto-dbg \
+    php-phar \
+    pidgin \
+    pidgin-dbg \
+    pim435-staticdev \
+    poco-ptest \
+    postgresql-server-dev \
+    qcbor-staticdev \
+    qperf-doc \
+    sharutils \
+    sharutils-dbg \
+    smemstat-doc \
+    soci-dev \
+    switchtec-user \
+    switchtec-user-dbg \
+    switchtec-user-staticdev \
+    thin-provisioning-tools-dev \
+    toybox-inittab \
+    toybox-inittab-dbg \
+    toybox-inittab-dev \
+    transmission-dbg \
+    transmission-gtk \
+    transmission-src \
+    vulkan-cts \
+    vulkan-cts-dbg \
+    waylandpp-dev \
+    yasm-src \
+    zlog-staticdev \
+    zsh \
+    zsh-dbg \
+    zsh-src \
+"
diff --git a/meta-perl/conf/include/non-repro-meta-perl.inc b/meta-perl/conf/include/non-repro-meta-perl.inc
deleted file mode 100755
index 9082691f67..0000000000
--- a/meta-perl/conf/include/non-repro-meta-perl.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-# List of known non-reproducible package of the meta-perl layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_PERL = " \
-    libencode-perl-src \
-    libhtml-tree-perl \
-    libhtml-tree-perl-doc \
-    libmodule-build-tiny-perl \
-    po4a \
-    po4a-doc \
-"
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 33f0822ec0..7ae1a39fcd 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -16,3 +16,14 @@ LAYERVERSION_perl-layer = "1"
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
 LAYERSERIES_COMPAT_perl-layer = "walnascar whinlatter"
+
+# List of known non-reproducible package of the meta-perl layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    libencode-perl-src \
+    libhtml-tree-perl \
+    libhtml-tree-perl-doc \
+    libmodule-build-tiny-perl \
+    po4a \
+    po4a-doc \
+"
diff --git a/meta-python/conf/include/non-repro-meta-python.inc b/meta-python/conf/include/non-repro-meta-python.inc
deleted file mode 100755
index 03d3fefba5..0000000000
--- a/meta-python/conf/include/non-repro-meta-python.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-# List of known non-reproducible package of the meta-python layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_PYTHON = " \
-    python3-evdev \
-    python3-evdev-dbg \
-    python3-evdev-src \
-    python3-frozenlist \
-    python3-frozenlist-dbg \
-    python3-kivy-src \
-    python3-lief \
-    python3-mlcommons-loadgen \
-    python3-mlcommons-loadgen-dbg \
-    python3-mlcommons-loadgen-src \
-    python3-pandas \
-    python3-pandas-dbg \
-    python3-pandas-src \
-    python3-propcache \
-    python3-propcache-dbg \
-    python3-pybind11-json-dev \
-    python3-pycocotools-src \
-    python3-pydantic-core \
-    python3-pynacl \
-    python3-pynacl-dbg \
-    python3-pynacl-src \
-    python3-pyproj \
-    python3-pyproj-dbg \
-    python3-pyproj-src \
-    python3-pyzmq \
-    python3-yarl \
-    python3-yarl-dbg \
-"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 261c38e89c..b887accbf8 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -17,3 +17,35 @@ LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 LAYERSERIES_COMPAT_meta-python = "walnascar whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
+
+# List of known non-reproducible package of the meta-python layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    python3-evdev \
+    python3-evdev-dbg \
+    python3-evdev-src \
+    python3-frozenlist \
+    python3-frozenlist-dbg \
+    python3-kivy-src \
+    python3-lief \
+    python3-mlcommons-loadgen \
+    python3-mlcommons-loadgen-dbg \
+    python3-mlcommons-loadgen-src \
+    python3-pandas \
+    python3-pandas-dbg \
+    python3-pandas-src \
+    python3-propcache \
+    python3-propcache-dbg \
+    python3-pybind11-json-dev \
+    python3-pycocotools-src \
+    python3-pydantic-core \
+    python3-pynacl \
+    python3-pynacl-dbg \
+    python3-pynacl-src \
+    python3-pyproj \
+    python3-pyproj-dbg \
+    python3-pyproj-src \
+    python3-pyzmq \
+    python3-yarl \
+    python3-yarl-dbg \
+"
diff --git a/meta-webserver/conf/include/non-repro-meta-webserver.inc b/meta-webserver/conf/include/non-repro-meta-webserver.inc
deleted file mode 100755
index ee998ea961..0000000000
--- a/meta-webserver/conf/include/non-repro-meta-webserver.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-# List of known non-reproducible package of the meta-webserver layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_WEBSERVER = " \
-    netdata \
-    netdata-dbg \
-    php-phar \
-"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 16d72a7a56..dcaae5cca8 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -25,3 +25,11 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phpmyadmin->bash \
   phpmyadmin->php \
 "
+
+# List of known non-reproducible package of the meta-webserver layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    netdata \
+    netdata-dbg \
+    php-phar \
+"
diff --git a/meta-xfce/conf/include/non-repro-meta-xfce.inc b/meta-xfce/conf/include/non-repro-meta-xfce.inc
deleted file mode 100755
index aad6b0c24d..0000000000
--- a/meta-xfce/conf/include/non-repro-meta-xfce.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-# List of known non-reproducible package of the meta-xfce layer
-# Please keep this list sorted
-KNOWN_NON_REPRO_META_XFCE = " \
-    catfish \
-    libsamba-util0 \
-    samba-dbg \
-"
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 0b7a359175..e8109725d3 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -27,3 +27,11 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   rodent-icon-theme->gdk-pixbuf \
   rodent-icon-theme->gtk+3 \
 "
+
+# List of known non-reproducible package of the meta-xfce layer
+# Please keep this list sorted
+OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
+    catfish \
+    libsamba-util0 \
+    samba-dbg \
+"

