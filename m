Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C82C17391A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 01:18:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6085909"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Apr 2016 09:18:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7602A408D299
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 09:18:27 +0800 (CST)
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0279.002; Fri, 29 Apr 2016 09:18:27 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] ltrace: Error Fix for ARM
Thread-Index: AQHRoF+5kRg+xKPc7Eu2TBkw2i1xZp+gKJwg
Date: Fri, 29 Apr 2016 01:18:26 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E80140987B04@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1460682409-1786-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20160427083526.GF2559@jama>
In-Reply-To: <20160427083526.GF2559@jama>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 7602A408D299.A8508
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][PATCH] ltrace: Error Fix for ARM
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
X-List-Received-Date: Fri, 29 Apr 2016 01:18:42 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-devel-bounces@lists.openembedded.org
>[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>Martin Jansa
>Sent: Wednesday, April 27, 2016 4:35 PM
>To: openembedded-devel@lists.openembedded.org
>Subject: Re: [oe] [meta-oe][PATCH] ltrace: Error Fix for ARM
>
>On Fri, Apr 15, 2016 at 04:06:49AM +0300, Li Xin wrote:
>> 1) The error is as following:
>>      root # ltrace ls
>>      __libc_start_main(0xb6fbc018, 1, 0xbed8fdc4,
>0xb6fd0b88PTRACE_SINGLESTEP: Input/output error
>>      2747 couldn't continue when handling __libc_start_main (0xb6fbbde0)=
 at
>0xb6fbbde0
>>    The master branch fix it.
>>
>> 2) remove unused patch:
>>      --0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
>>      --ltrace-0.7.2-unused-typedef.patch
>
>Now I'm seeing this failure:
>
>| ../../../../git/sysdeps/linux-gnu/arm/fetch.c: In function 'arch_elf_ini=
t':
>| ../../../../git/sysdeps/linux-gnu/arm/fetch.c:101:8: error: 'data' may b=
e used
>uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>|     if (elf_read_next_uleb128(data, &offset, &tag) < 0
>|         ^
>| cc1: all warnings being treated as errors
>| make[4]: *** [fetch.lo] Error 1
>| make[4]: *** Waiting for unfinished jobs....
>| make[4]: Leaving directory
>`.../ltrace/1_7.3+gitAUTOINC+01b10e191e-r0/build/sysdeps/linux-gnu/arm'
>
>Possibly caused by using -Os, can you retest with -Os?

OK, And can you tell me how to test with -Os?

Regards & Thanks.


>
>> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>> ---
>>  ...-ltrace-fix-gcc-5-logical-not-parentheses.patch | 38 ---------------=
--
>>  .../ltrace/ltrace-0.7.2-unused-typedef.patch       | 49 ---------------=
-------
>>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  6 +--
>>  3 files changed, 2 insertions(+), 91 deletions(-)  delete mode 100644
>> meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-n
>> ot-parentheses.patch  delete mode 100644
>> meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.pat
>> ch
>>
>> diff --git
>> a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical
>> -not-parentheses.patch
>> b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical
>> -not-parentheses.patch
>> deleted file mode 100644
>> index 681c43d..0000000
>> ---
>> a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical
>> -not-parentheses.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From 876fe5680d77800426f8c4c5680a235732d722e6 Mon Sep 17 00:00:00
>> 2001
>> -From: Kai Kang <kai.kang@windriver.com>
>> -Date: Mon, 24 Aug 2015 17:37:54 +0800
>> -Subject: [PATCH] ltrace: fix gcc 5 logical not parentheses
>> -
>> -Upstream-Status: Pending
>> -
>> -Build ltrace with gcc 5.2, it fails with:
>> -
>> -error: logical not is only applied to the left hand side of
>> comparison -[-Werror=3Dlogical-not-parentheses]
>> -   if (!need_data(data, offset, SIZE / 8) < 0)  \
>> -                                             ^
>> -
>> -Function need_data just return 0 on success and -1 if fail. So it is
>> ok -to just test if (need_data(data, offset, SIZE / 8) < 0).
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> - ltrace-elf.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/ltrace-elf.c b/ltrace-elf.c -index c571d2a..7fe830f
>> 100644
>> ---- a/ltrace-elf.c
>> -+++ b/ltrace-elf.c
>> -@@ -218,7 +218,7 @@ need_data(Elf_Data *data, GElf_Xword offset,
>GElf_Xword size)
>> - 	int								\
>> - 	NAME(Elf_Data *data, GElf_Xword offset, uint##SIZE##_t *retp)	\
>> - 	{								\
>> --		if (!need_data(data, offset, SIZE / 8) < 0)		\
>> -+		if (need_data(data, offset, SIZE / 8) < 0)		\
>> - 			return -1;					\
>> - 									\
>> - 		if (data->d_buf =3D=3D NULL) /* NODATA section */ {		\
>> ---
>> -1.9.1
>> -
>> diff --git
>> a/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.p
>> atch
>> b/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.p
>> atch
>> deleted file mode 100644
>> index 8f3c0ec..0000000
>> ---
>> a/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.p
>> atch
>> +++ /dev/null
>> @@ -1,49 +0,0 @@
>> -diff --git a/value.c b/value.c
>> -index d18db17..b98298e 100644
>> ---- a/value.c
>> -+++ b/value.c
>> -@@ -1,6 +1,6 @@
>> - /*
>> -  * This file is part of ltrace.
>> -- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
>> -+ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
>> -  *
>> -  * This program is free software; you can redistribute it and/or
>> -  * modify it under the terms of the GNU General Public License as
>> -@@ -282,9 +282,9 @@ value_init_deref(struct value *ret_val, struct value
>*valp)
>> - 	if (value_extract_word(valp, &l, NULL) < 0)
>> - 		return -1;
>> -
>> --	/* We need "long" to be long enough to hold platform
>> -+	/* We need "long" to be long enough to hold target
>> - 	 * pointers.  */
>> --	typedef char assert__long_enough_long[-(sizeof(l) < sizeof(void *))];
>> -+	assert(sizeof(l) >=3D sizeof(arch_addr_t));
>> -
>> - 	value_common_init(ret_val, valp->inferior, valp,
>> - 			  valp->type->u.ptr_info.info, 0);
>> -diff --git a/lens_default.c b/lens_default.c -index ed3d0e1..5d00814
>> 100644
>> ---- a/lens_default.c
>> -+++ b/lens_default.c
>> -@@ -1,6 +1,6 @@
>> - /*
>> -  * This file is part of ltrace.
>> -- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
>> -+ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
>> -  * Copyright (C) 1998,2004,2007,2008,2009 Juan Cespedes
>> -  * Copyright (C) 2006 Ian Wienand
>> -  * Copyright (C) 2006 Steve Fink
>> -@@ -342,9 +342,9 @@ format_array(FILE *stream, struct value *value, str=
uct
>value_dict *arguments,
>> - 	     struct expr_node *length, size_t maxlen, int before,
>> - 	     const char *open, const char *close, const char *delim)
>> - {
>> --	/* We need "long" to be long enough to cover the whole address
>> --	 * space.  */
>> --	typedef char assert__long_enough_long[-(sizeof(long) < sizeof(void *)=
)];
>> -+	/* We need "long" to be long enough to cover the whole target
>> -+	 * address space.  */
>> -+	assert(sizeof(long) >=3D sizeof(arch_addr_t));
>> - 	long l;
>> - 	if (expr_eval_word(length, value, arguments, &l) < 0)
>> - 		return -1;
>> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
>> b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
>> index d8d037e..850e8e3 100644
>> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
>> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
>> @@ -11,14 +11,12 @@ LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a"
>>
>>  PE =3D "1"
>>  PV =3D "7.3+git${SRCPV}"
>> -SRCREV =3D "37ecc41b58be3dbdd79592a76e331b5b371e4f81"
>> +SRCREV =3D "01b10e191e99d8cb147e5a2b7da8196e0ec6fb94"
>>
>>  DEPENDS =3D "elfutils"
>>  RDEPENDS_${PN} =3D "elfutils"
>> -SRC_URI =3D
>"git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dltrace-0.7 \
>> -           file://ltrace-0.7.2-unused-typedef.patch \
>> +SRC_URI =3D
>> +"git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dmaster \
>>             file://configure-allow-to-disable-selinux-support.patch \
>> -           file://0001-ltrace-fix-gcc-5-logical-not-parentheses.patch \
>>            "
>>  S =3D "${WORKDIR}/git"
>>
>> --
>> 1.8.4.2
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>--
>Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



