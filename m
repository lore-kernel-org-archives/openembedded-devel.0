Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id CFFF27901C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:19:57 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id r37-v6so11840748qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wmibl06GEZjHceOlZBuDIZhKEYg30SbMMnkR2EYRJ5Q=;
	b=GvcLbaMr+tFJKsTnFLur7oEgU4Aq9X8tBJAs+fNo8m4nFyAPwSlO/sC8wA/lg7yDEe
	/9ljlic6cC9ph7JbGyQUqllBSmOMFAFOZya8OIGLyrdfnrpoa5gnbXmnLDk5UskccfBq
	PxieOmTmOeE4i+2C8nuGsUyLpGo0d2w6jfuEglz/RhtTswrDF85YyjS7b/MdDLa1Nw99
	a76VCQZjVesIErwObSAR1am4eIzDFbprZYDQlCJWoE8vg8PPoy+nZazX33aZ433Di1zq
	ud5rT29BSJoJnQfwEiZqxa60jeBQEP8CVwlBBrhDIzMKLqcnIbo7Mm2HgBjjZgBB4rxx
	ssmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wmibl06GEZjHceOlZBuDIZhKEYg30SbMMnkR2EYRJ5Q=;
	b=GhJWBQEcy+n9evygnXN0WsPQWstMS97jPwdCbrgBCryX4P2yo3DIubDN1nDFwOfMng
	BUrMmRGHF70NkeiaKjx0hnePQgX84LR2wht3CnrJ9LC2p6YMEbRM69OJZXq+XAWQj8Yl
	Yf2PEzVg8Jz0B+6FFLOXve3pZzrfYBxe0veRtMYoHYLGIGMtIRSz/Tcy+IkqoloUUgMy
	RoWbG2a/g+M+hzEvp33+ldx0Bmsze39IDvBps4tNBY/vafF6F/wuKfrPht38EST3yerG
	Dfx9NwGrIF16BE/5/h5kXeYhqrn4p0dzlx0WryC5BCzedrhc+kVswMWzERlDsdb6FLpa
	Ac+w==
X-Gm-Message-State: APzg51A7zCjSVMYyj7KIHoBbXgNIXrJfZ3XUlV9b5dEp0hts6JvNA2KB
	IOrVpxXATjde+j9JeMZ3G+TvYIHb+9G3VwuI+mBhZA==
X-Google-Smtp-Source: AA+uWPzA8SXshaHCqBuxaWnWY9gjYpnS9aL6dg+8f64hDPVO7dz2MvrBxU83/4JZ3H5r9nnniLEybJTOJjiAvLjE1Kg=
X-Received: by 2002:ac8:46d3:: with SMTP id
	h19-v6mr11383824qto.188.1534835998587; 
	Tue, 21 Aug 2018 00:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <1534758107-254391-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1534758107-254391-1-git-send-email-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2018 00:19:32 -0700
Message-ID: <CAMKF1sowGqeZ5CwiYFPBibooHjwWMuiPWRg=-FKrAjGi6yaiCA@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Aug 2018 07:19:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 2:42 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Add parameter "--disable-optimizations" to
> configure script to disable compiler optimizations
> to fix below issue:
> $ gdb /usr/bin/fio
> (gdb) r -h
> Starting program: /usr/bin/fio -h
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
>
> Program received signal SIGILL, Illegal instruction.
> 0x0000000000407220 in prio_tree_init () at lib/prio_tree.c:61
> 61      index_bits_to_maxindex[i] = (1UL << (i + 1)) - 1;
> (gdb) bt
>  #0 0x0000000000407220 in prio_tree_init () at lib/prio_tree.c:61
>  #1 0x0000000000482208 in __libc_csu_init (argc=argc@entry=2,
>     argv=argv@entry=0x7fffffffecc8, envp=0x7fffffffece0)
>     at /usr/src/debug/glibc/2.26-r0/git/csu/elf-init.c:88
>  #2 0x00000031c742095e in __libc_start_main (main=0x407700 <main>, argc=2,
>     argv=0x7fffffffecc8, init=0x4821b6 <__libc_csu_init>,
>     fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7fffffffecb8)
>     at /usr/src/debug/glibc/2.26-r0/git/csu/libc-start.c:264
>  #3 0x00000000004077ea in _start () at ../sysdeps/x86_64/start.S:120
>

Please check if you see this issue on master branch
secondly, while you are here please upgrade to 3.8 release and see
if this fixes the issue you are seeing.

> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-oe/recipes-benchmark/fio/fio_3.7.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.7.bb b/meta-oe/recipes-benchmark/fio/fio_3.7.bb
> index 410e27b..9bec2df 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_3.7.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_3.7.bb
> @@ -32,6 +32,7 @@ S = "${WORKDIR}/git"
>  DISABLE_STATIC = ""
>
>  EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
> +EXTRA_OECONF = "--disable-optimizations"
>
>  do_configure() {
>      ./configure ${EXTRA_OECONF}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

