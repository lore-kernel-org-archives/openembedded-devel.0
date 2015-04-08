Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 44ECD737EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 11:18:03 +0000 (UTC)
Received: by ierf6 with SMTP id f6so70646927ier.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 04:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=w9fS+bwnT0GjfKeDBX/oEwepxmn6VluBqgMwOKeN5yY=;
	b=sm8xNj6DBTr3lBBS/WvqJaadPUh9NTODWCbr4Oj9Hm2qmxEonU3G0cL9U+gXHLnIir
	LbGaKVTDiX1UmE9pj5CaYTpCv8tpqXn/odkkBm2QIsmrjr1gR3tj30Ly030GMe+8FwBY
	W/Ndtk9dJgBOeN18SrHV1IBCo9C8VWv5gBe9HI44pMtZCXP+RtmryM9IkmwWSoQRqyky
	O6tiYk5cfPJBQoRR8s+YsIvlvZm4cQLrUDSTnkdd06vCGpuUd+3frobntNX3pfxBc2LZ
	vpnpBkGkSDTTYiJo4jRdv+vrT9TKTmO8p9rV/C4n3OSMKwSCl93az38X7dMrxdlqMObi
	ABuA==
MIME-Version: 1.0
X-Received: by 10.43.151.83 with SMTP id kr19mr13279257icc.3.1428491884316;
	Wed, 08 Apr 2015 04:18:04 -0700 (PDT)
Received: by 10.107.158.133 with HTTP; Wed, 8 Apr 2015 04:18:04 -0700 (PDT)
In-Reply-To: <1428419079-30420-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1428419079-30420-1-git-send-email-sven.ebenfeld@gmail.com>
Date: Wed, 8 Apr 2015 13:18:04 +0200
Message-ID: <CAD0=qk+QkWZwJJRyFiFd1-VZSYZaws-rwWJbzSTLA9HTfg9o9Q@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 0/7] Update OpenJDK7 to IcedTea 2.5.4 und OpenJDK 7u75b13
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
X-List-Received-Date: Wed, 08 Apr 2015 11:18:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Please ignore these patches as I have already found some mistakes.
I'm going to send updated ones in a few days.
Mit freundlichen Gr=C3=BC=C3=9Fen,
Sven Ebenfeld


2015-04-07 17:04 GMT+02:00 Sven Ebenfeld <sven.ebenfeld@gmail.com>:
> I've built this release for an arm i.MX6 target and its running quite wel=
l.
> This patchset is updating OpenJDK7 to the newest IcedTea Release and fixi=
ng
> some issues when building icedtea7-native. I have tested it with dizzy br=
anches.
>
> Sven Ebenfeld (7):
>   icedtea7-native: Add attr-native and libxslt-native as dependency
>   icedtea7-native: fix build with gcc 4.9
>   icedtea7-native: remove unused patch
>   openjdk-7: Add IcedTea 2.5.4 OpenJDK 7u75b13
>   openjdk-7: use icedtea7-native as dependency instead of icedtea6
>   openjdk-7: Add libxslt-native as dependency
>   openjdk-7: remove IcedTea 2.3.12, OpenJDK 7u25b30
>
>  recipes-core/icedtea/icedtea7-native.inc           |   4 +-
>  .../icedtea-change-to-gdb-debug-format.patch       |  29 ++
>  .../icedtea-disable-desktop-dirs.patch             |  91 ------
>  recipes-core/icedtea/openjdk-7-release-03b147.inc  |   2 +
>  .../openjdk/openjdk-7-25b30/build-hacks.patch      |  60 ----
>  .../openjdk-7-25b30/cacao-arm-ucontext.patch       |  24 --
>  .../openjdk/openjdk-7-25b30/cacao-libtoolize.patch |  12 -
>  .../openjdk-7-25b30/cacao-loadavg-makefile.patch   |  13 -
>  .../openjdk/openjdk-7-25b30/cacao-loadavg.patch    |  27 --
>  .../openjdk/openjdk-7-25b30/cacao-update.patch     |  63 ----
>  .../openjdk/openjdk-7-25b30/fix-checksums.patch    |  13 -
>  .../openjdk-7-25b30/fix_hotspot_crosscompile.patch |  51 ---
>  ...cedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch |  19 --
>  .../icedtea-corba-parallel-make.patch              |  31 --
>  .../openjdk-7-25b30/icedtea-crosscompile-fix.patch | 363 ---------------=
------
>  .../openjdk-7-25b30/icedtea-fix-xrender.patch      |  13 -
>  .../icedtea-hotspot-dlvsym-uclibc.patch            |  16 -
>  .../icedtea-hotspot-glibc-version.patch            |  23 --
>  .../openjdk-7-25b30/icedtea-hotspot-isfinte.patch  |  15 -
>  .../openjdk-7-25b30/icedtea-hotspot-isnanf.patch   |  13 -
>  .../openjdk-7-25b30/icedtea-hotspot-loadavg.patch  |  28 --
>  .../openjdk-7-25b30/icedtea-jdk-iconv-uclibc.patch |  39 ---
>  .../icedtea-jdk-nio-use-host-cc.patch              |  73 -----
>  .../icedtea-jdk-powerpc-atomic64.patch             |  65 ----
>  .../icedtea-jdk-ppc64-jvm-cfg.patch                |  41 ---
>  .../icedtea-jdk-remove-unused-backtrace.patch      |  41 ---
>  .../icedtea-jdk-unpack-uclibc.patch                |  10 -
>  .../openjdk-7-25b30/icedtea-launcher-stdc++.patch  |  13 -
>  .../openjdk-7-25b30/icedtea-libnet-renaming.patch  | 188 -----------
>  ...njdk-remove-currency-data-generation-expi.patch |  25 --
>  .../openjdk-7-25b30/icedtea-remove_werror.patch    |  16 -
>  .../icedtea-shark-arm-linux-cpu-detection.patch    | 113 -------
>  .../openjdk-7-25b30/icedtea-unbreak-float.patch    |  18 -
>  ...edtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch |  13 -
>  .../openjdk-7-25b30/icedtea-zero-hotspotfix.patch  |  37 ---
>  recipes-core/openjdk/openjdk-7-25b30/jvm.cfg       |  43 ---
>  .../remove-sun.misc.Perf-debug-code.patch          |  47 ---
>  .../openjdk/openjdk-7-75b13/build-hacks.patch      |  71 ++++
>  .../openjdk-7-75b13/cacao-arm-ucontext.patch       |  24 ++
>  .../openjdk/openjdk-7-75b13/cacao-libtoolize.patch |  12 +
>  .../openjdk-7-75b13/cacao-loadavg-makefile.patch   |  13 +
>  .../openjdk/openjdk-7-75b13/cacao-loadavg.patch    |  27 ++
>  .../openjdk/openjdk-7-75b13/fix-checksums.patch    |  28 ++
>  .../openjdk-7-75b13/fix_hotspot_crosscompile.patch |  52 +++
>  ...cedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch |  19 ++
>  .../openjdk-7-75b13/icedtea-crosscompile-fix.patch | 355 +++++++++++++++=
+++++
>  .../icedtea-jdk-nio-use-host-cc.patch              |  74 +++++
>  .../icedtea-jdk-rmi-crosscompile.patch             |  13 +
>  .../openjdk-7-75b13/icedtea-libnet-renaming.patch  | 236 ++++++++++++++
>  ...njdk-remove-currency-data-generation-expi.patch |  25 ++
>  .../openjdk-7-75b13/icedtea-remove_werror.patch    |  16 +
>  .../icedtea-shark-arm-linux-cpu-detection.patch    | 113 +++++++
>  .../openjdk-7-75b13/icedtea-unbreak-float.patch    |  18 +
>  ...edtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch |  13 +
>  .../openjdk-7-75b13/icedtea-zero-hotspotfix.patch  |  36 ++
>  recipes-core/openjdk/openjdk-7-75b13/jvm.cfg       |  43 +++
>  .../remove-sun.misc.Perf-debug-code.patch          |  47 +++
>  recipes-core/openjdk/openjdk-7-common.inc          |   7 +-
>  recipes-core/openjdk/openjdk-7-release-25b30.inc   | 137 --------
>  recipes-core/openjdk/openjdk-7-release-75b13.inc   | 104 ++++++
>  recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb     |  36 --
>  recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb      |  36 ++
>  62 files changed, 1412 insertions(+), 1835 deletions(-)
>  create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-change-=
to-gdb-debug-format.patch
>  delete mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-disable=
-desktop-dirs.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/build-hacks.patc=
h
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-arm-uconte=
xt.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-libtoolize=
.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg-ma=
kefile.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg.pa=
tch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-update.pat=
ch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/fix-checksums.pa=
tch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/fix_hotspot_cros=
scompile.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-=
lib-jni-to-DEFAULT_LIBPATH.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-corba-pa=
rallel-make.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscom=
pile-fix.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-fix-xren=
der.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-=
dlvsym-uclibc.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-=
glibc-version.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-=
isfinte.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-=
isnanf.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-=
loadavg.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-icon=
v-uclibc.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-=
use-host-cc.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-powe=
rpc-atomic64.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-ppc6=
4-jvm-cfg.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-remo=
ve-unused-backtrace.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-unpa=
ck-uclibc.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-launcher=
-stdc++.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-libnet-r=
enaming.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-=
remove-currency-data-generation-expi.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-remove_w=
error.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-shark-ar=
m-linux-cpu-detection.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-unbreak-=
float.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-unset-NI=
O_PLATFORM_CLASSES_ROOT_DIR.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hot=
spotfix.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/jvm.cfg
>  delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/remove-sun.misc.=
Perf-debug-code.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/build-hacks.patc=
h
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-arm-uconte=
xt.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-libtoolize=
.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg-ma=
kefile.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg.pa=
tch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/fix-checksums.pa=
tch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/fix_hotspot_cros=
scompile.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-add-usr-=
lib-jni-to-DEFAULT_LIBPATH.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscom=
pile-fix.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-=
use-host-cc.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-rmi-=
crosscompile.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-libnet-r=
enaming.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-openjdk-=
remove-currency-data-generation-expi.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-remove_w=
error.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-shark-ar=
m-linux-cpu-detection.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-unbreak-=
float.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-unset-NI=
O_PLATFORM_CLASSES_ROOT_DIR.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-zero-hot=
spotfix.patch
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/jvm.cfg
>  create mode 100644 recipes-core/openjdk/openjdk-7-75b13/remove-sun.misc.=
Perf-debug-code.patch
>  delete mode 100644 recipes-core/openjdk/openjdk-7-release-25b30.inc
>  create mode 100644 recipes-core/openjdk/openjdk-7-release-75b13.inc
>  delete mode 100644 recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb
>  create mode 100644 recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb
>
> --
> 1.8.1.rc3
>

