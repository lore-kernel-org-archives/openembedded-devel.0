Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F87FC4345F
	for <webhook@archiver.kernel.org>; Sat, 27 Apr 2024 21:36:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.20600.1714253784302966700
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Apr 2024 14:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=PmU8+Uj3;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-346359c8785so2787055f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Apr 2024 14:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714253782; x=1714858582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujl5gT8BocjVw2IX9gdSIYSthwmljxjbshWYNvYdqaE=;
        b=PmU8+Uj3pxFMO8jNnrwfkCF7su+gY5CrUzT622cMeg6y27sMk9ywuqTPUeZuo7Ecqz
         FAl70A9uNlYYiwGfPrKGS4OXKW+nRUOi0Y5xsqx67zNN7hZGNtmYRCdx6d4OHWBI25ss
         2OANfJdcMN//tjae0d3413AILFNRpgNU8gCJji4uE99CLcMQctmVMDHRbUusxeYlCvz8
         k2DlwfmDY+EEDLwPRrhYumLnGiX9gq62EL2X9EuLHGe945+K7A0I+bANbloIZ9vhx7vf
         sNNJr1FM6v0NXtD72uY6+277wiI+dCoFnLJ88hYf8UAT5uerVWMOzc1P3hgoTOYnurqT
         smcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714253782; x=1714858582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujl5gT8BocjVw2IX9gdSIYSthwmljxjbshWYNvYdqaE=;
        b=nSZBUBowMCqC81+qeL26bXDqs1Vm0y140+oDfcfvo1mMR1N+EYq59jK+4cU6x3YBaC
         f7oaKKf3RWGZNZe3aDqVg0JVGhloWjVm5TdjZ004lmi6u7tzHF0tY9W6QootuKnvdnHS
         WlZdexcyP8dm9CCtjoxZoZXnQkgEwwKO+w0TTJ2TLzvFpLhkqu8EN4yAG4yVfDnA3GhR
         PHCErr7CxmJUdMNCjMH8eCGCerdndv2QEGOQ7z+JDqofOO2f24NXTaanr3wzwY7NeuYH
         /2gGq8YjAc3f7LPPjgqaGVOdM/ntbmqHr6/3H8RJ7T51GP/pTBsQOvpr2QA8fKq7Nony
         vtEA==
X-Gm-Message-State: AOJu0Yy3c/tQaTs2jb6OwpAFFe8yEeswphNQjpj9jKkIctXae0EbAt8Z
	xt1YxLZxucNreJP62uQDZQVJyMZEYjbCaKMAevIG/WDY2c+xNADHiTiL1WemZYiBLfSkBE29xi/
	Baxc=
X-Google-Smtp-Source: AGHT+IHed1fEnpta0wbMvaWdadVJAEM6ABPBLayft+C1zXFgMh9om7rnjmFlpMQZXpCTxak8UaJriQ==
X-Received: by 2002:a5d:63d2:0:b0:34c:97e7:af6c with SMTP id c18-20020a5d63d2000000b0034c97e7af6cmr1955968wrw.59.1714253781692;
        Sat, 27 Apr 2024 14:36:21 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id d23-20020adfa357000000b0034cceee9051sm851599wrb.105.2024.04.27.14.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 14:36:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-*][PATCH] reproducibility: move repro excludes from AB config.json to meta-oe
Date: Sat, 27 Apr 2024 23:35:50 +0200
Message-Id: <20240427213549.3458829-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Apr 2024 21:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110159

For now, the known non-reproducible packages list is stored inside the
autobuilder config.json file. This is not ideal. Let's move this list
into each layers of meta-openembedded.

These lists can be used with, in local.conf:
  include conf/include/non-repro-meta-oe.inc
  OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES = "${KNOWN_NON_REPRO_META_OE}"

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v1->v2:
* Fix meta-filesystem*s* name in inc file name and content to make it
  coherent with the layer name.
---
 .../include/non-repro-meta-filesystems.inc    |   9 ++
 .../conf/include/non-repro-meta-gnome.inc     |  13 +++
 .../conf/include/non-repro-meta-initramfs.inc |  23 ++++
 .../include/non-repro-meta-multimedia.inc     |  15 +++
 .../include/non-repro-meta-networking.inc     |  59 ++++++++++
 meta-oe/conf/include/non-repro-meta-oe.inc    | 107 ++++++++++++++++++
 .../conf/include/non-repro-meta-perl.inc      |  10 ++
 .../conf/include/non-repro-meta-python.inc    |  22 ++++
 .../conf/include/non-repro-meta-webserver.inc |   7 ++
 .../conf/include/non-repro-meta-xfce.inc      |   7 ++
 10 files changed, 272 insertions(+)
 create mode 100644 meta-filesystems/conf/include/non-repro-meta-filesystems.inc
 create mode 100755 meta-gnome/conf/include/non-repro-meta-gnome.inc
 create mode 100755 meta-initramfs/conf/include/non-repro-meta-initramfs.inc
 create mode 100755 meta-multimedia/conf/include/non-repro-meta-multimedia.inc
 create mode 100755 meta-networking/conf/include/non-repro-meta-networking.inc
 create mode 100755 meta-oe/conf/include/non-repro-meta-oe.inc
 create mode 100755 meta-perl/conf/include/non-repro-meta-perl.inc
 create mode 100755 meta-python/conf/include/non-repro-meta-python.inc
 create mode 100755 meta-webserver/conf/include/non-repro-meta-webserver.inc
 create mode 100755 meta-xfce/conf/include/non-repro-meta-xfce.inc

diff --git a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
new file mode 100644
index 0000000000..4975593277
--- /dev/null
+++ b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
@@ -0,0 +1,9 @@
+# List of known non-reproducible package of the meta-filesystems layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_FILESYSTEMS = " \
+    e2tools-ptest \
+    xfsprogs-doc \
+    zfs \
+    zfs-dbg \
+    zfs-dev \
+"
diff --git a/meta-gnome/conf/include/non-repro-meta-gnome.inc b/meta-gnome/conf/include/non-repro-meta-gnome.inc
new file mode 100755
index 0000000000..553bc32cc6
--- /dev/null
+++ b/meta-gnome/conf/include/non-repro-meta-gnome.inc
@@ -0,0 +1,13 @@
+# List of known non-reproducible package of the meta-gnome layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_GNOME = " \
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
new file mode 100755
index 0000000000..8f01f5624b
--- /dev/null
+++ b/meta-initramfs/conf/include/non-repro-meta-initramfs.inc
@@ -0,0 +1,23 @@
+# List of known non-reproducible package of the meta-initramfs layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_INITRAMFS = " \
+    kexecboot-klibc \
+    kexecboot-klibc-dbg \
+    kexec-klibc \
+    kexec-tools-klibc-dbg \
+    mtdinfo-klibc \
+    ubiattach-klibc \
+    ubiblock-klibc \
+    ubicrc32-klibc \
+    ubidetach-klibc \
+    ubiformat-klibc \
+    ubimkvol-klibc \
+    ubinfo-klibc \
+    ubinize-klibc \
+    ubirename-klibc \
+    ubirmvol-klibc \
+    ubirsvol-klibc \
+    ubiupdatevol-klibc \
+    ubi-utils-klibc-dbg \
+    vmcore-dmesg-klibc \
+"
diff --git a/meta-multimedia/conf/include/non-repro-meta-multimedia.inc b/meta-multimedia/conf/include/non-repro-meta-multimedia.inc
new file mode 100755
index 0000000000..b02de42eb9
--- /dev/null
+++ b/meta-multimedia/conf/include/non-repro-meta-multimedia.inc
@@ -0,0 +1,15 @@
+# List of known non-reproducible package of the meta-multimedia layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_MULTIMEDIA = " \
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
new file mode 100755
index 0000000000..e0f448fe31
--- /dev/null
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -0,0 +1,59 @@
+# List of known non-reproducible package of the meta-networking layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_NETWORKING = " \
+    blueman \
+    blueman-dbg \
+    blueman-src \
+    civetweb-dev \
+    dhcp-relay-staticdev \
+    ettercap-src \
+    fetchmail \
+    fetchmail-dbg \
+    freediameter \
+    freediameter-src \
+    freeradius \
+    htpdate-doc \
+    keepalived \
+    keepalived-dbg \
+    kernel-module-mdio-netlink-6.6.17-yocto-standard \
+    libbearssl-staticdev \
+    libfko3 \
+    libfko-client \
+    libfko-daemon \
+    libfko-dbg \
+    libmosquitto1 \
+    libowfat-staticdev \
+    libruli-staticdev \
+    libsamba-util0 \
+    mdio-netlink-dbg \
+    mosquitto \
+    mosquitto-dbg \
+    ncftp \
+    ncftp-dbg \
+    ncftp-src \
+    ndisc6-dbg \
+    ndisc6-misc \
+    ndisc6-ndisc6 \
+    ndisc6-rdisc6 \
+    ndisc6-rdnssd \
+    ndisc6-rltraceroute6 \
+    netsniff-ng-doc \
+    ntpsec-src \
+    openl2tp \
+    openl2tp-dbg \
+    ot-br-posix \
+    ot-br-posix-dbg \
+    postfix-cfg \
+    proftpd \
+    proftpd-dbg \
+    proftpd-dev \
+    rdist \
+    rdist-dbg \
+    samba-dbg \
+    tayga \
+    tayga-dbg \
+    wolfssl \
+    wolfssl-dbg \
+    znc \
+    znc-doc \
+"
diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
new file mode 100755
index 0000000000..7961d851f9
--- /dev/null
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -0,0 +1,107 @@
+# List of known non-reproducible package of the meta-oe layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_OE = " \
+    boinc-client-dev \
+    cjson-ptest \
+    cpuid-doc \
+    crash \
+    crash-dbg \
+    crash-src \
+    dhrystone \
+    dhrystone-dbg \
+    dhrystone-dev \
+    dhrystone-src \
+    directfb \
+    directfb-dbg \
+    doxygen-src \
+    editorconfig-core-c-dev \
+    etcd-cpp-apiv3-dev \
+    fbgrab-doc \
+    fluentbit-src \
+    fvwm-dbg \
+    fvwm-doc \
+    fvwm-extra \
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
+    hplip \
+    hplip-dbg \
+    jpnevulator-doc \
+    jsonrpc-dev \
+    kpatch-build \
+    kpatch-doc \
+    ldns \
+    libbotan-3-bin \
+    libbotan-3-dbg \
+    libbotan-3-dev \
+    libck-doc \
+    libdbus-cxx-dev \
+    libforms \
+    libiio-src \
+    libjcat-dbg \
+    libjcat-ptest \
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
+    mozjs-115-src \
+    mpv \
+    mpv-dbg \
+    nana \
+    nbench-byte \
+    nbench-byte-dbg \
+    nbench-byte-src \
+    nspr-staticdev \
+    openocd \
+    openocd-dbg \
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
+    postgresql-server-dev \
+    qcbor-staticdev \
+    sharutils \
+    sharutils-dbg \
+    smemstat-doc \
+    soci-dev \
+    thin-provisioning-tools-dev \
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
new file mode 100755
index 0000000000..9082691f67
--- /dev/null
+++ b/meta-perl/conf/include/non-repro-meta-perl.inc
@@ -0,0 +1,10 @@
+# List of known non-reproducible package of the meta-perl layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_PERL = " \
+    libencode-perl-src \
+    libhtml-tree-perl \
+    libhtml-tree-perl-doc \
+    libmodule-build-tiny-perl \
+    po4a \
+    po4a-doc \
+"
diff --git a/meta-python/conf/include/non-repro-meta-python.inc b/meta-python/conf/include/non-repro-meta-python.inc
new file mode 100755
index 0000000000..629dc4aa04
--- /dev/null
+++ b/meta-python/conf/include/non-repro-meta-python.inc
@@ -0,0 +1,22 @@
+# List of known non-reproducible package of the meta-python layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_PYTHON = " \
+    python3-evdev-src \
+    python3-frozenlist \
+    python3-frozenlist-dbg \
+    python3-kivy-src \
+    python3-pandas \
+    python3-pandas-dbg \
+    python3-pandas-src \
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
new file mode 100755
index 0000000000..ee998ea961
--- /dev/null
+++ b/meta-webserver/conf/include/non-repro-meta-webserver.inc
@@ -0,0 +1,7 @@
+# List of known non-reproducible package of the meta-webserver layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_WEBSERVER = " \
+    netdata \
+    netdata-dbg \
+    php-phar \
+"
diff --git a/meta-xfce/conf/include/non-repro-meta-xfce.inc b/meta-xfce/conf/include/non-repro-meta-xfce.inc
new file mode 100755
index 0000000000..aad6b0c24d
--- /dev/null
+++ b/meta-xfce/conf/include/non-repro-meta-xfce.inc
@@ -0,0 +1,7 @@
+# List of known non-reproducible package of the meta-xfce layer
+# Please keep this list sorted
+KNOWN_NON_REPRO_META_XFCE = " \
+    catfish \
+    libsamba-util0 \
+    samba-dbg \
+"
-- 
2.39.2


