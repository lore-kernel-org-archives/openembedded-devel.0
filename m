Return-Path: <rsantos@admtronics.com>
Received: from p3plsmtpa09-09.prod.phx3.secureserver.net
	(p3plsmtpa09-09.prod.phx3.secureserver.net [173.201.193.238])
	by mail.openembedded.org (Postfix) with ESMTP id 5014F65DD0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 17:51:35 +0000 (UTC)
Received: from [192.168.1.93] ([75.99.190.18])
	by p3plsmtpa09-09.prod.phx3.secureserver.net with 
	id h5ra1o00Y0QFrz7015rbEX; Wed, 20 Aug 2014 10:51:36 -0700
Message-ID: <53F4E02A.1070808@admtronics.com>
Date: Wed, 20 Aug 2014 13:51:38 -0400
From: Rui DosSantos <rsantos@admtronics.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <53F3DC14.1040305@admtronics.com>
In-Reply-To: <53F3DC14.1040305@admtronics.com>
X-Forwarded-Message-Id: <53F3DC14.1040305@admtronics.com>
Subject: [meta-qt5][daisy] error meta-toolchain-qt5 not building
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Aug 2014 17:51:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey Guys,

Im trying to build "meta-toolchain-qt5" but it is failing, I am able to 
build my own custom Qt5 image however the "meta-toolchain-qt5" errors 
out with the following


ERROR: Unable to install packages. Command 
'/media/secondary/oe-core/build-cubie/tmp-eglibc/sysroots/x86_64-linux/usr/bin/opkg-cl 
-f 
/media/secondary/oe-core/build-cubie/tmp-eglibc/work/cortexa8hf-vfp-neon-oe-linux-gnueabi/meta-toolchain-qt5/1.0-r0/opkg.conf 
-o 
/media/secondary/oe-core/build-cubie/tmp-eglibc/work/cortexa8hf-vfp-neon-oe-linux-gnueabi/meta-toolchain-qt5/1.0-r0/sdk/image/usr/local/oecore-x86_64/sysroots/cortexa8hf-vfp-neon-oe-linux-gnueabi 
--force_postinstall --prefer-arch-to-version   install 
packagegroup-core-standalone-sdk-target-dbg 
packagegroup-core-standalone-sdk-target 
packagegroup-qt5-toolchain-target' returned 255:
Installing packagegroup-core-standalone-sdk-target-dbg (1.0-r8) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/all/packagegroup-core-standalone-sdk-target-dbg_1.0-r8_all.ipk.
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for libsegfault-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for libstdc++-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for eglibc-utils-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for eglibc-thread-db-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for eglibc-gconv-ibm850-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for eglibc-gconv-iso8859-15-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for eglibc-gconv-cp1252-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for eglibc-localedata-i18n-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation 
for eglibc-gconv-iso8859-1-dbg
Installing qemuwrapper-cross-dbg (1.0-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/qemuwrapper-cross-dbg_1.0-r0_cortexa8hf-vfp-neon.ipk.
Installing libgcc-s-dbg (4.8.2-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libgcc-s-dbg_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing libc6-dbg (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libc6-dbg_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing packagegroup-core-standalone-sdk-target (1.0-r8) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/all/packagegroup-core-standalone-sdk-target_1.0-r8_all.ipk.
libc6-dev: unsatisfied recommendation for eglibc-extra-nss-dev
libc6-dev: unsatisfied recommendation for libsegfault-dev
libc6-dev: unsatisfied recommendation for eglibc-thread-db-dev
libc6-dev: unsatisfied recommendation for libcidn-dev
Installing libgcc1 (4.8.2-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libgcc1_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing libc6 (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libc6_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libgcc-s-dev (4.8.2-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libgcc-s-dev_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing libc6-dev (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libc6-dev_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libthread-db1 (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libthread-db1_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-extra-nss (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-extra-nss_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libcidn1 (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libcidn1_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing linux-libc-headers-dev (3.14-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/linux-libc-headers-dev_3.14-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv-cp1252 (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv-cp1252_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-utils (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-utils_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv-ibm850 (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv-ibm850_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libstdc++-dev (4.8.2-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libstdc++-dev_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing libstdc++6 (4.8.2-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libstdc++6_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-i18n (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-i18n_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-neutral (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-neutral_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-circle (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-circle_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-cjk-compat (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-cjk-compat_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-small (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-small_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-compat (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-compat_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-narrow (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-narrow_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-wide (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-wide_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-font (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-font_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-fraction (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-fraction_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-iso14651-t1 (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-iso14651-t1_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-iso14651-t1-common (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-iso14651-t1-common_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libsegfault (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/libsegfault_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv-iso8859-1 (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv-iso8859-1_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv-iso8859-15 (2.19-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv-iso8859-15_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing qemuwrapper-cross (1.0-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/cortexa8hf-vfp-neon/qemuwrapper-cross_1.0-r0_cortexa8hf-vfp-neon.ipk.
Installing packagegroup-qt5-toolchain-target (1.0-r0) to root...
Downloading 
file:/media/secondary/oe-core/build-cubie/tmp-eglibc/deploy/ipk/all/packagegroup-qt5-toolchain-target_1.0-r0_all.ipk.
udev-dev: unsatisfied recommendation for libusb-dev
pciutils-dev: unsatisfied recommendation for pciutils-ids-dev
kmod-dev: unsatisfied recommendation for libkmod-dev
kmod-dev: unsatisfied recommendation for update-alternatives-opkg-dev
pciutils-dev: unsatisfied recommendation for libkmod-dev
udev-dev: unsatisfied recommendation for module-init-tools-dev
usbutils-dev: unsatisfied recommendation for usbutils-ids-dev
usbutils-dev: unsatisfied recommendation for libusb-dev
udev-dev: unsatisfied recommendation for libgudev-dev
package libtinfo5 suggests installing ncurses-terminfo
util-linux-dev: unsatisfied recommendation for util-linux-swaponoff-dev
util-linux-dev: unsatisfied recommendation for util-linux-umount-dev
util-linux-dev: unsatisfied recommendation for ncurses-libncursesw-dev
util-linux-dev: unsatisfied recommendation for update-alternatives-opkg-dev
ncurses-dev: unsatisfied recommendation for ncurses-libmenu-dev
ncurses-dev: unsatisfied recommendation for ncurses-libpanel-dev
ncurses-dev: unsatisfied recommendation for ncurses-libtinfo-dev
ncurses-dev: unsatisfied recommendation for ncurses-libform-dev
ncurses-dev: unsatisfied recommendation for ncurses-libncursesw-dev
ncurses-dev: unsatisfied recommendation for ncurses-libtic-dev
ncurses-dev: unsatisfied recommendation for ncurses-libncurses-dev
ncurses-dev: unsatisfied recommendation for ncurses-libmenuw-dev
ncurses-dev: unsatisfied recommendation for ncurses-terminfo-base-dev
ncurses-dev: unsatisfied recommendation for update-alternatives-opkg-dev
ncurses-dev: unsatisfied recommendation for ncurses-libpanelw-dev
ncurses-dev: unsatisfied recommendation for ncurses-libformw-dev
ncurses-dev: unsatisfied recommendation for ncurses-libticw-dev
util-linux-dev: unsatisfied recommendation for util-linux-losetup-dev
util-linux-dev: unsatisfied recommendation for ncurses-libtinfo-dev
udev-dev: unsatisfied recommendation for libkmod-dev
initscripts-dev: unsatisfied recommendation for update-alternatives-opkg-dev
initscripts-dev: unsatisfied recommendation for initscripts-functions-dev
udev-dev: unsatisfied recommendation for libudev-dev
qtbase-dev: unsatisfied recommendation for libssl-dev
openssl-dev: unsatisfied recommendation for libcrypto-dev
openssl-dev: unsatisfied recommendation for libssl-dev
qtbase-dev: unsatisfied recommendation for libcrypto-dev
libts-1.0-dev: unsatisfied recommendation for tslib-conf-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-card-restore-dev
pulseaudio-dev: unsatisfied recommendation for libpulse-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-intended-roles-dev
pulseaudio-dev: unsatisfied recommendation for libpulsecore-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-alsa-util-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-cli-protocol-unix-dev
pulseaudio-dev: unsatisfied recommendation for libavahi-client-dev
alsa-lib-dev: unsatisfied recommendation for libasound-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-lib-protocol-simple-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-detect-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-alsa-sink-dev
python-pygobject-dev: unsatisfied recommendation for libpython2-dev
python-pygobject-dev: unsatisfied recommendation for python-textutils-dev
python-pygobject-dev: unsatisfied recommendation for 
python-pygobject-lib-dev
python-dev: unsatisfied recommendation for python-audio-dev
python-dev: unsatisfied recommendation for python-mime-dev
python-dev: unsatisfied recommendation for python-io-dev
python-dev: unsatisfied recommendation for ncurses-libtinfo-dev
python-dev: unsatisfied recommendation for python-resource-dev
python-dev: unsatisfied recommendation for python-zlib-dev
python-dev: unsatisfied recommendation for python-lang-dev
python-dev: unsatisfied recommendation for python-multiprocessing-dev
python-dev: unsatisfied recommendation for python-pkgutil-dev
python-dev: unsatisfied recommendation for python-subprocess-dev
python-dev: unsatisfied recommendation for python-json-dev
python-dev: unsatisfied recommendation for python-doctest-dev
python-dev: unsatisfied recommendation for python-gdbm-dev
bzip2-dev: unsatisfied recommendation for update-alternatives-opkg-dev
python-dev: unsatisfied recommendation for python-sqlite3-dev
python-dev: unsatisfied recommendation for python-logging-dev
python-dev: unsatisfied recommendation for python-pickle-dev
python-dev: unsatisfied recommendation for python-threading-dev
python-dev: unsatisfied recommendation for python-codecs-dev
libgdbm-dev: unsatisfied recommendation for gdbm-compat-dev
python-dev: unsatisfied recommendation for python-pydoc-dev
python-dev: unsatisfied recommendation for python-pprint-dev
python-dev: unsatisfied recommendation for python-curses-dev
libreadline-dev: unsatisfied recommendation for ncurses-libtinfo-dev
python-dev: unsatisfied recommendation for python-fcntl-dev
python-dev: unsatisfied recommendation for python-compile-dev
python-dev: unsatisfied recommendation for python-debugger-dev
python-dev: unsatisfied recommendation for python-xmlrpc-dev
python-dev: unsatisfied recommendation for sqlite3-dev
python-dev: unsatisfied recommendation for python-distutils-dev
python-dev: unsatisfied recommendation for ncurses-libncursesw-dev
python-dev: unsatisfied recommendation for python-difflib-dev
python-dev: unsatisfied recommendation for python-crypt-dev
python-dev: unsatisfied recommendation for python-numbers-dev
python-dev: unsatisfied recommendation for python-idle-dev
python-dev: unsatisfied recommendation for python-db-dev
python-dev: unsatisfied recommendation for python-compiler-dev
python-dev: unsatisfied recommendation for python-unixadmin-dev
python-dev: unsatisfied recommendation for libssl-dev
python-dev: unsatisfied recommendation for ncurses-libpanelw-dev
python-dev: unsatisfied recommendation for python-tests-dev
python-dev: unsatisfied recommendation for libcrypto-dev
python-dev: unsatisfied recommendation for python-datetime-dev
python-dev: unsatisfied recommendation for python-unittest-dev
python-dev: unsatisfied recommendation for python-profile-dev
python-dev: unsatisfied recommendation for python-netclient-dev
python-dev: unsatisfied recommendation for python-xml-dev
python-dev: unsatisfied recommendation for python-textutils-dev
python-dev: unsatisfied recommendation for python-image-dev
python-dev: unsatisfied recommendation for python-smtpd-dev
python-dev: unsatisfied recommendation for python-hotshot-dev
python-dev: unsatisfied recommendation for python-html-dev
python-dev: unsatisfied recommendation for python-tkinter-dev
python-dev: unsatisfied recommendation for python-mmap-dev
python-dev: unsatisfied recommendation for python-bsddb-dev
python-dev: unsatisfied recommendation for python-compression-dev
python-dev: unsatisfied recommendation for python-readline-dev
python-dev: unsatisfied recommendation for python-elementtree-dev
python-dev: unsatisfied recommendation for python-email-dev
python-dev: unsatisfied recommendation for python-shell-dev
python-dev: unsatisfied recommendation for python-ctypes-dev
python-dev: unsatisfied recommendation for libpython2-dev
python-dev: unsatisfied recommendation for python-sqlite3-tests-dev
python-dev: unsatisfied recommendation for python-mailbox-dev
python-dev: unsatisfied recommendation for python-2to3-dev
python-dev: unsatisfied recommendation for python-math-dev
python-dev: unsatisfied recommendation for python-robotparser-dev
python-dev: unsatisfied recommendation for python-syslog-dev
python-dev: unsatisfied recommendation for python-stringold-dev
python-dev: unsatisfied recommendation for python-re-dev
python-dev: unsatisfied recommendation for python-netserver-dev
python-dev: unsatisfied recommendation for python-terminal-dev
python-dev: unsatisfied recommendation for python-core-dev
python-pygobject-dev: unsatisfied recommendation for python-core-dev
libsndfile-dev: unsatisfied recommendation for libasound-dev
libsndfile-dev: unsatisfied recommendation for sqlite3-dev
bluez4-dev: unsatisfied recommendation for libusb-dev
bluez4-dev: unsatisfied recommendation for dbus-lib-dev
libdbus-glib-1-dev: unsatisfied recommendation for dbus-lib-dev
shadow-dev: unsatisfied recommendation for update-alternatives-opkg-dev
dbus-dev: unsatisfied recommendation for shadow-sysroot-dev
dbus-dev: unsatisfied recommendation for dbus-lib-dev
dbus-dev: unsatisfied recommendation for initscripts-functions-dev
libdbus-glib-1-dev: unsatisfied recommendation for dbus-x11-dev
bluez4-dev: unsatisfied recommendation for libasound-dev
gawk-dev: unsatisfied recommendation for update-alternatives-opkg-dev
gawk-dev: unsatisfied recommendation for gawk-common-dev
python-dbus-dev: unsatisfied recommendation for python-io-dev
python-dbus-dev: unsatisfied recommendation for dbus-lib-dev
python-dbus-dev: unsatisfied recommendation for python-logging-dev
python-dbus-dev: unsatisfied recommendation for python-xml-dev
python-dbus-dev: unsatisfied recommendation for python-stringold-dev
python-dbus-dev: unsatisfied recommendation for python-threading-dev
bluez4-dev: unsatisfied recommendation for libudev-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-filter-heuristics-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-cli-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-avahi-wrap-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-stream-restore-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-null-sink-dev
pulseaudio-dev: unsatisfied recommendation for libudev-dev
gettext-dev: unsatisfied recommendation for libgettextlib-dev
gettext-dev: unsatisfied recommendation for libgettextsrc-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-rtp-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-lib-bluez4-util-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-default-device-restore-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-always-sink-dev
pulseaudio-dev: unsatisfied recommendation for libavahi-common-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-lib-protocol-esound-dev
pulseaudio-dev: unsatisfied recommendation for libpulsecommon-dev
gconf-dev: unsatisfied recommendation for dbus-lib-dev
gconf-dev: unsatisfied recommendation for gobject-introspection-stub-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-rescue-streams-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-role-cork-dev
pulseaudio-dev: unsatisfied recommendation for libasound-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-device-restore-dev
pulseaudio-dev: unsatisfied recommendation for libpulse-simple-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-lib-protocol-cli-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-alsa-card-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-lib-protocol-native-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-alsa-source-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-augment-properties-dev
pulseaudio-dev: unsatisfied recommendation for shadow-sysroot-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-lib-protocol-http-dev
pulseaudio-dev: unsatisfied recommendation for dbus-lib-dev
pulseaudio-dev: unsatisfied recommendation for consolekit-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-udev-detect-dev
pulseaudio-dev: unsatisfied recommendation for libpulse-mainloop-glib-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-switch-on-port-available-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-native-protocol-unix-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-oss-util-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-filter-apply-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-position-event-sounds-dev
pulseaudio-dev: unsatisfied recommendation for 
pulseaudio-module-suspend-on-idle-dev
flac-dev: unsatisfied recommendation for libflac-dev
flac-dev: unsatisfied recommendation for libflac++-dev
qtsystems-dev: unsatisfied recommendation for libx11-dev
qtsystems-dev: unsatisfied recommendation for libudev-dev
libqt5serialport-dev: unsatisfied recommendation for libudev-dev
icu-dev: unsatisfied recommendation for libicuuc-dev
icu-dev: unsatisfied recommendation for libicudata-dev
icu-dev: unsatisfied recommendation for libiculx-dev
icu-dev: unsatisfied recommendation for libicule-dev
icu-dev: unsatisfied recommendation for libicuio-dev
icu-dev: unsatisfied recommendation for libicui18n-dev
icu-dev: unsatisfied recommendation for libicutu-dev
qtmultimedia-dev: unsatisfied recommendation for libgstvideo-0.10-dev
qtmultimedia-dev: unsatisfied recommendation for libpulse-dev
qtmultimedia-dev: unsatisfied recommendation for libgstinterfaces-0.10-dev
qtmultimedia-dev: unsatisfied recommendation for libgstapp-0.10-dev
qtwebkit-dev: unsatisfied recommendation for sqlite3-dev
orc-dev: unsatisfied recommendation for liborc-test-0.4-dev
orc-dev: unsatisfied recommendation for liborc-0.4-dev
packagegroup-qt5-toolchain-target: unsatisfied recommendation for 
qtquickcontrols-qmlplugins
Configuring qemuwrapper-cross-dbg.
Configuring libc6-dbg.
Configuring libgcc-s-dbg.
Configuring packagegroup-core-standalone-sdk-target-dbg.
Configuring libc6.
Configuring eglibc-localedata-translit-fraction.
Configuring eglibc-extra-nss.
Configuring eglibc-localedata-iso14651-t1-common.
Configuring eglibc-localedata-iso14651-t1.
Configuring libgcc1.
Configuring libstdc++6.
Configuring libthread-db1.
Configuring libcidn1.
Configuring linux-libc-headers-dev.
Configuring libc6-dev.
Configuring libgcc-s-dev.
Configuring libstdc++-dev.
Configuring eglibc-gconv.
Configuring eglibc-gconv-iso8859-1.
Configuring eglibc-utils.
Configuring eglibc-localedata-translit-small.
Configuring qemuwrapper-cross.
Configuring eglibc-localedata-translit-circle.
Configuring eglibc-localedata-translit-cjk-compat.
Configuring eglibc-localedata-translit-compat.
Configuring eglibc-localedata-translit-narrow.
Configuring eglibc-localedata-translit-wide.
Configuring eglibc-localedata-translit-font.
Configuring eglibc-localedata-translit-neutral.
Configuring eglibc-gconv-cp1252.
Configuring eglibc-gconv-ibm850.
Configuring eglibc-localedata-i18n.
Configuring libsegfault.
Configuring eglibc-gconv-iso8859-15.
Configuring packagegroup-core-standalone-sdk-target.
Collected errors:
  * satisfy_dependencies_for: Cannot satisfy the following dependencies 
for packagegroup-qt5-toolchain-target:
  *     qtwebkit-mkspecs *     libx11-6 (>= 1.6.2) *     qtwebkit (= 
5.2.1-r0) * libxkbcommon (>= 0.4.0) *     qtwebkit-qmlplugins *     
qttools-plugins *
  * opkg_install_cmd: Cannot install package 
packagegroup-qt5-toolchain-target.

ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in: 
/media/secondary/oe-core/build-cubie/tmp-eglibc/work/cortexa8hf-vfp-neon-oe-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sdk.24564
ERROR: Task 7 
(/media/secondary/oe-core/meta-qt5/recipes-qt/meta/meta-toolchain-qt5.bb, do_populate_sdk) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2957 tasks of which 2949 didn't need to 
be rerun and 1 failed.
No currently running tasks (2957 of 2958)

Summary: 1 task failed:
/media/secondary/oe-core/meta-qt5/recipes-qt/meta/meta-toolchain-qt5.bb, 
do_populate_sdk
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


Any help is appreciated
Thanks


