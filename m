Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.47582.1598851865664315602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cSVZAgay;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id f18so689565pfa.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 22:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r+AXSW7P5Bj8mUWjmxMNnQKVIFY5hJp/HAJeER3/9EI=;
        b=cSVZAgayNan9hsxZaXhv96T2OBybiRpDT7xSFJ61DxcF0fFtQbRXd5YEUxJ1hmBy54
         LSQRdxfF0du7hWg0PGpMZgv/cSwPLHtWa97A9Ghau6kNiRQIOMndZ1nL4ufEeFQAirmD
         ZveFecW7CZZy+i5tU2oYtZG6Z6mS/ZKi5yN6r+YOPHVU9qoqWIyfgZsod3JChY3Hi4jT
         xYL6s5VXQTT/RlVAllxxI/XrYP9ywZGfbT1M9oBDH5NrRpkAsOPGn70+awpEJ7fiqmNQ
         UIx9RvCEQs39nAgSm73mh0QvIk1yKsz03ztixm5a3SL00XC/iMPdWoSul3JotM0vvtzP
         lEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r+AXSW7P5Bj8mUWjmxMNnQKVIFY5hJp/HAJeER3/9EI=;
        b=hVFWFbBfWlNKu1C2P7+CDSgKkP8TTm0qzSaii+jUNWHcG5xOb8l7pGUFV4gBN/bh7a
         q7Dxj47dBZHQMyiaStpxx7M1saW+LprJVZdE6HhnJTdfcX+V1kTmwalGmtzuxrWdwFrM
         yDoAz36JvA32mZcbj6hjDf+zKP+xCnXGm1FSJr9LUJ+G+IMtBE/3Y0LPRUmrjnLgBGFN
         4IPcdk6a/+j0ouqc7yG17nK9XuBAUlzpMbsl8d5rvyR8Zxck12cgZmFx+xAVbdgzAf+c
         oovP7UKCbaHi/pB9i6+GJPzBZ1csynaaoRDdCiOrW+emvEnOM5aomBsdaMWKh2BN1kPF
         hxkw==
X-Gm-Message-State: AOAM533k5DgfLh8g6vpUFP17HGOQzmPmeEoQE/zIPvuEluruD2Oy+/Pr
	LOu5hQUNYCEeaPb8G25XicJRumUcTFor8Q==
X-Google-Smtp-Source: ABdhPJxKjt5i3wO4c5cxNEt0nvNZZ5T1hM9kTeENVY9I3XaV9vJlYEn62W2LlHMsdb8w6K8VB6nGUQ==
X-Received: by 2002:a63:8543:: with SMTP id u64mr35387pgd.350.1598851864227;
        Sun, 30 Aug 2020 22:31:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y9sm1568350pfn.85.2020.08.30.22.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:31:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3 1/8] packagegroup-meta-oe: Overhaul so it can build meta-oe-image
Date: Sun, 30 Aug 2020 22:30:50 -0700
Message-Id: <20200831053057.1541321-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that newly added recipes are added
Organise the packages per direcories
introduce packagegroup for fortran packages
Add missing packagegroup for printing packages
Document the packages which can not be included in these packahge groups

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Refine packages based on various knobs they use
v3: Document packages which are not included in the packagegroups

 .../packagegroups/packagegroup-meta-oe.bb     | 993 ++++++++++++++----
 1 file changed, 806 insertions(+), 187 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4dc3afe454..01392d1435 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -4,7 +4,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
-PACKAGES = ' \
+PACKAGES = "\
     packagegroup-meta-oe \
     packagegroup-meta-oe-benchmarks \
     packagegroup-meta-oe-connectivity \
@@ -17,27 +17,32 @@ PACKAGES = ' \
     packagegroup-meta-oe-kernel \
     packagegroup-meta-oe-multimedia \
     packagegroup-meta-oe-navigation \
+    packagegroup-meta-oe-printing \
+    packagegroup-meta-oe-shells \
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-support \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest-packages", "", d)} \
-'
+"
+#PACKAGES += "packagegroup-meta-oe-fortran-packages"
 
 RDEPENDS_packagegroup-meta-oe = "\
     packagegroup-meta-oe-benchmarks \
+    packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-connectivity \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
-    packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-dbs \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
     packagegroup-meta-oe-kernel \
     packagegroup-meta-oe-multimedia \
     packagegroup-meta-oe-navigation \
+    packagegroup-meta-oe-printing \
     packagegroup-meta-oe-security \
+    packagegroup-meta-oe-shells \
     packagegroup-meta-oe-support \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
@@ -46,12 +51,31 @@ RDEPENDS_packagegroup-meta-oe = "\
 "
 
 RDEPENDS_packagegroup-meta-oe-benchmarks = "\
-    dhrystone iperf2 linpack phoronix-test-suite \
-    tiobench bonnie++ fio iperf2 iperf3 lmbench s-suite whetstone \
-    libc-bench memtester sysbench dbench iozone3 libhugetlbfs \
-    nbench-byte tinymembench \
+    bonnie++ \
+    dbench \
+    dhrystone \
+    fio \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "glmark2", "", d)} \
+    iozone3 \
+    iperf2 \
+    iperf3 \
+    libc-bench \
+    libhugetlbfs \
+    linpack \
+    lmbench \
+    memtester \
+    nbench-byte \
+    phoronix-test-suite \
+    s-suite \
+    stressapptest \
+    sysbench \
+    tinymembench \
+    tiobench \
+    whetstone \
 "
+RDEPENDS_packagegroup-meta-oe-benchmarks_append_armv7a = " cpuburn-arm"
+RDEPENDS_packagegroup-meta-oe-benchmarks_append_armv7ve = " cpuburn-arm"
+RDEPENDS_packagegroup-meta-oe-benchmarks_append_aarch64 = " cpuburn-arm"
 
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mipsarch = "libhugetlbfs"
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mips64 = "tinymembench"
@@ -59,234 +83,817 @@ RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mips64el = "tinymembench"
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_riscv64 = "libhugetlbfs"
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_riscv32 = "libhugetlbfs"
 
+RDEPENDS_packagegroup-meta-oe-bsp ="\
+    acpitool \
+    cpufrequtils \
+    edac-utils \
+    flashrom \
+    irda-utils \
+    lmsensors-config-cgi \
+    lmsensors-config-fancontrol \
+    lmsensors-config-sensord \
+    lmsensors \
+    lsscsi \
+    nvme-cli \
+    pcmciautils \
+    pointercal \
+"
+RDEPENDS_packagegroup-meta-oe-bsp_append_x86 = " ledmon"
+RDEPENDS_packagegroup-meta-oe-bsp_append_x86-64 = " ledmon"
+
+RDEPENDS_packagegroup-meta-oe-bsp_remove_libc-musl = "ledmon"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_mipsarch = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc64 = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc64le = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv64 = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv32 = "efivar efibootmgr"
+
 RDEPENDS_packagegroup-meta-oe-connectivity ="\
-    gammu hostapd irssi krb5 libev libimobiledevice \
-    libmbim libmtp libndp libqmi libtorrent \
-    libuv libwebsockets linuxptp loudmouth \
-    modemmanager mosh  \
-    paho-mqtt-c phonet-utils rabbitmq-c rfkill rtorrent \
-    ser2net smstools3 telepathy-glib thrift \
-    usbmuxd zabbix zeromq \
+    gammu \
+    gattlib \
+    gensio \
+    hostapd \
+    ifplugd \
+    irssi \
+    iwd \
+    krb5 \
+    libev \
+    libimobiledevice \
+    libmbim \
+    libmtp \
+    libndp \
+    libnet \
+    libqmi \
+    libtorrent \
+    libuv \
+    libwebsockets \
+    linuxptp \
+    loudmouth \
+    modemmanager \
+    mosh \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
-    libmikmod \
-    obexftp openobex libnet \
+    openobex \
+    obexftp \
+    packagegroup-tools-bluetooth \
+    paho-mqtt-c \
+    phonet-utils \
+    rabbitmq-c \
+    rfkill \
+    rtorrent \
+    ser2net \
+    smstools3 \
+    telepathy-glib \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
-    "
+    thrift \
+    usbmuxd \
+    wifi-test-suite \
+    zabbix \
+    czmq \
+    zeromq \
+"
+
 RDEPENDS_packagegroup-meta-oe-connectivity_append_libc-glibc = " wvstreams wvdial"
 
 # dracut needs dracut
-RDEPENDS_packagegroup-meta-oe-core ="\
-    dbus-daemon-proxy libdbus-c++ \
-    ell glibmm libsigc++-2.0 libxml++ distro-feed-configs \
-    mm-common opencl-headers opencl-icd-loader \
-    proxy-libintl usleep \
-    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker ndctl", "", d)} \
-    "
+RDEPENDS_packagegroup-meta-oe-core = "\
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker", "", d)} \
+    dbus-daemon-proxy \
+    libdbus-c++ \
+    emlog \
+    kernel-module-emlog \
+    glibmm \
+    libnfc \
+    libsigc++-2.0 \
+    libsigc++-3 \
+    libxml++ \
+    mdbus2 \
+    distro-feed-configs \
+    mm-common \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "ndctl", "", d)} \
+    opencl-icd-loader \
+    proxy-libintl \
+    safec \
+    sdbus-c++-tools \
+    sdbus-c++ \
+    toybox \
+    usleep \
+"
+RDEPENDS_packagegroup-meta-oe-core_append_libc-glibc = " glfw"
+RDEPENDS_packagegroup-meta-oe-core_remove_riscv64 = "safec"
+RDEPENDS_packagegroup-meta-oe-core_remove_riscv32 = "safec"
 
 RDEPENDS_packagegroup-meta-oe-crypto ="\
-    botan cryptsetup libkcapi libmcrypt \
-    libsodium pkcs11-helper \
-    "
-RDEPENDS_packagegroup-meta-oe-bsp ="\
-    acpitool cpufrequtils edac-utils efibootmgr \
-    efivar flashrom lmsensors lmsensors-config \
-    lsscsi nvme-cli pcmciautils pointercal \
-    "
-RDEPENDS_packagegroup-meta-oe-bsp_remove_mipsarch = "efivar efibootmgr"
-RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc = "efivar efibootmgr"
-RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc64 = "efivar efibootmgr"
-RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc64le = "efivar efibootmgr"
-RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv64 = "efivar efibootmgr"
-RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv32 = "efivar efibootmgr"
+    botan \
+    cryptsetup \
+    libkcapi \
+    libmcrypt \
+    libsodium \
+    pkcs11-helper \
+"
 
 RDEPENDS_packagegroup-meta-oe-dbs ="\
-    leveldb libdbi mariadb mariadb-native \
-    postgresql psqlodbc rocksdb soci \
-    sqlite \
+    leveldb \
+    libdbi \
+    mariadb \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
-    "
+    postgresql \
+    psqlodbc \
+    rocksdb \
+    soci \
+    sqlite \
+"
 
 RDEPENDS_packagegroup-meta-oe-devtools ="\
-    android-tools android-tools-conf bootchart breakpad \
-    capnproto cgdb cscope ctags \
-    debootstrap dmalloc flatbuffers \
-    giflib grpc icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
-    kconfig-frontends lemon libedit libgee libsombok3 \
-    libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
-    mpich msgpack-c nlohmann-json openocd pax-utils \
-    ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
-    protobuf protobuf-c \
-    rapidjson serialcheck sip3 tclap uftrace uw-imap \
-    xmlrpc-c yajl yasm \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
+    abseil-cpp \
+    breakpad \
+    bootchart \
+    android-tools-conf \
+    android-tools \
+    concurrencykit \
+    cgdb \
+    ctags \
+    debootstrap \
+    cjson \
+    cloc \
+    icon-slicer \
+    cscope \
+    dmalloc \
+    ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnf-plugin-tui", "", d)} \
+    doxygen \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany-plugins geany", "", d)} \
+    lemon \
+    flatbuffers \
+    libubox \
+    ltrace \
+    lua \
+    luajit \
+    mcpp \
+    memstat \
+    giflib \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "glade", "", d)} \
+    grpc \
+    guider \
+    php \
+    iptraf-ng \
+    jq \
+    json-spirit \
+    serialcheck \
+    tclap \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "tk", "", d)} \
+    uw-imap \
+    jsoncpp \
+    jsonrpc \
+    yajl \
+    yajl \
+    kconfig-frontends \
+    ldns \
+    libgee \
+    libsombok3 \
+    log4cplus \
+    lshw \
+    luaposix \
+    capnproto-compiler \
+    mpich \
+    msgpack-c \
+    mercurial \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "nodejs", "", d)} \
-    "
+    openocd \
+    pax-utils \
+    ipc-run \
+    libdbd-mysql-perl \
+    libdbi-perl \
+    libdev-checklib-perl \
+    libio-pty-perl \
+    libjson-perl \
+    libperlio-gzip-perl \
+    ply \
+    protobuf-c \
+    protobuf \
+    pugixml \
+    python3-distutils-extra \
+    rapidjson \
+    sip3 \
+    uftrace \
+    libxerces-c \
+    xerces-c-samples \
+    xmlrpc-c \
+    yasm \
+    json-schema-validator \    
+"
+RDEPENDS_packagegroup-meta-oe-devtools_append_x86 = " cpuid msr-tools pmtools"
+RDEPENDS_packagegroup-meta-oe-devtools_append_x86-64 = " cpuid msr-tools pcimem pmtools"
+RDEPENDS_packagegroup-meta-oe-devtools_append_arm = " pcimem"
+RDEPENDS_packagegroup-meta-oe-devtools_append_aarch64 = " pcimem"
 
+RDEPENDS_packagegroup-meta-oe-devtools_remove_arm = "concurrencykit"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "nodejs"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad ltrace nodejs uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad ltrace nodejs uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "concurrencykit lshw ply uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "luajit nodejs"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "luajit nodejs"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad lshw luajit uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools lshw luajit uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools lshw luajit uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit lshw ltrace luajit nodejs ply uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit lshw ltrace luajit nodejs ply uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)} concurrencykit"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TUNE_FEATURES", "corei7", "", "abseil-cpp", d)}"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
-    byacc cfengine cfengine-masterfiles cmpi-bindings \
-    ddrescue dialog dumb-init enscript fluentbit \
-    haveged hexedit hiredis hplip hwloc indent iotop isomd5sum \
-    jansson konkretcmpi libblockdev libcec libconfig \
-    libdivecomputer libplist libusbmuxd \
-    liblockfile liblogging liblognorm libmodbus libmodbus \
-    libpwquality libqb libuio \
-    lockfile-progs logwatch lprng mailx md5deep \
-    mraa nana nicstat \
-    p7zip p8platform libfile-fnmatch-perl \
-    rarpd redis rrdtool libfastjson librelp rsyslog sanlock \
-    sblim-cmpi-devel sblim-sfc-common sblim-sfcc \
-    scsirastools sgpio smartmontools snappy \
-    can-utils libsocketcan tipcutils tiptop \
-    tmux uml-utilities upm vlock volume-key wipe zlog zram \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", " libgxim gnuplot libwmf", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluez", "collectd", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit polkit-group-rule-datetime ", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-network ", "", d)} \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
-    "
-RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
-RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
-RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64 = "upm mraa"
+     brotli \
+     byacc \
+     cmpi-bindings \
+     collectd \
+     cfengine-masterfiles \
+     cfengine \
+     ddrescue \
+     dialog \
+     enscript \
+     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gnuplot", "", d)} \
+     dlt-daemon \
+     docopt.cpp \
+     iotop \
+     dumb-init \
+     konkretcmpi \
+     figlet \
+     libcec \
+     libdivecomputer \
+     fluentbit \
+     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libgxim", "", d)} \
+     liblognorm \
+     libmodbus \
+     haveged \
+     hexedit \
+     hiredis \
+     hplip \
+     hwloc \
+     libuio \
+     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
+     lprng \
+     icewm \
+     md5deep \
+     indent \
+     jansson \
+     nana \
+     nicstat \
+     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
+     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
+     p7zip \
+     isomd5sum \
+     jpnevulator \
+     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-datetime polkit-group-rule-network polkit", "", d)} \
+     rarpd \
+     redis \
+     libfastjson \
+     librelp \
+     sblim-cmpi-devel \
+     sblim-sfc-common \
+     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "sblim-sfcb ", "", d)} \
+     sblim-sfcc \
+     libblockdev \
+     sgpio \
+     smartmontools \
+     can-utils \
+     canutils \
+     libsocketcan \
+     libconfig \
+     uml-utilities \
+     libidn \
+     libqb \
+     wipe \
+     libzip \
+     zram \
+     libplist \
+     libusbmuxd \
+     liblockfile \
+     liblogging \
+     libnss-nisplus \
+     libpwquality \
+     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", d)} \
+     libserialport \
+     libstatgrab \
+     lockfile-progs \
+     logwatch \
+     mailx \
+     mraa \
+     ostree \
+     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb pam-ssh-agent-auth", "", d)} \
+     pegtl \
+     libfile-fnmatch-perl \
+     rrdtool \
+     sanlock \
+     scsirastools \
+     sedutil \
+     libsigrok \
+     libsigrokdecode \
+     sigrok-cli \
+     snappy \
+     tipcutils \
+     tiptop \
+     tmux \
+     triggerhappy \
+     upm \
+     vlock \
+     volume-key \
+     wxwidgets \
+     zlog \
+     zstd \
+     redis-plus-plus \
+"
+RDEPENDS_packagegroup-meta-oe-extended_append_libc-musl = " libexecinfo"
+RDEPENDS_packagegroup-meta-oe-extended_append_x86-64 = " pmdk libx86-1"
+RDEPENDS_packagegroup-meta-oe-extended_append_x86 = " libx86-1"
+
+RDEPENDS_packagegroup-meta-oe-extended_remove_libc-musl = "libnss-nisplus sysdig"
+RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa minifi-cpp tiptop"
+RDEPENDS_packagegroup-meta-oe-extended_remove_mips = "sysdig"
+RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa minifi-cpp"
+RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64 = "upm mraa minifi-cpp"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64le = "upm mraa"
-RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa tiptop"
-RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa tiptop"
+RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa sysdig tiptop"
+RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa sysdig tiptop"
 
 RDEPENDS_packagegroup-meta-oe-gnome ="\
-    atkmm gnome-common gnome-doc-utils-stub gtkmm \
-    gtkmm3 pyxdg vte9 \
-    "
+    atkmm \
+    gcab \
+    gnome-common \
+    gmime \
+    libjcat \
+    gtk+ \
+    gtkmm3 \
+    gtkmm \
+    libpeas \
+    pyxdg \
+    vte9 \
+    gnome-theme-adwaita \
+    libxmlb \
+"
 
 RDEPENDS_packagegroup-meta-oe-graphics ="\
-    cairomm dietsplash directfb directfb-examples \
-    ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnfdragora dnf-plugin-tui", "", d)} \
-    fbgrab fbida fontforge fvwm glm gphoto2 libgphoto2 \
-    gtkperf jasper leptonica libmng libsdl2-image libsdl2-mixer libsdl2-net \
-    libsdl-gfx libsdl-image libsdl-mixer libsdl-net libsdl-ttf \
-    libvncserver libyui libyui-ncurses lxdm numlockx openbox openjpeg \
-    packagegroup-fonts-truetype pangomm qrencode takao-fonts terminus-font \
-    tesseract tesseract-lang tigervnc tslib source-han-sans-cn-fonts \
-    source-han-sans-jp-fonts source-han-sans-kr-fonts source-han-sans-tw-fonts ttf-abyssinica \
-    libvdpau x11vnc xcursorgen xdotool \
-    bdftopcf iceauth sessreg setxkbmap twm xclock xfontsel xgamma xkbevd xkbprint xkbutils \
-    xlsatoms xlsclients xlsfonts xmag xmessage xrdb xrefresh xsetmode xsetroot xstdcmap \
-    xterm xwd xwud xbitmaps xorg-sgml-doctools \
-    font-adobe-100dpi font-adobe-utopia-100dpi \
-    font-bh-100dpi font-bh-lucidatypewriter-100dpi font-bitstream-100dpi font-cursor-misc \
-    font-misc-misc xorg-fonts-100dpi liblbxutil libxaw libxkbui libxpresent xserver-common \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "freeglut libsdl2-ttf", "", d)} \
-    "
-
+    cairomm \
+    directfb-examples \
+    directfb \
+    fbgrab \
+    dietsplash \
+    ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnfdragora", "", d)} \
+    fontforge \
+    fbida \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "freeglut", "", d)} \
+    ftgl \
+    fvwm \
+    gtkperf \
+    gphoto2 \
+    libgphoto2 \
+    graphviz \
+    gtkwave \
+    jasper \
+    libforms \
+    lxdm \
+    numlockx \
+    openbox \
+    packagegroup-fonts-truetype \
+    qrencode \
+    takao-fonts \
+    leptonica \
+    libvncserver \
+    libmng \
+    libsdl-gfx \
+    libsdl-image \
+    libsdl-mixer \
+    libsdl-net \
+    libsdl-ttf \
+    libsdl2-image \
+    libsdl2-mixer \
+    libsdl2-net \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libsdl2-ttf", "", d)} \
+    libsdl \
+    ttf-arphic-uming \
+    ttf-droid-sans ttf-droid-sans-mono ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif \
+    ttf-abyssinica \
+    source-han-sans-cn-fonts \
+    source-han-sans-jp-fonts \
+    source-han-sans-kr-fonts \
+    source-han-sans-tw-fonts \
+    ttf-dejavu-sans \
+    ttf-dejavu-sans-condensed \
+    ttf-dejavu-sans-mono \
+    ttf-dejavu-serif \
+    ttf-dejavu-serif-condensed \
+    ttf-dejavu-mathtexgyre \
+    ttf-dejavu-common \
+    ttf-gentium \
+    ttf-hunky-sans \
+    ttf-hunky-serif \
+    ttf-lohit \
+    ttf-inconsolata \
+    ttf-liberation-sans-narrow \
+    ttf-liberation-mono \
+    ttf-liberation-sans \
+    ttf-liberation-serif \
+    ttf-lklug \
+    ttf-noto-emoji-color \
+    ttf-noto-emoji-regular \
+    ttf-sazanami-gothic \
+    ttf-sazanami-mincho \
+    ttf-tlwg \
+    ttf-roboto \
+    ttf-wqy-zenhei \
+    ttf-pt-sans \
+    ttf-vlgothic \
+    ttf-ubuntu-mono \
+    ttf-ubuntu-sans \
+    libyui-ncurses \
+    libyui \
+    x11vnc \
+    terminus-font-consolefonts \
+    terminus-font-pcf \
+    xdotool \
+    xkbevd \
+    bdftopcf \
+    iceauth \
+    sessreg \
+    xgamma \
+    setxkbmap \
+    xkbutils \
+    twm \
+    xclock \
+    xfontsel \
+    xkbprint \
+    xsetmode \
+    xlsatoms \
+    xlsclients \
+    xlsfonts \
+    xmag \
+    xmessage \
+    xrdb \
+    xrefresh \
+    xsetroot \
+    xstdcmap \
+    xterm \
+    xwd \
+    xwud \
+    xorg-sgml-doctools \
+    xf86-input-tslib \
+    xf86-input-void \
+    xf86-video-armsoc \
+    xf86-video-ati \
+    font-adobe-100dpi \
+    font-adobe-utopia-100dpi \
+    font-bh-100dpi \
+    font-bh-lucidatypewriter-100dpi \
+    font-bitstream-100dpi \
+    font-cursor-misc \
+    font-misc-misc \
+    xorg-fonts-100dpi \
+    liblbxutil \
+    libxaw6 \
+    libxkbui \
+    libxpresent \
+    xcb-util-cursor \
+    xserver-common \
+    openjpeg \
+    pangomm \
+    spirv-shader-generator \
+    spirv-tools \
+    stalonetray \
+    surf \
+    tesseract-lang \
+    tesseract \
+    tigervnc \
+    tslib \
+    unclutter-xfixes \
+    libvdpau \
+    xcursorgen \
+    xscreensaver \
+    yad \
+    parallel-deqp-runner \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts", "", d)} \
+"
+RDEPENDS_packagegroup-meta-oe-graphics_append_x86 = " renderdoc xf86-video-nouveau xf86-video-mga"
+RDEPENDS_packagegroup-meta-oe-graphics_append_x86-64 = " renderdoc xf86-video-nouveau xf86-video-mga"
+RDEPENDS_packagegroup-meta-oe-graphics_append_arm = " renderdoc"
+RDEPENDS_packagegroup-meta-oe-graphics_append_aarch64 = " renderdoc"
 
+RDEPENDS_packagegroup-meta-oe-graphics_remove_libc-musl = "renderdoc"
 
 RDEPENDS_packagegroup-meta-oe-kernel ="\
-    agent-proxy broadcom-bt-firmware cpupower \
-    crash ipmitool minicoredumper oprofile \
-    "
-RDEPENDS_packagegroup-meta-oe-kernel_append_x86 = " pm-graph "
-RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " pm-graph "
+    agent-proxy \
+    crash \
+    cpupower \
+    ipmitool \
+    broadcom-bt-firmware \
+    kernel-selftest \
+    minicoredumper \
+    oprofile \
+    spidev-test \
+"
+RDEPENDS_packagegroup-meta-oe-kernel_append_x86 = " intel-speed-select ipmiutil pm-graph turbostat"
+RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat"
+RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 = " libpfm4"
 
-RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash minicoredumper"
+# Kernel-selftest does not build with 5.8 and its exluded from build too so until its fixed remove it
+RDEPENDS_packagegroup-meta-oe-kernel_remove = "kernel-selftest"
+RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash intel-speed-select kernel-selftest minicoredumper turbostat"
 
+RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch = "makedumpfile"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64el = "crash"
 
-RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv64 = "crash oprofile"
-RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv32 = "crash oprofile"
+RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv64 = "crash makedumpfile oprofile"
+RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv32 = "crash makedumpfile oprofile"
 
 RDEPENDS_packagegroup-meta-oe-multimedia ="\
-    alsa-oss audiofile cdrkit id3lib \
-    a2jmidid jack libass libburn libcdio libcdio-paranoia \
-    libdvdread libmms libmodplug libopus live555 \
-    opus-tools \
-    sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol xsp", "", d)} \
+    alsa-oss \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "faad2", "", d)} \
+    cdrkit \
+    id3lib \
+    audiofile \
+    a2jmidid \
+    jack-server \
+    jack-utils \
+    libass \
+    libburn \
+    libcdio-paranoia \
+    libcdio \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad", "", d)} \
+    libmms \
+    libdvdread \
+    libopus \
+    live555-examples \
+    live555-mediaserver \
     libmikmod \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad faad2 mpv", "", d)} \
-    "
+    opus-tools \
+    libmodplug \
+    sound-theme-freedesktop \
+    yavta \
+    v4l-utils \
+    wavpack \
+    libvpx \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xsp", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "mpv", "", d)} \
+    pipewire \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pavucontrol", "", d)} \
+    libopusenc \
+"
+
 RDEPENDS_packagegroup-meta-oe-multimedia_remove_libc-musl = "alsa-oss"
 
 RDEPENDS_packagegroup-meta-oe-navigation ="\
-    geoclue geos libspatialite proj \
+    geos \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd-machine-conf gpsd", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "orrery", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd gpsd-machine-conf", "", d)} \
-    "
+    geoclue \
+    libspatialite \
+    proj \
+"
+
+RDEPENDS_packagegroup-meta-oe-printing ="\
+    cups-filters \
+    qpdf \
+"
 
 RDEPENDS_packagegroup-meta-oe-security ="\
-    tomoyo-tools \
+    keyutils \
+    nmap \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "passwdqc", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluz5", "nmap", "", d)} \
-    "
+    softhsm \
+    tomoyo-tools \
+"
 
 RDEPENDS_packagegroup-meta-oe-shells ="\
-    dash tcsh zsh \
-    "
-
-NE10 = ""
-NE10_aarch64 = "ne10"
-NE10_armv7a = "ne10"
-NE10_armv7ve = "ne10"
+    dash \
+    mksh \
+    tcsh \
+    zsh \
+"
 
 RDEPENDS_packagegroup-meta-oe-support ="\
-    anthy asio atop augeas avro-c bdwgc frame grail c-ares \
-    ccid ceres-solver ckermit cpprest ctapi-common daemonize \
-    daemontools devmem2 dfu-util dfu-util-native digitemp \
-    dstat eject enca epeg espeak fbset fbset-modes \
-    fftw fltk-native gd gflags glog gnulib gperftools \
-    gpm gradm gsl gsoap hddtemp hidapi htop hunspell hwdata iksemel \
-    libinih inotify-tools joe lcms lcov libatasmart libbytesize \
-    libcereal libcyusbserial libee libeigen libestr libftdi libgit2 \
-    libgpiod libiio libjs-jquery libjs-sizzle liblinebreak libmicrohttpd \
-    libmxml liboauth libol liboop libp11 libraw1394 libsmi libsoc libssh2 \
-    libssh libtar libteam libtinyxml2 libtinyxml libusbg libusb-compat libutempter \
-    links lockdev log4c log4cpp logwarn libdevmapper lvm2 \
-    mailcap mbuffer mg minini \
-    multipath-tools nano neon nmon numactl onig openct openldap \
-    opensc wbxml2 p910nd pcsc-lite picocom libotr pidgin \
-    pngcheck poco poppler poppler-data portaudio-v19 pps-tools \
-    pv pxaregs raptor2 rdfind read-edid rsnapshot \
-    satyr sdparm pty-forward-native serial-forward \
-    sg3-utils sharutils spitools srecord ssiapi stm32flash \
-    syslog-ng system-config-keyboard tbb thin-provisioning-tools tokyocabinet \
-    tree uhubctl unixodbc uriparser usb-modeswitch \
-    usb-modeswitch-data uthash utouch-evemu utouch-frame \
-    vim vim-tiny websocketpp xdelta3 xdg-user-dirs xmlstarlet \
-    zbar zile \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis toscoterm uim synergy utouch-mtview links-x11 fltk pidgin-otr", "", d)} \
+    anthy \
+    atop \
+    ace-cloud-editor \
+    frame \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis", "", d)} \
+    geis \
+    grail \
+    asio \
+    augeas \
+    avro-c \
+    bdwgc \
+    c-ares \
+    cmark \
+    ${@bb.utils.contains("DISTRO_FEATURES", "polkit gobject-introspection-data", "colord", "", d)} \
+    cpprest \
+    ctapi-common \
+    dfu-util \
+    dhex \
+    digitemp \
+    dstat \
+    espeak \
+    exiv2 \
+    libnice \
+    c-periphery \
+    fmt \
+    function2 \
+    gd \
+    gflags \
+    glog \
+    gperftools \
+    gpm \
+    gsoap \
+    hdf5 \
+    htop \
+    hunspell-dictionaries \
+    hunspell \
+    hwdata \
+    iksemel \
+    gengetopt \
+    imagemagick \
+    iniparser \
+    inotify-tools \
+    joe \
+    lcms \
+    lcov \
+    imapfilter \
+    libbytesize \
+    libcyusbserial \
+    libestr \
+    libfann \
+    libftdi \
+    ccid \
+    zchunk \
+    libgpiod \
+    libgpiod \
+    ckermit \
+    libcereal \
+    daemontools \
+    libiio \
+    devmem2 \
+    libgit2 \
+    libharu \
+    eject \
+    enca \
+    epeg \
+    libmxml \
+    fbset-modes \
+    fbset \
+    liboop \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "fltk", "", d)} \
+    freerdp \
+    libgusb \
+    emacs \
+    libp11 \
+    libraw1394 \
+    gradm \
+    gsl \
+    librsync \
+    hddtemp \
+    hidapi \
+    libsoc \
+    libmimetic \
+    libinih \
+    libtar \
+    libteam \
+    libusb-compat \
+    libatasmart \
     libcanberra \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
-    procmail \
-    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks2 upower", "", d)} \
-    ${NE10} \
+    libssh \
+    libssh2 \
+    libee \
+    libusbgx-config \
+    libusbgx \
+    lockdev \
+    logwarn \
+    libjs-jquery \
+    libjs-sizzle \
+    liblinebreak \
+    mailcap \
+    liboauth \
+    libol \
+    mg \
+    monit \
+    mscgen \
+    libsmi \
+    remmina \
+    neon \
+    nmon \
+    libtinyxml \
+    libusbg \
+    libutempter \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "links-x11", "links", d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "lio-utils", "", d)} \
-    "
-
+    log4c \
+    log4cpp \
+    nspr \
+    libdevmapper \
+    lvm2 \
+    nss \
+    mbuffer \
+    onig \
+    mime-support \
+    minini \
+    multipath-tools \
+    numactl \
+    clinfo \
+    opencv \
+    opensc \
+    openct \
+    openldap \
+    wbxml2 \
+    p910nd \
+    libtinyxml2 \
+    picocom \
+    funyahoo-plusplus \
+    icyque \
+    libotr \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pidgin-otr", "", d)} \
+    pidgin \
+    purple-skypeweb \
+    pidgin-sipe \
+    pngcheck \
+    poco \
+    poppler-data \
+    poppler \
+    portaudio-v19 \
+    procmail \
+    pxaregs \
+    pv \
+    rsnapshot \
+    pps-tools \
+    raptor2 \
+    rdfind \
+    sdparm \
+    serial-forward \
+    read-edid \
+    spitools \
+    libsass \
+    sassc \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "synergy", "", d)} \
+    syslog-ng \
+    system-config-keyboard \
+    tbb \
+    satyr \
+    pcsc-lite \
+    sharutils \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "toscoterm", "", d)} \
+    sg3-utils \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "uim", "", d)} \
+    uchardet \
+    srecord \
+    ssiapi \
+    tree \
+    utouch-evemu \
+    utouch-frame \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "utouch-mtview", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks2", "", d)} \
+    stm32flash \
+    tokyocabinet \
+    xmlstarlet \
+    thin-provisioning-tools \
+    uhubctl \
+    zile \
+    unixodbc \
+    daemonize \
+    upower \
+    xxhash \
+    unicode-ucd \
+    xdelta3 \
+    uriparser \
+    nano \
+    xdg-user-dirs \
+    xmlsec1 \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
+    usb-modeswitch-data \
+    usb-modeswitch \
+    liburing \
+    zbar \
+    libmicrohttpd \
+"
+RDEPENDS_packagegroup-meta-oe-support_append_armv7a = " ne10"
+RDEPENDS_packagegroup-meta-oe-support_append_armv7ve = " ne10"
+RDEPENDS_packagegroup-meta-oe-support_append_aarch64 = " ne10"
+RDEPENDS_packagegroup-meta-oe-support_append_x86 = " mcelog mce-inject mce-test open-vm-tools vboxguestdrivers"
+RDEPENDS_packagegroup-meta-oe-support_append_x86-64 = " mcelog mce-inject mce-test open-vm-tools vboxguestdrivers"
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
 
-RDEPENDS_packagegroup-meta-oe-support-egl ="\
-    freerdp libnice opencv \
-    "
-
 RDEPENDS_packagegroup-meta-oe-test ="\
-    catch2 cppunit cunit cxxtest evtest fb-test \
-    fwts googletest pm-qa stress-ng testfloat \
-    "
+    bats \
+    cppunit \
+    cunit \
+    cxxtest \
+    evtest \
+    fb-test \
+    fwts \
+    googletest \
+    pm-qa \
+    testfloat \
+"
 RDEPENDS_packagegroup-meta-oe-test_remove_libc-musl = "pm-qa"
 RDEPENDS_packagegroup-meta-oe-test_remove_arm = "fwts"
 RDEPENDS_packagegroup-meta-oe-test_remove_mipsarch = "fwts"
@@ -306,14 +913,26 @@ RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
     uthash-ptest \
     libee-ptest \
     poco-ptest \
-    "
+"
+RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86 = " mcelog-ptest"
+RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86-64 = " mcelog-ptest"
+
 RDEPENDS_packagegroup-meta-oe-ptest-packages_remove_riscv64 = "oprofile-ptest"
 RDEPENDS_packagegroup-meta-oe-ptest-packages_remove_riscv32 = "oprofile-ptest"
+RDEPENDS_packagegroup-meta-oe-ptest-packages_remove_arm = "numactl-ptest"
 
-RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86 = "\
-    mcelog-ptest \
-"
-RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86-64 = "\
-    mcelog-ptest \
+
+RDEPENDS_packagegroup-meta-oe-fortran-packages = "\
+    lapack \
+    octave \
 "
-RDEPENDS_packagegroup-meta-oe-ptest-packages_remove_arm = "numactl-ptest"
+# library-only or headers-only packages
+# They wont be built as part of images but might be interesting to include
+# with dev-pkgs images
+#
+# opencl-headers sdbus-c++-libsystemd boost-url nlohmann-fifo sqlite-orm
+# nlohmann-json exprtk liblightmodbus p8platform gnome-doc-utils-stub
+# glm ttf-mplus xbitmaps ceres-solver cli11 fftw gnulib libeigen ade
+# spdlog span-lite uthash websocketpp catch2
+
+# rsyslog conflicts with syslog-ng so its not included here
-- 
2.28.0

