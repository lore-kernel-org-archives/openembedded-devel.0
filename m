Return-Path: <Edson.Seabra@zpesystems.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720107.outbound.protection.outlook.com [40.107.72.107])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA447FC21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 17:45:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=iDg16x8wkV4+PKZ8jxdbuQ7/VwDR4TGislQG27RCUkK7qu4RrL2WSpk8cZmuawxU1QkM/PI1D+95TBKtJbMfFoaPL4C+5tdDlePJcxCFGta/Xd1WFy13X9f56DzkpSbFcr5N+hGXS4OjEfK7Fi1FmZwfXvLcKCEEtaor77hAxmETcGxPOfPmH9lL45O9QXNCo99sSBZuECwBgmWLvcpo+fPdYPyliSJgOzAOc0NKUPi71vDGWwieYUe4r+Htzrbmjzc6dblJYxiDtq0psTvIYrlEHovk610uMMYTWRHI9/0oWBm67RTFiJZTNFzrQwYBDWcTKYn5xrsHqKLPYnNYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OlWNF6CN5k/GrQj3K29aOzFtYFkHc4DBCJ9RfYx9uuk=;
	b=PJkGrXX9X5EXwIKbDySp89POEobIHiOiKOqoQjHGb0BhGnMOBlFnEwjLJLukgXR4N772PvEGZp4XzuYETvpnww5aLA0CMgHUvvvc/4RY7tWW087iGOqpP/TyDejbjKMKHopl/CFNbKv8Rcj34dEZmILr+WhFd2fekGZx2WP19PnXMALqsPdTYr1s478vxc/JTvhirpIpLhKDtYN2kEQ2RKgt9EmBlPURNSe3ICj7hjEwvPU0RG4cBuJEdjWJ3J2EpLluIGPqVAzMIwF/tNaM1CVL35pn3fck3gNhLEWTEbo9UUSHhQpVDbFQFP4NI6C3+0gPzy0+nT9uCI5udk26aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=zpesystems.com; dmarc=pass action=none
	header.from=zpesystems.com; dkim=pass header.d=zpesystems.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ZPESystems.onmicrosoft.com; s=selector2-ZPESystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OlWNF6CN5k/GrQj3K29aOzFtYFkHc4DBCJ9RfYx9uuk=;
	b=wv2yua3cj3U76OIQqjEDYjLg+0EHNBEuLoKcKksQBK01UXQEN2Z/a0phIXmMJsnNnYxlfDQZYkZj1ZQvLtp6LEeAEB9G3JrhP2hQKuMVMBZFhRjc/eiZd/OXoEKVNpsoZxW26V8FSVFgT1omGIlczRYBnRirSl7R5R59suIu4dQ=
Received: from DM6PR19MB2796.namprd19.prod.outlook.com (20.178.231.150) by
	DM6PR19MB3804.namprd19.prod.outlook.com (10.186.140.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.18; Mon, 25 Nov 2019 17:45:55 +0000
Received: from DM6PR19MB2796.namprd19.prod.outlook.com
	([fe80::41e2:49f1:fb6:1e3b]) by DM6PR19MB2796.namprd19.prod.outlook.com
	([fe80::41e2:49f1:fb6:1e3b%7]) with mapi id 15.20.2474.023;
	Mon, 25 Nov 2019 17:45:55 +0000
From: Edson Seabra <Edson.Seabra@zpesystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Build error on external kernel modules
Thread-Index: AQHVo7X4dB0pUTbsQ0ayERo1KF1EmQ==
Date: Mon, 25 Nov 2019 17:45:54 +0000
Message-ID: <DM6PR19MB2796D26877315806EDFD09BBF74A0@DM6PR19MB2796.namprd19.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Edson.Seabra@zpesystems.com; 
x-originating-ip: [2804:14d:7e81:88ba:7044:42d7:f0ce:cbf0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57bd0b09-c9a4-4588-3229-08d771cf5275
x-ms-traffictypediagnostic: DM6PR19MB3804:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM6PR19MB3804DA424D12A347EEF4FCBDF74A0@DM6PR19MB3804.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(136003)(366004)(376002)(346002)(396003)(51874003)(199004)(189003)(8676002)(81156014)(81166006)(8936002)(2501003)(9686003)(861006)(14444005)(256004)(6436002)(105004)(46003)(186003)(19627405001)(86362001)(2351001)(6506007)(7696005)(102836004)(76116006)(64756008)(99286004)(66556008)(66476007)(66616009)(52536014)(316002)(66946007)(7736002)(6916009)(66446008)(6116002)(71200400001)(25786009)(55016002)(91956017)(733005)(2906002)(508600001)(5640700003)(33656002)(71190400001)(5660300002)(54896002)(606006)(14454004)(30864003)(74316002)(236005)(6306002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR19MB3804;
	H:DM6PR19MB2796.namprd19.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: zpesystems.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W6a9F5pd51ESh0nVoPL8Y6HTyCIf+W5oD9RoS31JtIBdCt1XwNLJ+U4OFZi6CREZape+9hoBn+mSd7UhUm7XDRQHSxdsVz1EsSK3A7vdFbN0a43ECiroGl/7sG8u6UEFWYuywRI5WOuqVMvUtkTldb9n7GkaGttuBjANR7/nw8HEbJ4FWJSIaLb5GbtKovbCleft//s/3LHcx14/I8HTdFaPk2hRdpMf1OUolAiITgDAQwXpEbn+Bc8X0T2oKPrqSi/Ghhu2YuI9Q4nfvPMXeHOMMVS0m4NnhCm1yu925rSi3NWds6encEt54OYsir+6vvvUf6n5/hXj/JH6QP3SLaeftWk7WXH4NFlVnoF3mMkbeYricbl1YZt5i5oS0v242htrxTE4NyzGCFfrr9vu7UxRjGQENV6NxKU8uJnQSvibAL4xRo+obZtu4ncIYLBBLZ63Rrgq0/vsBfFXv/XxVHEmGd2JrCEjjRW3hfYXcSc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: zpesystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bd0b09-c9a4-4588-3229-08d771cf5275
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 17:45:54.6868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 09cd24a9-c206-4d0b-8a25-3e9a321f0e90
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPO3c0vZoQ2M6zKjyWSFEfXDFo5tcf1y7URKdCrzcxM3zncnQW/Ati1l+JYUkQ8R0KM/AxwLXnMkqNhLC5vy58+z4GRoOQsnXfuzKisk5/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3804
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Build error on external kernel modules
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
X-List-Received-Date: Mon, 25 Nov 2019 17:45:55 -0000
X-Groupsio-MsgNum: 81190
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_DM6PR19MB2796D26877315806EDFD09BBF74A0DM6PR19MB2796namp_";
	type="multipart/alternative"

--_004_DM6PR19MB2796D26877315806EDFD09BBF74A0DM6PR19MB2796namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm working on update our builder environment to new YOCTO  Zeus (3.0).

I could build the core-image-sato,  install, and run it normally. Just prov=
iding extra configuration to generate ISO image.

But I was not able to build external kernel modules.  After build the image=
 a just type 'bitbake cryptodev-module' and I got the error below.

Can you give a hint about what is wrong or what I'm missing ?

Thanks in advance.

=3D=3D=3D=3D local conf =3D=3D=3D=3D


edson@yocto-zeus:sato$ grep -v "^$\|^#" conf/local.conf

MACHINE ?=3D "genericx86-64"

DISTRO ?=3D "poky"

PACKAGE_CLASSES ?=3D "package_ipk"

EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"

USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"

PATCHRESOLVE =3D "noop"

BB_DISKMON_DIRS ??=3D "\

    STOPTASKS,${TMPDIR},1G,100K \

    STOPTASKS,${DL_DIR},1G,100K \

    STOPTASKS,${SSTATE_DIR},1G,100K \

    STOPTASKS,/tmp,100M,100K \

    ABORT,${TMPDIR},100M,1K \

    ABORT,${DL_DIR},100M,1K \

    ABORT,${SSTATE_DIR},100M,1K \

    ABORT,/tmp,10M,1K"

PACKAGECONFIG_append_pn-qemu-system-native =3D " sdl"

CONF_VERSION =3D "1"

IMAGE_FSTYPES =3D "iso"

COMPRESSISO =3D "1"

BB_GENERATE_MIRROR_TARBALLS =3D "1"

DL_DIR =3D "/opt/sources"

BUILDCFG_VARS +=3D " IMAGE_LINGUAS MACHINE_FEATURES IMAGE_FSTYPES DISTRO_FE=
ATURES IMAGE_FEATURES "

BB_NUMBER_THREADS =3D "10"

PARALLEL_MAKE =3D "-j 6"

edson@yocto-zeus:sato$

=3D=3D=3D=3D build log =3D=3D=3D=3D


edson@yocto-zeus:sato$ bitbake cryptodev-module

Loading cache: 100% |######################################################=
###| Time: 0:00:00

Loaded 1314 entries from dependency cache.

NOTE: Resolving any missing task queue dependencies


Build Configuration:

BB_VERSION           =3D "1.44.0"

BUILD_SYS            =3D "x86_64-linux"

NATIVELSBSTRING      =3D "universal"

TARGET_SYS           =3D "x86_64-poky-linux"

MACHINE              =3D "genericx86-64"

DISTRO               =3D "poky"

DISTRO_VERSION       =3D "3.0"

TUNE_FEATURES        =3D "m64 core2"

TARGET_FPU           =3D ""

IMAGE_LINGUAS        =3D "en-us en-gb"

MACHINE_FEATURES     =3D " screen keyboard pci usbhost ext2 ext3 x86       =
               acpi serial usbgadget alsa wifi efi pcbios"

IMAGE_FSTYPES        =3D "iso"

DISTRO_FEATURES      =3D "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile =
pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 largefile o=
pengl ptest multiarch wayland vulkan"

IMAGE_FEATURES       =3D " debug-tweaks"

meta

meta-poky

meta-yocto-bsp       =3D "zeus:24046332599cc528834df515a90babc83b7cd570"


Initialising tasks: 100% |#################################################=
###| Time: 0:00:00

Sstate summary: Wanted 26 Found 8 Missed 18 Current 140 (30% match, 89% com=
plete)

NOTE: Executing Tasks

NOTE: Setscene tasks completed

ERROR: make-mod-scripts-1.0-r0 do_configure: oe_runmake failed

ERROR: make-mod-scripts-1.0-r0 do_configure: Execution of '/home/edson/ng-t=
runk/sato/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0/temp/ru=
n.do_configure.85788' failed with exit code 1:

make: Entering directory '/home/edson/ng-trunk/sato/tmp/work-shared/generic=
x86-64/kernel-source'

make: *** No rule to make target 'scripts'.  Stop.

make: Leaving directory '/home/edson/ng-trunk/sato/tmp/work-shared/genericx=
86-64/kernel-source'

WARNING: exit code 1 from a shell command.


ERROR: Logfile of failure stored in: /home/edson/ng-trunk/sato/tmp/work/gen=
ericx86_64-poky-linux/make-mod-scripts/1.0-r0/temp/log.do_configure.85788

Log data follows:

| DEBUG: Executing python function extend_recipe_sysroot

| NOTE: Direct dependencies are ['virtual:native:/home/edson/ng-trunk/poky/=
meta/recipes-devtools/bison/bison_3.4.1.bb:do_populate_sysroot', '/home/eds=
on/ng-trunk/poky/meta/recipes-kernel/kmod/kmod-native_git.bb:do_populate_sy=
sroot', '/home/edson/ng-trunk/poky/meta/recipes-devtools/binutils/binutils-=
cross_2.32.bb:do_populate_sysroot', 'virtual:native:/home/edson/ng-trunk/po=
ky/meta/recipes-support/lzop/lzop_1.04.bb:do_populate_sysroot', '/home/edso=
n/ng-trunk/poky/meta/recipes-core/glibc/glibc_2.30.bb:do_populate_sysroot',=
 'virtual:native:/home/edson/ng-trunk/poky/meta/recipes-devtools/elfutils/e=
lfutils_0.177.bb:do_populate_sysroot', '/home/edson/ng-trunk/poky/meta/reci=
pes-devtools/gcc/gcc-cross_9.2.bb:do_populate_sysroot', '/home/edson/ng-tru=
nk/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroo=
t', '/home/edson/ng-trunk/poky/meta/recipes-kernel/kern-tools/kern-tools-na=
tive_git.bb:do_populate_sysroot', 'virtual:native:/home/edson/ng-trunk/poky=
/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb:do_populate_sysroot', =
'virtual:native:/home/edson/ng-trunk/poky/meta/recipes-core/util-linux/util=
-linux_2.34.bb:do_populate_sysroot', 'virtual:native:/home/edson/ng-trunk/p=
oky/meta/recipes-extended/xz/xz_5.2.4.bb:do_populate_sysroot', 'virtual:nat=
ive:/home/edson/ng-trunk/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git=
.bb:do_populate_sysroot', '/home/edson/ng-trunk/poky/meta/recipes-devtools/=
gcc/gcc-runtime_9.2.bb:do_populate_sysroot', 'virtual:native:/home/edson/ng=
-trunk/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot']

| NOTE: Installed into sysroot: ['kmod-native', 'lzop-native', 'elfutils-na=
tive', 'kern-tools-native', 'openssl-native', 'util-linux-native', 'lzo-nat=
ive', 'gtk-doc-native', 'python3-native', 'libcap-ng-native', 'libnsl2-nati=
ve', 'libtirpc-native', 'gdbm-native', 'bzip2-native', 'sqlite3-native', 'l=
ibffi-native']

| NOTE: Skipping as already exists in sysroot: ['bison-native', 'binutils-c=
ross-x86_64', 'glibc', 'gcc-cross-x86_64', 'quilt-native', 'xz-native', 'pk=
gconfig-native', 'gcc-runtime', 'bc-native', 'autoconf-native', 'texinfo-du=
mmy-native', 'gnu-config-native', 'gettext-minimal-native', 'automake-nativ=
e', 'libtool-native', 'flex-native', 'zlib-native', 'linux-libc-headers', '=
gmp-native', 'libmpc-native', 'mpfr-native', 'ncurses-native', 'libgcc', 'r=
eadline-native', 'm4-native']

| DEBUG: sed -e 's:^[^/]*/:/home/edson/ng-trunk/sato/tmp/work/genericx86_64=
-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/:g' /home/edson/n=
g-trunk/sato/tmp/sysroots-components/x86_64/elfutils-native/fixmepath /home=
/edson/ng-trunk/sato/tmp/sysroots-components/x86_64/openssl-native/fixmepat=
h /home/edson/ng-trunk/sato/tmp/sysroots-components/x86_64/gtk-doc-native/f=
ixmepath /home/edson/ng-trunk/sato/tmp/sysroots-components/x86_64/python3-n=
ative/fixmepath | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:/home/edson/ng-t=
runk/sato/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0/recipe-=
sysroot:g; s:FIXMESTAGINGDIRHOST:/home/edson/ng-trunk/sato/tmp/work/generic=
x86_64-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native:g' -e 's:FI=
XME_PSEUDO_SYSROOT:/home/edson/ng-trunk/sato/tmp/sysroots-components/x86_64=
/pseudo-native:g' -e 's:FIXME_HOSTTOOLS_DIR:/home/edson/ng-trunk/sato/tmp/h=
osttools:g' -e 's:FIXME_PKGDATA_DIR:/home/edson/ng-trunk/sato/tmp/pkgdata/g=
enericx86-64:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/edson/ng-trunk/sato/=
tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0/pseudo/:g' -e 's:=
FIXME_LOGFIFO:/home/edson/ng-trunk/sato/tmp/work/genericx86_64-poky-linux/m=
ake-mod-scripts/1.0-r0/temp/fifo.85788:g'

| DEBUG: Python function extend_recipe_sysroot finished

| DEBUG: Executing shell function do_configure

| NOTE: make HOSTCC=3Dgcc  -isystem/home/edson/ng-trunk/sato/tmp/work/gener=
icx86_64-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/inclu=
de -O2 -pipe -L/home/edson/ng-trunk/sato/tmp/work/genericx86_64-poky-linux/=
make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib                      =
   -L/home/edson/ng-trunk/sato/tmp/work/genericx86_64-poky-linux/make-mod-s=
cripts/1.0-r0/recipe-sysroot-native/lib                         -Wl,--enabl=
e-new-dtags                         -Wl,-rpath-link,/home/edson/ng-trunk/sa=
to/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=
-native/usr/lib                         -Wl,-rpath-link,/home/edson/ng-trun=
k/sato/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0/recipe-sys=
root-native/lib                         -Wl,-rpath,/home/edson/ng-trunk/sat=
o/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-=
native/usr/lib                         -Wl,-rpath,/home/edson/ng-trunk/sato=
/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-n=
ative/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,-=
-dynamic-linker=3D/home/edson/ng-trunk/sato/tmp/sysroots-uninative/x86_64-l=
inux/lib/ld-linux-x86-64.so.2 HOSTCPP=3Dgcc  -E CC=3Dx86_64-poky-linux-gcc =
 -fuse-ld=3Dbfd -fmacro-prefix-map=3D/home/edson/ng-trunk/sato/tmp/work/gen=
ericx86_64-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scr=
ipts/1.0-r0                      -fdebug-prefix-map=3D/home/edson/ng-trunk/=
sato/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/d=
ebug/make-mod-scripts/1.0-r0                      -fdebug-prefix-map=3D/hom=
e/edson/ng-trunk/sato/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.=
0-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/home/edso=
n/ng-trunk/sato/tmp/work/genericx86_64-poky-linux/make-mod-scripts/1.0-r0/r=
ecipe-sysroot-native=3D  -fdebug-prefix-map=3D/home/edson/ng-trunk/sato/tmp=
/work-shared/genericx86-64/kernel-source=3D/usr/src/kernel LD=3Dx86_64-poky=
-linux-ld.bfd  AR=3Dx86_64-poky-linux-ar  -C /home/edson/ng-trunk/sato/tmp/=
work-shared/genericx86-64/kernel-source O=3D/home/edson/ng-trunk/sato/tmp/w=
ork-shared/genericx86-64/kernel-build-artifacts scripts

| make: Entering directory '/home/edson/ng-trunk/sato/tmp/work-shared/gener=
icx86-64/kernel-source'

| make: *** No rule to make target 'scripts'.  Stop.

| make: Leaving directory '/home/edson/ng-trunk/sato/tmp/work-shared/generi=
cx86-64/kernel-source'

| ERROR: oe_runmake failed

| WARNING: exit code 1 from a shell command.

| ERROR: Execution of '/home/edson/ng-trunk/sato/tmp/work/genericx86_64-pok=
y-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.85788' failed with ex=
it code 1:

| make: Entering directory '/home/edson/ng-trunk/sato/tmp/work-shared/gener=
icx86-64/kernel-source'

| make: *** No rule to make target 'scripts'.  Stop.

| make: Leaving directory '/home/edson/ng-trunk/sato/tmp/work-shared/generi=
cx86-64/kernel-source'

| WARNING: exit code 1 from a shell command.

|

ERROR: Task (/home/edson/ng-trunk/poky/meta/recipes-kernel/make-mod-scripts=
/make-mod-scripts_1.0.bb:do_configure) failed with exit code '1'

NOTE: Tasks Summary: Attempted 683 tasks of which 665 didn't need to be rer=
un and 1 failed.


Summary: 1 task failed:

  /home/edson/ng-trunk/poky/meta/recipes-kernel/make-mod-scripts/make-mod-s=
cripts_1.0.bb:do_configure

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


Edson Seabra

Principal Engineer

M +1 510 579 0843

E   edson.seabra@zpesystems.com<mailto:alvin.chan@zpesystems.com>

[1506169147061_OutlookEmoji-1505330244060_ZPELogo_Email.png1e6c5898-d340-4c=
90-8c28-e559c26bc7d1.png]
46757 Fremont Blvd., Fremont, CA 94538
zpesystems.com<https://www.zpesystems.com/> | Request a Nodegrid Demo<https=
://www.zpesystems.com/demo/>

--_004_DM6PR19MB2796D26877315806EDFD09BBF74A0DM6PR19MB2796namp_
Content-Type: image/png; name="Outlook-1506169147.png"
Content-Description: Outlook-1506169147.png
Content-Disposition: inline; filename="Outlook-1506169147.png"; size=2497;
	creation-date="Mon, 25 Nov 2019 17:45:54 GMT";
	modification-date="Mon, 25 Nov 2019 17:45:54 GMT"
Content-ID: <ab59c4f1-3702-4811-8496-0f652fe45586>
Content-Transfer-Encoding: base64

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

--_004_DM6PR19MB2796D26877315806EDFD09BBF74A0DM6PR19MB2796namp_--
