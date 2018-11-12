Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF976C257
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 02:57:00 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g7-v6so3558484pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2018 18:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=75LkVypYPjXIfKOUAobbkPOZJcgtOrXWnXKmcv+Rk0E=;
	b=jRiHD1aqSyrxN0mwh8lzZ/v/AL2HzvAlfVguiURdwL6Yqrq9otmJq/L4+AiSsnRXr5
	dpFzbKyBouUfkuOyyyKSTLRcQDnAFXc+IXlTQ28sdjW9m5dMXblamlHoaFbvCQc5KZxK
	Yrjr3MCdzN5j0dP5t/zmLve2QGBJ/a9xNy8XQOnoPgGcs7DXnCAZNGf6P03DLL7m6PaT
	tz4/ZymJgXYWh9rB+OtgPqQsINaP4pcds0g9DVJwmEskM+thvh+x7FDWhuvnqZ/H96Ts
	l8D6nUUQ7pN8gdTaIIEGe1t8H8fgFvumYrUJ2mKHL/eER0qH/Orl+4IHX7pkwb7P6Xdn
	m3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=75LkVypYPjXIfKOUAobbkPOZJcgtOrXWnXKmcv+Rk0E=;
	b=EVv4dIcOTv9anZKlWPBHmDWQb0e87KYKp3DPZsjqiu2WcT9vCD3+QpVvvfsI5qFjds
	CZxllYv4T/cWFUdJgTXwOtCQEwxkdkIZbtkT8rc4Ds6P9zNKiLo8QvZkb+Qysd8nrUiU
	0aKlafE6x7W9RJpi3Z02Yq/lMlj2v+OvglLIrPwc3H+tUC7TVuwPAbyH19c8BQX9L5lb
	2jr53hcjtO24diLba05ULHzPjFSzseZAfl8/VPQj/2psgMKSEsdxlvZ6CR9nGbll9su3
	qX6fQGOJwEuo4nGiT/PefZPpAZelltbc2rv6mRYqSoOYEDiLbeVhw7RVR2X8icJfVDD0
	bbAQ==
X-Gm-Message-State: AGRZ1gKoKg7p+EyOFsOElXxdcjm9S4jSdjARO/dKoaDfvVcmoK/RGlO5
	9RUUM4bo0JLVWeOWC/kuD5ME1N15
X-Google-Smtp-Source: AJdET5djA+EQ0G0nXD1xAJ18beN4H7bEFkUuQ1kFdCgZz4GJdcNCmUTk1Ot+JCtJowL7IZsGq6AVJQ==
X-Received: by 2002:a63:ef47:: with SMTP id c7mr16097091pgk.386.1541991421968; 
	Sun, 11 Nov 2018 18:57:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7077:6962:50cb:42de])
	by smtp.gmail.com with ESMTPSA id
	b69-v6sm16128554pfc.150.2018.11.11.18.57.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Nov 2018 18:57:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 11 Nov 2018 18:56:59 -0800
Message-Id: <1541991419-8898-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541991419-8898-1-git-send-email-akuster808@gmail.com>
References: <1541991419-8898-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH] ptest: add addition packagegroups and image for ptests
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2018 02:57:01 -0000

Need a method to run ptests in meta-oe and to build test
tasks not done via a world build

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/conf/layer.conf                            |   2 +
 meta-oe/recipes-core/images/meta-oe-image-base.bb  |   7 +
 meta-oe/recipes-core/images/meta-oe-image.bb       |   5 +
 meta-oe/recipes-core/images/meta-oe-ptest-image.bb |   5 +
 .../packagegroups/packagegroup-meta-oe.bb          | 251 +++++++++++++++++++++
 5 files changed, 270 insertions(+)
 create mode 100644 meta-oe/recipes-core/images/meta-oe-image-base.bb
 create mode 100644 meta-oe/recipes-core/images/meta-oe-image.bb
 create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-image.bb
 create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 64c888d..23c10ce 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -77,3 +77,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   source-han-sans-kr-fonts->fontconfig \
   source-han-sans-tw-fonts->fontconfig \
 "
+
+DEFAULT_TEST_SUITES_pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
diff --git a/meta-oe/recipes-core/images/meta-oe-image-base.bb b/meta-oe/recipes-core/images/meta-oe-image-base.bb
new file mode 100644
index 0000000..df92f16
--- /dev/null
+++ b/meta-oe/recipes-core/images/meta-oe-image-base.bb
@@ -0,0 +1,7 @@
+SUMMARY = "meta-oe build test image"
+
+IMAGE_INSTALL = "packagegroup-core-boot"
+
+LICENSE = "MIT"
+
+inherit core-image
diff --git a/meta-oe/recipes-core/images/meta-oe-image.bb b/meta-oe/recipes-core/images/meta-oe-image.bb
new file mode 100644
index 0000000..1565549
--- /dev/null
+++ b/meta-oe/recipes-core/images/meta-oe-image.bb
@@ -0,0 +1,5 @@
+require  meta-oe-image-base.bb
+
+SUMMARY = "meta-oe build test image"
+
+IMAGE_INSTALL += "packagegroup-meta-oe"
diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
new file mode 100644
index 0000000..0166b9c
--- /dev/null
+++ b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
@@ -0,0 +1,5 @@
+require  meta-oe-image-base.bb
+
+SUMMARY = "meta-oe ptest test image"
+
+IMAGE_INSTALL += "packagegroup-meta-oe"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
new file mode 100644
index 0000000..4526e99
--- /dev/null
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -0,0 +1,251 @@
+SUMMARY = "Meta-oe ptest packagegroups"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = ' \
+    packagegroup-meta-oe \
+    packagegroup-meta-oe-benchmarks \
+    packagegroup-meta-oe-connectivity \
+    packagegroup-meta-oe-core \
+    packagegroup-meta-oe-crypto \
+    packagegroup-meta-oe-bsp \
+    packagegroup-meta-oe-dbs \
+    packagegroup-meta-oe-devtools \
+    packagegroup-meta-oe-extended \
+    packagegroup-meta-oe-kernel \
+    packagegroup-meta-oe-multimedia \
+    packagegroup-meta-oe-navigation \
+    packagegroup-meta-oe-security \
+    packagegroup-meta-oe-support \
+    packagegroup-meta-oe-test \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest", "", d)} \
+'
+
+RDEPENDS_packagegroup-meta-oe = "\
+    packagegroup-meta-oe-benchmarks \
+    packagegroup-meta-oe-connectivity \
+    packagegroup-meta-oe-core \
+    packagegroup-meta-oe-crypto \
+    packagegroup-meta-oe-bsp \
+    packagegroup-meta-oe-dbs \
+    packagegroup-meta-oe-devtools \
+    packagegroup-meta-oe-extended \
+    packagegroup-meta-oe-kernel \
+    packagegroup-meta-oe-multimedia \
+    packagegroup-meta-oe-navigation \
+    packagegroup-meta-oe-security \
+    packagegroup-meta-oe-support \
+    packagegroup-meta-oe-test \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest", "", d)} \
+"
+
+RDEPENDS_packagegroup-meta-oe-benchmarks = "\
+    analyze-suspend dhrystone iperf2 linpack phoronix-test-suite \
+    tiobench bonnie++ fio iperf2 iperf3 lmbench s-suite whetstone \
+    libc-bench memtester sysbench dbench iozone3 libhugetlbfs \
+    nbench-byte tinymembench \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "glmark2", "", d)} \
+"
+
+RDEPENDS_packagegroup-meta-oe-connectivity ="\
+    gammu hostapd irssi krb5 libev libimobiledevice \
+    libmbim libmtp libndp libqmi libtorrent \
+    libuv libwebsockets linuxptp lirc loudmouth \
+    modemmanager mosh  \
+    paho-mqtt-c phonet-utils rabbitmq-c rfkill rtorrent \
+    ser2net smstools3 telepathy-glib telepathy-idle thrift \
+    usbmuxd wvstreams zabbix zeromq \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libmikmod", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "obexftp openobex libnet wvdial", "", d)} \
+    "
+
+# dracut needs dracut
+RDEPENDS_packagegroup-meta-oe-core ="\
+    dbus-daemon-proxy libdbus-c++ eggdbus \
+    ell glibmm libsigc++-2.0 libxml++ distro-feed-configs \
+    mm-common opencl-headers opencl-icd-loader \
+    proxy-libintl usleep \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker ndctl", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-oe-crypto ="\
+    botan cryptsetup libkcapi libmcrypt \
+    libsodium pkcs11-helper \
+    "
+RDEPENDS_packagegroup-meta-oe-bsp ="\
+    acpitool cpufrequtils edac-utils efibootmgr \
+    efivar flashrom lmsensors lmsensors-config \
+    lsscsi nvme-cli pcmciautils pointercal \
+    "
+RDEPENDS_packagegroup-meta-oe-dbs ="\
+    leveldb libdbi mariadb mariadb-native \
+    mysql-python postgresql psqlodbc rocksdb soci \
+    sqlite \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "mongodb", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-oe-devtools ="\
+    android-tools android-tools-conf bootchart breakpad \
+    capnproto cgdb cscope ctags \
+    debootstrap dejagnu dmalloc flatbuffers \
+    giflib icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
+    kconfig-frontends lemon libedit libgee libsombok3 \
+    libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
+    mpich msgpack-c nlohmann-json nodejs openocd pax-utils \
+    ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
+    protobuf protobuf-c python3-distutils-extra \
+    python-cpuset python-distutils-extra python-futures python-pygobject \
+    rapidjson serialcheck sip3 sip tclap uftrace uw-imap valijson \
+    xmlrpc-c yajl yasm \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-oe-extended ="\
+    byacc cfengine cfengine-masterfiles cmpi-bindings \
+    ddrescue dialog dumb-init enscript fluentbit \
+    haveged hexedit hiredis hplip hwloc indent iotop isomd5sum \
+    jansson konkretcmpi lcdproc libblockdev libcec libconfig \
+    libdivecomputer libplist libusbmuxd \
+    liblockfile liblogging liblognorm libmodbus libmodbus \
+    libpwquality libqb libuio \
+    lockfile-progs logwatch lprng mailx md5deep \
+    mozjs mraa nana nicstat \
+    p7zip p8platform libfile-fnmatch-perl polkit \
+    polkit-group-rule-datetime polkit-group-rule-network \
+    rarpd redis rrdtool libfastjson librelp rsyslog sanlock \
+    sblim-cmpi-devel sblim-sfc-common sblim-sfcc \
+    scsirastools sgpio smartmontools snappy can-isotp \
+    can-utils libsocketcan tipcutils tiptop \
+    tmux uml-utilities upm vlock volume-key wipe zlog zram \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", " libgxim t1lib gnuplot libwmf gtkmathview", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluez", "collectd", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
+    ${@bb.utils.contains("BBPATH", "meta-python", "openlmi-tools", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-oe-gnome ="\
+    atkmm gnome-common gnome-doc-utils-stub gtkmm \
+    gtkmm3 pyxdg vte9 \
+    "
+
+RDEPENDS_packagegroup-meta-oe-graphics ="\
+    babl cairomm dietsplash directfb directfb-examples dnfdragora \
+    fbgrab fbida fontforge freeglut fvwm gegl gimp glm gphoto2 libgphoto2 \
+    gtkperf jasper leptonica libmng libsdl2-image libsdl2-mixer libsdl2-net \
+    libsdl2-ttf libsdl-gfx libsdl-image libsdl-mixer libsdl-net libsdl-ttf \
+    libvncserver libyui libyui-ncurses lxdm numlockx openbox openjpeg \
+    packagegroup-fonts-truetype pangomm qrencode takao-fonts terminus-font \
+    tesseract tesseract-lang tigervnc tslib source-han-sans-cn-fonts \
+    source-han-sans-jp-fonts source-han-sans-kr-fonts source-han-sans-tw-fonts ttf-abyssinica \
+    libvdpau x11vnc xcursorgen xdotool \
+    bdftopcf iceauth sessreg setxkbmap twm xclock xfontsel xgamma xkbevd xkbprint xkbutils \
+    xlsatoms xlsclients xlsfonts xmag xmessage xrdb xrefresh xsetmode xsetroot xstdcmap \
+    xterm xwd xwud xbitmaps xorg-sgml-doctools \
+    font-adobe-100dpi font-adobe-utopia-100dpi \
+    font-bh-100dpi font-bh-lucidatypewriter-100dpi font-bitstream-100dpi font-cursor-misc \
+    font-misc-misc xorg-fonts-100dpi liblbxutil libxaw libxkbui libxpresent xserver-common \
+    "
+
+RDEPENDS_packagegroup-meta-oe-kernel ="\
+    agent-proxy bpftool broadcom-bt-firmware cpupower \
+    crash ipmitool minicoredumper oprofile \
+    "
+
+RDEPENDS_packagegroup-meta-oe-multimedia ="\
+    alsa-oss audiofile cdrkit esound faad2 id3lib \
+    a2jmidid jack libass libburn libcdio libcdio-paranoia \
+    libdvdread libmad libmms libmodplug libopus live555 \
+    mplayer-common opus-tools \
+    sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol mpv xsp", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libmikmod", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-oe-navigation ="\
+    geoclue geos libspatialite proj \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "orrery", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd gpsd-machine-conf", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-oe-security ="\
+    tomoyo-tools \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "passwdqc", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluz5", "nmap", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-oe-shells ="\
+    dash tcsh zsh \
+    "
+
+NE10 = ""
+NE10_aarch64 = "ne10"
+NE10_arm7 = "ne10"
+
+RDEPENDS_packagegroup-meta-oe-support ="\
+    anthy asio atop augeas avro-c bdwgc frame grail \
+    ccid ceres-solver ckermit cpprest ctapi-common daemonize \
+    daemontools debsums devmem2 dfu-util dfu-util-native digitemp \
+    dstat eject enca epeg espeak espeak-data fbset fbset-modes \
+    fftw fltk-native gd gflags glog gnulib gperftools \
+    gpm gradm gsl gsoap hddtemp hidapi htop hunspell hwdata iksemel \
+    libinih inotify-tools joe lcms lcov libatasmart libbytesize \
+    libcereal libcyusbserial libee libeigen libestr libftdi libgit2 \
+    libgpiod libiio libjs-jquery libjs-sizzle liblinebreak libmicrohttpd \
+    libmxml libnih liboauth libol liboop libp11 libraw1394 libsmi libsoc libssh2 \
+    libssh libtar libteam libtinyxml2 libtinyxml libusbg libusb-compat libutempter \
+    links lio-utils lockdev log4c log4cpp logwarn libdevmapper lvm2 \
+    mailcap mbuffer mg minini \
+    multipath-tools nano neon nmon numactl onig openct openldap \
+    opensc wbxml2 p910nd pcsc-lite picocom libotr pidgin \
+    pngcheck poco poppler poppler-data portaudio-v19 pps-tools \
+    pv pxaregs raptor2 rdfind read-edid rsnapshot s3c24xx-gpio s3c64xx-gpio \
+    sjf2410-linux-native satyr sdparm pty-forward-native serial-forward \
+    sg3-utils sharutils smem spitools srecord ssiapi start-stop-daemon stm32flash \
+    syslog-ng system-config-keyboard tbb thin-provisioning-tools tokyocabinet \
+    tree udisks udisks2 uhubctl unixodbc upower uriparser usb-modeswitch \
+    usb-modeswitch-data usbpath uthash utouch-evemu utouch-frame \
+    vim vim-tiny websocketpp wmiconfig xdelta3 xdg-user-dirs xmlstarlet \
+    zbar zile \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis toscoterm uim synergy utouch-mtview links-x11 fltk pidgin-otr", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libcanberra", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "procmail", "", d)} \
+    ${NE10} \
+    "
+
+RDEPENDS_packagegroup-meta-oe-support-egl ="\
+    freerdp libnice opencv \
+    "
+
+RDEPENDS_packagegroup-meta-oe-test ="\
+    catch2 cppunit cunit cxxtest evtest fb-test \
+    fwts gtest pm-qa stress-ng testfloat \
+    "
+
+RDEPENDS_packagegroup-meta-oe-ptest = "\
+    zeromq-ptest \
+    libxml-ptest \
+    soci-ptest \
+    leveldb-ptest \
+    psqlodbc-ptest \
+    lua-ptest \
+    protobuf-ptest \
+    libdbi-ptest \
+    rsyslog-ptest \
+    oprofile-ptest \
+    libteam-ptest \
+    uthash-ptest \
+    mcelog-ptest \
+    openldap-ptest \
+    libee-ptest \
+    numactl-ptest \
+    poco-ptest \
+    "
-- 
2.7.4


