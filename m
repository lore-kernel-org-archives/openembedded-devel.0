Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9076FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 00:31:04 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id xy5so4287490wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 16:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=W3epaX+1FRCuelU1EvB+azFL5LAWXZ5FFnFjrIOErgE=;
	b=nzdJP/nqd1b0e5jmSRzcQhROk2ITjEvzkmMgMgMO+exA8j8A0JZVV1mXNqbWew48ud
	ciLXdV30Cd+riIO9l8yh+JaivAfZcHwv25n5NiUk+jFyHtLsDeNL8zkSGSMMhCoRV/Jz
	066owZ7TMUEs05GAt08+b5MeLMqVjOewpLT5NxcM1RvhBGrdJXTWW8rUXiXy3Oi+SehJ
	zNS0VhQe8zhmjeLkRO2NP4IrrYjECmDWXBooNbaptG85mOjJ0c672BmOVWbG1Za7A8F3
	XssW5JZlBPlcGTrEmv/BdjSEJLGsyqtcgmBd2zWvefMi+kFN5J2s9TsRtny463/ufmCz
	uEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=W3epaX+1FRCuelU1EvB+azFL5LAWXZ5FFnFjrIOErgE=;
	b=H2RPXDXzytAolXcbQ9KH3OiysxMpA1H1TwGmTxJxwyKbkk8q7mT6NTHHjYjG1jJxlo
	lDdt02ohWC2xs4UlAkojyhcLPjP8fdB+tGL5Yqp5MhTUFt63zS7yxSdqiWoC7hfwM4tu
	g8tdiaH7JrkO9gUnLxi5x2rnbdUJNOUQroUrlcEkqQd1OhkreumNrVf+eBZcQjXsHyIo
	oJf5R3dAjLJy7wWBuW2d0KqRZOcg6hoeOSA9Yob96nxajVUju/Z0NHvBmgkWh9ZIZJ2j
	HoVkbNDT2gsNVL1X5wHvL98Uaiqh9vZXyQIyUXIySBtHXuyH+WXJgRlYWyp7z71r3pY+
	PawA==
X-Gm-Message-State: AKaTC000C4LQmQfRZNco3ecTxqdbTQmw+S+Ij6OmWzMEmzgleEP9x+SRVo5wyI3rHplw8kqAyGDK57+QTHCYaA==
X-Received: by 10.194.77.83 with SMTP id q19mr4550587wjw.186.1480033865517;
	Thu, 24 Nov 2016 16:31:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Thu, 24 Nov 2016 16:31:05 -0800 (PST)
In-Reply-To: <20161123092209.23699-19-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-19-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Nov 2016 01:31:05 +0100
Message-ID: <CA+chaQc5s+S10LOwREDv45PcTZthZp0DfjQjfCbUF9ORN+OGug@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-filesystems][PATCH 19/49] xfsprogs: Upgrade 3.2.3 -> 4.8.0
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
X-List-Received-Date: Fri, 25 Nov 2016 00:31:07 -0000
Content-Type: text/plain; charset=UTF-8

Failed to build in bitbake world:

| ../include/xfs/linux.h:20:23: fatal error: uuid/uuid.h: No such file
or directory
|  #include <uuid/uuid.h>
|                        ^
| compilation terminated.
| make[2]: *** [crc32selftest] Error 1


On Wed, Nov 23, 2016 at 10:21 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Change-Id: I0015da261d540f99bfdebba703fef9403eebff7b
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-utils/xfsprogs/xfsprogs_3.2.3.bb       | 55
> ----------------------
>  .../recipes-utils/xfsprogs/xfsprogs_4.8.0.bb       | 52
> ++++++++++++++++++++
>  2 files changed, 52 insertions(+), 55 deletions(-)
>  delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/
> xfsprogs_3.2.3.bb
>  create mode 100644 meta-filesystems/recipes-utils/xfsprogs/
> xfsprogs_4.8.0.bb
>
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> deleted file mode 100644
> index 460a898..0000000
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -SUMMARY = "XFS Filesystem Utilities"
> -HOMEPAGE = "http://oss.sgi.com/projects/xfs"
> -SECTION = "base"
> -LICENSE = "GPLv2 & LGPLv2.1"
> -LICENSE_libhandle = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac
> 2a"
> -DEPENDS = "util-linux"
> -
> -SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
> -    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
> -    file://remove-install-as-user.patch \
> -    file://drop-configure-check-for-aio.patch \
> -"
> -
> -SRC_URI[md5sum] = "9f383e36682709e62b12c125e5d8b895"
> -SRC_URI[sha256sum] = "7a5124a880997939551b519610a2e5
> 4bd4cd0b0adfd563ce3f4de30827109ac9"
> -
> -inherit autotools-brokensep
> -
> -PACKAGES =+ "${PN}-fsck ${PN}-mkfs libhandle"
> -
> -RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs"
> -
> -FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
> -FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
> -FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
> -
> -EXTRA_OECONF = "--enable-gettext=no"
> -do_configure () {
> -    # Prevent Makefile from calling configure without arguments,
> -    # when do_configure gets called for a second time.
> -    rm -f include/builddefs include/platform_defs.h
> -    # Recreate configure script.
> -    rm -f configure
> -    oe_runmake configure
> -    # Configure.
> -    export DEBUG="-DNDEBUG"
> -    gnu-configize --force
> -    oe_runconf
> -}
> -
> -LIBTOOL = "${HOST_SYS}-libtool"
> -EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -PARALLEL_MAKE = ""
> -
> -do_install () {
> -    export DIST_ROOT=${D}
> -    oe_runmake install
> -    # needed for xfsdump
> -    oe_runmake install-dev
> -}
> -
> -# http://errors.yoctoproject.org/Errors/Details/83236/
> -PNBLACKLIST[xfsprogs] ?= "BROKEN: Needs upgrade to 4.5.0 version to be
> compatible with Kernel uapi changes from 4.5"
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> new file mode 100644
> index 0000000..049a4be
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> @@ -0,0 +1,52 @@
> +SUMMARY = "XFS Filesystem Utilities"
> +HOMEPAGE = "http://oss.sgi.com/projects/xfs"
> +SECTION = "base"
> +LICENSE = "GPLv2 & LGPLv2.1"
> +LICENSE_libhandle = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac
> 2a"
> +DEPENDS = "util-linux"
> +SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${
> BP}.tar.xz \
> +"
> +SRC_URI[md5sum] = "4f047bc9a28b48a95c6db0ad5ce4dbcb"
> +SRC_URI[sha256sum] = "82ce9cb3a55f4e208e8fe3471ff0af
> f0602b8300f3e50bdf05cc7e11549686f9"
> +
> +inherit autotools-brokensep
> +
> +PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
> +
> +
> +RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
> +
> +FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
> +FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
> +FILES_${PN}-repair = "${base_sbindir}/xfs_repair"
> +
> +FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
> +
> +EXTRA_OECONF = "--enable-gettext=no \
> +               INSTALL_USER=root \
> +               INSTALL_GROUP=root \
> +"
> +
> +EXTRA_AUTORECONF += "-I ${S}/m4 --exclude=autoheader"
> +
> +PACKAGECONFIG ??= "readline blkid"
> +
> +PACKAGECONFIG[readline] = "--enable-readline=yes,--
> enable-readline=no,readline"
> +PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
> +
> +export DEBUG="-DNDEBUG"
> +
> +EXTRA_OEMAKE = "DIST_ROOT='${D}'"
> +
> +do_configure_prepend () {
> +    # Prevent Makefile from calling configure without arguments,
> +    # when do_configure gets called for a second time.
> +    rm -f ${B}/include/builddefs ${B}/include/platform_defs.h
> ${B}/configure
> +    # Recreate configure script.
> +    oe_runmake configure
> +}
> +
> +do_install_append() {
> +        oe_runmake 'DESTDIR=${D}' install-dev
> +}
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

