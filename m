Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7448377A2C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 15:14:18 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id k3so1369262pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3Eig2jK771fUfCq0Ozk8lXjTXSTVIdu6N1JvW4eSbrk=;
	b=oHLJaNAOKdHlFNYAp28T2nKe0+T57IimgCiyBLVbIaKoASBORAR3x9F5NhoK39P9Bv
	ZF/rIuozV5lISl7MIxTelJxz5Tdu9fy73hmn3KvjiPu3BIWk0dRIkpwU5gYtg5zKq9Y3
	+5gUeSyNbCLNHpAk3HsXqtkfDNyYoArj3fwvB1lZvzs5bEImj9sLjuDmYx4Z3CAy5ksh
	I20rHZK0iO9VZJ32fn5UCXT5nwifIMIcpPqoyy/CZwUR066HU1HSilNJgrBpY+2wNQtN
	ttMgGZe01VMabZ1fNap1LnL6k4CPCXylLGKcpoVwRxKTZ77Il6KRN68ba6wx3VFiCF8q
	JS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3Eig2jK771fUfCq0Ozk8lXjTXSTVIdu6N1JvW4eSbrk=;
	b=n4kAbBBxt3HbLAGNeYY3n+LO5qzie+Uy0b16o6dZtKOqPkbEBhv9zbpqGvGCQqkTDY
	qBP6cb2nk7hkYEA6a4VRNXA/+3WiUPFcjbx/jpGskLfoQiAALtetT5dZcJwNB1xy/OJi
	NBAe8hZLbx7tgjykjV7SFAGyLEaSmKEg71Cum+sEq4FeNflX7GT1yYdmFT4hySzTO9uC
	ryfabdbpenFxDyrFvhHgoXo37IgqpRqb5ZbGRN90HTyqeBAj1eKtbBV/LpqO4S85Tud/
	l+8VT1GSzkypzMra8UrrigOqdNtWJfMAY1on28yfKs61PVOX3YVnQe2wMLnxPsS3aT5t
	y61Q==
X-Gm-Message-State: AHYfb5jl76t/+PVfRJJ8gP8Q+fYPE98YHFAex6StJsLhCqU4zXFYXaif
	JsP+Va22+gLzscwM7G3R705bfDS9lQ==
X-Received: by 10.84.216.75 with SMTP id f11mr3369598plj.444.1503501259254;
	Wed, 23 Aug 2017 08:14:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 23 Aug 2017 08:13:48 -0700 (PDT)
In-Reply-To: <CA+chaQd8mp+6F87UY9da24nZrQ2=qdsY5=2ymU9cUVmD2DpMPA@mail.gmail.com>
References: <20170818164949.24616-1-raj.khem@gmail.com>
	<CA+chaQd8mp+6F87UY9da24nZrQ2=qdsY5=2ymU9cUVmD2DpMPA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Aug 2017 08:13:48 -0700
Message-ID: <CAMKF1sq-gLkOqRvZfsi9bWqmMOCX8Yup_Zcfr2yR5xeJcvq_WA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V3] efivar: Upgrade to 0.31
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
X-List-Received-Date: Wed, 23 Aug 2017 15:14:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2017 at 4:38 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Fails here in qemux86 build with:
>
> DEBUG: Executing shell function do_compile
> NOTE: make -j 24 AR=3Dgcc-ar
> make[1]: Entering directory
> `TOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src'
> make -f
> TOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/Make.deps de=
ps
> SOURCES=3D"crc32.c creator.c disk.c gpt.c linux.c loadopt.c dp.c dp-acpi.=
c
> dp-hw.c dp-media.c dp-message.c efivarfs.c error.c export.c guid.c guids.=
S
> guid-symbols.c lib.c vars.c makeguids.c guid.c
> include/efivar/efiboot-creator.h include/efivar/efiboot.h
> include/efivar/efiboot-loadopt.h include/efivar/efivar-dp.h
> include/efivar/efivar-guids.h include/efivar/efivar.h
> include/efivar/efivar-guids.h guid-symbols.c efivar.c"
> make[2]: Entering directory
> `TOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src'
> make[2]: Nothing to be done for `deps'.
> make[2]: Leaving directory
> `TOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src'
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o dp.o dp.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o guid-symbols.o guid-symbols.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o lib.o lib.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o vars.o vars.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o crc32.o crc32.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o creator.o creator.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o disk.o disk.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o gpt.o gpt.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o linux.o linux.c
> gcc
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe
> -ITOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src/include/ef=
ivar/
> -specs=3DTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/gcc.spe=
cs
> -fPIC
> -isystemTOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/recipe-sysro=
ot-native/usr/include
> -c -o loadopt.o loadopt.c
> dp.c: In function =E2=80=98efidp_duplicate_extra=E2=80=99:
> dp.c:78:2: warning: implicit declaration of function =E2=80=98_Generic=E2=
=80=99
> [-Wimplicit-function-declaration]
>   if (add(sz, extra, &plus)) {
>   ^
> In file included from dp.c:27:0:
> util.h:109:10: error: expected expression before =E2=80=98int=E2=80=99
>           int *: int_add(a,b,c),   \
>           ^

I have gcc 7.1 on my build host and I dont see efivar-native failing
what should I do to reproduce it

> dp.c:78:6: note: in expansion of macro =E2=80=98add=E2=80=99
>   if (add(sz, extra, &plus)) {
>       ^
> dp.c:65:58: warning: unused parameter =E2=80=98extra=E2=80=99 [-Wunused-p=
arameter]
>  efidp_duplicate_extra(const_efidp dp, efidp *out, size_t extra)
>                                                           ^
> In file included from dp.c:27:0:
> dp.c: In function =E2=80=98efidp_append_path=E2=80=99:
> util.h:109:10: error: expected expression before =E2=80=98int=E2=80=99
>           int *: int_add(a,b,c),   \
>           ^
> dp.c:164:6: note: in expansion of macro =E2=80=98add=E2=80=99
>   if (add(lsz, rsz, &newsz)) {
>       ^
> dp.c: In function =E2=80=98efidp_append_node=E2=80=99:
> util.h:109:10: error: expected expression before =E2=80=98int=E2=80=99
>           int *: int_add(a,b,c),   \
>           ^
> dp.c:221:7: note: in expansion of macro =E2=80=98add=E2=80=99
>    if (add(rsz, sizeof(end_entire), &newsz)) {
>        ^
> util.h:109:10: error: expected expression before =E2=80=98int=E2=80=99
>           int *: int_add(a,b,c),   \
>           ^
> dp.c:257:6: note: in expansion of macro =E2=80=98add=E2=80=99
>   if (add(lsz, rsz, &newsz) || add(newsz, sizeof(end_entire), &newsz)) {
>       ^
> util.h:109:10: error: expected expression before =E2=80=98int=E2=80=99
>           int *: int_add(a,b,c),   \
>           ^
> dp.c:257:31: note: in expansion of macro =E2=80=98add=E2=80=99
>   if (add(lsz, rsz, &newsz) || add(newsz, sizeof(end_entire), &newsz)) {
>                                ^
> make[1]: *** [dp.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory
> `TOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/git/src'
> make: *** [all] Error 2
> ERROR: oe_runmake failed
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_compile (log file is located at
> TOPDIR/BUILD/work/x86_64-linux/efivar-native/0.31-r0/temp/log.do_compile.=
7593)
>
>
>
> On Fri, Aug 18, 2017 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...some-extra-const-that-gcc-complains-about.patch | 44 ---------------
>>  ...Do-not-use-__bswap_constant_-16-32-macros.patch | 37 ++++++++++++
>>  ...-version-new-way-symbol-versioning-breaks.patch | 66
>> ----------------------
>>  .../efivar/efivar/0002-disable-static-build.patch  | 33 -----------
>>  .../0004-fix-unknow-option-for-gold-linker.patch   | 15 ++---
>>  .../fix-compile-failure-with-host-gcc-4.6.patch    | 13 ++---
>>  .../efivar/efivar/musl-strndupa.patch              | 17 ++++++
>>  .../efivar/{efivar_0.24.bb =3D> efivar_0.31.bb}      |  9 ++-
>>  8 files changed, 69 insertions(+), 165 deletions(-)
>>  delete mode 100644
>> meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that=
-gcc-complains-about.patch
>>  create mode 100644
>> meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bswap=
_constant_-16-32-macros.patch
>>  delete mode 100644
>> meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symb=
ol-versioning-breaks.patch
>>  delete mode 100644
>> meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
>>  create mode 100644
>> meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch
>>  rename meta-oe/recipes-extended/efivar/{efivar_0.24.bb =3D> efivar_0.31=
.bb}
>> (83%)
>>
>> diff --git
>> a/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-th=
at-gcc-complains-about.patch
>> b/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-th=
at-gcc-complains-about.patch
>> deleted file mode 100644
>> index 4ae8cb90f..000000000
>> ---
>> a/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-th=
at-gcc-complains-about.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -From 29a2dea16113b5a8e51de46437c6a9f7426c5867 Mon Sep 17 00:00:00 2001
>> -From: Peter Jones <pjones@redhat.com>
>> -Date: Mon, 6 Feb 2017 14:28:19 -0500
>> -Subject: [PATCH 1/2] Remove some extra "const" that gcc complains about=
.
>> -
>> -One of these days I'll get these right.
>> -
>> -Signed-off-by: Peter Jones <pjones@redhat.com>
>> ----
>> - src/include/efivar/efiboot-loadopt.h | 4 ++--
>> - src/loadopt.c                        | 2 +-
>> - 2 files changed, 3 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/src/include/efivar/efiboot-loadopt.h
>> b/src/include/efivar/efiboot-loadopt.h
>> -index 07db5c4..efc29c6 100644
>> ---- a/src/include/efivar/efiboot-loadopt.h
>> -+++ b/src/include/efivar/efiboot-loadopt.h
>> -@@ -32,8 +32,8 @@ extern ssize_t efi_loadopt_create(uint8_t *buf, ssize=
_t
>> size,
>> -
>> - extern efidp efi_loadopt_path(efi_load_option *opt, ssize_t limit)
>> -       __attribute__((__nonnull__ (1)));
>> --extern const unsigned char const * efi_loadopt_desc(efi_load_option
>> *opt,
>> --                                                  ssize_t limit)
>> -+extern const unsigned char * efi_loadopt_desc(efi_load_option *opt,
>> -+                                            ssize_t limit)
>> -       __attribute__((__visibility__ ("default")))
>> -       __attribute__((__nonnull__ (1)));
>> - extern uint32_t efi_loadopt_attrs(efi_load_option *opt)
>> -diff --git a/src/loadopt.c b/src/loadopt.c
>> -index 64e333f..ec50722 100644
>> ---- a/src/loadopt.c
>> -+++ b/src/loadopt.c
>> -@@ -336,7 +336,7 @@ teardown(void)
>> -
>> - __attribute__((__nonnull__ (1)))
>> - __attribute__((__visibility__ ("default")))
>> --const unsigned char const *
>> -+const unsigned char *
>> - efi_loadopt_desc(efi_load_option *opt, ssize_t limit)
>> - {
>> -       if (last_desc) {
>> ---
>> -2.12.2
>> -
>> diff --git
>> a/meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bsw=
ap_constant_-16-32-macros.patch
>> b/meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bsw=
ap_constant_-16-32-macros.patch
>> new file mode 100644
>> index 000000000..73a772186
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bsw=
ap_constant_-16-32-macros.patch
>> @@ -0,0 +1,37 @@
>> +From 98b33d4193998687aa3a78c097f7bd4c393e0c85 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 15 Jul 2017 00:29:42 -0700
>> +Subject: [PATCH] makeguids: Do not use __bswap_constant_{16|32} macros
>> +
>> +not available on musl
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/makeguids.c | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/src/makeguids.c b/src/makeguids.c
>> +index da2f5f7..daf821a 100644
>> +--- a/src/makeguids.c
>> ++++ b/src/makeguids.c
>> +@@ -155,13 +155,13 @@ main(int argc, char *argv[])
>> + #if BYTE_ORDER =3D=3D BIG_ENDIAN\n\
>> + #define cpu_to_be32(n) (n)\n\
>> + #define cpu_to_be16(n) (n)\n\
>> +-#define cpu_to_le32(n) (__bswap_constant_32(n))\n\
>> +-#define cpu_to_le16(n) (__bswap_constant_16(n))\n\
>> ++#define cpu_to_le32(n) ((uint32_t) ((n)>>24 | (n)>>8&0xff00 |
>> (n)<<8&0xff0000 | (n)<<24))\n\
>> ++#define cpu_to_le16(n) ((uint16_t) ((n)<<8 | (n)>>8))\n\
>> + #else\n\
>> + #define cpu_to_le32(n) (n)\n\
>> + #define cpu_to_le16(n) (n)\n\
>> +-#define cpu_to_be32(n) (__bswap_constant_32(n))\n\
>> +-#define cpu_to_be16(n) (__bswap_constant_16(n))\n\
>> ++#define cpu_to_be32(n) ((uint32_t) ((n)>>24 | (n)>>8&0xff00 |
>> (n)<<8&0xff0000 | (n)<<24))\n\
>> ++#define cpu_to_be16(n) ((uint16_t) ((n)<<8 | (n)>>8))\n\
>> + #endif\n\
>> + """);
>> +
>> +--
>> +2.13.3
>> +
>> diff --git
>> a/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-sy=
mbol-versioning-breaks.patch
>> b/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-sy=
mbol-versioning-breaks.patch
>> deleted file mode 100644
>> index 737b78b01..000000000
>> ---
>> a/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-sy=
mbol-versioning-breaks.patch
>> +++ /dev/null
>> @@ -1,66 +0,0 @@
>> -From 31e655d2b5f66e772d9714422b7332bbaa60d2e6 Mon Sep 17 00:00:00 2001
>> -From: Peter Jones <pjones@redhat.com>
>> -Date: Mon, 6 Feb 2017 14:41:58 -0500
>> -Subject: [PATCH 2/2] New gcc version, new way symbol versioning breaks.
>> -
>> -Apparently I get to redo this every time there's a compiler release.
>> -Yaaaaaay.
>> -
>> -Anyway, the current method is to define the two compat things from the
>> -land before time as @libefivar.so.0 symbols and list them there in the
>> -link map.  Then we have the real one defined with another name, and set
>> -as efi_set_variable@@LIBEFIVAR_0.24.  Then to make there actually be a
>> -efi_set_variable symbol to link against, we create it as a weak alias.
>> -
>> -This is all completely absurd.
>> -
>> -Signed-off-by: Peter Jones <pjones@redhat.com>
>> ----
>> - src/lib.c | 17 ++++++++++++-----
>> - 1 file changed, 12 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/src/lib.c b/src/lib.c
>> -index 6a9b392..afa7d94 100644
>> ---- a/src/lib.c
>> -+++ b/src/lib.c
>> -@@ -49,7 +49,7 @@ _efi_set_variable(efi_guid_t guid, const char *name,
>> uint8_t *data,
>> - {
>> -       return ops->set_variable(guid, name, data, data_size, attributes=
,
>> 0600);
>> - }
>> --__asm__(".symver _efi_set_variable,_efi_set_variable@");
>> -+__asm__(".symver _efi_set_variable,_efi_set_variable@libefivar.so.0");
>> -
>> - int
>> - __attribute__((__nonnull__ (2, 3)))
>> -@@ -59,17 +59,24 @@ _efi_set_variable_variadic(efi_guid_t guid, const
>> char *name, uint8_t *data,
>> - {
>> -       return ops->set_variable(guid, name, data, data_size, attributes=
,
>> 0600);
>> - }
>> --__asm__(".symver _efi_set_variable_variadic,efi_set_variable@");
>> -+__asm__(".symver
>> _efi_set_variable_variadic,efi_set_variable@libefivar.so.0");
>> -
>> - int
>> - __attribute__((__nonnull__ (2, 3)))
>> - __attribute__((__visibility__ ("default")))
>> --efi_set_variable(efi_guid_t guid, const char *name, uint8_t *data,
>> --               size_t data_size, uint32_t attributes, mode_t mode)
>> -+_efi_set_variable_mode(efi_guid_t guid, const char *name, uint8_t *dat=
a,
>> -+                     size_t data_size, uint32_t attributes, mode_t mod=
e)
>> - {
>> -       return ops->set_variable(guid, name, data, data_size, attributes=
,
>> mode);
>> - }
>> --__asm__(".symver efi_set_variable,efi_set_variable@@LIBEFIVAR_0.24");
>> -+__asm__(".symver
>> _efi_set_variable_mode,efi_set_variable@@LIBEFIVAR_0.24");
>> -+
>> -+int
>> -+__attribute__((__nonnull__ (2, 3)))
>> -+__attribute__((__visibility__ ("default")))
>> -+efi_set_variable(efi_guid_t guid, const char *name, uint8_t *data,
>> -+               size_t data_size, uint32_t attributes, mode_t mode)
>> -+      __attribute((weak, alias ("_efi_set_variable_mode")));
>> -
>> - int
>> - __attribute__((__nonnull__ (2, 3)))
>> ---
>> -2.12.2
>> -
>> diff --git
>> a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
>> b/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
>> deleted file mode 100644
>> index 951b15921..000000000
>> ---
>> a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon Sep 17 00:00:00 2001
>> -From: Koen Kooi <koen.kooi@linaro.org>
>> -Date: Fri, 4 Mar 2016 14:53:55 +0100
>> -Subject: [PATCH 2/2] disable static build
>> -
>> -Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> -
>> -Upstream-Status: Inappropriate [meta-oe specific]
>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> -
>> ----
>> - src/Makefile | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/src/Makefile b/src/Makefile
>> -index 1829d22..c7a0ca3 100644
>> ---- a/src/Makefile
>> -+++ b/src/Makefile
>> -@@ -8,9 +8,9 @@ include $(TOPDIR)/Make.defaults
>> -
>> - LIBTARGETS=3Dlibefivar.so libefiboot.so
>> - STATICLIBTARGETS=3Dlibefivar.a libefiboot.a
>> --BINTARGETS=3Defivar efivar-static
>> -+BINTARGETS=3Defivar
>> - PCTARGETS=3Defivar.pc efiboot.pc
>> --TARGETS=3D$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGETS)
>> -+TARGETS=3D$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS)
>> -
>> - LIBEFIBOOT_SOURCES =3D crc32.c creator.c disk.c gpt.c linux.c loadopt.=
c
>> - LIBEFIBOOT_OBJECTS =3D $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES))
>> ---
>> -2.4.3
>> -
>> diff --git
>> a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold=
-linker.patch
>> b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold=
-linker.patch
>> index 5d50c1906..96d0c6b3b 100644
>> ---
>> a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold=
-linker.patch
>> +++
>> b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold=
-linker.patch
>> @@ -23,16 +23,13 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>   gcc.specs | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> -diff --git a/gcc.specs b/gcc.specs
>> -index 24fabc2..5b0fdef 100644
>> ---- a/gcc.specs
>> -+++ b/gcc.specs
>> +Index: git/gcc.specs
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/gcc.specs
>> ++++ git/gcc.specs
>>  @@ -14,4 +14,4 @@
>>   + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings
>> -Wl,-static -static -Wl,-z,relro,-z,now}
>>
>>   *link:
>> --+ %{!static:--fatal-warnings} --no-undefined-version
>> --no-allow-shlib-undefined --add-needed -z now --build-id
>> %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%<pie}
>> -++ %{!static:--fatal-warnings} --no-undefined-version
>> --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}}
>> %{shared:-z relro -fPIC} %{static:%<pie}
>> ---
>> -2.8.1
>> -
>> +-+ %{!static:--fatal-warnings} --no-undefined-version
>> --no-allow-shlib-undefined --add-needed -z now --build-id
>> %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
>> +++ %{!static:--fatal-warnings} --no-undefined-version
>> --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}}
>> %{shared:-z relro} %{static:%<pie}
>> diff --git
>> a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-g=
cc-4.6.patch
>> b/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-g=
cc-4.6.patch
>> index 1c68a2934..e3fa2e1c1 100644
>> ---
>> a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-g=
cc-4.6.patch
>> +++
>> b/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-g=
cc-4.6.patch
>> @@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>   gcc.specs | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> -diff --git a/gcc.specs b/gcc.specs
>> -index 0d4bbda..3802ca6 100644
>> ---- a/gcc.specs
>> -+++ b/gcc.specs
>> +Index: git/gcc.specs
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/gcc.specs
>> ++++ git/gcc.specs
>>  @@ -2,13 +2,13 @@
>>   + -D_GNU_SOURCE
>>
>> @@ -35,11 +35,8 @@ index 0d4bbda..3802ca6 100644
>>   + %(efivar_cpp_options)
>>
>>   *cc1_options:
>> --+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants -fl=
to
>> -fvisibility=3Dhidden
>> %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
>> +-+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants
>> -fvisibility=3Dhidden
>> %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
>>  ++ %(efivar_cpp_options) -fno-merge-constants -fvisibility=3Dhidden
>> %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
>>
>>   *self_spec:
>>   + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings
>> -Wl,-static -static -Wl,-z,relro,-z,now}
>> ---
>> -2.8.1
>> -
>> diff --git a/meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch
>> b/meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch
>> new file mode 100644
>> index 000000000..fc8f8c8b2
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch
>> @@ -0,0 +1,17 @@
>> +Taken from void linux
>> +
>> +Index: git/src/linux.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/src/linux.c
>> ++++ git/src/linux.c
>> +@@ -40,6 +40,10 @@
>> + #include <efivar.h>
>> + #include <efiboot.h>
>> +
>> ++#if !defined(__GLIBC__)
>> ++#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
>> ++#endif
>> ++
>> + #include "dp.h"
>> + #include "linux.h"
>> + #include "util.h"
>> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
>> b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
>> similarity index 83%
>> rename from meta-oe/recipes-extended/efivar/efivar_0.24.bb
>> rename to meta-oe/recipes-extended/efivar/efivar_0.31.bb
>> index 877ca9045..10dde896e 100644
>> --- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
>> +++ b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
>> @@ -12,13 +12,12 @@ inherit pkgconfig
>>
>>  COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
>>
>> -SRCREV =3D "963cb2e5adc145fe00717f94e382f2973f80e753"
>> +SRCREV =3D "11324799c68193116e1dd5f94b416591bd324f90"
>>  SRC_URI =3D "git://github.com/rhinstaller/efivar.git \
>> -           file://0002-disable-static-build.patch \
>>             file://allow-multi-definitions-for-native.patch \
>> -
>> file://0001-Remove-some-extra-const-that-gcc-complains-about.patch \
>> -
>> file://0002-New-gcc-version-new-way-symbol-versioning-breaks.patch \
>> -"
>> +
>> file://0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch \
>> +           file://musl-strndupa.patch \
>> +           "
>>  SRC_URI_append_class-target =3D "
>> file://0001-efivar-fix-for-cross-compile.patch \
>>
>> file://0003-efivar-fix-for-cross-compile.patch \
>>                                  ${@bb.utils.contains('DISTRO_FEATURES',
>> 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '',=
 d)}
>> \
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

