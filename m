Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <maurizio.rottin@gmail.com>) id 1KisVz-00006v-Hd
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 17:12:23 +0200
Received: by yw-out-1718.google.com with SMTP id 5so92172ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=l4K3hKcIbEeM3cDmXZThVpEEYQq3uCEXY2fFthsgbxg=;
	b=l2Y4/ki0d+o9psOLD4gj0j47efuwM/Nuyg9axdcTjvPGliG+0LbDKn9mDzhtfa7NIn
	s10fQBgscb2WiloWIlcUsSgHY+o4ujpIYMeb1cflk/jc/beVmtWzFhxCYTFXSZlndrx0
	nBUOlFZIYGawIfufhqHTvbfSnhBUT0ruqWS9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=njxnW3SXVAWMSE2YD5AKQWuKodBR3dUyuo5JulVHwJh1wZJ3rc7/cvR9dQwUXQgYkx
	qbk6z4zc38cddUHl8JV5eYsF67UeellauxbskdOaNcDEPp5++X+YPz9d0rV0tkJP837n
	uQ5OAPqAiJeTsfD9QWVgYWUTqrEXj+zvj0jRo=
Received: by 10.151.141.16 with SMTP id t16mr32098ybn.167.1222355321356;
	Thu, 25 Sep 2008 08:08:41 -0700 (PDT)
Received: by 10.151.27.11 with HTTP; Thu, 25 Sep 2008 08:08:41 -0700 (PDT)
Message-ID: <e83473390809250808h7ee77edeo8540ff1aff235c7e@mail.gmail.com>
Date: Thu, 25 Sep 2008 17:08:41 +0200
From: "Maurizio Rottin" <maurizio.rottin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: logrotate fails to install (while compiles)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Sep 2008 15:12:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi all,

i did build a little system several times and i always have the same
error with logrotate.

logrotate fails to compile with this error:

ERROR: log data follows
(/stuff/tmp/work/logrotate-3.7.1-r1/temp/log.do_install.12011)
| strip: Unable to recognise the format of the input file
`/stuff/tmp/work/logrotate-3.7.1-r1/image/sbin/logrotate'
| install: strip process terminated abnormally


i post  also my distro config:

DISTRO_NAME = "mau-oe-uclibc"
DISTRO_VERSION = ".dev-snapshot-${SRCDATE}"
DISTRO_TYPE = "debug"
DISTRO_FEATURES = "uboot"

INHERIT += "package_ipk"
IMAGE_FSTYPES ?= "tar.gz jffs2"
KERNEL = "kernel26"
MACHINE_KERNEL_VERSION = "2.6"
TARGET_OS = "linux-uclibc"
TARGET_FPU_arm = "soft"
PREFERRED_PROVIDER_virtual/libc = "uclibc"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
PREFERRED_VERSION_linux-libc-headers ?= "2.6.23"
PREFERRED_VERSION_libtool-native ?= "2.2.4"
PREFERRED_VERSION_libtool-cross ?= "2.2.4"
PREFERRED_VERSION_libtool-sdk ?= "2.2.4"
PREFERRED_VERSION_libtool ?= "2.2.4"
PREFERRED_VERSION_automake ?= "1.10"
PREFERRED_VERSION_automake-native ?= "1.10"
PREFERRED_VERSION_pkgconfig-native ?= "0.23"
PREFERRED_VERSION_pkgconfig-sdk ?= "0.23"
PREFERRED_VERSION_pkgconfig ?= "0.23"
PREFERRED_PROVIDER_virtual/libiconv = "libiconv"
PREFERRED_PROVIDER_virtual/libintl = "gettext"
PREFERRED_VERSION_gcc ?= "4.2.4"
PREFERRED_VERSION_gcc-cross ?= "4.2.4"
PREFERRED_VERSION_gcc-cross-initial ?= "4.2.4"
PREFERRED_VERSION_binutils ?= "2.18"
PREFERRED_VERSION_binutils-cross ?= "2.18"
PREFERRED_VERSION_binutils-sdk ?= "2.18"

PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"

USE_NLS ?= "no"
USE_NLS_glib-2.0 = "yes"

PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"

require conf/distro/include/sane-srcdates.inc
require conf/distro/include/sane-srcrevs.inc



thanks in advance,

-- 
mr


