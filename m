Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9419878289
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 15:05:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 143so9994614wmu.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hdeQSbzLfY3sDNseVshPzeP6am9W3OvdhhL7jRApZms=;
	b=KIyuHJDjsF3MDbFkE7LJa8b4ynS/V4Q4W5+664piN3ube4SDZRkn3CvnkYdSu9NGT1
	erG6GvqcpFjs2pQLHLbUbsmH12rCaAbelSasnp/r3hkbsjbXS6x3CLF0875JD49/Tye1
	crK2ka54fYBn4EWaQi6wMYq1JTDCQbfidimJXpleZBy4vJxYRU5RKex0Sc55yToFX0pl
	d/PGcJdtmri0sGwQ5ZsmYWHYUggtabJRG+/r7r95FTi9rBT8fZf3yN77ES3pC5B0GRxj
	YBUVGEM/xpY9QDRzRv6uJQsT29PcFkoQ38vJvvCS+0YUlFvf186RVAwc/hqRLqtC3acQ
	JnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hdeQSbzLfY3sDNseVshPzeP6am9W3OvdhhL7jRApZms=;
	b=rFPPPdXaBqSx9jNdvIvhKOUcGm5zyDhKlHiaw8G8um296oFjZk1A4CLFSn1nHC9+9K
	qdZ6rd3gwR1Wj3U/aOHMOfBabC2KoFLPe+tlZPIIySQBQxDh6tnhql0u9et7wZJOaEfU
	/+PZJxVZBMbpCFPZ5OwnDQcRw6vXhOHQicAHBHW3yJjArzk83TYDRWZTng9uNOSpuEmF
	bLbwf7tyo09BBBZ1PiZOvT//CdnnCW4w/HF6cl2ACuLaRF4Afio/+KSiKUvl5e2paad3
	jwRKgR4lQYuSdMqUK5GuhNsD82cqx65kG5QkYwv+Ub8sTGqdM1GUFKipKZCfPQ1R9Lwz
	2xRg==
X-Gm-Message-State: AIVw112tv2UnWWF5zNeDxrBlBn5JCh2wLo9282TxewyoYesVBWW5sIAa
	FaaTgccRYSYZOqMAwdgHGib0x6GDPw==
X-Received: by 10.80.159.202 with SMTP id c68mr5241571edf.11.1500735921277;
	Sat, 22 Jul 2017 08:05:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Sat, 22 Jul 2017 08:04:50 -0700 (PDT)
In-Reply-To: <CA+chaQcPvJNaX1UseBsHY7K1Ggzkf2DYbSg3i45MGwAHu7f56w@mail.gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
	<20170718031013.44536-10-raj.khem@gmail.com>
	<CA+chaQcPvJNaX1UseBsHY7K1Ggzkf2DYbSg3i45MGwAHu7f56w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jul 2017 08:04:50 -0700
Message-ID: <CAMKF1sruKooyyNm=PSV_CZKo8agS2Zub655KZE4E6qfkHHNL+Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 10/17] efivar: Upgrade to 0.31
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
X-List-Received-Date: Sat, 22 Jul 2017 15:05:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2017 at 2:13 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> For target version it fails to apply gold linker patch:
>
> Applying patch 0004-fix-unknow-option-for-gold-linker.patch
> patching file gcc.specs
> Hunk #1 FAILED at 14.
> 1 out of 1 hunk FAILED -- rejects in file gcc.specs
> Patch 0004-fix-unknow-option-for-gold-linker.patch does not apply (enforc=
e
> with -f)
>
> and native version fails in do_compile with:
> In file included from dp.c:27:0:
> util.h:109:10: error: expected expression before =E2=80=98int=E2=80=99
>           int *: int_add(a,b,c),   \
>           ^
>

Interesting, I will take a look again


> On Tue, Jul 18, 2017 at 5:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...some-extra-const-that-gcc-complains-about.patch | 44 ---------------
>>  ...Do-not-use-__bswap_constant_-16-32-macros.patch | 37 ++++++++++++
>>  ...-version-new-way-symbol-versioning-breaks.patch | 66
>> ----------------------
>>  .../efivar/efivar/0002-disable-static-build.patch  | 33 -----------
>>  .../fix-compile-failure-with-host-gcc-4.6.patch    | 13 ++---
>>  .../efivar/efivar/musl-strndupa.patch              | 17 ++++++
>>  .../efivar/{efivar_0.24.bb =3D> efivar_0.31.bb}      |  9 ++-
>>  7 files changed, 63 insertions(+), 156 deletions(-)
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
>> 2.13.3
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

