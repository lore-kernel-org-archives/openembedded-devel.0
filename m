Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id D1A316B43D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 16:15:34 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d135so42363099qkc.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DaxwZrrkcHrBI9FCl++76P++FuiNYdXSgjD67G6M5xg=;
	b=t4lYgURFv9/H3eQMAkM2Jr/rqTNlOYZnmjwgdTFnQj2ZTB/lFNEXsD+D1EVnj4Lek3
	N1c4h5xM8xY+t7dpmYHEMHEM4p/AO88OslZmOGuSgBtPqi6lAK4OiGQrrKmeJvPIxw9A
	u+DczKrLJ4eLz1LFEM34Xr1vzjeTdBM4mH0DyiP4elMdDXCxQjuI8QTbun7T5/bBTph/
	4aMI4U75Ly9dvGLCogYrEH54zzBwEQAXKpmH5CBvtSgrOCMl81o+cG7Yj9jFcxxZpIxA
	T7DIPNAqZux16AssOmjr0J8vGBdEysOpSNj3afJde6N1NBUevpLw34sZXtntCT+aFDaW
	m9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DaxwZrrkcHrBI9FCl++76P++FuiNYdXSgjD67G6M5xg=;
	b=j6lYotnUZqYY26bOAdcV84Vdm7eMz0Mw95MamL/HJG5yRMUIVG4uQp06VZHRv9D8Tn
	jYmSpxrgkkw0f+TYMVLKVfj9JpZLqOqJlQyfcuUW3UAByzHv5K81ynuiHlYCcLMccaRi
	89Y0+Y7Av8cNjjYyXNMqRUBgVA9xyC/5nS3LwMRDslWerxM9xjhxfxqicWzhiUwO6UB8
	okQQbxKg56t1JpoD8hGWmFwap94A3lzgqb3gGdCcIFtWlEJ3TGrg6DHx7D0WNwakMqrQ
	QDC9o/t3o9CABL6Uc/V28dep/pHNy/DzW2e8Yl3s97C3pWd0X1MJT6c81yGRRw3oqitn
	41pw==
X-Gm-Message-State: AGRZ1gLyJsfJ7oTqDQr0LGUgSshDPBTwKuR5pztY3YDUqcskM53jbUmq
	TqS8JSanZ51tQtIjJU/KDwNsvFMO61SGPa5GPXfTPJvX7mQ=
X-Google-Smtp-Source: AJdET5cF2+8cJsB8XGGYC0u/0U1axhA4MDL33BzjGRyaIPk1Xu0IiQcLrMwqSclGAw7y9Yb5uBMORl46ExY8yTzvkhY=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr14465952qvd.224.1542471335137;
	Sat, 17 Nov 2018 08:15:35 -0800 (PST)
MIME-Version: 1.0
References: <1541991419-8898-1-git-send-email-akuster808@gmail.com>
	<1541991419-8898-2-git-send-email-akuster808@gmail.com>
In-Reply-To: <1541991419-8898-2-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Nov 2018 08:15:09 -0800
Message-ID: <CAMKF1sqb0b3ZSyEJqjHzneihiWbbCFyX_McZj6uoJoA_NQbhfw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ptest: add addition packagegroups and image for ptests
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
X-List-Received-Date: Sat, 17 Nov 2018 16:15:35 -0000
Content-Type: text/plain; charset="UTF-8"

Armin

This patch is causing problems for musl based world builds (parse)

RROR: Nothing RPROVIDES 'fwts' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
fwts was skipped: incompatible with host arm-yoe-linux-musleabi (not
in COMPATIBLE_HOST)
NOTE: Runtime target 'fwts' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['fwts']
NOTE: Runtime target 'packagegroup-meta-oe-graphics' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-graphics', 'fwts']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-connectivity' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-connectivity'
NOTE: Runtime target 'packagegroup-meta-oe-connectivity' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-connectivity']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-kernel' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-kernel'
NOTE: Runtime target 'packagegroup-meta-oe-kernel' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-kernel']
ERROR: Nothing RPROVIDES 'soci-ptest' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'soci-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['soci-ptest']
ERROR: Nothing RPROVIDES 'openldap-ptest' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'openldap-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openldap-ptest']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-benchmarks' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-benchmarks'
NOTE: Runtime target 'packagegroup-meta-oe-benchmarks' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-benchmarks']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-support' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-support'
NOTE: Runtime target 'packagegroup-meta-oe-support' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-support']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-gnome' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-gnome'
NOTE: Runtime target 'packagegroup-meta-oe-gnome' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-gnome']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-dbs' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-dbs'
NOTE: Runtime target 'packagegroup-meta-oe-dbs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-dbs']
ERROR: Nothing RPROVIDES 'numactl' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
numactl was skipped: incompatible with host arm-yoe-linux-musleabi
(not in COMPATIBLE_HOST)
NOTE: Runtime target 'numactl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['numactl']
ERROR: Nothing RPROVIDES 'lcdproc' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
lcdproc was skipped: incompatible with host arm-yoe-linux-musleabi
(not in COMPATIBLE_HOST)
NOTE: Runtime target 'lcdproc' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lcdproc']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-ptest' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-ptest'
NOTE: Runtime target 'packagegroup-meta-oe-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-ptest']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe'
NOTE: Runtime target 'packagegroup-meta-oe' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe']
ERROR: Nothing RPROVIDES 'mcelog-ptest' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'mcelog-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mcelog-ptest']
ERROR: Nothing RPROVIDES 'numactl-ptest' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'numactl-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['numactl-ptest']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-navigation' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-navigation'
NOTE: Runtime target 'packagegroup-meta-oe-navigation' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-navigation']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-core' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-core'
NOTE: Runtime target 'packagegroup-meta-oe-core' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-core']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-multimedia' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-multimedia'
NOTE: Runtime target 'packagegroup-meta-oe-multimedia' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-multimedia']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-bsp' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-bsp'
NOTE: Runtime target 'packagegroup-meta-oe-bsp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-bsp']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-security' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-security'
NOTE: Runtime target 'packagegroup-meta-oe-security' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-security']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-extended' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-extended'
NOTE: Runtime target 'packagegroup-meta-oe-extended' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-extended']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-test' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-test'
NOTE: Runtime target 'packagegroup-meta-oe-test' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-test']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-crypto' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-crypto'
NOTE: Runtime target 'packagegroup-meta-oe-crypto' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-crypto']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-devtools' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-devtools'
NOTE: Runtime target 'packagegroup-meta-oe-devtools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-devtools']
ERROR: Nothing RPROVIDES 'libxml-ptest' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'libxml-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libxml-ptest']
ERROR: Nothing RPROVIDES 'libdbi-ptest' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'libdbi-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libdbi-ptest']
On Sun, Nov 11, 2018 at 6:57 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Need a method to run ptests in meta-oe and to build test
> tasks not done via a world build
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/conf/layer.conf                            |   2 +
>  meta-oe/recipes-core/images/meta-oe-image-base.bb  |   7 +
>  meta-oe/recipes-core/images/meta-oe-image.bb       |   5 +
>  meta-oe/recipes-core/images/meta-oe-ptest-image.bb |   5 +
>  .../packagegroups/packagegroup-meta-oe.bb          | 251 +++++++++++++++++++++
>  5 files changed, 270 insertions(+)
>  create mode 100644 meta-oe/recipes-core/images/meta-oe-image-base.bb
>  create mode 100644 meta-oe/recipes-core/images/meta-oe-image.bb
>  create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-image.bb
>  create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 64c888d..23c10ce 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -77,3 +77,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    source-han-sans-kr-fonts->fontconfig \
>    source-han-sans-tw-fonts->fontconfig \
>  "
> +
> +DEFAULT_TEST_SUITES_pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
> diff --git a/meta-oe/recipes-core/images/meta-oe-image-base.bb b/meta-oe/recipes-core/images/meta-oe-image-base.bb
> new file mode 100644
> index 0000000..df92f16
> --- /dev/null
> +++ b/meta-oe/recipes-core/images/meta-oe-image-base.bb
> @@ -0,0 +1,7 @@
> +SUMMARY = "meta-oe build test image"
> +
> +IMAGE_INSTALL = "packagegroup-core-boot"
> +
> +LICENSE = "MIT"
> +
> +inherit core-image
> diff --git a/meta-oe/recipes-core/images/meta-oe-image.bb b/meta-oe/recipes-core/images/meta-oe-image.bb
> new file mode 100644
> index 0000000..1565549
> --- /dev/null
> +++ b/meta-oe/recipes-core/images/meta-oe-image.bb
> @@ -0,0 +1,5 @@
> +require  meta-oe-image-base.bb
> +
> +SUMMARY = "meta-oe build test image"
> +
> +IMAGE_INSTALL += "packagegroup-meta-oe"
> diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
> new file mode 100644
> index 0000000..0166b9c
> --- /dev/null
> +++ b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
> @@ -0,0 +1,5 @@
> +require  meta-oe-image-base.bb
> +
> +SUMMARY = "meta-oe ptest test image"
> +
> +IMAGE_INSTALL += "packagegroup-meta-oe"
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> new file mode 100644
> index 0000000..4526e99
> --- /dev/null
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -0,0 +1,251 @@
> +SUMMARY = "Meta-oe ptest packagegroups"
> +
> +inherit packagegroup
> +
> +PROVIDES = "${PACKAGES}"
> +PACKAGES = ' \
> +    packagegroup-meta-oe \
> +    packagegroup-meta-oe-benchmarks \
> +    packagegroup-meta-oe-connectivity \
> +    packagegroup-meta-oe-core \
> +    packagegroup-meta-oe-crypto \
> +    packagegroup-meta-oe-bsp \
> +    packagegroup-meta-oe-dbs \
> +    packagegroup-meta-oe-devtools \
> +    packagegroup-meta-oe-extended \
> +    packagegroup-meta-oe-kernel \
> +    packagegroup-meta-oe-multimedia \
> +    packagegroup-meta-oe-navigation \
> +    packagegroup-meta-oe-security \
> +    packagegroup-meta-oe-support \
> +    packagegroup-meta-oe-test \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest", "", d)} \
> +'
> +
> +RDEPENDS_packagegroup-meta-oe = "\
> +    packagegroup-meta-oe-benchmarks \
> +    packagegroup-meta-oe-connectivity \
> +    packagegroup-meta-oe-core \
> +    packagegroup-meta-oe-crypto \
> +    packagegroup-meta-oe-bsp \
> +    packagegroup-meta-oe-dbs \
> +    packagegroup-meta-oe-devtools \
> +    packagegroup-meta-oe-extended \
> +    packagegroup-meta-oe-kernel \
> +    packagegroup-meta-oe-multimedia \
> +    packagegroup-meta-oe-navigation \
> +    packagegroup-meta-oe-security \
> +    packagegroup-meta-oe-support \
> +    packagegroup-meta-oe-test \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest", "", d)} \
> +"
> +
> +RDEPENDS_packagegroup-meta-oe-benchmarks = "\
> +    analyze-suspend dhrystone iperf2 linpack phoronix-test-suite \
> +    tiobench bonnie++ fio iperf2 iperf3 lmbench s-suite whetstone \
> +    libc-bench memtester sysbench dbench iozone3 libhugetlbfs \
> +    nbench-byte tinymembench \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "glmark2", "", d)} \
> +"
> +
> +RDEPENDS_packagegroup-meta-oe-connectivity ="\
> +    gammu hostapd irssi krb5 libev libimobiledevice \
> +    libmbim libmtp libndp libqmi libtorrent \
> +    libuv libwebsockets linuxptp lirc loudmouth \
> +    modemmanager mosh  \
> +    paho-mqtt-c phonet-utils rabbitmq-c rfkill rtorrent \
> +    ser2net smstools3 telepathy-glib telepathy-idle thrift \
> +    usbmuxd wvstreams zabbix zeromq \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libmikmod", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "obexftp openobex libnet wvdial", "", d)} \
> +    "
> +
> +# dracut needs dracut
> +RDEPENDS_packagegroup-meta-oe-core ="\
> +    dbus-daemon-proxy libdbus-c++ eggdbus \
> +    ell glibmm libsigc++-2.0 libxml++ distro-feed-configs \
> +    mm-common opencl-headers opencl-icd-loader \
> +    proxy-libintl usleep \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker ndctl", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-crypto ="\
> +    botan cryptsetup libkcapi libmcrypt \
> +    libsodium pkcs11-helper \
> +    "
> +RDEPENDS_packagegroup-meta-oe-bsp ="\
> +    acpitool cpufrequtils edac-utils efibootmgr \
> +    efivar flashrom lmsensors lmsensors-config \
> +    lsscsi nvme-cli pcmciautils pointercal \
> +    "
> +RDEPENDS_packagegroup-meta-oe-dbs ="\
> +    leveldb libdbi mariadb mariadb-native \
> +    mysql-python postgresql psqlodbc rocksdb soci \
> +    sqlite \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "mongodb", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-devtools ="\
> +    android-tools android-tools-conf bootchart breakpad \
> +    capnproto cgdb cscope ctags \
> +    debootstrap dejagnu dmalloc flatbuffers \
> +    giflib icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
> +    kconfig-frontends lemon libedit libgee libsombok3 \
> +    libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
> +    mpich msgpack-c nlohmann-json nodejs openocd pax-utils \
> +    ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
> +    protobuf protobuf-c python3-distutils-extra \
> +    python-cpuset python-distutils-extra python-futures python-pygobject \
> +    rapidjson serialcheck sip3 sip tclap uftrace uw-imap valijson \
> +    xmlrpc-c yajl yasm \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-extended ="\
> +    byacc cfengine cfengine-masterfiles cmpi-bindings \
> +    ddrescue dialog dumb-init enscript fluentbit \
> +    haveged hexedit hiredis hplip hwloc indent iotop isomd5sum \
> +    jansson konkretcmpi lcdproc libblockdev libcec libconfig \
> +    libdivecomputer libplist libusbmuxd \
> +    liblockfile liblogging liblognorm libmodbus libmodbus \
> +    libpwquality libqb libuio \
> +    lockfile-progs logwatch lprng mailx md5deep \
> +    mozjs mraa nana nicstat \
> +    p7zip p8platform libfile-fnmatch-perl polkit \
> +    polkit-group-rule-datetime polkit-group-rule-network \
> +    rarpd redis rrdtool libfastjson librelp rsyslog sanlock \
> +    sblim-cmpi-devel sblim-sfc-common sblim-sfcc \
> +    scsirastools sgpio smartmontools snappy can-isotp \
> +    can-utils libsocketcan tipcutils tiptop \
> +    tmux uml-utilities upm vlock volume-key wipe zlog zram \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", " libgxim t1lib gnuplot libwmf gtkmathview", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez", "collectd", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
> +    ${@bb.utils.contains("BBPATH", "meta-python", "openlmi-tools", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-gnome ="\
> +    atkmm gnome-common gnome-doc-utils-stub gtkmm \
> +    gtkmm3 pyxdg vte9 \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-graphics ="\
> +    babl cairomm dietsplash directfb directfb-examples dnfdragora \
> +    fbgrab fbida fontforge freeglut fvwm gegl gimp glm gphoto2 libgphoto2 \
> +    gtkperf jasper leptonica libmng libsdl2-image libsdl2-mixer libsdl2-net \
> +    libsdl2-ttf libsdl-gfx libsdl-image libsdl-mixer libsdl-net libsdl-ttf \
> +    libvncserver libyui libyui-ncurses lxdm numlockx openbox openjpeg \
> +    packagegroup-fonts-truetype pangomm qrencode takao-fonts terminus-font \
> +    tesseract tesseract-lang tigervnc tslib source-han-sans-cn-fonts \
> +    source-han-sans-jp-fonts source-han-sans-kr-fonts source-han-sans-tw-fonts ttf-abyssinica \
> +    libvdpau x11vnc xcursorgen xdotool \
> +    bdftopcf iceauth sessreg setxkbmap twm xclock xfontsel xgamma xkbevd xkbprint xkbutils \
> +    xlsatoms xlsclients xlsfonts xmag xmessage xrdb xrefresh xsetmode xsetroot xstdcmap \
> +    xterm xwd xwud xbitmaps xorg-sgml-doctools \
> +    font-adobe-100dpi font-adobe-utopia-100dpi \
> +    font-bh-100dpi font-bh-lucidatypewriter-100dpi font-bitstream-100dpi font-cursor-misc \
> +    font-misc-misc xorg-fonts-100dpi liblbxutil libxaw libxkbui libxpresent xserver-common \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-kernel ="\
> +    agent-proxy bpftool broadcom-bt-firmware cpupower \
> +    crash ipmitool minicoredumper oprofile \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-multimedia ="\
> +    alsa-oss audiofile cdrkit esound faad2 id3lib \
> +    a2jmidid jack libass libburn libcdio libcdio-paranoia \
> +    libdvdread libmad libmms libmodplug libopus live555 \
> +    mplayer-common opus-tools \
> +    sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol mpv xsp", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libmikmod", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-navigation ="\
> +    geoclue geos libspatialite proj \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "orrery", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd gpsd-machine-conf", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-security ="\
> +    tomoyo-tools \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "passwdqc", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluz5", "nmap", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-shells ="\
> +    dash tcsh zsh \
> +    "
> +
> +NE10 = ""
> +NE10_aarch64 = "ne10"
> +NE10_arm7 = "ne10"
> +
> +RDEPENDS_packagegroup-meta-oe-support ="\
> +    anthy asio atop augeas avro-c bdwgc frame grail \
> +    ccid ceres-solver ckermit cpprest ctapi-common daemonize \
> +    daemontools debsums devmem2 dfu-util dfu-util-native digitemp \
> +    dstat eject enca epeg espeak espeak-data fbset fbset-modes \
> +    fftw fltk-native gd gflags glog gnulib gperftools \
> +    gpm gradm gsl gsoap hddtemp hidapi htop hunspell hwdata iksemel \
> +    libinih inotify-tools joe lcms lcov libatasmart libbytesize \
> +    libcereal libcyusbserial libee libeigen libestr libftdi libgit2 \
> +    libgpiod libiio libjs-jquery libjs-sizzle liblinebreak libmicrohttpd \
> +    libmxml libnih liboauth libol liboop libp11 libraw1394 libsmi libsoc libssh2 \
> +    libssh libtar libteam libtinyxml2 libtinyxml libusbg libusb-compat libutempter \
> +    links lio-utils lockdev log4c log4cpp logwarn libdevmapper lvm2 \
> +    mailcap mbuffer mg minini \
> +    multipath-tools nano neon nmon numactl onig openct openldap \
> +    opensc wbxml2 p910nd pcsc-lite picocom libotr pidgin \
> +    pngcheck poco poppler poppler-data portaudio-v19 pps-tools \
> +    pv pxaregs raptor2 rdfind read-edid rsnapshot s3c24xx-gpio s3c64xx-gpio \
> +    sjf2410-linux-native satyr sdparm pty-forward-native serial-forward \
> +    sg3-utils sharutils smem spitools srecord ssiapi start-stop-daemon stm32flash \
> +    syslog-ng system-config-keyboard tbb thin-provisioning-tools tokyocabinet \
> +    tree udisks udisks2 uhubctl unixodbc upower uriparser usb-modeswitch \
> +    usb-modeswitch-data usbpath uthash utouch-evemu utouch-frame \
> +    vim vim-tiny websocketpp wmiconfig xdelta3 xdg-user-dirs xmlstarlet \
> +    zbar zile \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis toscoterm uim synergy utouch-mtview links-x11 fltk pidgin-otr", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libcanberra", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "procmail", "", d)} \
> +    ${NE10} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-support-egl ="\
> +    freerdp libnice opencv \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-test ="\
> +    catch2 cppunit cunit cxxtest evtest fb-test \
> +    fwts gtest pm-qa stress-ng testfloat \
> +    "
> +
> +RDEPENDS_packagegroup-meta-oe-ptest = "\
> +    zeromq-ptest \
> +    libxml-ptest \
> +    soci-ptest \
> +    leveldb-ptest \
> +    psqlodbc-ptest \
> +    lua-ptest \
> +    protobuf-ptest \
> +    libdbi-ptest \
> +    rsyslog-ptest \
> +    oprofile-ptest \
> +    libteam-ptest \
> +    uthash-ptest \
> +    mcelog-ptest \
> +    openldap-ptest \
> +    libee-ptest \
> +    numactl-ptest \
> +    poco-ptest \
> +    "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

