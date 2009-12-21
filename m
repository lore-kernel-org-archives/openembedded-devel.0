Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMkcm-00082z-8V
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 16:56:47 +0100
Received: by iwn32 with SMTP id 32so3275218iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 07:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HjOASjU9cxQ06ZGb/ImF9OZanT9VQJeOWN8lirihv58=;
	b=L+w1YifoVBhzEEuUoZFMwMs/qVh7lyGMQpWrlqGdT38oRAJXJpuXbAXwD7Xe3GLR84
	IixnDQ9ryNWYNEQnIqnEqtvuuYDOZnUB0CcE4FlgO54CfFCoOQGF+ZaKl3kjCuuaxmpX
	zLFbjQgYI0ePDW5U36HlGHUxAClXUC4HgxXJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QYw+mRvTmYGHRD5wAHMIE4XYUb9PNaeSWGplqL8s1iuAj3+OBjKMVvwzgnGdx/8WxS
	kdGde+klJQkgnhzqQF/7kOIZphANZTxuc2Crw4flDe6hDTK/JR6fDVVNdQeS3Qpt7a/k
	+5pv6UFzODUkNlffaVfc38Wzz4dWTKTMEXN0A=
MIME-Version: 1.0
Received: by 10.231.167.204 with SMTP id r12mr1112302iby.31.1261410892331; 
	Mon, 21 Dec 2009 07:54:52 -0800 (PST)
In-Reply-To: <hgo4u8$uil$1@ger.gmane.org>
References: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
	<hgneg9$kka$1@ger.gmane.org>
	<19c1b8a90912210711w560614betc4ff2fe27b3032c8@mail.gmail.com>
	<hgo4u8$uil$1@ger.gmane.org>
Date: Mon, 21 Dec 2009 07:54:52 -0800
Message-ID: <19c1b8a90912210754p28ab4324g7e80ee0c189730cc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/3] gcc: Enable mips plt extentions if DISTRO_FEATURE has mplt.
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
X-List-Received-Date: Mon, 21 Dec 2009 15:56:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2009 at 7:40 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 21-12-09 16:11, Khem Raj wrote:
>> On Mon, Dec 21, 2009 at 1:18 AM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Why am I getting these errors:
>>>
>>> NOTE: <type 'exceptions.NameError'>:name 'get_gcc_mips_plt_setting' is
>>> not defined while evaluating:
>>>
>>> when building kernel modules for an arm machine?
>>>
>>> On 19-12-09 23:26, Khem Raj wrote:
>>>> * Newer gcc (4.4+) has implemented -mplt option to
>>>> =C2=A0 enable PLT and copy relocation extentions of MIPS ABI
>>>> =C2=A0 which makes shared code run a lot faster. This feature
>>>> =C2=A0 is however controlled by DISTRO_FEATURES which should
>>>> =C2=A0 add 'mplt' to DISTRO_FEATURES to enable it.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> =C2=A0recipes/gcc/gcc-3.3.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-3.4.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-3.4.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.1.0.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.1.1.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.1.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.2.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.2.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.2.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.3.1.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.3.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.3.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.3.4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.4.1.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-4.4.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>>> =C2=A0recipes/gcc/gcc-common.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A05 +++++
>>>> =C2=A0recipes/gcc/gcc-configure-common.inc =C2=A0 | =C2=A0 =C2=A05 +++=
+-
>>>> =C2=A0recipes/gcc/gcc-cross-initial.inc =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A03 ++-
>>>> =C2=A0recipes/gcc/gcc-cross-intermediate.inc | =C2=A0 =C2=A03 ++-
>>>> =C2=A019 files changed, 28 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/recipes/gcc/gcc-3.3.4.inc b/recipes/gcc/gcc-3.3.4.inc
>>>> index 635e617..a3fbdde 100644
>>>> --- a/recipes/gcc/gcc-3.3.4.inc
>>>> +++ b/recipes/gcc/gcc-3.3.4.inc
>>>> @@ -1,6 +1,6 @@
>>>> =C2=A0require gcc-common.inc
>>>>
>>>> -INC_PR =3D "r10"
>>>> +INC_PR =3D "r11"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/releases/gcc-${PV}/gcc-${PV}.tar.=
bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://arm-gotoff.dpatch;patch=3D1;p=
num=3D0 \
>>>> diff --git a/recipes/gcc/gcc-3.4.3.inc b/recipes/gcc/gcc-3.4.3.inc
>>>> index 72f9042..febe0fc 100644
>>>> --- a/recipes/gcc/gcc-3.4.3.inc
>>>> +++ b/recipes/gcc/gcc-3.4.3.inc
>>>> @@ -1,6 +1,6 @@
>>>> =C2=A0require gcc-common.inc
>>>>
>>>> -INC_PR =3D "r18"
>>>> +INC_PR =3D "r19"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc34-reverse-compare.patch;p=
atch=3D1 \
>>>> diff --git a/recipes/gcc/gcc-3.4.4.inc b/recipes/gcc/gcc-3.4.4.inc
>>>> index 9a02c5d..b87e1e3 100644
>>>> --- a/recipes/gcc/gcc-3.4.4.inc
>>>> +++ b/recipes/gcc/gcc-3.4.4.inc
>>>> @@ -1,6 +1,6 @@
>>>> =C2=A0require gcc-common.inc
>>>>
>>>> -INC_PR =3D "r14"
>>>> +INC_PR =3D "r15"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc34-reverse-compare.patch;p=
atch=3D1 \
>>>> diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
>>>> index 7bb1a34..df0ae3f 100644
>>>> --- a/recipes/gcc/gcc-4.1.0.inc
>>>> +++ b/recipes/gcc/gcc-4.1.0.inc
>>>> @@ -1,6 +1,6 @@
>>>> =C2=A0require gcc-common.inc
>>>>
>>>> -INC_PR =3D "r9"
>>>> +INC_PR =3D "r10"
>>>>
>>>> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>>>>
>>>> diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
>>>> index 68323ac..a960b41 100644
>>>> --- a/recipes/gcc/gcc-4.1.1.inc
>>>> +++ b/recipes/gcc/gcc-4.1.1.inc
>>>> @@ -2,7 +2,7 @@ require gcc-common.inc
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r0"
>>>> +INC_PR =3D "r1"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://100-uclibc-conf.patch;patch=3D1 \
>>>> diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
>>>> index 911d2d9..21bf486 100644
>>>> --- a/recipes/gcc/gcc-4.1.2.inc
>>>> +++ b/recipes/gcc/gcc-4.1.2.inc
>>>> @@ -2,7 +2,7 @@ require gcc-common.inc
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r21"
>>>> +INC_PR =3D "r22"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://100-uclibc-conf.patch;patch=3D1 \
>>>> diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
>>>> index 0eb1223..931de9a 100644
>>>> --- a/recipes/gcc/gcc-4.2.2.inc
>>>> +++ b/recipes/gcc/gcc-4.2.2.inc
>>>> @@ -3,7 +3,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r15"
>>>> +INC_PR =3D "r16"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://100-uclibc-conf.patch;patch=3D1 \
>>>> diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
>>>> index 1501c7e..b2fb029 100644
>>>> --- a/recipes/gcc/gcc-4.2.3.inc
>>>> +++ b/recipes/gcc/gcc-4.2.3.inc
>>>> @@ -3,7 +3,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r12"
>>>> +INC_PR =3D "r17"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://100-uclibc-conf.patch;patch=3D1 \
>>>> diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
>>>> index 3249c09..e96122a 100644
>>>> --- a/recipes/gcc/gcc-4.2.4.inc
>>>> +++ b/recipes/gcc/gcc-4.2.4.inc
>>>> @@ -3,7 +3,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r9"
>>>> +INC_PR =3D "r10"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://100-uclibc-conf.patch;patch=3D1 \
>>>> diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
>>>> index 0b05f0a..3eaff45 100644
>>>> --- a/recipes/gcc/gcc-4.3.1.inc
>>>> +++ b/recipes/gcc/gcc-4.3.1.inc
>>>> @@ -7,7 +7,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r19"
>>>> +INC_PR =3D "r20"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://fedora/gcc43-c++-builtin-redecl.patch;patc=
h=3D1;pnum=3D0 \
>>>> diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
>>>> index 5483b8f..8d40d72 100644
>>>> --- a/recipes/gcc/gcc-4.3.2.inc
>>>> +++ b/recipes/gcc/gcc-4.3.2.inc
>>>> @@ -7,7 +7,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r9"
>>>> +INC_PR =3D "r10"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://fedora/gcc43-c++-builtin-redecl.patch;patc=
h=3D1;pnum=3D0 \
>>>> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
>>>> index 46d5e35..47bfbc6 100644
>>>> --- a/recipes/gcc/gcc-4.3.3.inc
>>>> +++ b/recipes/gcc/gcc-4.3.3.inc
>>>> @@ -7,7 +7,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r10"
>>>> +INC_PR =3D "r11"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://fedora/gcc43-c++-builtin-redecl.patch;patc=
h=3D1;pnum=3D0 \
>>>> diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
>>>> index 2b1054c..ff02ac5 100644
>>>> --- a/recipes/gcc/gcc-4.3.4.inc
>>>> +++ b/recipes/gcc/gcc-4.3.4.inc
>>>> @@ -7,7 +7,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r7"
>>>> +INC_PR =3D "r8"
>>>>
>>>> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> =C2=A0 =C2=A0 =C2=A0 file://fedora/gcc43-c++-builtin-redecl.patch;patc=
h=3D1;pnum=3D0 \
>>>> diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
>>>> index 9daff95..cbf28dd 100644
>>>> --- a/recipes/gcc/gcc-4.4.1.inc
>>>> +++ b/recipes/gcc/gcc-4.4.1.inc
>>>> @@ -7,7 +7,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r7"
>>>> +INC_PR =3D "r8"
>>>>
>>>> =C2=A0FILESPATHPKG .=3D ":gcc-$PV"
>>>>
>>>> diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
>>>> index 514cc9f..1ef1359 100644
>>>> --- a/recipes/gcc/gcc-4.4.2.inc
>>>> +++ b/recipes/gcc/gcc-4.4.2.inc
>>>> @@ -7,7 +7,7 @@ LICENSE =3D "GPLv3"
>>>>
>>>> =C2=A0DEPENDS =3D "mpfr gmp"
>>>>
>>>> -INC_PR =3D "r0"
>>>> +INC_PR =3D "r1"
>>>>
>>>> =C2=A0FILESPATHPKG .=3D ":gcc-$PV"
>>>>
>>>> diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
>>>> index 6e777e6..97b140c 100644
>>>> --- a/recipes/gcc/gcc-common.inc
>>>> +++ b/recipes/gcc/gcc-common.inc
>>>> @@ -15,6 +15,11 @@ def get_gcc_fpu_setting(bb, d):
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--with-float=3Dsoft"
>>>> =C2=A0 =C2=A0 =C2=A0return ""
>>>>
>>>> +def get_gcc_mips_plt_setting(bb, d):
>>>> + =C2=A0 =C2=A0if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'mips', 'mi=
psel' ] and 'mplt' in bb.data.getVar('DISTRO_FEATURES',d,1).split() :
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--with-mips-plt"
>>>> + =C2=A0 =C2=A0return ""
>>>> +
>>>> =C2=A0# We really need HOST_SYS here for some packages and TARGET_SYS =
for others.
>>>> =C2=A0# For now, libgcc is most important so we fix for that - RP.
>>>> =C2=A0SHLIBSDIR =3D "${STAGING_DIR_TARGET}/shlibs"
>>>> diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-co=
nfigure-common.inc
>>>> index 8a96326..ee6c0e7 100644
>>>> --- a/recipes/gcc/gcc-configure-common.inc
>>>> +++ b/recipes/gcc/gcc-configure-common.inc
>>>> @@ -13,6 +13,8 @@ OBJC_linux-uclibceabi ?=3D ""
>>>> =C2=A0OBJC_linux-uclibc ?=3D ""
>>>> =C2=A0OBJC_avr ?=3D ""
>>>> =C2=A0OBJC_nylon ?=3D ""
>>>> +OBJC_mips ?=3D ""
>>>> +OBJC_mipsel ?=3D ""
>>>> =C2=A0OBJC ?=3D ",objc"
>>>>
>>>> =C2=A0# gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect '=
fortran'
>>>> @@ -36,7 +38,8 @@ EXTRA_OECONF =3D "${@['--enable-clocale=3Dgeneric', =
''][bb.data.getVar('USE_NLS', d,
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--progra=
m-prefix=3D${TARGET_PREFIX} \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_=
OECONF_BASE} \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_=
OECONF_FPU} \
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_OECON=
F_PATHS}"
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_OECON=
F_PATHS} \
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@get_gcc_mips_plt_settin=
g(bb, d)}"
>>>>
>>>> =C2=A0# Build uclibc compilers without cxa_atexit support
>>>> =C2=A0EXTRA_OECONF_append_linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D " --enable-__cxa_atexit"
>>>> diff --git a/recipes/gcc/gcc-cross-initial.inc b/recipes/gcc/gcc-cross=
-initial.inc
>>>> index a2c4445..2ab1d7f 100644
>>>> --- a/recipes/gcc/gcc-cross-initial.inc
>>>> +++ b/recipes/gcc/gcc-cross-initial.inc
>>>> @@ -16,7 +16,8 @@ EXTRA_OECONF =3D "--with-local-prefix=3D${STAGING_DI=
R_TARGET}${target_prefix} \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --program-prefix=3D${=
TARGET_PREFIX} \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-sysroot=3D${ST=
AGING_DIR_TARGET} \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-build-sysroot=
=3D${STAGING_DIR_TARGET} \
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@get_gcc_fpu_setting(bb,=
 d)}"
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@get_gcc_fpu_setting(bb,=
 d)} \
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@get_gcc_mips_plt_settin=
g(bb, d)}"
>>>>
>>>> =C2=A0do_install () {
>>>> =C2=A0 =C2=A0 =C2=A0 :
>>>> diff --git a/recipes/gcc/gcc-cross-intermediate.inc b/recipes/gcc/gcc-=
cross-intermediate.inc
>>>> index ccfa2b4..50792b6 100644
>>>> --- a/recipes/gcc/gcc-cross-intermediate.inc
>>>> +++ b/recipes/gcc/gcc-cross-intermediate.inc
>>>> @@ -14,7 +14,8 @@ EXTRA_OECONF =3D "--with-local-prefix=3D${STAGING_DI=
R_TARGET}${target_prefix} \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --program-prefix=3D${=
TARGET_PREFIX} \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-sysroot=3D${ST=
AGING_DIR_TARGET} \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-build-sysroot=
=3D${STAGING_DIR_TARGET} \
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@get_gcc_fpu_setting(bb,=
 d)}"
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@get_gcc_fpu_setting(bb,=
 d)} \
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@get_gcc_mips_plt_settin=
g(bb, d)}"
>>>>
>>>> =C2=A0do_stage_append () {
>>>> =C2=A0 =C2=A0 =C2=A0 # get rid of dummy libc.so
>>
>> I did an arm build earlier and did not see this message at all.
>> which gcc version are you building ? my guess is that some version
>> does not include gcc-common.inc thats one reason it can happen
>
> So you mean you broke gcc 4.3.3...

eh not intentionally if its so... :)

gcc 4.3.3 recipes include gcc-common.inc so it should get
the function defined. I did not test it 4.3.3, but only with gcc
4.4 and 4.2 I will give it a shot in the next run and see if I can
reproduce it.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLL5cIMkyGM64RGpERAgcMAKC50t+0uY87sloRWJ9azphpuAa0SQCgvDsf
> JtckYxcIzz9Cz1yr/NUo0j4=3D
> =3Dt3de
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


