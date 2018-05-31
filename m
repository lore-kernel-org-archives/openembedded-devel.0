Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1831D747B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 01:37:26 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x34-v6so12640517qtk.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 18:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jJkc1tVUuUus/IKgN6bp6CjEoSqyBgUgPdcYGjD61ho=;
	b=dbqqZzt/uld4Ec21egV6uhVH9Dje7NXKjhP3JY1lmPrBg47rmzFuMe4mOnKc57JCRu
	27nY0tVrjSNZZQXxK5/q4vhi9KHnxqlO3fEU9pYrTn3CGzofu267qCSmNJ+wwU4p5YZ3
	b5ZwVhuZWR5bYrU4xAwOOSGZRnAqZOKzT1GtnTYOkfrHzGNdq6c56Snk6onuDSuy7TRg
	Z49LEgpMA0KBXzAcO9YeUsw5jUQ4gRK3DO8SBj0sHMNrV/jjxc2LEFqL3Z27iP0LR/fB
	n2J617Y7Z8U0RsXI41Jyp8tl3PEiqsA+iTxd5+Li5cklTcJz40y8CAGGqjGiKtoeZE6G
	nlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jJkc1tVUuUus/IKgN6bp6CjEoSqyBgUgPdcYGjD61ho=;
	b=P1hl61MjmRCV5BEFX0Rn2UiID0scRO7HBn8EjxQymsgwowMue4DXM6jv9bGh+nVOOZ
	rE4IaYgZiv8iDelYoyON7FPxLFcPrJFSiWCUsBm/99sKWL8nhVTMbIjWL9uS8nRG6tKh
	xqhNKKI1r3p5nykl8rMVMe0r4yB1mxSzuHvGiF3NI1t6aujm1CweEqkQ8m3o80d7yyBF
	tdFsLsakAV0XcaGer9PkeHXzIKCsZMM2BHg2n7D5nFVfvGmM/Nd+Rw563W6brGJKj5SJ
	/xhFQC9EbxizH5kwRd0wArspLjwwCz67FQo8bRGzjzo0MJ8YVo60B6M7mHx4CpZG8Dh/
	P4RQ==
X-Gm-Message-State: APt69E2b7vT/0/OOQi45vIj5jLPVMLlRdliww4db0bN5oMAIad8Apdd2
	ieQH4U4PJtxB70imJ1w7bqBHQagpFEWgU0ARnC8=
X-Google-Smtp-Source: ADUXVKLIvTy00NjUR3X+E0NDkoTgqS4nuLE8j8ApXx3P5LXIVgkbEp/igdRP8r84KkWgpp+gsk96aUnFpa6vVoJ7Jlg=
X-Received: by 2002:ac8:296:: with SMTP id
	p22-v6mr4807666qtg.188.1527730647611; 
	Wed, 30 May 2018 18:37:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Wed, 30 May 2018 18:36:57
	-0700 (PDT)
In-Reply-To: <50b5ba5a-6d57-56b3-616f-75a17d472dd4@windriver.com>
References: <20180528020041.33603-1-hongzhi.song@windriver.com>
	<50b5ba5a-6d57-56b3-616f-75a17d472dd4@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2018 18:36:57 -0700
Message-ID: <CAMKF1srXodxHHt1jiVmZDAehsJL-vTCr_ZickpkUuewBj2EkDQ@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] turbostat: add the recipe of turbostat to meta-oe
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
X-List-Received-Date: Thu, 31 May 2018 01:37:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please check patchwork for status, this is staged in master-next right now.

On Wed, May 30, 2018 at 6:15 PM, Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
> ping
>
> -- Hongzhi
>
>
>
> On 2018=E5=B9=B405=E6=9C=8828=E6=97=A5 10:00, Hongzhi.Song wrote:
>>
>> It is an efficient and necessary tool to reflect the status of X86
>> processors. Turbostat reports processor topology, frequency, idle
>> power-state statistics, temperature and power on X86 processors.
>>
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> ---
>>   meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 58
>> +++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>   create mode 100644 meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>>
>> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>> b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>> new file mode 100644
>> index 000000000..355941794
>> --- /dev/null
>> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>> @@ -0,0 +1,58 @@
>> +#
>> +# Copyright (C) 2013 Wind River Systems, Inc.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License version 2 as
>> +# published by the Free Software Foundation.
>> +#
>> +SUMMARY =3D "Frequency and Idle power monitoring tools for Linux"
>> +
>> +DESCRIPTION =3D "The turbostat tool allows you to determine the actual =
\
>> +processor frequency and idle power saving state residency on supported =
\
>> +processors."
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be=
7cd7"
>> +
>> +COMPATIBLE_HOST =3D '(x86_64.*|i.86.*)-linux'
>> +COMPATIBLE_HOST_libc-musl =3D "null"
>> +
>> +DEPENDS =3D "virtual/kernel"
>> +
>> +do_fetch[noexec] =3D "1"
>> +do_unpack[noexec] =3D "1"
>> +do_patch[noexec] =3D "1"
>> +
>> +# This looks in S, so we better make sure there's
>> +# something in the directory.
>> +#
>> +do_populate_lic[depends] =3D "${PN}:do_configure"
>> +
>> +
>> +EXTRA_OEMAKE =3D '\
>> +                CC=3D"${CC}" \
>> +               'CFLAGS=3D-Wall
>> -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
>> +               '
>> +
>> +# If we build under STAGING_KERNEL_DIR, source will not be put
>> +# into the dbg rpm.  STAGING_KERNEL_DIR will exist by the time
>> +# do_configure() is invoked so we can safely copy from it.
>> +#
>> +do_configure_prepend() {
>> +       mkdir -p ${S}
>> +       cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S=
}
>> +       cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h
>> ${S}
>> +       cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
>> +       cp -r ${STAGING_KERNEL_DIR}/COPYING ${S}
>> +}
>> +
>> +do_compile() {
>> +       sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
>> +       sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
>> +       sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC)
>> \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
>> +       oe_runmake STAGING_KERNEL_DIR=3D${STAGING_KERNEL_DIR}
>> +}
>> +
>> +do_install() {
>> +       oe_runmake DESTDIR=3D"${D}" install
>> +}
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

