Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id F02CA7702D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 15:50:31 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so36803949wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=STzC5YaJ33QvS+gYmLienc4eRyxoQcFvRvoieb3T198=;
	b=iwNPnhmRveP4t7RW05sp04V+ZrfExnSEWWw7OzqZPWLGB8SZ/ljT41t+BrV1/1mdsP
	HeGZpDd5HKECnmoQfRJtJqaFC8offR/Ez+/7pgPnYf9t6XRTs8xwh8R9ROjy0+34sq/y
	nwPg/QOivlPtDbbyYCx3PijwtZS4rVdVWfHYG5QTat3G1nQ5TukZEYTrdmDNhh1QjAVg
	miNRHDamQxqbG21KI8fLOfUHN6JupNXw1uZ+tQlkNRKIxdbQDIIKsKtAPvjHhdsJugm+
	BH6sa0vv5GKwk+4AwDtOl6y5EH3/oFUlYJhjDS4PDWXyDBs3HZEc9hUeZbAVq6D6AXzh
	K3Jw==
X-Received: by 10.194.236.200 with SMTP id uw8mr16407462wjc.126.1443801031747; 
	Fri, 02 Oct 2015 08:50:31 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id jf3sm9005873wic.8.2015.10.02.08.50.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 02 Oct 2015 08:50:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <B399646F8CA055479BEC55F6B065A04A370ABF6A@FMSMSX108.amr.corp.intel.com>
Date: Fri, 2 Oct 2015 17:50:29 +0200
Message-Id: <D8A82570-8C75-4DA8-B884-13747427A3D4@gmail.com>
References: <1440032144-18482-1-git-send-email-vinay.k.awasthi@intel.com>
	<B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>
	<CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
	<B399646F8CA055479BEC55F6B065A04A370ABF6A@FMSMSX108.amr.corp.intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
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
X-List-Received-Date: Fri, 02 Oct 2015 15:50:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

> Am 01.10.2015 um 00:58 schrieb Awasthi, Vinay K =
<vinay.k.awasthi@intel.com>:
>=20
> I have 2 inputs...=20
>=20
> openjdk-8 is pointing to unrelased 8u72b00 can we roll it back to =
released version 8u60b27 (http://hg.openjdk.java.net/jdk8u/jdk8u60/tags =
).

I discussed that with our local Java expert. He says: The hotspot =
changes in u72b00 looking better and u60b27 should be ignored. The =
entire 8u is maintenance only, so keep on recent tags ;)

Generally, let's see what we have when yocto branches for next stable =
and decide then. My personal opinion is: move forward until we hit u80 =
:)

> I am getting a failure in do_configure for openjdk-8... see logs and =
list of files in=20
>=20
> ls -al  =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790
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
> DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', =
'bit-64', 'x86_64-linux', 'common']
> DEBUG: Executing shell function autotools_preconfigure
> + cd =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/build
> + autotools_preconfigure
> + [ -n =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/configure.sstate -a -e =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/configure.sstate ]
> + ret=3D0
> + trap  0
> + exit 0
>=20
> + cd =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/build
> + autotools_preconfigure
> + [ -n =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/configure.sstate -a -e =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/configure.sstate ]
> + ret=3D0
> + trap  0
> + exit 0
> DEBUG: Shell function autotools_preconfigure finished
> DEBUG: Executing python function autotools_copy_aclocals
> DEBUG: Python function autotools_copy_aclocals finished
> DEBUG: Executing shell function do_configure
> + cd =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/build
> + do_configure
> + export X11_NOT_NEEDED=3Dyes CUPS_NOT_NEEDED=3Dyes =
ALSA_NOT_NEEDED=3Dyes PULSE_NOT_NEEDED=3Dyes
> + autotools_do_configure
>=20
> + find =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790 -ignore_readdir_race -name configure.in =
-o -name configure.ac
>=20
> + dirname =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure.ac
>=20
> + rm -f =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure
>=20
> + =
CS=3D/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8=
-native/72b00-r0/jdk8u-d0afaafe3790
>=20
> + dirname configure
>=20
> + test . !=3D .
> + [ -e =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/configure.in -o -e =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/configure.ac ]
> + [ -e =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/configure ]
>=20
> + cd =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/build
> + do_configure
> + export X11_NOT_NEEDED=3Dyes CUPS_NOT_NEEDED=3Dyes =
ALSA_NOT_NEEDED=3Dyes PULSE_NOT_NEEDED=3Dyes
> + autotools_do_configure
> + find =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790 -ignore_readdir_race -name configure.in =
-o -name configure.ac
> + dirname =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure.ac
> + rm -f =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure
> + =
CS=3D/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8=
-native/72b00-r0/jdk8u-d0afaafe3790
> + dirname configure
> + test . !=3D .
> + [ -e =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/configure.in -o -e =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/configure.ac ]
> + [ -e =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/configure ]
> ERROR: Function failed: do_configure (log file is located at =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/temp/log.do_configure.1566)
>=20
> I do see configure here .. =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/configure but for some reason build just =
bails out..

I told you in private mail yesterday evening, you have to apply =
https://github.com/rehsack/poky/commit/9aa003359f9d804544ba68fa812dd65915c=
4901b in poky before running openjdk's autoconf procedure. It's because =
of poky unlink's all "configure" files and expects running autoreconf =
brings the fine ones back.
OpenJDK has a weird perspective regarding "fine ones" ^^

The other issue you mailed me:

> Am 01.10.2015 um 23:04 schrieb Awasthi, Vinay K =
<vinay.k.awasthi@intel.com>:
>=20
> It seems openjdk-8-native truly looks for native toolschains etc.. and =
does not pick up cross compiling targets.. (my target is i586-poky-linux =
but configure picks up x86_64 etc..).. it fails looking for gcc in =
x86_64 area under sysroot... where as it should look into =
i586-poky-linux...
>=20
> I am running bitbake openjdk-8...
> In openjdk-8-native.inc it is set to pick up native not TARGET_SYS..
> EXTRA_OECONF_append =3D "\
>        --with-jobs=3D${@get_jdk8_native_jobs(d)} \
>        \
>        --openjdk-target=3D${TARGET_SYS} \
>        --with-sys-root=3D${STAGING_DIR_NATIVE} \
>        --with-tools-dir=3D${STAGING_DIR_NATIVE} \
>        --with-boot-jdk=3D${STAGING_LIBDIR_NATIVE}/jvm/icedtea7-native =
\
>        ${@jdk_configure_options(d)} \
>  "

I have no clue what that means. If one would give me a hint, I'm happy =
to fix anything (what's broken).

We're should looking forward to include the way you apply compact =
profiles, I've seen nice blog posts from Java developers at oracle =
shrinking jre to 10MB ...
Since our's is currently at 76MB, that would be worth investing ...

Cheers,
Jens

> ls =
/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-nati=
ve/72b00-r0/jdk8u-d0afaafe3790/
> ASSEMBLY_EXCEPTION  configure  get_source.sh  jaxp   jdk        =
LICENSE  Makefile  patches  README-builds.html  THIRD_PARTY_README
> common              corba      hotspot        jaxws  langtools  make   =
  nashorn   README   test
>=20
> Thanks,
> Vinay
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org =
[openembedded-devel-bounces@lists.openembedded.org] on behalf of Otavio =
Salvador [otavio.salvador@ossystems.com.br]
> Sent: Wednesday, September 30, 2015 2:20 PM
> To: OpenEmbedded Devel List
> Cc: Richard Purdie; Otavio Salvador; mario@ossystems.com.br
> Subject: Re: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM
>=20
> Hello Vinay,
>=20
> On Wed, Sep 30, 2015 at 6:15 PM, Awasthi, Vinay K
> <vinay.k.awasthi@intel.com> wrote:
>> Any update on when openjdk-8 is going to be part of meta-java? It has =
been over a month..
>=20
> Jens has prepared the patches and it has the ARM side fixed as well.
>=20
> Is it possible for you to take a look at his changes and see if those
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
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Jens Rehsack - rehsack@gmail.com


