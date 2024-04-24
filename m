Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59446C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 11:42:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.14182.1713958951463598504
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 04:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=BrZohwVs;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41a7ae25d53so22965115e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713958949; x=1714563749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsZRqbruR+QGEt+zlKrBbo9TK5x/qZl74iQemU4B1v4=;
        b=BrZohwVs4QcOGNQw7V9KTu4iP4NXBoscmpjaQrjobaHvIqThQlOJgp++ivflHTP3sU
         MkqPDqsCc3YNuPOfXloc7patpW3RyagWofhIAFS7ywVFHxD0RzHY9pxKUxymXJYPP+JC
         qC8Ord4STeQKOSN1LaXfBKfRDpxmtoVm9L2od+L78Mfh2e1E5irN9Ft3z0rxnBNqXVU+
         xRAPv3d9NW0cvs7d0w6Zg0GfYoObA4234kKrDfvG6rrCNn8K8V9mS5jI+fb26qlASXev
         RGoJIkNIkA+v6BRTQa21PYofMW3t1U7FVWQTVoMU9Al65XYa/fovWZSOiorIX/P27GDH
         XY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713958949; x=1714563749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsZRqbruR+QGEt+zlKrBbo9TK5x/qZl74iQemU4B1v4=;
        b=Fc6z2jtJV9ZYb34sOxl7yys4cSO7qGYLq8HyyM+Yxi576O0lmOt6UJ/HWjjnjkQ3jp
         iJOBFXnov2Z7VGWaStHILxFwzikFtsDQ83boUv25BYhMJIOWO6RYy+VZepxlIhAANjgC
         tI8GP3srmdREPp4H5hgL9ulCw09jlwR9tPF09uEBkEC+98qChz/4ZHUtcwmN8raSlM6P
         K+s706dP3Sh/ygCYcd3HPAHHxrFlPjSEhSM2CIJO6Y4bcGnGHyJ4sYbEwqYWwgyjMOaE
         lfkmBH2BFjtjDusDGXTXqezBgiWZAPzwgKWWsTjl3/6FHqHyqVFP6SPmMlqZc1nIurdE
         fxgA==
X-Gm-Message-State: AOJu0YzannCyFhqhlbaZxNtgvBdk1mxMaYN1GfvoSnqFio7ngaRVhLKR
	GrOX7ccgMT1g09Zolv3UNMUZ4GrQUQ8fciGEuad9wAM+Hcc03P7j5w1XgwFCgF8cV/4NzGmknsc
	UGGA=
X-Google-Smtp-Source: AGHT+IGXv2enn1Gf4VWFmln2A7IngpQ01zcdv3ce5uH7nZct03yG+zht8MRdXdGisW9szwfN0n2wQg==
X-Received: by 2002:a05:600c:35d6:b0:418:e6fc:3708 with SMTP id r22-20020a05600c35d600b00418e6fc3708mr1652234wmq.24.1713958949116;
        Wed, 24 Apr 2024 04:42:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id e15-20020a05600c218f00b004146e58cc35sm26719154wme.46.2024.04.24.04.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:42:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-*][PATCH] reproducibility: move repro excludes from AB config.json to meta-oe
Date: Wed, 24 Apr 2024 13:41:58 +0200
Message-Id: <20240424114158.4102856-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 11:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110122

For now, the known non-reproducible packages list is stored inside the
autobuilder config.json file. This is not ideal. Let's move this list
into each layers of meta-openembedded.

These lists can be used with, in local.conf:
  include conf/include/non-repro-meta-oe.inc
  OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES = "${KNOWN_NON_REPRO_META_OE}"

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>
Richard, Khem: The next step will be to move the current AB config to use these
files. And then, continue to cleanup reproducibility errors.
---
 .../include/non-repro-meta-filesystem.inc     |   9 ++
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
 create mode 100644 meta-filesystems/conf/include/non-repro-meta-filesystem.inc
 create mode 100755 meta-gnome/conf/include/non-repro-meta-gnome.inc
 create mode 100755 meta-initramfs/conf/include/non-repro-meta-initramfs.inc
 create mode 100755 meta-multimedia/conf/include/non-repro-meta-multimedia.inc
 create mode 100755 meta-networking/conf/include/non-repro-meta-networking.inc
 create mode 100755 meta-oe/conf/include/non-repro-meta-oe.inc
 create mode 100755 meta-perl/conf/include/non-repro-meta-perl.inc
 create mode 100755 meta-python/conf/include/non-repro-meta-python.inc
 create mode 100755 meta-webserver/conf/include/non-repro-meta-webserver.inc
 create mode 100755 meta-xfce/conf/include/non-repro-meta-xfce.inc

diff --git a/meta-filesystems/conf/include/non-repro-meta-filesystem.inc b/meta-filesystems/conf/include/non-repro-meta-filesystem.inc
new file mode 100644
index 0000000000..50facbf174
--- /dev/null
+++ b/meta-filesystems/conf/include/non-repro-meta-filesystem.inc
@@ -0,0 +1,9 @@
+# List of known non-reproducible package of the meta-filesystem layer
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


