Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 32E0475E80
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 08:17:45 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so5430463wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=TzQaqrc0FK8+h3xzJcqLe5IbUSkZ6n/0n8cBvfvgpiI=;
	b=hzL9CeBWFVO4dnnG9YF2TABKtEBPiWrc+b8uO58cRY+Sa6lNXgDqM675DcZlra7C5Y
	wLjhafbeN1Ux7iMBt5WC5abcTGQYh+/+biAS5CXEYBs2qB57jriGaLKnJJKWsJOqQNaR
	zSEjXuPbDgwA5ErEsQVKNFI7HW8Lq9UzmTqDydkC9Lq/CI2mBH468XLVkICRaC28SZaa
	yxjcYNGAqbwocUJNcYk/D80ogseGKCZ064m+GlLAbRemuovEQpPR4GDOpC82qeyMAT9M
	WaUQ1bjU0vN/NVclxG+9mmRn6vUhYN3cw6fDmPX+BUsYxMyx1WxSo03sbIwjoDNukXbN
	JfJw==
X-Received: by 10.194.58.84 with SMTP id o20mr8204819wjq.73.1446193065275;
	Fri, 30 Oct 2015 01:17:45 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	t126sm1620533wmd.23.2015.10.30.01.17.44
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Oct 2015 01:17:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <20151029191455.GC2564@jama>
Date: Fri, 30 Oct 2015 09:17:43 +0100
Message-Id: <37B60086-7E99-499A-AEDD-891A4F38F828@gmail.com>
References: <1445901886-17887-1-git-send-email-philip@blister.org>
	<20151029191455.GC2564@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: Philip Balister <philip@opensdr.com>
Subject: Re: [meta-oe][PATCH] llvm: Add recipe for llvm-3.7.0.
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
X-List-Received-Date: Fri, 30 Oct 2015 08:17:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 29.10.2015 um 20:14 schrieb Martin Jansa <martin.jansa@gmail.com>:
>=20
> On Mon, Oct 26, 2015 at 04:24:46PM -0700, Philip Balister wrote:
>> From: Philip Balister <philip@opensdr.com>
>>=20
>> This version builds in parallel with the 3.3 recipe. I had to use the
>> mesa llvmpipe driver, which required updates to llvm and mesa before =
it
>> worked. With updates, I succesfully used the mesa llvmpipe driver.
>>=20
>> * Move the licence file checksum to the version specific part of the =
recipe
>> * License changed for 3.7.0 due to year change and adding related =
software
>> * llvm source is now compressed with xz not gz.
>=20
> It fails to build on older Ubuntu-12.04 with:
> | checking whether GCC is new enough... no
> | configure: error:
> | The selected GCC C++ compiler is not new enough to build LLVM. =
Please upgrade
> | to GCC 4.7. You may pass --disable-compiler-version-checks to =
configure to
> | bypass these sanity checks.
>=20
> Shouldn't it check the cross compiler instead of the native one from
> host? (in this build it was 5.2)

Usually some tools run on the host to preprocess input specifically for
a distribution might be build using the host compiler.

Either Yocto moves to generate native tools during bootstrapping itself
or you have to update :(

>> Signed-off-by: Philip Balister <philip@opensdr.com>
>> ---
>> meta-oe/recipes-core/llvm/llvm.inc           |  3 +--
>> meta-oe/recipes-core/llvm/llvm3.3_3.3.bb     |  4 ++++
>> meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb | 24 =
++++++++++++++++++++++++
>> 3 files changed, 29 insertions(+), 2 deletions(-)
>> create mode 100644 meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>>=20
>> diff --git a/meta-oe/recipes-core/llvm/llvm.inc =
b/meta-oe/recipes-core/llvm/llvm.inc
>> index 04c87aa..7df4f4c 100644
>> --- a/meta-oe/recipes-core/llvm/llvm.inc
>> +++ b/meta-oe/recipes-core/llvm/llvm.inc
>> @@ -23,7 +23,6 @@ HOMEPAGE =3D "http://llvm.org"
>> # 3-clause BSD-like
>> # University of Illinois/NCSA Open Source License
>> LICENSE =3D "NCSA"
>> -LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
>>=20
>> DEPENDS =3D "libffi libxml2-native llvm-common"
>>=20
>> @@ -32,7 +31,7 @@ inherit perlnative pythonnative autotools
>> LLVM_RELEASE =3D "${PV}"
>> LLVM_DIR =3D "llvm${LLVM_RELEASE}"
>>=20
>> -SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
>> +SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.xz"
>> S =3D "${WORKDIR}/llvm-${PV}.src"
>>=20
>> LLVM_BUILD_DIR =3D "${WORKDIR}/llvm-${PV}.build"
>> diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb =
b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
>> index 60a2221..f1562f6 100644
>> --- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
>> +++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
>> @@ -1,8 +1,12 @@
>> require llvm.inc
>>=20
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
>> +
>> DEPENDS +=3D "zlib"
>> EXTRA_OECONF +=3D "--enable-zlib"
>>=20
>> +# Overwrite SRC_URI from include file since older llvm uses .gz =
compression
>> +SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
>> SRC_URI +=3D =
"file://Remove-error-output-from-configure-if-CFLAGS-is-set-.patch"
>>=20
>> SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
>> diff --git a/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb =
b/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>> new file mode 100644
>> index 0000000..813b185
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>> @@ -0,0 +1,24 @@
>> +require llvm.inc
>> +
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3D4c0bc17c954e99fd547528d938832bfa"
>> +
>> +DEPENDS +=3D "zlib"
>> +EXTRA_OECONF +=3D "--enable-zlib"
>> +
>> +SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
>> +
>> +SRC_URI[md5sum] =3D "b98b9495e5655a672d6cb83e1a180f8e"
>> +SRC_URI[sha256sum] =3D =
"ab45895f9dcdad1e140a3a79fd709f64b05ad7364e308c0e582c5b02e9cc3153"
>> +
>> +PACKAGECONFIG ??=3D ""
>> +PACKAGECONFIG[r600] =3D "--enable-experimental-targets=3DR600,,,"
>> +
>> +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>> +
>> +# Fails to build with thumb-1 (qemuarm)
>> +# | {standard input}: Assembler messages:
>> +# | {standard input}:22: Error: selected processor does not support =
Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
>> +# | {standard input}:31: Error: lo register required -- `ldmia =
sp!,{r0,r1,r2,r3,lr}'
>> +# | {standard input}:32: Error: lo register required -- `ldr =
pc,[sp],#4'
>> +# | make[3]: *** =
[/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/l=
lvm3.3/3.3-r0/llvm-3.3.build/lib/Target/ARM/Release/ARMJITInfo.o] Error =
1
>> +ARM_INSTRUCTION_SET =3D "arm"
>> --=20
>> 1.9.3
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Jens Rehsack - rehsack@gmail.com


