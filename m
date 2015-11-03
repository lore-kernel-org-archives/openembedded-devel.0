Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 73FEB71633
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 17:56:39 +0000 (UTC)
Received: (qmail 6104 invoked by uid 1003); 3 Nov 2015 17:56:39 -0000
Received: from unknown (HELO ?192.168.11.125?)
	(philip@opensdr.com@108.44.122.7)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	3 Nov 2015 17:56:39 -0000
To: openembedded-devel@lists.openembedded.org
References: <1446228808-18756-1-git-send-email-philip@balister.org>
	<20151030195137.GD2566@jama> <5633CB87.1070903@balister.org>
	<20151103141546.GA2556@jama>
From: Philip Balister <philip@balister.org>
Message-ID: <5638F552.7000609@balister.org>
Date: Tue, 3 Nov 2015 12:56:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20151103141546.GA2556@jama>
Subject: Re: [meta-oe][PATCHv2] llvm: Add recipe for llvm-3.7.0.
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
X-List-Received-Date: Tue, 03 Nov 2015 17:56:44 -0000
X-Groupsio-MsgNum: 58269
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4wj4plhINr2S7qp1BkIq8K8uTQ6ekmFQt"

--4wj4plhINr2S7qp1BkIq8K8uTQ6ekmFQt
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 11/03/2015 09:15 AM, Martin Jansa wrote:
> On Fri, Oct 30, 2015 at 12:56:55PM -0700, Philip Balister wrote:
>> On 10/30/2015 12:51 PM, Martin Jansa wrote:
>>> On Fri, Oct 30, 2015 at 11:13:28AM -0700, Philip Balister wrote:
>>>> From: Philip Balister <philip@opensdr.com>
>>>>
>>>> This version builds in parallel with the 3.3 recipe. I had to use th=
e
>>>> mesa llvmpipe driver, which required updates to llvm and mesa before=
 it
>>>> worked. With updates, I succesfully used the mesa llvmpipe driver.
>>>>
>>>>  * Move the licence file checksum to the version specific part of th=
e recipe
>>>>  * License changed for 3.7.0 due to year change and adding related s=
oftware
>>>>  * llvm source is now compressed with xz not gz.
>>>>  * Disable compiler version check since it checks the host compiler.=

>>>
>>> I made one more change in master-next already, I've renamed it to=20
>>> llvm3.7_3.7.0.bb
>>>
>>> I don't know if there will be 3.7.1 release, but I would assume that =
3.7
>>> series will be ABI compatible, so users of this won't need to update
>>> DEPENDS when switching from 3.7.0 to 3.7.1 (if that exists).
>>>
>>> OK?
>>
>> I tried doing this as 3.7, but for some reason (possibly installing
>> something that required me to set the LLVM_VERSION to the full version=
,
>> not 3.7) led me to version it this way.
>>
>> Check what gets installed as llvmconfig.x.y.x.
>=20
> OK, I won't rename it then :).
>=20
> The --disable-compiler-version-checks in EXTRA_OECONF isn't passed to
> configure:
> http://errors.yoctoproject.org/Errors/Details/21293/

That is the log from do_compile. Apparently configure is getting re-run
with different arguments. Anyone have ideas?

Philip

>=20
>=20
>>
>> Philip
>>
>>>
>>>> Signed-off-by: Philip Balister <philip@opensdr.com>
>>>> ---
>>>>  meta-oe/recipes-core/llvm/llvm.inc           |  6 +++---
>>>>  meta-oe/recipes-core/llvm/llvm3.3_3.3.bb     |  4 ++++
>>>>  meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb | 24 +++++++++++++++++=
+++++++
>>>>  3 files changed, 31 insertions(+), 3 deletions(-)
>>>>  create mode 100644 meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>>>>
>>>> diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-co=
re/llvm/llvm.inc
>>>> index 04c87aa..c9a4ce4 100644
>>>> --- a/meta-oe/recipes-core/llvm/llvm.inc
>>>> +++ b/meta-oe/recipes-core/llvm/llvm.inc
>>>> @@ -23,7 +23,6 @@ HOMEPAGE =3D "http://llvm.org"
>>>>  # 3-clause BSD-like
>>>>  # University of Illinois/NCSA Open Source License
>>>>  LICENSE =3D "NCSA"
>>>> -LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e=
5ffc273ab1f8"
>>>> =20
>>>>  DEPENDS =3D "libffi libxml2-native llvm-common"
>>>> =20
>>>> @@ -32,7 +31,7 @@ inherit perlnative pythonnative autotools
>>>>  LLVM_RELEASE =3D "${PV}"
>>>>  LLVM_DIR =3D "llvm${LLVM_RELEASE}"
>>>> =20
>>>> -SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
>>>> +SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.xz"
>>>>  S =3D "${WORKDIR}/llvm-${PV}.src"
>>>> =20
>>>>  LLVM_BUILD_DIR =3D "${WORKDIR}/llvm-${PV}.build"
>>>> @@ -46,7 +45,8 @@ EXTRA_OECONF +=3D "--disable-assertions \
>>>>                   --enable-libffi \
>>>>                   --enable-optimized \
>>>>                   --enable-shared \
>>>> -                 --enable-targets=3Dhost-only"
>>>> +                 --enable-targets=3Dhost-only \
>>>> +                 --disable-compiler-version-checks"
>>>>  EXTRA_OEMAKE +=3D "REQUIRES_RTTI=3D1 VERBOSE=3D1"
>>>> =20
>>>>  do_configure_prepend() {
>>>> diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/reci=
pes-core/llvm/llvm3.3_3.3.bb
>>>> index 60a2221..f1562f6 100644
>>>> --- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
>>>> +++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
>>>> @@ -1,8 +1,12 @@
>>>>  require llvm.inc
>>>> =20
>>>> +LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e=
5ffc273ab1f8"
>>>> +
>>>>  DEPENDS +=3D "zlib"
>>>>  EXTRA_OECONF +=3D "--enable-zlib"
>>>> =20
>>>> +# Overwrite SRC_URI from include file since older llvm uses .gz com=
pression
>>>> +SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
>>>>  SRC_URI +=3D "file://Remove-error-output-from-configure-if-CFLAGS-i=
s-set-.patch"
>>>> =20
>>>>  SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
>>>> diff --git a/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb b/meta-oe/=
recipes-core/llvm/llvm3.7.0_3.7.0.bb
>>>> new file mode 100644
>>>> index 0000000..813b185
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>>>> @@ -0,0 +1,24 @@
>>>> +require llvm.inc
>>>> +
>>>> +LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D4c0bc17c954e99fd5475=
28d938832bfa"
>>>> +
>>>> +DEPENDS +=3D "zlib"
>>>> +EXTRA_OECONF +=3D "--enable-zlib"
>>>> +
>>>> +SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
>>>> +
>>>> +SRC_URI[md5sum] =3D "b98b9495e5655a672d6cb83e1a180f8e"
>>>> +SRC_URI[sha256sum] =3D "ab45895f9dcdad1e140a3a79fd709f64b05ad7364e3=
08c0e582c5b02e9cc3153"
>>>> +
>>>> +PACKAGECONFIG ??=3D ""
>>>> +PACKAGECONFIG[r600] =3D "--enable-experimental-targets=3DR600,,,"
>>>> +
>>>> +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>>>> +
>>>> +# Fails to build with thumb-1 (qemuarm)
>>>> +# | {standard input}: Assembler messages:
>>>> +# | {standard input}:22: Error: selected processor does not support=
 Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
>>>> +# | {standard input}:31: Error: lo register required -- `ldmia sp!,=
{r0,r1,r2,r3,lr}'
>>>> +# | {standard input}:32: Error: lo register required -- `ldr pc,[sp=
],#4'
>>>> +# | make[3]: *** [/home/jenkins/oe/world/shr-core/tmp-glibc/work/ar=
mv5te-oe-linux-gnueabi/llvm3.3/3.3-r0/llvm-3.3.build/lib/Target/ARM/Relea=
se/ARMJITInfo.o] Error 1
>>>> +ARM_INSTRUCTION_SET =3D "arm"
>>>> --=20
>>>> 1.9.3
>>>>
>>>> --=20
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>>
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20


--4wj4plhINr2S7qp1BkIq8K8uTQ6ekmFQt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOPVSAAoJEMDJd4rr0mer2yUH/2JKyZsCsPkhQz5R/ESuRX9j
ysGOctT7EEary494yLwfehh5IrMrthybwraWNzPn/1VpBID8xJAI0R5ZQ5WTjhkF
C4xjHqNDPq5/fvv/TuSPtCVoayxhTEIek7OXM4REuSHzxSIClVD29dufcMdRR0l+
NRlxOs7fLhKGBAAzhYqRpyLIReCaeGgtqmg8/XNe4TOHDq54tRnkl11s+wVr7gQO
b4JdFNnyqKQ5y3G8O0o3bMeCUaDBK4mJcb5+AvhwUcVAxUtwUTFBpuFXoQX5XYNJ
mV0tHXH9fDRaQOtAVzbpKA45vlyRCbDxkFOTk6HGqhrnCIFWoPR9hxZBQgIR3Ug=
=Px5/
-----END PGP SIGNATURE-----

--4wj4plhINr2S7qp1BkIq8K8uTQ6ekmFQt--
