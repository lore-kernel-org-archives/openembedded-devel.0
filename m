Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BF24A77027
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 22:58:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2015 15:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,614,1437462000"; d="scan'208";a="816613820"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2015 15:58:25 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 30 Sep 2015 15:58:24 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.194]) by
	fmsmsx115.amr.corp.intel.com ([169.254.4.46]) with mapi id
	14.03.0248.002; Wed, 30 Sep 2015 15:58:24 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM
Thread-Index: AQHQ2uLL0F9RpkJJK0Wyg4YeyoPAuJ5V08vAgAB3jwD//6EOpA==
Date: Wed, 30 Sep 2015 22:58:23 +0000
Message-ID: <B399646F8CA055479BEC55F6B065A04A370ABF6A@FMSMSX108.amr.corp.intel.com>
References: <1440032144-18482-1-git-send-email-vinay.k.awasthi@intel.com>
	<B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>,
	<CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
In-Reply-To: <CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
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
X-List-Received-Date: Wed, 30 Sep 2015 22:58:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have 2 inputs... =0A=
=0A=
openjdk-8 is pointing to unrelased 8u72b00 can we roll it back to released =
version 8u60b27 (http://hg.openjdk.java.net/jdk8u/jdk8u60/tags ).=0A=
=0A=
I am getting a failure in do_configure for openjdk-8... see logs and list o=
f files in =0A=
=0A=
ls -al  /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk=
-8-native/72b00-r0/jdk8u-d0afaafe3790=0A=
total 440=0A=
drwxrwxr-x 15 vinay vinay   4096 Sep 30 15:30 .=0A=
drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 ..=0A=
-rw-r--r--  1 vinay vinay   1503 Aug  7 11:52 ASSEMBLY_EXCEPTION=0A=
drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 common=0A=
-rw-r--r--  1 vinay vinay   1235 Aug  7 11:52 configure=0A=
drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 corba=0A=
-rw-r--r--  1 vinay vinay   3095 Aug  7 11:52 get_source.sh=0A=
-rw-r--r--  1 vinay vinay    154 Aug  7 11:52 .hg_archival.txt=0A=
-rw-r--r--  1 vinay vinay     70 Aug  7 11:52 .hgignore=0A=
-rw-r--r--  1 vinay vinay  23202 Aug  7 11:52 .hgtags=0A=
drwxrwxr-x  7 vinay vinay   4096 Sep 30 15:00 hotspot=0A=
drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jaxp=0A=
drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jaxws=0A=
drwxrwxr-x  2 vinay vinay   4096 Sep 30 15:00 .jcheck=0A=
drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jdk=0A=
drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 langtools=0A=
-rw-r--r--  1 vinay vinay  19263 Aug  7 11:52 LICENSE=0A=
drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 make=0A=
-rw-r--r--  1 vinay vinay   6232 Aug  7 11:52 Makefile=0A=
drwxrwxr-x 12 vinay vinay   4096 Sep 30 15:00 nashorn=0A=
drwxrwxr-x  2 vinay vinay   4096 Sep 30 15:00 patches=0A=
drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 .pc=0A=
-rw-r--r--  1 vinay vinay   1549 Aug  7 11:52 README=0A=
-rw-r--r--  1 vinay vinay 129333 Aug  7 11:52 README-builds.html=0A=
drwxrwxr-x  3 vinay vinay   4096 Sep 30 15:00 test=0A=
-rw-r--r--  1 vinay vinay 177094 Aug  7 11:52 THIRD_PARTY_README=0A=
=0A=
=0A=
=0A=
DEBUG: Executing python function sysroot_cleansstate=0A=
DEBUG: Python function sysroot_cleansstate finished=0A=
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64=
', 'x86_64-linux', 'common']=0A=
DEBUG: Executing shell function autotools_preconfigure=0A=
+ cd /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-=
native/72b00-r0/build=0A=
+ autotools_preconfigure=0A=
+ [ -n /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/configure.sstate -a -e /home/vinay/YOCTO/NEW_META_JAVA/bu=
ild/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/configure.sstate ]=0A=
+ ret=3D0=0A=
+ trap  0=0A=
+ exit 0=0A=
=0A=
+ cd /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-=
native/72b00-r0/build=0A=
+ autotools_preconfigure=0A=
+ [ -n /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/configure.sstate -a -e /home/vinay/YOCTO/NEW_META_JAVA/bu=
ild/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/configure.sstate ]=0A=
+ ret=3D0=0A=
+ trap  0=0A=
+ exit 0=0A=
DEBUG: Shell function autotools_preconfigure finished=0A=
DEBUG: Executing python function autotools_copy_aclocals=0A=
DEBUG: Python function autotools_copy_aclocals finished=0A=
DEBUG: Executing shell function do_configure=0A=
+ cd /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-=
native/72b00-r0/build=0A=
+ do_configure=0A=
+ export X11_NOT_NEEDED=3Dyes CUPS_NOT_NEEDED=3Dyes ALSA_NOT_NEEDED=3Dyes P=
ULSE_NOT_NEEDED=3Dyes=0A=
+ autotools_do_configure=0A=
=0A=
+ find /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/jdk8u-d0afaafe3790 -ignore_readdir_race -name configure.i=
n -o -name configure.ac=0A=
=0A=
+ dirname /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openj=
dk-8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure.ac=0A=
=0A=
+ rm -f /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk=
-8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure=0A=
=0A=
+ CS=3D/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/jdk8u-d0afaafe3790=0A=
=0A=
+ dirname configure=0A=
=0A=
+ test . !=3D .=0A=
+ [ -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/jdk8u-d0afaafe3790/configure.in -o -e /home/vinay/YOCTO/N=
EW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0=
afaafe3790/configure.ac ]=0A=
+ [ -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/jdk8u-d0afaafe3790/configure ]=0A=
=0A=
+ cd /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-=
native/72b00-r0/build=0A=
+ do_configure=0A=
+ export X11_NOT_NEEDED=3Dyes CUPS_NOT_NEEDED=3Dyes ALSA_NOT_NEEDED=3Dyes P=
ULSE_NOT_NEEDED=3Dyes=0A=
+ autotools_do_configure=0A=
+ find /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/jdk8u-d0afaafe3790 -ignore_readdir_race -name configure.i=
n -o -name configure.ac=0A=
+ dirname /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openj=
dk-8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure.ac=0A=
+ rm -f /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk=
-8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure=0A=
+ CS=3D/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/jdk8u-d0afaafe3790=0A=
+ dirname configure=0A=
+ test . !=3D .=0A=
+ [ -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/jdk8u-d0afaafe3790/configure.in -o -e /home/vinay/YOCTO/N=
EW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0=
afaafe3790/configure.ac ]=0A=
+ [ -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-=
8-native/72b00-r0/jdk8u-d0afaafe3790/configure ]=0A=
ERROR: Function failed: do_configure (log file is located at /home/vinay/YO=
CTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/tem=
p/log.do_configure.1566)=0A=
=0A=
I do see configure here .. /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x=
86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure but for =
some reason build just bails out..=0A=
=0A=
ls /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-na=
tive/72b00-r0/jdk8u-d0afaafe3790/=0A=
ASSEMBLY_EXCEPTION  configure  get_source.sh  jaxp   jdk        LICENSE  Ma=
kefile  patches  README-builds.html  THIRD_PARTY_README=0A=
common              corba      hotspot        jaxws  langtools  make     na=
shorn   README   test=0A=
=0A=
Thanks,=0A=
Vinay=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Otavio Salvador [otavio.salva=
dor@ossystems.com.br]=0A=
Sent: Wednesday, September 30, 2015 2:20 PM=0A=
To: OpenEmbedded Devel List=0A=
Cc: Richard Purdie; Otavio Salvador; mario@ossystems.com.br=0A=
Subject: Re: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM=0A=
=0A=
Hello Vinay,=0A=
=0A=
On Wed, Sep 30, 2015 at 6:15 PM, Awasthi, Vinay K=0A=
<vinay.k.awasthi@intel.com> wrote:=0A=
> Any update on when openjdk-8 is going to be part of meta-java? It has bee=
n over a month..=0A=
=0A=
Jens has prepared the patches and it has the ARM side fixed as well.=0A=
=0A=
Is it possible for you to take a look at his changes and see if those=0A=
work for you?=0A=
=0A=
* https://github.com/rehsack/poky/tree/master=0A=
* https://github.com/rehsack/meta-openembedded/tree/master=0A=
* https://github.com/rehsack/meta-fsl-arm/tree/master=0A=
* https://github.com/rehsack/meta-java/tree/master=0A=
=0A=
--=0A=
Otavio Salvador                             O.S. Systems=0A=
http://www.ossystems.com.br        http://code.ossystems.com.br=0A=
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

