Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNKbv-0004C7-Ep
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 07:22:18 +0100
Received: by iwn32 with SMTP id 32so4422275iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 22:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=UB9I6+bv+F35oalONbPc+Nn1WuLJryoA6afBckbhQTM=;
	b=qRZ3GYqHMKlafGz0cBtK70GFEleJ1ajAbIpqMeCls6fLFtJsZB+sK1FTGybwA2G6ra
	H90/RV8nK6vk6kPLzuxeV4zrKpbmOs9KO8ouF6/0cxsKKZOaFU8J3OZOuXnF90jX6RS4
	sPjt7tY9O/7rOmbadqoVc8VuDxtGWBKCSe7Hk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tPUxXe51HgXNNz1psGhA2qg4owCx9uUyCiO2q8RrrmRL8iDkWysxn2pt/nDz7QB6Bv
	o9EK6XY+tBak28/MA2v7f9utXCACVKvb0Znnv6xAX+KiZ9w5qgEHYgbSJrqR/HxzsZ78
	ixmxB32HnI4iMcBwsXXU3Gyk9Q7Az17fsVWrU=
MIME-Version: 1.0
Received: by 10.231.121.69 with SMTP id g5mr895930ibr.44.1261549222004; Tue, 
	22 Dec 2009 22:20:22 -0800 (PST)
In-Reply-To: <op.u5dklxm5mn1qzu@guohr-laptop-ubuntu>
References: <op.u5dklxm5mn1qzu@guohr-laptop-ubuntu>
Date: Tue, 22 Dec 2009 22:20:21 -0800
Message-ID: <19c1b8a90912222220j543c443ei1d24890b83c4b7f9@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Compiling glibc-2.6.1 failed
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
X-List-Received-Date: Wed, 23 Dec 2009 06:22:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2009 at 9:09 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =C2=A0 =C2=A0When compiling glibc, =C2=A0I meet the following error infor=
mation. You can
> reproduce it as the following:
> DISTRO =3D "minimal"
> MACHINE =3D "qemux86"
> bitbake helloworld-image
>
> =C2=A0 By the way, when using eglibc, it works OK. =C2=A0Anyone can give =
me some
> hints?
>
> Thanks a lot.
>
> | checking whether
> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-lin=
ux/4.4.2/../../../../i686-oe-linux/bin/ld
> is GNU ld... yes
> | checking for
> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-lin=
ux/4.4.2/../../../../i686-oe-linux/bin/as...
> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-lin=
ux/4.4.2/../../../../i686-oe-linux/bin/as
> | checking version of
> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-lin=
ux/4.4.2/../../../../i686-oe-linux/bin/as...
> 2.20, bad
> | checking for
> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-lin=
ux/4.4.2/../../../../i686-oe-linux/bin/ld...
> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-lin=
ux/4.4.2/../../../../i686-oe-linux/bin/ld
> | checking version of
> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-lin=
ux/4.4.2/../../../../i686-oe-linux/bin/ld...
> 2.20, bad

here lies the problem. I think the sed expression is not
able to comprehend that 2.20 version of ld is newer

you need to backport glibc-2.9/glibc-2.9-enable-binutils-2.2.patch

to 2.6.1

Thx

-Khem



> | checking for pwd...
> /media/work-disk/workdir/oe-mini-glibc-bug/staging/i686-linux/usr/bin/pwd
> | checking for i686-oe-linux-gcc... (cached) ccache i686-oe-linux-gcc
> -march=3Dpentiumpro
> | checking version of ccache i686-oe-linux-gcc -march=3Dpentiumpro... 4.4=
.2,
> ok
> | checking for gnumake... make
> | checking version of make... 3.81, ok
> | checking for gnumsgfmt... no
> | checking for gmsgfmt... no
> | checking for msgfmt... msgfmt
> | checking version of msgfmt... 0.17, ok
> | checking for makeinfo... makeinfo
> | checking version of makeinfo... 4.11, ok
> | checking for sed... sed
> | checking version of sed... 4.1.5, ok
> | checking for autoconf... autoconf
> | checking whether autoconf works... yes
> | configure: error:
> | *** These critical programs are missing or too old: as ld
> | *** Check the INSTALL file for required versions.
> | FATAL: oe_runconf failed
>
>
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Mobile: +86-0-13484056007
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


