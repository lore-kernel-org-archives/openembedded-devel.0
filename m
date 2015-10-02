Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1F0C770D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 16:44:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 02 Oct 2015 09:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,624,1437462000"; d="scan'208";a="572908908"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2015 09:44:50 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 2 Oct 2015 09:44:49 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.194]) by
	FMSMSX102.amr.corp.intel.com ([169.254.10.29]) with mapi id
	14.03.0248.002; Fri, 2 Oct 2015 09:44:49 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM
Thread-Index: AQHQ2uLL0F9RpkJJK0Wyg4YeyoPAuJ5V08vAgAB3jwD//6EOpIADJ0qA//+YN2A=
Date: Fri, 2 Oct 2015 16:44:48 +0000
Message-ID: <B399646F8CA055479BEC55F6B065A04A370B7A63@FMSMSX108.amr.corp.intel.com>
References: <1440032144-18482-1-git-send-email-vinay.k.awasthi@intel.com>
	<B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>
	<CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
	<B399646F8CA055479BEC55F6B065A04A370ABF6A@FMSMSX108.amr.corp.intel.com>
	<D8A82570-8C75-4DA8-B884-13747427A3D4@gmail.com>
In-Reply-To: <D8A82570-8C75-4DA8-B884-13747427A3D4@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 02 Oct 2015 16:44:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for poky patches input (I picked java branch and that got me past co=
nfigure script issue but it is still failing for me while looking for gcc i=
n STAGING_DIR_NATIVE..

If I were to pick 64 bit OS to cross compile 32 bit Yocto and all related s=
oftware.. recipe does not look at TARGET_SYS instead goes for STAGING_DIR_N=
ATIVE to look for gcc and other tools...

You can reproduce this failure by simply setting MACHINE as qemux86 and try=
 building it on 64 bit OS (say Ubuntu 14.04)

Thanks,
Vinay

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
Sent: Friday, October 2, 2015 8:50 AM
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie; Otavio Salvador; mario@ossystems.com.br
Subject: Re: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM

Hi,

> Am 01.10.2015 um 00:58 schrieb Awasthi, Vinay K <vinay.k.awasthi@intel.co=
m>:
>=20
> I have 2 inputs...=20
>=20
> openjdk-8 is pointing to unrelased 8u72b00 can we roll it back to release=
d version 8u60b27 (http://hg.openjdk.java.net/jdk8u/jdk8u60/tags ).

I discussed that with our local Java expert. He says: The hotspot changes i=
n u72b00 looking better and u60b27 should be ignored. The entire 8u is main=
tenance only, so keep on recent tags ;)

Generally, let's see what we have when yocto branches for next stable and d=
ecide then. My personal opinion is: move forward until we hit u80 :)

> I am getting a failure in do_configure for openjdk-8... see logs and=20
> list of files in
>=20
> ls -al =20
> /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-
> native/72b00-r0/jdk8u-d0afaafe3790
> total 440
> drwxrwxr-x 15 vinay vinay   4096 Sep 30 15:30 .
> drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 ..
> -rw-r--r--  1 vinay vinay   1503 Aug  7 11:52 ASSEMBLY_EXCEPTION
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 common
> -rw-r--r--  1 vinay vinay   1235 Aug  7 11:52 configure
> drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 corba
> -rw-r--r--  1 vinay vinay   3095 Aug  7 11:52 get_source.sh
> -rw-r--r--  1 vinay vinay    154 Aug  7 11:52 .hg_archival.txt
> -rw-r--r--  1 vinay vinay     70 Aug  7 11:52 .hgignore
> -rw-r--r--  1 vinay vinay  23202 Aug  7 11:52 .hgtags
> drwxrwxr-x  7 vinay vinay   4096 Sep 30 15:00 hotspot
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jaxp
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jaxws
> drwxrwxr-x  2 vinay vinay   4096 Sep 30 15:00 .jcheck
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jdk
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 langtools
> -rw-r--r--  1 vinay vinay  19263 Aug  7 11:52 LICENSE
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 make
> -rw-r--r--  1 vinay vinay   6232 Aug  7 11:52 Makefile
> drwxrwxr-x 12 vinay vinay   4096 Sep 30 15:00 nashorn
> drwxrwxr-x  2 vinay vinay   4096 Sep 30 15:00 patches
> drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 .pc
> -rw-r--r--  1 vinay vinay   1549 Aug  7 11:52 README
> -rw-r--r--  1 vinay vinay 129333 Aug  7 11:52 README-builds.html
> drwxrwxr-x  3 vinay vinay   4096 Sep 30 15:00 test
> -rw-r--r--  1 vinay vinay 177094 Aug  7 11:52 THIRD_PARTY_README
>=20
>=20
>=20
> DEBUG: Executing python function sysroot_cleansstate
> DEBUG: Python function sysroot_cleansstate finished
> DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',=20
> 'bit-64', 'x86_64-linux', 'common']
> DEBUG: Executing shell function autotools_preconfigure
> + cd=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/build
> + autotools_preconfigure
> + [ -n=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/configure.sstate -a -e=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/configure.sstate ]
> + ret=3D0
> + trap  0
> + exit 0
>=20
> + cd=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/build
> + autotools_preconfigure
> + [ -n=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/configure.sstate -a -e=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/configure.sstate ]
> + ret=3D0
> + trap  0
> + exit 0
> DEBUG: Shell function autotools_preconfigure finished
> DEBUG: Executing python function autotools_copy_aclocals
> DEBUG: Python function autotools_copy_aclocals finished
> DEBUG: Executing shell function do_configure
> + cd=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/build
> + do_configure
> + export X11_NOT_NEEDED=3Dyes CUPS_NOT_NEEDED=3Dyes ALSA_NOT_NEEDED=3Dyes=
=20
> + PULSE_NOT_NEEDED=3Dyes autotools_do_configure
>=20
> + find=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790 -ignore_readdir_race -name=20
> + configure.in -o -name configure.ac
>=20
> + dirname=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure.ac
>=20
> + rm -f=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure
>=20
> + CS=3D/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openj
> + dk-8-native/72b00-r0/jdk8u-d0afaafe3790
>=20
> + dirname configure
>=20
> + test . !=3D .
> + [ -e=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/configure.in -o -e=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/configure.ac ] [ -e=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/configure ]
>=20
> + cd=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/build
> + do_configure
> + export X11_NOT_NEEDED=3Dyes CUPS_NOT_NEEDED=3Dyes ALSA_NOT_NEEDED=3Dyes=
=20
> + PULSE_NOT_NEEDED=3Dyes autotools_do_configure find=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790 -ignore_readdir_race -name=20
> + configure.in -o -name configure.ac dirname=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure.ac
> + rm -f=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure
> + CS=3D/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openj
> + dk-8-native/72b00-r0/jdk8u-d0afaafe3790
> + dirname configure
> + test . !=3D .
> + [ -e=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/configure.in -o -e=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/configure.ac ] [ -e=20
> + /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-
> + 8-native/72b00-r0/jdk8u-d0afaafe3790/configure ]
> ERROR: Function failed: do_configure (log file is located at=20
> /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-
> native/72b00-r0/temp/log.do_configure.1566)
>=20
> I do see configure here .. /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work=
/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure but fo=
r some reason build just bails out..

I told you in private mail yesterday evening, you have to apply https://git=
hub.com/rehsack/poky/commit/9aa003359f9d804544ba68fa812dd65915c4901b in pok=
y before running openjdk's autoconf procedure. It's because of poky unlink'=
s all "configure" files and expects running autoreconf brings the fine ones=
 back.
OpenJDK has a weird perspective regarding "fine ones" ^^

The other issue you mailed me:

> Am 01.10.2015 um 23:04 schrieb Awasthi, Vinay K <vinay.k.awasthi@intel.co=
m>:
>=20
> It seems openjdk-8-native truly looks for native toolschains etc.. and do=
es not pick up cross compiling targets.. (my target is i586-poky-linux but =
configure picks up x86_64 etc..).. it fails looking for gcc in x86_64 area =
under sysroot... where as it should look into i586-poky-linux...
>=20
> I am running bitbake openjdk-8...
> In openjdk-8-native.inc it is set to pick up native not TARGET_SYS..
> EXTRA_OECONF_append =3D "\
>        --with-jobs=3D${@get_jdk8_native_jobs(d)} \
>        \
>        --openjdk-target=3D${TARGET_SYS} \
>        --with-sys-root=3D${STAGING_DIR_NATIVE} \
>        --with-tools-dir=3D${STAGING_DIR_NATIVE} \
>        --with-boot-jdk=3D${STAGING_LIBDIR_NATIVE}/jvm/icedtea7-native \
>        ${@jdk_configure_options(d)} \
>  "

I have no clue what that means. If one would give me a hint, I'm happy to f=
ix anything (what's broken).

We're should looking forward to include the way you apply compact profiles,=
 I've seen nice blog posts from Java developers at oracle shrinking jre to =
10MB ...
Since our's is currently at 76MB, that would be worth investing ...

Cheers,
Jens

> ls /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-=
native/72b00-r0/jdk8u-d0afaafe3790/
> ASSEMBLY_EXCEPTION  configure  get_source.sh  jaxp   jdk        LICENSE  =
Makefile  patches  README-builds.html  THIRD_PARTY_README
> common              corba      hotspot        jaxws  langtools  make     =
nashorn   README   test
>=20
> Thanks,
> Vinay
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org=20
> [openembedded-devel-bounces@lists.openembedded.org] on behalf of=20
> Otavio Salvador [otavio.salvador@ossystems.com.br]
> Sent: Wednesday, September 30, 2015 2:20 PM
> To: OpenEmbedded Devel List
> Cc: Richard Purdie; Otavio Salvador; mario@ossystems.com.br
> Subject: Re: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM
>=20
> Hello Vinay,
>=20
> On Wed, Sep 30, 2015 at 6:15 PM, Awasthi, Vinay K=20
> <vinay.k.awasthi@intel.com> wrote:
>> Any update on when openjdk-8 is going to be part of meta-java? It has be=
en over a month..
>=20
> Jens has prepared the patches and it has the ARM side fixed as well.
>=20
> Is it possible for you to take a look at his changes and see if those=20
> work for you?
>=20
> * https://github.com/rehsack/poky/tree/master
> * https://github.com/rehsack/meta-openembedded/tree/master
> * https://github.com/rehsack/meta-fsl-arm/tree/master
> * https://github.com/rehsack/meta-java/tree/master
>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Jens Rehsack - rehsack@gmail.com

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

