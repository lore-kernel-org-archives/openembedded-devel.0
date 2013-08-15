Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 903F46009A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:18:53 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so180099eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=czy0G50kK8F/Ksj4zlhON1iiuLqjE6ORfMpm1BkKVY8=;
	b=ziydXndziXReNUqRF8d5fU7rX5F9wjuZr6+hWDkSGoy8WFeRgNN3qv1+5frAhGSmnY
	aEh31QmiWVYbOCXOhBKAzGWqE1wwvLBN9X14i2hPomaugCW98fqAvAwBQTaKuFjnvGWv
	diawlRHhqI7wUqeVdGgLXBQX0AEVPs7ez6VL4NqeSLC4A/6RX6A0074kXtrvgNrnMfEk
	q5mskaIi0YSab3Mk/4+93LWh/aYSi6iOJPZdNGI5RUAAMJNPktgNQxj1UTD1oarxuXEc
	enzKdXxWXFkh/O0RHw/IpsvMOcAG0t247KqFYs9OlQE2Elya2+ftSQZ2w5NHoGRgsxyz
	RvxQ==
X-Received: by 10.15.91.3 with SMTP id r3mr20829000eez.4.1376551133823;
	Thu, 15 Aug 2013 00:18:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm7566833eev.6.2013.08.15.00.18.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:18:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:40 +0200
Message-Id: <cover.1376551134.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][dylan][PATCH 00/60] Backports for deterministic dependencies
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
X-List-Received-Date: Thu, 15 Aug 2013 07:18:54 -0000

The following changes since commit 13ae5105ee30410136beeae66ec41ee4a8a2e2b0:

  icon-slicer: fix native build by depending on gdk-pixbuf only (2013-05-28 09:58:04 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/dylan-backports
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/dylan-backports

Martin Jansa (57):
  vsftpd: add missing dependency on openssl
  fbida: define -I when checking jpeg version
  xorg-sgml-doctools: add missing dependency on util-macros
  gypsy: add dependency on libxslt-native
  media-ctl: inherit pkgconfig
  rsyslog: inherit pkgconfig
  libspatialite: add missing dependency on sqlite3
  ruby: add missing dependency on ruby-native
  cpufrequtils: inherit gettext
  cryptsetup: add missing dependency on libgcrypt
  gsoap: add missing dependency on zlib
  wbxml2: add missing dependency on expat
  iso-codes: add missing dependency on gettext-native
  portaudio: explicitly disable oss, add PACKAGECONFIG for alsa and jack
  mysql5: prevent using bundled zlib at all costs
  portaudio: inherit pkgconfig
  f2fs-tools: add util-linux dependency
  lcdproc5: add PACKAGECONFIG for libftdi, libusb
  openldap: convert to PACKAGECONFIGs, explicitly disable openssl
  samba: use more specific LICENSE
  samba: add dependency on zlib popt, PACKAGECONFIG for pam
  jack: add dependency on libsaplerate0 and readline
  glog: add dependency on libunwind
  lvm2: add PACKAGECONFIG for readline
  libunwind: add PACKAGECONFIG for lzma
  ntp: add PACKAGECONFIG for libcap and readline
  vim: add PACKAGECONFIG for acl
  mkvtoolnix: inherit gettext and export RUBYLIB
  rrdtool: add PACKAGECONFIG for dbi
  loudmouth: add dependency on libidn
  cifs-utils: add PACKAGECONFIG for libcap
  atftp: add PACKAGECONFIG for pcre, readline, tcp-wrapper
  fbida: add dependency on curl libungif tiff
  mbuffer: add PACKAGECONFIG for md5
  inetutils: add PACKAGECONFIG for ftp and uucpd
  jasper: add PACKAGECONFIG for jpeg
  joe: add PACKAGECONFIG for joe
  krb5: add PACKAGECONFIG for openssl and libedit
  libass: add PACKAGECONFIG for harfbuzz
  links: add PACKAGECONFIG for bzip2, lzma
  quagga: add PACKAGECONFIG for capabilities
  sox: add PACKAGECONFIG for magic and wavpack
  usbmuxd: add PACKAGECONFIG for plist
  usbmuxd: fix unpackaged files
  libav: add PACKAGECONFIG for bzip2 and jack
  libnice: add PACKAGECONFIG for gupnp
  farsight2: add PACKAGECONFIG for gupnp
  x264: explicitly disable swscale
  libftdi: add PACKAGECONFIG for cpp-wrapper
  ntfs-3g-ntfsprogs: add packageconfig for uuid
  openldap: add dependency on util-linux
  smbnetfs: add packageconfig for gnome-keyring
  libgphoto2: add configure option for gd and add PACKAGECONFIG
  libgphoto2: add PACKAGECONFIG for serial
  samba: add packageconfig for fam
  ruby: add dependency on db gdbm readline
  cifs-utils: inherit pkgconfig

Mihai Prica (1):
  python-feedparser: Changed from distutils to setuptools

Paul Barker (1):
  fluidsynth: added dependency on glib

Roy.Li (1):
  cyrus-sasl: Avoid to call AC_TRY_RUN

 .../recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb     |   8 +-
 .../fluidsynth/fluidsynth_1.1.1.bb                 |   2 +-
 .../recipes-multimedia/sox/sox_14.4.0.bb           |   3 +
 .../inetutils/inetutils_1.9.1.bb                   |   5 +
 meta-networking/recipes-daemons/atftp/atftp_git.bb |   5 +
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |   6 +-
 .../files/avoid-to-call-AC_TRY_RUN.patch           |  46 +++++++
 .../recipes-daemons/vsftpd/vsftpd_2.3.5.bb         |   2 +-
 .../recipes-protocols/quagga/quagga.inc            |   3 +
 .../recipes-support/cifs/cifs-utils_git.bb         |   5 +-
 meta-networking/recipes-support/ntp/ntp.inc        |   2 +
 meta-oe/recipes-connectivity/krb5/krb5_1.11.bb     |   4 +
 .../loudmouth/loudmouth_1.4.3.bb                   |   2 +-
 meta-oe/recipes-connectivity/samba/samba.inc       |  10 +-
 .../recipes-connectivity/smbnetfs/smbnetfs_git.bb  |   3 +
 .../recipes-connectivity/usbmuxd/usbmuxd_git.bb    |   5 +
 .../recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb    |   3 +
 .../python/python-feedparser_5.1.3.bb              |   2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |   8 +-
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb  |   3 +
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   2 +-
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb       |   4 +-
 .../libgphoto2-2.4.11/allow.to.disable.gd.patch    |  33 +++++
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |   7 +-
 meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb  |   3 +
 .../xorg-doc/xorg-sgml-doctools_1.7.bb             |   2 +
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb    |   3 +-
 meta-oe/recipes-multimedia/libass/libass.inc       |   3 +
 meta-oe/recipes-multimedia/libav/libav.inc         |   4 +
 .../recipes-multimedia/v4l2apps/media-ctl_git.bb   |   2 +-
 meta-oe/recipes-multimedia/x264/x264_git.bb        |   1 +
 meta-oe/recipes-navigation/gypsy/gypsy.inc         |   2 +-
 .../libspatialite/libspatialite.inc                |   2 +-
 .../cpufrequtils/cpufrequtils_008.bb               |   2 +
 .../recipes-support/cryptsetup/cryptsetup_1.6.1.bb |   2 +-
 .../recipes-support/farsight/farsight2_0.0.22.bb   |   3 +
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |   3 +
 meta-oe/recipes-support/glog/glog.inc              |   2 +
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb      |   2 +-
 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb |   4 +
 meta-oe/recipes-support/joe/joe_3.1.bb             |   4 +-
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb    |   3 +
 meta-oe/recipes-support/libunwind/libunwind.inc    |   3 +
 meta-oe/recipes-support/links/links.inc            |   4 +
 meta-oe/recipes-support/lvm2/lvm2.inc              |   3 +
 .../recipes-support/mbuffer/mbuffer_20091227.bb    |   3 +
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    |   2 +-
 .../ntfs-3g-ntfsprogs_2011.4.12.bb                 |   3 +
 .../recipes-support/openldap/openldap_2.4.23.bb    | 138 +++++++--------------
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb  |   2 +
 .../recipes-support/portaudio/portaudio-v19_svn.bb |  12 +-
 meta-oe/recipes-support/vim/vim.inc                |   1 +
 meta-ruby/recipes-devtools/ruby/ruby.inc           |   4 +-
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb |   2 -
 54 files changed, 273 insertions(+), 124 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/allow.to.disable.gd.patch

-- 
1.8.3.2


