Return-Path: <richardcochran@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBDE60144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 06:04:58 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so4127511wgg.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 23:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=3qZCsc2KMaCPL9KpXOXHy3gv0Wx4CPnEXzUZizw4S88=;
	b=oRQwFYrAGdeA5vErE0qXEe2SQKsX/TZN2TptZwP1aHxXrfAsXjpEKSGFslK+HzHqTp
	8b9lXYf1LN2j4h/3ayZDcKJtV/Efz+orwy79uo93iYGMWJx/hQnbFk70/jBN71mW33qD
	RZxEv9iCvEVkM68p+PPgWu42P1Tox6rdArAUKk99rWD/Qcmar4ybuaA/Qn6x+pQteTzY
	kbnw8qmff957v8VtttNIYP7AbAr57n8af0ztJTaW/KzHiwjPpwTOEo9gUo63GUjE2WB9
	RL2FhQea/RYb4//ZVEnBkuGQqAka2KpPCDbDLOuGUqgtvWd1gLd3pbB3q9s1l4aizhze
	Z44w==
X-Received: by 10.194.47.134 with SMTP id d6mr5190322wjn.76.1411625098680;
	Wed, 24 Sep 2014 23:04:58 -0700 (PDT)
Received: from netboy (193-81-107-163.adsl.highway.telekom.at.
	[193.81.107.163])
	by mx.google.com with ESMTPSA id td9sm1942234wic.15.2014.09.24.23.04.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Sep 2014 23:04:57 -0700 (PDT)
Date: Thu, 25 Sep 2014 08:04:53 +0200
From: Richard Cochran <richardcochran@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140925060453.GB7314@netboy>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-qt5][daisy] meta-toolchain-qt5 build failure
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
X-List-Received-Date: Thu, 25 Sep 2014 06:05:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear list,

With current daisy, the target

  bitbake meta-toolchain-qt5

fails mysteriously. Anyone know how to fix this?

Log file appended.

Thanks,
Richard

---
DEBUG: Executing python function do_populate_sdk
NOTE: Installing TARGET packages
NOTE: Executing '/home/rcochran/git/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index -r /home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/Packages -p /home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/Packages -m /home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon' ...
NOTE: Executing '/home/rcochran/git/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index -r /home/rcochran/git/poky/build/tmp/deploy/ipk/beaglebone/Packages -p /home/rcochran/git/poky/build/tmp/deploy/ipk/beaglebone/Packages -m /home/rcochran/git/poky/build/tmp/deploy/ipk/beaglebone' ...
NOTE: Executing '/home/rcochran/git/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index -r /home/rcochran/git/poky/build/tmp/deploy/ipk/all/Packages -p /home/rcochran/git/poky/build/tmp/deploy/ipk/all/Packages -m /home/rcochran/git/poky/build/tmp/deploy/ipk/all' ...
NOTE: Executing '/home/rcochran/git/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index -r /home/rcochran/git/poky/build/tmp/deploy/ipk/x86_64-nativesdk/Packages -p /home/rcochran/git/poky/build/tmp/deploy/ipk/x86_64-nativesdk/Packages -m /home/rcochran/git/poky/build/tmp/deploy/ipk/x86_64-nativesdk' ...
NOTE: Installing the following packages: packagegroup-core-standalone-sdk-target-dbg packagegroup-core-standalone-sdk-target packagegroup-qt5-toolchain-target
NOTE: /home/rcochran/git/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f /home/rcochran/git/poky/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/opkg.conf -o /home/rcochran/git/poky/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/sdk/image/opt/poky/1.6.1/sysroots/cortexa8hf-vfp-neon-poky-linux-gnueabi --force_postinstall --prefer-arch-to-version   install packagegroup-core-standalone-sdk-target-dbg packagegroup-core-standalone-sdk-target packagegroup-qt5-toolchain-target
ERROR: Unable to install packages. Command '/home/rcochran/git/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f /home/rcochran/git/poky/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/opkg.conf -o /home/rcochran/git/poky/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/sdk/image/opt/poky/1.6.1/sysroots/cortexa8hf-vfp-neon-poky-linux-gnueabi --force_postinstall --prefer-arch-to-version   install packagegroup-core-standalone-sdk-target-dbg packagegroup-core-standalone-sdk-target packagegroup-qt5-toolchain-target' returned 255:
Installing packagegroup-core-standalone-sdk-target-dbg (1.0-r8) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/all/packagegroup-core-standalone-sdk-target-dbg_1.0-r8_all.ipk.
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for libsegfault-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for libstdc++-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-utils-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-thread-db-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-gconv-ibm850-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-gconv-iso8859-15-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-gconv-cp1252-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-localedata-i18n-dbg
packagegroup-core-standalone-sdk-target-dbg: unsatisfied recommendation for eglibc-gconv-iso8859-1-dbg
Installing qemuwrapper-cross-dbg (1.0-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/qemuwrapper-cross-dbg_1.0-r0_cortexa8hf-vfp-neon.ipk.
Installing libgcc-s-dbg (4.8.2-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libgcc-s-dbg_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing libc6-dbg (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libc6-dbg_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing packagegroup-core-standalone-sdk-target (1.0-r8) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/all/packagegroup-core-standalone-sdk-target_1.0-r8_all.ipk.
libc6-dev: unsatisfied recommendation for eglibc-extra-nss-dev
libc6-dev: unsatisfied recommendation for libsegfault-dev
libc6-dev: unsatisfied recommendation for eglibc-thread-db-dev
libc6-dev: unsatisfied recommendation for libcidn-dev
Installing libgcc1 (4.8.2-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libgcc1_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing libc6 (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libc6_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libgcc-s-dev (4.8.2-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libgcc-s-dev_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing libc6-dev (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libc6-dev_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libthread-db1 (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libthread-db1_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-extra-nss (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-extra-nss_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libcidn1 (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libcidn1_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing linux-libc-headers-dev (3.14-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/linux-libc-headers-dev_3.14-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv-cp1252 (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv-cp1252_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-utils (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-utils_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv-ibm850 (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv-ibm850_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libstdc++-dev (4.8.2-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libstdc++-dev_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing libstdc++6 (4.8.2-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libstdc++6_4.8.2-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-i18n (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-i18n_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-neutral (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-neutral_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-circle (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-circle_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-cjk-compat (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-cjk-compat_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-small (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-small_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-compat (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-compat_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-narrow (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-narrow_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-wide (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-wide_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-font (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-font_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-translit-fraction (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-translit-fraction_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-iso14651-t1 (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-iso14651-t1_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-localedata-iso14651-t1-common (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-localedata-iso14651-t1-common_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing libsegfault (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/libsegfault_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv-iso8859-1 (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv-iso8859-1_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing eglibc-gconv-iso8859-15 (2.19-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/eglibc-gconv-iso8859-15_2.19-r0_cortexa8hf-vfp-neon.ipk.
Installing qemuwrapper-cross (1.0-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/cortexa8hf-vfp-neon/qemuwrapper-cross_1.0-r0_cortexa8hf-vfp-neon.ipk.
Installing packagegroup-qt5-toolchain-target (1.0-r0) to root...
Downloading file:/home/rcochran/git/poky/build/tmp/deploy/ipk/all/packagegroup-qt5-toolchain-target_1.0-r0_all.ipk.
libxcb-dev: unsatisfied recommendation for libxcb-shape-dev
libxcb-dev: unsatisfied recommendation for libxcb-dpms-dev
libxcb-dev: unsatisfied recommendation for libxcb-render-dev
libxcb-dev: unsatisfied recommendation for libxcb-shm-dev
libxcb-dev: unsatisfied recommendation for libxcb-dri3-dev
libxcb-dev: unsatisfied recommendation for libxcb-damage-dev
libxcb-dev: unsatisfied recommendation for libxcb-glx-dev
libxcb-dev: unsatisfied recommendation for libxcb-composite-dev
libxcb-dev: unsatisfied recommendation for libxcb-res-dev
libxcb-dev: unsatisfied recommendation for libxcb-xvmc-dev
libxcb-dev: unsatisfied recommendation for libxcb-xkb-dev
libxcb-dev: unsatisfied recommendation for libxcb-sync-dev
libxcb-dev: unsatisfied recommendation for libxcb-xevie-dev
libxcb-dev: unsatisfied recommendation for libxcb-dri2-dev
libxcb-dev: unsatisfied recommendation for libxcb-randr-dev
libxcb-dev: unsatisfied recommendation for libxcb-xprint-dev
libxcb-dev: unsatisfied recommendation for libxcb-xv-dev
libxcb-dev: unsatisfied recommendation for libxcb-record-dev
libxcb-dev: unsatisfied recommendation for libxcb-xtest-dev
libxcb-dev: unsatisfied recommendation for libxcb-screensaver-dev
libxcb-dev: unsatisfied recommendation for libxcb-present-dev
libxcb-dev: unsatisfied recommendation for libxcb-xf86dri-dev
libxcb-dev: unsatisfied recommendation for libxcb-xinerama-dev
libxcb-dev: unsatisfied recommendation for libxcb-xfixes-dev
libx11-dev: unsatisfied recommendation for libx11-xcb-dev
openssl-dev: unsatisfied recommendation for libcrypto-dev
openssl-dev: unsatisfied recommendation for libssl-dev
shadow-dev: unsatisfied recommendation for update-alternatives-opkg-dev
dbus-dev: unsatisfied recommendation for shadow-sysroot-dev
dbus-dev: unsatisfied recommendation for dbus-lib-dev
dbus-dev: unsatisfied recommendation for initscripts-functions-dev
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
e2fsprogs-dev: unsatisfied recommendation for e2fsprogs-badblocks-dev
e2fsprogs-dev: unsatisfied recommendation for libss-dev
e2fsprogs-dev: unsatisfied recommendation for libext2fs-dev
e2fsprogs-dev: unsatisfied recommendation for libcomerr-dev
e2fsprogs-dev: unsatisfied recommendation for libe2p-dev
initscripts-dev: unsatisfied recommendation for update-alternatives-opkg-dev
initscripts-dev: unsatisfied recommendation for initscripts-functions-dev
udev-dev: unsatisfied recommendation for libusb-dev
udev-dev: unsatisfied recommendation for module-init-tools-dev
python-pygobject-dev: unsatisfied recommendation for libpython2-dev
python-pygobject-dev: unsatisfied recommendation for python-textutils-dev
python-pygobject-dev: unsatisfied recommendation for python-pygobject-lib-dev
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
python-dev: unsatisfied recommendation for python-2to3-dev
python-dev: unsatisfied recommendation for python-gdbm-dev
bzip2-dev: unsatisfied recommendation for update-alternatives-opkg-dev
python-dev: unsatisfied recommendation for python-misc-dev
python-dev: unsatisfied recommendation for python-logging-dev
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
python-dev: unsatisfied recommendation for python-pickle-dev
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
python-dev: unsatisfied recommendation for python-sqlite3-dev
python-dev: unsatisfied recommendation for python-math-dev
python-dev: unsatisfied recommendation for python-robotparser-dev
python-dev: unsatisfied recommendation for python-syslog-dev
python-dev: unsatisfied recommendation for python-stringold-dev
python-dev: unsatisfied recommendation for python-re-dev
python-dev: unsatisfied recommendation for python-netserver-dev
python-dev: unsatisfied recommendation for python-modules-dev
python-dev: unsatisfied recommendation for python-terminal-dev
python-dev: unsatisfied recommendation for python-core-dev
python-pygobject-dev: unsatisfied recommendation for python-core-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-localedata-translit-cjk-variants-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-gconv-utf-32-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-gconv-utf-7-dev
libglib-2.0-dev: unsatisfied recommendation for tzdata-posix-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-gconv-iso8859-1-dev
libglib-2.0-dev: unsatisfied recommendation for tzdata-americas-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-gconv-utf-16-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-gconv-euc-jp-dev
libglib-2.0-dev: unsatisfied recommendation for tzdata-asia-dev
libdbus-glib-1-dev: unsatisfied recommendation for dbus-lib-dev
libdbus-glib-1-dev: unsatisfied recommendation for dbus-x11-dev
python-dbus-dev: unsatisfied recommendation for python-io-dev
python-dbus-dev: unsatisfied recommendation for dbus-lib-dev
python-dbus-dev: unsatisfied recommendation for python-logging-dev
python-dbus-dev: unsatisfied recommendation for python-xml-dev
python-dbus-dev: unsatisfied recommendation for python-stringold-dev
python-dbus-dev: unsatisfied recommendation for python-threading-dev
libglib-2.0-dev: unsatisfied recommendation for tzdata-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-gconv-cp1255-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-charmap-invariant-dev
libglib-2.0-dev: unsatisfied recommendation for tzdata-europe-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-gconv-iso8859-15-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-charmap-cp1255-dev
libglib-2.0-dev: unsatisfied recommendation for dbus-lib-dev
libglib-2.0-dev: unsatisfied recommendation for eglibc-charmap-utf-8-dev
libxml2-dev: unsatisfied recommendation for eglibc-gconv-ebcdic-us-dev
libxml2-dev: unsatisfied recommendation for eglibc-gconv-ibm1141-dev
pciutils-dev: unsatisfied recommendation for pciutils-ids-dev
kmod-dev: unsatisfied recommendation for libkmod-dev
kmod-dev: unsatisfied recommendation for update-alternatives-opkg-dev
pciutils-dev: unsatisfied recommendation for libkmod-dev
usbutils-dev: unsatisfied recommendation for usbutils-ids-dev
usbutils-dev: unsatisfied recommendation for libusb-dev
udev-dev: unsatisfied recommendation for libgudev-dev
udev-dev: unsatisfied recommendation for libkmod-dev
udev-dev: unsatisfied recommendation for libudev-dev
qtbase-dev: unsatisfied recommendation for libssl-dev
qtbase-dev: unsatisfied recommendation for libcrypto-dev
libxrender-dev: unsatisfied recommendation for xdmcp-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-card-restore-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-intended-roles-dev
alsa-lib-dev: unsatisfied recommendation for libasound-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-alsa-util-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-cli-protocol-unix-dev
pulseaudio-dev: unsatisfied recommendation for libpulsecore-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-protocol-simple-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-detect-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-alsa-sink-dev
pulseaudio-dev: unsatisfied recommendation for libpulse-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-filter-apply-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-filter-heuristics-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-cli-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-stream-restore-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-null-sink-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-protocol-cli-dev
pulseaudio-dev: unsatisfied recommendation for libudev-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-rtp-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-default-device-restore-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-always-sink-dev
pulseaudio-dev: unsatisfied recommendation for libpulsecommon-dev
gconf-dev: unsatisfied recommendation for dbus-lib-dev
gconf-dev: unsatisfied recommendation for gobject-introspection-stub-dev
gconf-dev: unsatisfied recommendation for dbus-x11-dev
pulseaudio-dev: unsatisfied recommendation for libx11-xcb-dev
pulseaudio-dev: unsatisfied recommendation for libasound-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-device-restore-dev
pulseaudio-dev: unsatisfied recommendation for libpulse-simple-dev
libsndfile-dev: unsatisfied recommendation for sqlite3-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-alsa-card-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-protocol-native-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-alsa-source-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-protocol-esound-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-augment-properties-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-switch-on-port-available-dev
pulseaudio-dev: unsatisfied recommendation for shadow-sysroot-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-protocol-http-dev
pulseaudio-dev: unsatisfied recommendation for dbus-lib-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-console-kit-dev
consolekit-dev: unsatisfied recommendation for dbus-lib-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-udev-detect-dev
pulseaudio-dev: unsatisfied recommendation for libpulse-mainloop-glib-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-native-protocol-unix-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-role-cork-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-oss-util-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-rescue-streams-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-position-event-sounds-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-suspend-on-idle-dev
flac-dev: unsatisfied recommendation for libflac-dev
flac-dev: unsatisfied recommendation for libflac++-dev
libxkbcommon-dev: unsatisfied recommendation for libxcb-xkb-dev
libxcb-render-util-dev: unsatisfied recommendation for libxcb-render-dev
libxcb-image-dev: unsatisfied recommendation for libxcb-shm-dev
libdrm-dev: unsatisfied recommendation for libdrm-kms-dev
libdrm-dev: unsatisfied recommendation for libdrm-nouveau-dev
libdrm-dev: unsatisfied recommendation for libdrm-omap-dev
libdrm-dev: unsatisfied recommendation for libdrm-radeon-dev
libgl-mesa-dev: unsatisfied recommendation for libxcb-dri2-dev
libgl-mesa-dev: unsatisfied recommendation for libxcb-glx-dev
libgl-mesa-dev: unsatisfied recommendation for libx11-xcb-dev
libcairo-dev: unsatisfied recommendation for libxcb-render-dev
libcairo-dev: unsatisfied recommendation for libxcb-shm-dev
libcairo-dev: unsatisfied recommendation for cairo-perf-utils-dev
libcairo-dev: unsatisfied recommendation for cairo-script-interpreter-dev
libcairo-dev: unsatisfied recommendation for cairo-gobject-dev
gtk+-dev: unsatisfied recommendation for libxcb-render-dev
gtk+-dev: unsatisfied recommendation for update-alternatives-opkg-dev
gtk+-dev: unsatisfied recommendation for libxcb-shm-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-qtif-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-png-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-ras-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-tga-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-ani-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-jpeg-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-ico-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-bmp-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-pnm-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-pcx-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-wbmp-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-gif-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-xbm-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-icns-dev
gdk-pixbuf-dev: unsatisfied recommendation for gdk-pixbuf-loader-xpm-dev
pango-dev: unsatisfied recommendation for libxcb-render-dev
pango-dev: unsatisfied recommendation for libxcb-shm-dev
bluez4-dev: unsatisfied recommendation for libusb-dev
bluez4-dev: unsatisfied recommendation for dbus-lib-dev
gawk-dev: unsatisfied recommendation for update-alternatives-opkg-dev
gawk-dev: unsatisfied recommendation for gawk-common-dev
bluez4-dev: unsatisfied recommendation for libudev-dev
qtsystems-dev: unsatisfied recommendation for libudev-dev
libqt5serialport-dev: unsatisfied recommendation for libudev-dev
icu-dev: unsatisfied recommendation for libicuuc-dev
icu-dev: unsatisfied recommendation for libicudata-dev
icu-dev: unsatisfied recommendation for libiculx-dev
icu-dev: unsatisfied recommendation for libicule-dev
icu-dev: unsatisfied recommendation for libicuio-dev
icu-dev: unsatisfied recommendation for libicui18n-dev
icu-dev: unsatisfied recommendation for libicutu-dev
qtmultimedia-dev: unsatisfied recommendation for libpulse-dev
qtwebkit-dev: unsatisfied recommendation for sqlite3-dev
orc-dev: unsatisfied recommendation for liborc-test-0.4-dev
orc-dev: unsatisfied recommendation for liborc-0.4-dev
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
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-qt5-toolchain-target:
 * 	qtwebkit-mkspecs * 	qtwebkit (= 5.2.1-r0) * 	qtwebkit-qmlplugins * 	qttools-plugins * 
 * opkg_install_cmd: Cannot install package packagegroup-qt5-toolchain-target.

DEBUG: Python function do_populate_sdk finished
ERROR: Function failed: do_populate_sdk

