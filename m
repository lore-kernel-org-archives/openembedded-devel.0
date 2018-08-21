Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8639D7900C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:25:23 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 130-v6so3733632qkd.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0aQ8v4JcGln+qdVbwmXpDD+IBmJSQCRNZAW3KJ7p6LM=;
	b=p/Gjv8/VxHkp47bGuEbPsvUNYmxGlLe0EJgxlG1gWMTGh8EpruPqYSj2kksY2HL+Iv
	DOTvdewBI0dXGmV1yCD72K8bv0WgxojXU3rvVuosoiSWB0V1DTTMI5zjGKX/itppKHFm
	a2nFt1U6eCSChw9PJYIXNIJibukGrKK2Kj64H3bHaDe5iDjvc19a3qoGDl6t77OYmYRs
	E67sPoiRuu2Gn6xVDVqfyJVm/KNiHPuCpU6sSEWklbW3l99N1wEasQfMrCYzr6IQ2dyU
	LuhQ0xFlmjGfK8T69o3sIBq5YpfF3iyXUmoghiyubZf5p7Q2fzV8M+48qP2C41cwMHwj
	K5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0aQ8v4JcGln+qdVbwmXpDD+IBmJSQCRNZAW3KJ7p6LM=;
	b=bbHVxhslofRh84WgrqqhLTlyvKOtpNkVLzXSVXPbf8ZomuMWduJH4AiZeziinSGrHy
	A80dJwGRLA/TwMLmJL9xK7mcuxYWH/qLYJha6F3tl35FZ9oHXBplZVgTJ7SxvRsytI8z
	0ngpTqqZRlbR4JLFVNl7DH0y3ilbVmo3siGW9cmwx1K6ioU0X7acgXqU+4012VqBo6/v
	6AuvjE0e0d8RLdo8Syw+wazydxP9xgGZALLBx+gc8kJcUvR8YdWNSxMJcvtnvcqDe1bf
	wcItEjbHqa+/RiFLG1MZErsaVDYWPU8/EX+6bFmq5Yq3feXldK5FFbyuYbM9uglxXIdw
	ybdA==
X-Gm-Message-State: AOUpUlGtzsiSM92uJDiytEw5Baku48q0Ke7PkTSc7XJZ81MsBwpMHn1l
	q4TbyhcH+Fkvt4uEi1hXZy3wgtvwnrt5CYoTiXg=
X-Google-Smtp-Source: AA+uWPxShXk2Tq4K9qv7b4TzVEk2/xGnCuLanN8amhHvh3+RmudSWkjBQGnSgZyw0o5m7c3aBnIc/YzNE5JZZrMZ8mo=
X-Received: by 2002:a37:a24f:: with SMTP id
	l76-v6mr42499885qke.406.1534836324103; 
	Tue, 21 Aug 2018 00:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <1534758107-254391-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sowGqeZ5CwiYFPBibooHjwWMuiPWRg=-FKrAjGi6yaiCA@mail.gmail.com>
	<5B7BBD04.20204@windriver.com>
In-Reply-To: <5B7BBD04.20204@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2018 00:24:57 -0700
Message-ID: <CAMKF1so-+gSYZJGEJnaY9b_CT0fqDAWdAKMHtQxp+=OtJYESVA@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fio: disable compiler optimizations
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
X-List-Received-Date: Tue, 21 Aug 2018 07:25:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2018 at 12:21 AM Yu, Mingli <mingli.yu@windriver.com> wrote=
:
>
>
>
> On 2018=E5=B9=B408=E6=9C=8821=E6=97=A5 15:19, Khem Raj wrote:
> > On Mon, Aug 20, 2018 at 2:42 AM <mingli.yu@windriver.com> wrote:
> >>
> >> From: Mingli Yu <Mingli.Yu@windriver.com>
> >>
> >> Add parameter "--disable-optimizations" to
> >> configure script to disable compiler optimizations
> >> to fix below issue:
> >> $ gdb /usr/bin/fio
> >> (gdb) r -h
> >> Starting program: /usr/bin/fio -h
> >> [Thread debugging using libthread_db enabled]
> >> Using host libthread_db library "/lib64/libthread_db.so.1".
> >>
> >> Program received signal SIGILL, Illegal instruction.
> >> 0x0000000000407220 in prio_tree_init () at lib/prio_tree.c:61
> >> 61      index_bits_to_maxindex[i] =3D (1UL << (i + 1)) - 1;
> >> (gdb) bt
> >>   #0 0x0000000000407220 in prio_tree_init () at lib/prio_tree.c:61
> >>   #1 0x0000000000482208 in __libc_csu_init (argc=3Dargc@entry=3D2,
> >>      argv=3Dargv@entry=3D0x7fffffffecc8, envp=3D0x7fffffffece0)
> >>      at /usr/src/debug/glibc/2.26-r0/git/csu/elf-init.c:88
> >>   #2 0x00000031c742095e in __libc_start_main (main=3D0x407700 <main>, =
argc=3D2,
> >>      argv=3D0x7fffffffecc8, init=3D0x4821b6 <__libc_csu_init>,
> >>      fini=3D<optimized out>, rtld_fini=3D<optimized out>, stack_end=3D=
0x7fffffffecb8)
> >>      at /usr/src/debug/glibc/2.26-r0/git/csu/libc-start.c:264
> >>   #3 0x00000000004077ea in _start () at ../sysdeps/x86_64/start.S:120
> >>
> >
> > Please check if you see this issue on master branch
> > secondly, while you are here please upgrade to 3.8 release and see
> > if this fixes the issue you are seeing.
>
> Yes, this issue exists in master, and even upgrade to 3.8, the issue
> still exist.
>

OK. lets update regardless.

> Thanks,
>
> >
> >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> >> ---
> >>   meta-oe/recipes-benchmark/fio/fio_3.7.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.7.bb b/meta-oe/recipe=
s-benchmark/fio/fio_3.7.bb
> >> index 410e27b..9bec2df 100644
> >> --- a/meta-oe/recipes-benchmark/fio/fio_3.7.bb
> >> +++ b/meta-oe/recipes-benchmark/fio/fio_3.7.bb
> >> @@ -32,6 +32,7 @@ S =3D "${WORKDIR}/git"
> >>   DISABLE_STATIC =3D ""
> >>
> >>   EXTRA_OEMAKE =3D "CC=3D'${CC}' LDFLAGS=3D'${LDFLAGS}'"
> >> +EXTRA_OECONF =3D "--disable-optimizations"
> >>
> >>   do_configure() {
> >>       ./configure ${EXTRA_OECONF}
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

