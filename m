Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NXZ6p-0004Nb-Om
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 12:52:31 +0100
Received: by pxi9 with SMTP id 9so3628697pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 03:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=2eA0qx+KYwY1ehvMvLNo/AnbdRIo+cDlNazcqZKARMQ=;
	b=aesCdJ0L5u2Phy9L8Coait1KqkmURmgvAyhC3P5SZrvy8rxYT8zP1Gbjz2KaLYm3Ec
	Vli/5mKlhuK6aSw8nsXYg1M8tRLw1uVktGQG4IdYXnSWosaft43yvjvjXQLzzV7X0fEX
	bVRLMbVnHFSolZ/HOnqOCraQdT0vzCUcEUZK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d8NYIR0h1wnSVTZO1bPz2b9/9MJL853seV5rkGJaG3/oE9PA3snMNC91tV1fw92uuu
	dKhugw/vJVTH+9L1UwWjv7SGl2qedAWAq+WFc0hNvA5VFZxdyl1Y1dq+/n5P6k+oXv8J
	Fx6IjwHOGgrD3CduUF2Vw2sEPhrUsmYsEQlSo=
MIME-Version: 1.0
Received: by 10.141.101.2 with SMTP id d2mr3552259rvm.235.1263988210169; Wed, 
	20 Jan 2010 03:50:10 -0800 (PST)
In-Reply-To: <19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
	<ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
	<ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
	<19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
Date: Wed, 20 Jan 2010 17:20:10 +0530
Message-ID: <ec1f3d401001200350g9fb8480h1ed53a8ee4a90e0@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Wed, 20 Jan 2010 11:52:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

>
> It seems that qemu is aborting while running localedef. Unless you
> really need locales I would recommend to disable
> the locale generation. Add
> ENABLE_BINARY_LOCALE_GENERATION =3D "0"
> to your local.conf and rebuild eglibc.
>
> -Khem
>

hi, i have some progress to report. The build completed and generated a
vmlinux image and a file-system tarball. I created a ramdisk (initrd) and
tried to boot the kernel on my cortex A9 hardware. I notice that the kernel
boots till the point where it frees init memory, after which it hangs. Here
is a short kernel boot log -

------------------8<8<8<8<8<8<-----------------------
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
i2c /dev entries driver
Serial: AMBA PL011 UART driver
uart0_bus: ttyAMA0 at MMIO 0x80120000 mem 0xc8812000 (irq =3D 43) is a
AMBA/PL011
uart1_bus: ttyAMA1 at MMIO 0x80121000 mem 0xc8814000 (irq =3D 51) is a
AMBA/PL011
uart2_bus: ttyAMA2 at MMIO 0x80007000 mem 0xc8816000 (irq =3D 58) is a
AMBA/PL011
console [ttyAMA2] enabled
brd: module loaded
mice: PS/2 mouse device common for all mice
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 92K
=F8=BE=80=FF
------------------------8<8<8<8<8<-------------------

If i pass a statically linked hello application to init (init=3Dhello), it
works.

My toolchain lineup remains same, as published in my previous mail. Is
eglibc somehow messed up ? Any pointers ?

Thanks
--RK

