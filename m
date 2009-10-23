Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N188x-00064z-5d
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 02:36:38 +0200
Received: by ewy5 with SMTP id 5so5624369ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 17:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BTymPJC7n49aTcqQ2SutXNuOi2sjSARLIlLLNFu+Sos=;
	b=aQLASxYvkmjYLui2RlLRhhYSoZpPz6ZX4vTR/wqbq4cGXs8lEpkb+cV/lEEvdkpUjX
	bv8eFKbCjJ2D3esKvlW4bKFQZjv8MaSXuTZY4UNP2fwjWzzT7VpwvkmfId5MwWYBHZ2V
	43O9rPKI5056+sbkP5hf6JpH63ooS2AMCkWSQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PWXZt0A/A5unQC0q+3s+/IDboY/+39MBXabKjQD/6Ecrh+11mdzRlQdyl8njY49aJw
	Aprbosbwbcy9AUC2EBgbo8WHpwqlVOHANIHx7/eKem+8wwZNwetUgC+eP8ZJyJiLkqtN
	iNGaMC479prSZ4I3w/9V1tRtD3XcXoOwWgN7k=
MIME-Version: 1.0
Received: by 10.210.96.12 with SMTP id t12mr56289ebb.71.1256258131523; Thu, 22 
	Oct 2009 17:35:31 -0700 (PDT)
In-Reply-To: <4AE0BEFA.4020905@mlbassoc.com>
References: <4AE0BEFA.4020905@mlbassoc.com>
Date: Thu, 22 Oct 2009 17:35:31 -0700
Message-ID: <19c1b8a90910221735t5c91498ft9a692cd75c442db4@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SDK problems
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
X-List-Received-Date: Fri, 23 Oct 2009 00:36:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2009 at 1:22 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I tried to build the QTE SDK using
> =C2=A0git://git.openembedded.org/openembedded
> =C2=A09e54aa00b3de07933fabf5f6193a4f40af3b54f9
>
> When I try the example
> =C2=A0(http://docs.openembedded.org/usermanual/html/ch05s08.html),
> I get:
>
> $ make
> arm-angstrom-linux-gnueabi-g++ -c -pipe =C2=A0 -Wall -W -D_REENTRANT
> -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
> -I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/share/qtopia/mks=
pecs/linux-g++
> -I.
> -I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi//usr/include/qtopia/=
QtCore
> -I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi//usr/include/qtopia/=
QtGui
> -I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi//usr/include/qtopia =
-I.
> -o main.o main.cpp
> arm-angstrom-linux-gnueabi-g++ =C2=A0-Wl,-rpath-link,/usr/lib -o qte-exam=
ple
> main.o =C2=A0 =C2=A0-L/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/=
/usr/lib
> -lQtGuiE -lpng -lfreetype -lQtNetworkE -pthread -pthread -pthread -pthrea=
d
> -pthread -pthread -lQtCoreE -lz -lm -pthread -lgthread-2.0 -lrt -lglib-2.=
0
> -ldl -lpthread
> /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib/crt1.o: In
> function `_start':
> init.c:(.text+0x2c): undefined reference to `__libc_csu_fini'
> init.c:(.text+0x34): undefined reference to `__libc_csu_init'
> collect2: ld returned 1 exit status
> make: *** [qte-example] Error 1
>
> Any ideas what I need to do to fix this?

One reason could be that its not getting right libc to link with. You
could check <staging>/usr/lib/libc.so
and it should be a text file which points to right libc to link with.
On glibc it was different than in eglibc
eglibc one should work. I do not know about glibc as I do not have
working version of glibc here.

>
> Thanks
>
> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


