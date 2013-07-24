Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 960846AE6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:48 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so217111eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xz4+TkaCDkekKXDbgntY+u+kphJprlnS1EG7zeeJygE=;
	b=Z0MYNtCTu9yxw9R5WTebVNGge+QYYXv7L8ZluBFJhzAWaxygH/3+Xz7Vk6iSvvjrNC
	bCd6WYRFn58zVLllVMC//iHLvoBCdU63XzgLXmW4FvGlR4QDYmczGC2bfOiyneQR8BGX
	ZT1yystHccmA1j2Wo+UmgUCWW8gLIBvwY/urZAVTF3xB5nCasn9hdbL0mN+n+/LK5txx
	GM3sT6qGvblH2Jc+9UcSdoGOt/Moz+ZgYpATRioXPUndnLyLnPXIsgiVaS1eUWejXaH/
	kV6E6IiUpOv0zCJKrYsVTnGkZnDwIcTIVJW4HDiSx0QceiUbxDpZfSNf7pjuXwDVYSJ6
	3uGw==
X-Received: by 10.15.31.9 with SMTP id x9mr37411173eeu.103.1374669648482;
	Wed, 24 Jul 2013 05:40:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm65858403eed.9.2013.07.24.05.40.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:40:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:09 +0200
Message-Id: <cover.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH 00/29] autodetected dependencies
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:49 -0000

The following changes since commit 02adda55bbb151b540ae00d57618ae6ac2b348f7:

  qt-creator: upgrade to 2.8.0 (2013-07-24 14:36:05 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/deps
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/deps

Martin Jansa (29):
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
  mkvtoolnix: inherit gettext and export RUBYLIB
  libftdi: add PACKAGECONFIG for cpp-wrapper
  libgphoto2: add PACKAGECONFIG for serial
  ntfs-3g-ntfsprogs: add packageconfig for uuid
  openldap: add dependency on util-linux
  samba: add packageconfig for fam
  smbnetfs: add packageconfig for gnome-keyring
  ruby: add dependency on db gdbm readline
  cifs-utils: inherit pkgconfig

 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb        | 8 +++++++-
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb              | 3 +++
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb | 5 +++++
 meta-networking/recipes-daemons/atftp/atftp_git.bb                | 5 +++++
 meta-networking/recipes-protocols/quagga/quagga.inc               | 3 +++
 meta-networking/recipes-support/cifs/cifs-utils_git.bb            | 5 ++++-
 meta-oe/recipes-connectivity/krb5/krb5_1.11.bb                    | 4 ++++
 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb         | 2 +-
 meta-oe/recipes-connectivity/samba/samba.inc                      | 1 +
 meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb             | 3 +++
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb               | 5 +++++
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb                 | 3 +++
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb                      | 2 +-
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb             | 1 +
 meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb                 | 3 +++
 meta-oe/recipes-multimedia/libass/libass.inc                      | 3 +++
 meta-oe/recipes-multimedia/libav/libav.inc                        | 4 ++++
 meta-oe/recipes-multimedia/x264/x264_git.bb                       | 1 +
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb              | 3 +++
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb                | 3 +++
 meta-oe/recipes-support/joe/joe_3.1.bb                            | 4 +++-
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb                   | 3 +++
 meta-oe/recipes-support/links/links.inc                           | 4 ++++
 meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb               | 3 +++
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb              | 3 +++
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb               | 2 ++
 meta-ruby/recipes-devtools/ruby/ruby.inc                          | 4 ++--
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb                | 2 --
 28 files changed, 83 insertions(+), 9 deletions(-)

-- 
1.8.3.2


