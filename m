Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.7114.1598686392802354966
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2020 00:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ai4JuITL;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id 10so702802plg.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2020 00:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lgvVy+wwEhbalv8lUGEzx+HMW47CAHfGaOI030MRYAA=;
        b=Ai4JuITL3eF3REa1FJVgkaJEPwOqON31N7gk2fHpdp6febXVivYEBuVmRfCCvxaHTd
         k1wnXFF9OqwKMDRe2QFaFPrX+CqfYyb2iJhkeCtpaG0xE5XQZSLj9XJ521USl9xrZYGn
         widQEljeHef4Soo4kgBiGExVQqO47ZZ7O0xHc+f4Dno+iwnja39eqbzmDOlJJtMJaSSU
         U0qsK7w9d0Q8hOGUgx6UjxvZWn5S4FyKGvfvvd0H1EGSFYZhsIjXHVDs96zE/ymbpGB/
         IvlmphwgmPOHriS1pJz5gdJTP1Gz/q0nUhkh4COnAdy3PXo0jlplA3ecPBxiUzXLzoZ3
         dZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lgvVy+wwEhbalv8lUGEzx+HMW47CAHfGaOI030MRYAA=;
        b=TNfktu6PtzZiBcA+YPlYGPx1cwwdAJa00mgi47IPEn1nntaO6OY308KXApGCPH0oIx
         nxFcib58nPI7pbGkZIF+GzBfbwwChpbRhaXP8RylYisf+yEUQWBVJg8TELEyLCpOa+k3
         84zNsdyAyAWTeHOmZ59sSMclwKjJquCHum23DZIh4viZiNU7uZtpLxaNMCJX8ogIkDjw
         idlk+TdVTbfi/7wpO3pP1C8Y4697f1JTzSSC7H00+i+H4jxq6oVro2pjKnawhXlp4c5o
         y5MgruFW6DIu0R8Q8vIWkkpq2DUa/oxm4jcWxp6pA1KCunhRcTLFV6XP5+9Zua8mpdM1
         J/QQ==
X-Gm-Message-State: AOAM533ZYv72gyg/5ijea8VuDzOl4qSxdl6TCumjewcef7jnxpKBw1bc
	MuLjgtzRM5NM12rneloLJRQTHzD6NqOYDQ==
X-Google-Smtp-Source: ABdhPJwjMnmZ0SgSLOIMBEjoSHIuvteNjGw4/GluFD9NPLN1tkxyxifb0v/tbcrmOsSjS133ZaPpSg==
X-Received: by 2002:a17:90a:6301:: with SMTP id e1mr2126454pjj.5.1598686391544;
        Sat, 29 Aug 2020 00:33:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id l13sm1529469pgq.33.2020.08.29.00.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 00:33:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] packagegroup-meta-oe: Overhaul so it can build meta-oe-image
Date: Sat, 29 Aug 2020 00:33:07 -0700
Message-Id: <20200829073307.2778520-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200829073307.2778520-1-raj.khem@gmail.com>
References: <20200829073307.2778520-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that newly added recipes are added
Organise the packages per direcories
introduce packagegroup for fortran packages
Add missing packagegroup for printing packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 982 ++++++++++++++----
 1 file changed, 806 insertions(+), 176 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4dc3afe454..adcfe8e91f 100644
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
+    packagegroup-meta-oe-fortran-packages \
+"
 
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
@@ -59,104 +83,337 @@ RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mips64el = "tinymembench"
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_riscv64 = "libhugetlbfs"
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_riscv32 = "libhugetlbfs"
 
+RDEPENDS_packagegroup-meta-oe-bsp ="\
+    acpitool \
+    cpufrequtils \
+    edac-utils \
+    flashrom \
+    irda-utils \
+    lmsensors-config \
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
+    glfw \
+    glibmm \
+    libnfc \
+    libsigc++-2.0 \
+    libsigc++-3 \
+    libxml++ \
+    mdbus2 \
+    distro-feed-configs \
+    mm-common \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "ndctl", "", d)} \
+    opencl-headers \
+    opencl-icd-loader \
+    proxy-libintl \
+    safec \
+    sdbus-c++-libsystemd \
+    sdbus-c++-tools \
+    sdbus-c++ \
+    toybox \
+    usleep \
+"
 
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
+    mariadb-native \
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
+    autoconf-2.13-native \
+    concurrencykit \
+    cgdb \
+    ctags \
+    debootstrap \
+    boost-url \
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
+    capnproto \
+    mpich \
+    msgpack-c \
+    nlohmann-fifo \
+    mercurial \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "nodejs", "", d)} \
-    "
+    openocd \
+    pax-utils \
+    pcimem \
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
+    sqlite-orm \
+    uftrace \
+    libxerces-c \
+    xerces-c-samples \
+    xmlrpc-c \
+    yasm \
+    nlohmann-json \
+    exprtk \
+    json-schema-validator \    
+"
+RDEPENDS_packagegroup-meta-oe-devtools_append_x86 = " cpuid msr-tools pmtools"
+RDEPENDS_packagegroup-meta-oe-devtools_append_x86-64 = " cpuid msr-tools pmtools"
 
+RDEPENDS_packagegroup-meta-oe-devtools_remove_arm = "concurrencykit"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "concurrencykit uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad ltrace nodejs uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad ltrace nodejs uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit ltrace nodejs uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit ltrace nodejs uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)} concurrencykit"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TUNE_FEATURES", "corei7", "", "abseil-cpp", d)}"
 
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
+     rsyslog \
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
+     sysdig \
+     libconfig \
+     uml-utilities \
+     libidn \
+     libqb \
+     wipe \
+     libzip \
+     zram \
+     libplist \
+     libusbmuxd \
+     liblightmodbus \
+     liblockfile \
+     liblogging \
+     libnss-nisplus \
+     libpwquality \
+     libreport \
+     libserialport \
+     libstatgrab \
+     lockfile-progs \
+     logwatch \
+     mailx \
+     mraa \
+     ostree \
+     p8platform \
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
+     minifi-cpp \
+     redis-plus-plus \
+"
+RDEPENDS_packagegroup-meta-oe-extended_append_libc-musl = " libexecinfo"
+RDEPENDS_packagegroup-meta-oe-extended_append_x86-64 = " pmdk libx86-1"
+RDEPENDS_packagegroup-meta-oe-extended_append_x86 = " libx86-1"
+
 RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64 = "upm mraa"
@@ -165,40 +422,186 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa tiptop"
 
 RDEPENDS_packagegroup-meta-oe-gnome ="\
-    atkmm gnome-common gnome-doc-utils-stub gtkmm \
-    gtkmm3 pyxdg vte9 \
-    "
+    atkmm \
+    gcab \
+    gnome-common \
+    gnome-doc-utils-stub \
+    gmime \
+    libjcat \
+    gtk+ \
+    gtkmm3 \
+    gtkmm \
+    libpeas \
+    pyxdg \
+    vte9 \
+    gnome-themes-extra \
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
+    glm \
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
+    ttf-mplus \
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
+    terminus-font \
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
+    xbitmaps \
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
+    libxaw \
+    libxkbui \
+    libxpresent \
+    xcb-util-cursor \
+    xserver-common \
+    openjpeg \
+    pangomm \
+    renderdoc \
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
+RDEPENDS_packagegroup-meta-oe-graphics_append_x86 = " xf86-video-nouveau xf86-video-mga"
+RDEPENDS_packagegroup-meta-oe-graphics_append_x86-64 = " xf86-video-nouveau xf86-video-mga"
 
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
+    makedumpfile \
+    minicoredumper \
+    oprofile \
+    spidev-test \
+"
+RDEPENDS_packagegroup-meta-oe-kernel_append_x86 = " intel-speed-select ipmiutil pm-graph turbostat"
+RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat"
+RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 = " libpfm4"
 
-RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash minicoredumper"
+RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash intel-speed-select minicoredumper turbostat"
 
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64el = "crash"
@@ -207,86 +610,310 @@ RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv64 = "crash oprofile"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv32 = "crash oprofile"
 
 RDEPENDS_packagegroup-meta-oe-multimedia ="\
-    alsa-oss audiofile cdrkit id3lib \
-    a2jmidid jack libass libburn libcdio libcdio-paranoia \
-    libdvdread libmms libmodplug libopus live555 \
-    opus-tools \
-    sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol xsp", "", d)} \
+    alsa-oss \
+    faad2 \
+    cdrkit \
+    id3lib \
+    audiofile \
+    a2jmidid \
+    jack \
+    libass \
+    libburn \
+    libcdio-paranoia \
+    libcdio \
+    libmad \
+    libmms \
+    libdvdread \
+    libopus \
+    live555 \
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
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext", "", d)} \
+    xpext \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xsp", "", d)} \
+    mpv \
+    pipewire-0.2 \
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
+    ceres-solver \
+    cli11 \
+    cmark \
+    colord \
+    cpprest \
+    ctapi-common \
+    dfu-util-native \
+    dfu-util \
+    dhex \
+    digitemp \
+    dstat \
+    espeak \
+    exiv2 \
+    libnice \
+    fftw \
+    c-periphery \
+    fmt \
+    function2 \
+    gd \
+    gflags \
+    glog \
+    gnulib \
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
+    libeigen \
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
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "links-x11", "", d)} \
+    links \
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
+    ne10 \
+    numactl \
+    clinfo \
+    ade \
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
+    pty-forward-native \
+    serial-forward \
+    read-edid \
+    spdlog \
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
+    udisks2 \
+    stm32flash \
+    tokyocabinet \
+    xmlstarlet \
+    thin-provisioning-tools \
+    uhubctl \
+    zile \
+    unixodbc \
+    daemonize \
+    span-lite \
+    upower \
+    xxhash \
+    unicode-ucd \
+    xdelta3 \
+    uthash \
+    uriparser \
+    nano \
+    xdg-user-dirs \
+    xmlsec1 \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
+    usb-modeswitch-data \
+    usb-modeswitch \
+    liburing \
+    zbar \
+    websocketpp \
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
+    catch2 \
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
@@ -306,14 +933,17 @@ RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
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
+
-- 
2.28.0

