Received: from mail-iw0-f203.google.com ([209.85.223.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NXlNm-0000Sk-33
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 01:58:49 +0100
Received: by iwn41 with SMTP id 41so1100588iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 16:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1bOziS0I3jCSvyH+18lBqsVXdhe5JsQCQWtneuOHKGU=;
	b=DSt1Dximx6iRrqu12KQgiBoD1NN6tB6zY1R/KU/Pr3L++y+IjPDtiYDe8AOoSqUgjz
	LqKl5mh5G2NeqnQbOzadu7xG5eockknn69m+ffvnTozIpCqvtHoEXBANxICHWlbgm+/S
	THpmSHdxLMRB4SXhbo/YeLJIqZh77ueF1v4sI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=i38PhGUmjdEBKWEYU4PsPAzasW4wajpGCjT9wBvPCAImK0bXQv9Z584LU5ka/qky/q
	nHvaKzW9Z1AD61GgE4WqvLmlCSf/ocmxf1O/7t7UydHMKaG6dyCFQePa/lW9e0jrJ1r5
	YAfDo7jFktzbnS6BmAxURcLJuxpslrl2MNNUo=
MIME-Version: 1.0
Received: by 10.231.148.16 with SMTP id n16mr1235820ibv.37.1264035389136; Wed, 
	20 Jan 2010 16:56:29 -0800 (PST)
In-Reply-To: <ec1f3d401001200350g9fb8480h1ed53a8ee4a90e0@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
	<ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
	<ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
	<19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
	<ec1f3d401001200350g9fb8480h1ed53a8ee4a90e0@mail.gmail.com>
Date: Wed, 20 Jan 2010 16:56:29 -0800
Message-ID: <19c1b8a91001201656g6fd1751bvc2a478b2d4c9ef8c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.203
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
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
X-List-Received-Date: Thu, 21 Jan 2010 00:58:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2010 at 3:50 AM, RK Raggit <rk.raggit@gmail.com> wrote:
>>
>> It seems that qemu is aborting while running localedef. Unless you
>> really need locales I would recommend to disable
>> the locale generation. Add
>> ENABLE_BINARY_LOCALE_GENERATION =3D "0"
>> to your local.conf and rebuild eglibc.
>>
>> -Khem
>>
>
> hi, i have some progress to report. The build completed and generated a
> vmlinux image and a file-system tarball. I created a ramdisk (initrd) and
> tried to boot the kernel on my cortex A9 hardware. I notice that the kern=
el
> boots till the point where it frees init memory, after which it hangs. He=
re
> is a short kernel boot log -
>
> ------------------8<8<8<8<8<8<-----------------------
> io scheduler noop registered
> io scheduler anticipatory registered
> io scheduler deadline registered
> io scheduler cfq registered (default)
> i2c /dev entries driver
> Serial: AMBA PL011 UART driver
> uart0_bus: ttyAMA0 at MMIO 0x80120000 mem 0xc8812000 (irq =3D 43) is a
> AMBA/PL011
> uart1_bus: ttyAMA1 at MMIO 0x80121000 mem 0xc8814000 (irq =3D 51) is a
> AMBA/PL011
> uart2_bus: ttyAMA2 at MMIO 0x80007000 mem 0xc8816000 (irq =3D 58) is a
> AMBA/PL011
> console [ttyAMA2] enabled
> brd: module loaded
> mice: PS/2 mouse device common for all mice
> RAMDISK: Compressed image found at block 0
> VFS: Mounted root (ext2 filesystem).
> Freeing init memory: 92K
> =F8=BE=80=FF
> ------------------------8<8<8<8<8<-------------------
>
> If i pass a statically linked hello application to init (init=3Dhello), i=
t
> works.
>
> My toolchain lineup remains same, as published in my previous mail. Is
> eglibc somehow messed up ? Any pointers ?

you can boot into static dash and then debug the dynamic loading problem.
or you could build kernel with debug support and enable debug user_debug=3D=
-1
on kernel commandline if there are any crashes it should print them.

>
> Thanks
> --RK
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


