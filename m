Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NMkPi-00018s-7F for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 16:43:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NMkNw-0000W9-9i
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 16:41:24 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 16:41:24 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 16:41:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 21 Dec 2009 16:40:57 +0100
Message-ID: <hgo4u8$uil$1@ger.gmane.org>
References: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>	<hgneg9$kka$1@ger.gmane.org>
	<19c1b8a90912210711w560614betc4ff2fe27b3032c8@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091219 Shredder/3.0.1pre
In-Reply-To: <19c1b8a90912210711w560614betc4ff2fe27b3032c8@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Mon, 21 Dec 2009 15:43:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-12-09 16:11, Khem Raj wrote:
> On Mon, Dec 21, 2009 at 1:18 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Why am I getting these errors:
>>
>> NOTE: <type 'exceptions.NameError'>:name 'get_gcc_mips_plt_setting' is
>> not defined while evaluating:
>>
>> when building kernel modules for an arm machine?
>>
>> On 19-12-09 23:26, Khem Raj wrote:
>>> * Newer gcc (4.4+) has implemented -mplt option to
>>>   enable PLT and copy relocation extentions of MIPS ABI
>>>   which makes shared code run a lot faster. This feature
>>>   is however controlled by DISTRO_FEATURES which should
>>>   add 'mplt' to DISTRO_FEATURES to enable it.
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  recipes/gcc/gcc-3.3.4.inc              |    2 +-
>>>  recipes/gcc/gcc-3.4.3.inc              |    2 +-
>>>  recipes/gcc/gcc-3.4.4.inc              |    2 +-
>>>  recipes/gcc/gcc-4.1.0.inc              |    2 +-
>>>  recipes/gcc/gcc-4.1.1.inc              |    2 +-
>>>  recipes/gcc/gcc-4.1.2.inc              |    2 +-
>>>  recipes/gcc/gcc-4.2.2.inc              |    2 +-
>>>  recipes/gcc/gcc-4.2.3.inc              |    2 +-
>>>  recipes/gcc/gcc-4.2.4.inc              |    2 +-
>>>  recipes/gcc/gcc-4.3.1.inc              |    2 +-
>>>  recipes/gcc/gcc-4.3.2.inc              |    2 +-
>>>  recipes/gcc/gcc-4.3.3.inc              |    2 +-
>>>  recipes/gcc/gcc-4.3.4.inc              |    2 +-
>>>  recipes/gcc/gcc-4.4.1.inc              |    2 +-
>>>  recipes/gcc/gcc-4.4.2.inc              |    2 +-
>>>  recipes/gcc/gcc-common.inc             |    5 +++++
>>>  recipes/gcc/gcc-configure-common.inc   |    5 ++++-
>>>  recipes/gcc/gcc-cross-initial.inc      |    3 ++-
>>>  recipes/gcc/gcc-cross-intermediate.inc |    3 ++-
>>>  19 files changed, 28 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/recipes/gcc/gcc-3.3.4.inc b/recipes/gcc/gcc-3.3.4.inc
>>> index 635e617..a3fbdde 100644
>>> --- a/recipes/gcc/gcc-3.3.4.inc
>>> +++ b/recipes/gcc/gcc-3.3.4.inc
>>> @@ -1,6 +1,6 @@
>>>  require gcc-common.inc
>>>
>>> -INC_PR = "r10"
>>> +INC_PR = "r11"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/releases/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>          file://arm-gotoff.dpatch;patch=1;pnum=0 \
>>> diff --git a/recipes/gcc/gcc-3.4.3.inc b/recipes/gcc/gcc-3.4.3.inc
>>> index 72f9042..febe0fc 100644
>>> --- a/recipes/gcc/gcc-3.4.3.inc
>>> +++ b/recipes/gcc/gcc-3.4.3.inc
>>> @@ -1,6 +1,6 @@
>>>  require gcc-common.inc
>>>
>>> -INC_PR = "r18"
>>> +INC_PR = "r19"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>          file://gcc34-reverse-compare.patch;patch=1 \
>>> diff --git a/recipes/gcc/gcc-3.4.4.inc b/recipes/gcc/gcc-3.4.4.inc
>>> index 9a02c5d..b87e1e3 100644
>>> --- a/recipes/gcc/gcc-3.4.4.inc
>>> +++ b/recipes/gcc/gcc-3.4.4.inc
>>> @@ -1,6 +1,6 @@
>>>  require gcc-common.inc
>>>
>>> -INC_PR = "r14"
>>> +INC_PR = "r15"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>          file://gcc34-reverse-compare.patch;patch=1 \
>>> diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
>>> index 7bb1a34..df0ae3f 100644
>>> --- a/recipes/gcc/gcc-4.1.0.inc
>>> +++ b/recipes/gcc/gcc-4.1.0.inc
>>> @@ -1,6 +1,6 @@
>>>  require gcc-common.inc
>>>
>>> -INC_PR = "r9"
>>> +INC_PR = "r10"
>>>
>>>  DEFAULT_PREFERENCE = "-1"
>>>
>>> diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
>>> index 68323ac..a960b41 100644
>>> --- a/recipes/gcc/gcc-4.1.1.inc
>>> +++ b/recipes/gcc/gcc-4.1.1.inc
>>> @@ -2,7 +2,7 @@ require gcc-common.inc
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r0"
>>> +INC_PR = "r1"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://100-uclibc-conf.patch;patch=1 \
>>> diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
>>> index 911d2d9..21bf486 100644
>>> --- a/recipes/gcc/gcc-4.1.2.inc
>>> +++ b/recipes/gcc/gcc-4.1.2.inc
>>> @@ -2,7 +2,7 @@ require gcc-common.inc
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r21"
>>> +INC_PR = "r22"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://100-uclibc-conf.patch;patch=1 \
>>> diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
>>> index 0eb1223..931de9a 100644
>>> --- a/recipes/gcc/gcc-4.2.2.inc
>>> +++ b/recipes/gcc/gcc-4.2.2.inc
>>> @@ -3,7 +3,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r15"
>>> +INC_PR = "r16"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://100-uclibc-conf.patch;patch=1 \
>>> diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
>>> index 1501c7e..b2fb029 100644
>>> --- a/recipes/gcc/gcc-4.2.3.inc
>>> +++ b/recipes/gcc/gcc-4.2.3.inc
>>> @@ -3,7 +3,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r12"
>>> +INC_PR = "r17"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://100-uclibc-conf.patch;patch=1 \
>>> diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
>>> index 3249c09..e96122a 100644
>>> --- a/recipes/gcc/gcc-4.2.4.inc
>>> +++ b/recipes/gcc/gcc-4.2.4.inc
>>> @@ -3,7 +3,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r9"
>>> +INC_PR = "r10"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://100-uclibc-conf.patch;patch=1 \
>>> diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
>>> index 0b05f0a..3eaff45 100644
>>> --- a/recipes/gcc/gcc-4.3.1.inc
>>> +++ b/recipes/gcc/gcc-4.3.1.inc
>>> @@ -7,7 +7,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r19"
>>> +INC_PR = "r20"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
>>> diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
>>> index 5483b8f..8d40d72 100644
>>> --- a/recipes/gcc/gcc-4.3.2.inc
>>> +++ b/recipes/gcc/gcc-4.3.2.inc
>>> @@ -7,7 +7,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r9"
>>> +INC_PR = "r10"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
>>> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
>>> index 46d5e35..47bfbc6 100644
>>> --- a/recipes/gcc/gcc-4.3.3.inc
>>> +++ b/recipes/gcc/gcc-4.3.3.inc
>>> @@ -7,7 +7,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r10"
>>> +INC_PR = "r11"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
>>> diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
>>> index 2b1054c..ff02ac5 100644
>>> --- a/recipes/gcc/gcc-4.3.4.inc
>>> +++ b/recipes/gcc/gcc-4.3.4.inc
>>> @@ -7,7 +7,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r7"
>>> +INC_PR = "r8"
>>>
>>>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>       file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
>>> diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
>>> index 9daff95..cbf28dd 100644
>>> --- a/recipes/gcc/gcc-4.4.1.inc
>>> +++ b/recipes/gcc/gcc-4.4.1.inc
>>> @@ -7,7 +7,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r7"
>>> +INC_PR = "r8"
>>>
>>>  FILESPATHPKG .= ":gcc-$PV"
>>>
>>> diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
>>> index 514cc9f..1ef1359 100644
>>> --- a/recipes/gcc/gcc-4.4.2.inc
>>> +++ b/recipes/gcc/gcc-4.4.2.inc
>>> @@ -7,7 +7,7 @@ LICENSE = "GPLv3"
>>>
>>>  DEPENDS = "mpfr gmp"
>>>
>>> -INC_PR = "r0"
>>> +INC_PR = "r1"
>>>
>>>  FILESPATHPKG .= ":gcc-$PV"
>>>
>>> diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
>>> index 6e777e6..97b140c 100644
>>> --- a/recipes/gcc/gcc-common.inc
>>> +++ b/recipes/gcc/gcc-common.inc
>>> @@ -15,6 +15,11 @@ def get_gcc_fpu_setting(bb, d):
>>>          return "--with-float=soft"
>>>      return ""
>>>
>>> +def get_gcc_mips_plt_setting(bb, d):
>>> +    if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'mips', 'mipsel' ] and 'mplt' in bb.data.getVar('DISTRO_FEATURES',d,1).split() :
>>> +        return "--with-mips-plt"
>>> +    return ""
>>> +
>>>  # We really need HOST_SYS here for some packages and TARGET_SYS for others.
>>>  # For now, libgcc is most important so we fix for that - RP.
>>>  SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
>>> diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
>>> index 8a96326..ee6c0e7 100644
>>> --- a/recipes/gcc/gcc-configure-common.inc
>>> +++ b/recipes/gcc/gcc-configure-common.inc
>>> @@ -13,6 +13,8 @@ OBJC_linux-uclibceabi ?= ""
>>>  OBJC_linux-uclibc ?= ""
>>>  OBJC_avr ?= ""
>>>  OBJC_nylon ?= ""
>>> +OBJC_mips ?= ""
>>> +OBJC_mipsel ?= ""
>>>  OBJC ?= ",objc"
>>>
>>>  # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
>>> @@ -36,7 +38,8 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
>>>                  --program-prefix=${TARGET_PREFIX} \
>>>                  ${EXTRA_OECONF_BASE} \
>>>                  ${EXTRA_OECONF_FPU} \
>>> -                ${EXTRA_OECONF_PATHS}"
>>> +                ${EXTRA_OECONF_PATHS} \
>>> +             ${@get_gcc_mips_plt_setting(bb, d)}"
>>>
>>>  # Build uclibc compilers without cxa_atexit support
>>>  EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
>>> diff --git a/recipes/gcc/gcc-cross-initial.inc b/recipes/gcc/gcc-cross-initial.inc
>>> index a2c4445..2ab1d7f 100644
>>> --- a/recipes/gcc/gcc-cross-initial.inc
>>> +++ b/recipes/gcc/gcc-cross-initial.inc
>>> @@ -16,7 +16,8 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
>>>               --program-prefix=${TARGET_PREFIX} \
>>>               --with-sysroot=${STAGING_DIR_TARGET} \
>>>               --with-build-sysroot=${STAGING_DIR_TARGET} \
>>> -             ${@get_gcc_fpu_setting(bb, d)}"
>>> +             ${@get_gcc_fpu_setting(bb, d)} \
>>> +             ${@get_gcc_mips_plt_setting(bb, d)}"
>>>
>>>  do_install () {
>>>       :
>>> diff --git a/recipes/gcc/gcc-cross-intermediate.inc b/recipes/gcc/gcc-cross-intermediate.inc
>>> index ccfa2b4..50792b6 100644
>>> --- a/recipes/gcc/gcc-cross-intermediate.inc
>>> +++ b/recipes/gcc/gcc-cross-intermediate.inc
>>> @@ -14,7 +14,8 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
>>>               --program-prefix=${TARGET_PREFIX} \
>>>               --with-sysroot=${STAGING_DIR_TARGET} \
>>>               --with-build-sysroot=${STAGING_DIR_TARGET} \
>>> -             ${@get_gcc_fpu_setting(bb, d)}"
>>> +             ${@get_gcc_fpu_setting(bb, d)} \
>>> +             ${@get_gcc_mips_plt_setting(bb, d)}"
>>>
>>>  do_stage_append () {
>>>       # get rid of dummy libc.so
> 
> I did an arm build earlier and did not see this message at all.
> which gcc version are you building ? my guess is that some version
> does not include gcc-common.inc thats one reason it can happen

So you mean you broke gcc 4.3.3...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLL5cIMkyGM64RGpERAgcMAKC50t+0uY87sloRWJ9azphpuAa0SQCgvDsf
JtckYxcIzz9Cz1yr/NUo0j4=
=t3de
-----END PGP SIGNATURE-----



