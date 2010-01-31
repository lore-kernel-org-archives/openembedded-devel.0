Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NbSIb-000503-RW
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 06:24:44 +0100
Received: by iwn10 with SMTP id 10so1048327iwn.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 21:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IIF3xiuJUvBCqLG+ulu6UI+a3sZ8zE5pBAeyNBFNIlU=;
	b=V3CGtJLp9T77smmogHB8aFB+aiHqGLdh/vFmTUN69IUGNFZRq/A9HPlzEM45FZtZLC
	S1wngDcwHiL4sK+mWPJf+YX7QTBx1vMEQ203ZdoAV9UevJwf1pKJ4wZn41JQiUxMGyQ7
	NVLCSper8aQAGWMF1GUD79XjHSqh2SEKZzlB4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jTcRjows4+7dT6AFD3+hh1UeX3gT+InLrXYKMQVeSWD2kwGUtXnluucBMizf1fa6Ko
	eyInf58EUBpObgbLuQgTKbd+7pQnegZZrlS9olPj7J9GAA7mY44nCHjJ1fIYGiMXFKtv
	bywKtZzvwSlu4PWbGFvPZlZ/gX/FPTeKQkAD0=
MIME-Version: 1.0
Received: by 10.231.146.2 with SMTP id f2mr2763291ibv.23.1264915336252; Sat, 
	30 Jan 2010 21:22:16 -0800 (PST)
In-Reply-To: <op.u7dmmldamn1qzu@camelguo>
References: <op.u7dmmldamn1qzu@camelguo>
Date: Sat, 30 Jan 2010 21:22:16 -0800
Message-ID: <19c1b8a91001302122x5cde3628xd57639405a862736@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building piccontrol - 0.4 failed due to lack of liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 05:24:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 30, 2010 at 7:01 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =A0I tried to build MACHINE=3Dtsx09 DISTRO=3Dmicro LIBC=3Dglibc, but fail=
ed when
> building picontrol. The error is the following:
>
> NOTE: make -j 4 -e MAKEFLAGS=3D
> ccache arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mthumb
> -isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux=
-gnueabi/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
> =A0-I/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gn=
ueabi/include/lua5.1
> -isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux=
-gnueabi/include
> =A0-c -o piccontrol.o piccontrol.c
> ccache arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mthumb
> -isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux=
-gnueabi/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
> =A0-I/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gn=
ueabi/include/lua5.1
> -isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux=
-gnueabi/include
> =A0-c -o ts209.o ts209.c
> ccache arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mthumb
> -isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux=
-gnueabi/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
> =A0-I/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gn=
ueabi/include/lua5.1
> -isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux=
-gnueabi/include
> =A0-c -o evdev.o evdev.c
> ccache arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mthumb -o piccontrol piccontrol.o ts209.o evdev.o
> -L/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnuea=
bi/lib
> -Wl,-rpath-link,/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-=
oe-linux-gnueabi/lib
> -Wl,-O1 -Wl,--hash-style=3Dgnu
> =A0/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnue=
abi/lib/liblua5.1.a
> -lpthread -lm -ldl
> arm-oe-linux-gnueabi-gcc:
> /media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi=
/lib/liblua5.1.a:
> No such file or directory

I think micro uses a different layout and my guess is that the package
is relying upon layout where /usr is used.

in your build tree check where liblua5.1.a is installed and then
go from there.

>
> for more information, please see the following url:
> http://tinderbox.openembedded.net/packages/451539/
>
> Is there anyone who can give me some information?
>
> Thanks a lot!
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


