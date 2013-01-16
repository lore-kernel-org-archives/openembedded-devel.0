Received: from mail-lb0-f172.google.com ([209.85.217.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gopikrishnans@pec.edu>) id 1TvVZZ-0006c4-Do
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 17:10:49 +0100
Received: by mail-lb0-f172.google.com with SMTP id y2so1159346lbk.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 07:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:x-gm-message-state;
	bh=jFvKnrv+JQ9ul2px12AAArh7k1KddpGZkhiLCURCq68=;
	b=RotkrJfobCgJbAF8MBNGF3Sls1tDFondC8bxlok/6Q3Y2ZqpuitsmQWgUDqGfIlmTs
	c3ocWdKB4jrP88ww5n2oaqamkwifUkqZQpsIva1tW/PfL/lnnOu/ifvxFVKeBXC1CKGq
	gRCRKBzgBqQuA3r7zaS9RJpoKawQ0q+duv1JXFv2aiaQxcCEigxYQ2UdxqmIus8YREOt
	WdxwDaMUkoe2t1R47vX0PMZqbaU3pf4Ht+KiuViVlVu9iYcOzb3e85a6SKK/XvZ+VRyk
	oqi0SvC6QofBFC44ZOMNswn089mGZsuQo5ueAm5fouRlA8HMWhrDMFyUOvYtJi4VeUuC
	KEvA==
MIME-Version: 1.0
X-Received: by 10.152.104.199 with SMTP id gg7mr1628501lab.14.1358351719528;
	Wed, 16 Jan 2013 07:55:19 -0800 (PST)
Received: by 10.112.89.133 with HTTP; Wed, 16 Jan 2013 07:55:19 -0800 (PST)
In-Reply-To: <CAP9ODKp4EnstE_iY-4cu2zCTUFP5FFf467NcSWe63K2iFDio-A@mail.gmail.com>
References: <CAOkC3RY4n66f9LgvWczskaDUn0wPOjBDbDAoKCMo8CjnFWzgSA@mail.gmail.com>
	<CAP9ODKp4EnstE_iY-4cu2zCTUFP5FFf467NcSWe63K2iFDio-A@mail.gmail.com>
Date: Wed, 16 Jan 2013 21:25:19 +0530
Message-ID: <CAOkC3RYBQV01jOyyzJ5Y1aspoo=+m_qBUuekXjxDSj92_iD-Ag@mail.gmail.com>
From: GOPIKRISHNAN S <gopikrishnans@pec.edu>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmDfsLPBiZIwn2PG4HEVjT/d8XXoFkn6qlhu1JXPDINTgbX59UXYq0r9bbDaz/FzrJAw1nP
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Reg: Hiawatha
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
X-List-Received-Date: Wed, 16 Jan 2013 16:10:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Actually, the Freescale's SDK is having only gcc version 4.6.2 (GCC), Not
4.7, still trying to find the problem...
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto$
./build_p2041rdb_release/tmp/sysroots/i686-linux/usr/bin/ppce500mc-fsl-linux/powerpc-fsl-linux-gcc
-v
Using built-in specs.
COLLECT_GCC=./build_p2041rdb_release/tmp/sysroots/i686-linux/usr/bin/ppce500mc-fsl-linux/powerpc-fsl-linux-gcc
COLLECT_LTO_WRAPPER=/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/i686-linux/usr/bin/ppce500mc-fsl-linux/../../libexec/ppce500mc-fsl-linux/gcc/powerpc-fsl-linux/4.6.2/lto-wrapper
Target: powerpc-fsl-linux
Configured with:
/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/work-shared/gcc-4.6.2+svnr180516-r29+fsl.6/gcc-4_6-branch/configure
--build=i686-linux --host=i686-linux --target=powerpc-fsl-linux
--prefix=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr
--exec_prefix=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr
--bindir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/bin/ppce500mc-fsl-linux
--sbindir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/bin/ppce500mc-fsl-linux
--libexecdir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/libexec/ppce500mc-fsl-linux
--datadir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/share
--sysconfdir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/etc
--sharedstatedir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/com
--localstatedir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/var
--libdir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/lib/ppce500mc-fsl-linux
--includedir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/include
--oldincludedir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/include
--infodir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/share/info
--mandir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr/share/man
--disable-silent-rules --disable-dependency-tracking
--with-libtool-sysroot=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux
--with-gnu-ld --enable-shared --enable-languages=c,c++
--enable-threads=posix --disable-multilib --enable-c99 --enable-long-long
--enable-symvers=gnu --enable-libstdcxx-pch
--program-prefix=powerpc-fsl-linux- --enable-lto --enable-libssp
--disable-bootstrap --disable-libgomp --disable-libmudflap
--with-system-zlib --with-linker-hash-style=gnu --enable-cheaders=c_global
--with-local-prefix=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/p4080ds/usr
--with-gxx-include-dir=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/p4080ds/usr/include/c++
--with-sysroot=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/p4080ds
--with-build-sysroot=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/p4080ds
--enable-poison-system-directories
--with-headers=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/p4080ds/usr/include
--disable-libunwind-exceptions
--with-mpfr=/local/workspace/yocto-iso-make/p4080ds/build_p4080ds_release/tmp/sysroots/i686-linux/usr
--with-system-zlib --disable-nls --enable-__cxa_atexit
--with-long-double-128
Thread model: posix
gcc version 4.6.2 (GCC)


On Mon, Jan 7, 2013 at 5:46 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Mon, Jan 7, 2013 at 10:13 AM, GOPIKRISHNAN S <gopikrishnans@pec.edu>
> wrote:
> > I am facing strange issue while building Hiawatha for Freescale P2041RDB.
> >
> > I am getting some errors while building hiawatha(using recipe from
> > openembedded). In investigation I found all return \type and parameter
> type
> > seems to be same & in all /usr/include/*.h files in declared as extern
> was
> > added before to make it visible in global. I wonder no problem was
> > not raised while compiling for my host platform (Debian 6 on x86), and
> > getting problem only doing it for my freescale board
> ...
>
> OE has a newer GCC version and GCC has get more strict about those
> checks so those errors do need to be fixed.
>
> If you upgrade your GCC to 4.7 you'll probably find same build errors.
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

