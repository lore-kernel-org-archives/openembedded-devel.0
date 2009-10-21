Received: from [209.85.219.212] (helo=mail-ew0-f212.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N0guX-0001UC-FG
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Oct 2009 21:31:56 +0200
Received: by ewy8 with SMTP id 8so1914926ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 12:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LBYq2eFem852FSkx5rm7mfdA5TtOxIA56UsXh9FGaCw=;
	b=e0Bs7zV0MEyUoleSjAnXMAxn3yUQ4uGeadByNZAh3irPlBvv0atohJPnZweudCKlsC
	bpWJV/SvNszjEd0AAWYGp/NJ236ltDgYqXHkMTwQAQ8j5lvCYDarR18zlu3zvmkdNX6I
	ZnNUhZIU3E18GnBmpmSRGLX8Ft1i5/zHqXlPM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=L+PU5rsjabIzJZB289x+mUEM+PVe2DWBJFxBVpuWiFDpxKIDkaBh9aHJ2BvuOJ05Sv
	7VrOzOmRuLq+v4BvDYzfestUsmjgCNGU3+EFz7G+9uQJqG/dokweYDQU1dTBsgYaRx5/
	xwfi9zlH/glYJYeyNJoCG1J06LyW30yThKJ+Q=
MIME-Version: 1.0
Received: by 10.210.160.10 with SMTP id i10mr3363853ebe.10.1256153452093; Wed, 
	21 Oct 2009 12:30:52 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.00.0910210827480.13736@localhost>
References: <alpine.LFD.2.00.0910210827480.13736@localhost>
Date: Wed, 21 Oct 2009 12:30:52 -0700
Message-ID: <19c1b8a90910211230n1e9984bdh916bbf62f9e82702@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: error building angstrom for beagle, dev branch
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
X-List-Received-Date: Wed, 21 Oct 2009 19:31:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2009 at 5:33 AM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
> =C2=A0from the latest git pull, a build that seemed to work fine a couple
> days ago:
>
> ... snip ...
>
> NOTE: Running task 2037 of 3361 (ID: 2919, /home/rpjday/oe/openembedded/r=
ecipes/gnome/gconf_2.26.2.bb, do_install)
> ERROR: function do_compile failed
> ERROR: see log in /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux=
-gnueabi/libgcrypt-1.4.1-r0/temp/log.do_compile.3137
> NOTE: Task failed: /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linu=
x-gnueabi/libgcrypt-1.4.1-r0/temp/log.do_compile.3137
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/rpjday/oe/openembedded/recipes/libgcrypt/libgcrypt_=
1.4.1.bb do_compile failed
> E: generating locale nb_NO (UTF-8)
> NOTE: generating locale en_DK (UTF-8)
> ... lots of this snipped ...
> NOTE: generating locale nds_NL (UTF-8)
> NOTE: generating locale ar_KW (UTF-8)
> NOTE: collecting binary locales from locale tree
> NOTE: the following files were installed but not shipped in any package:
> NOTE: =C2=A0 /etc/rpc
> NOTE: =C2=A0 /lib/libcidn-2.9.so
> NOTE: =C2=A0 /lib/libmemusage.so
> NOTE: Multiple libraries (libnss_nisplus.so.2, libnss_nis.so.2, libnss_he=
siod.so.2) found, but LEAD_SONAME 'libc.so' doesn't match any of them
> NOTE: glibc contains dangling symlink to /lib/libcidn-2.9.so
> NOTE: Couldn't find shared library provider for libgcc_s.so.1
> NOTE: package glibc-dbg skipped
> ERROR: Task 2000 (/home/rpjday/oe/openembedded/recipes/libgcrypt/libgcryp=
t_1.4.1.bb, do_compile) failed
> NOTE: Waiting for 3 active tasks to finish
> NOTE: 1: /home/rpjday/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_pack=
age (18349)
> NOTE: 2: /home/rpjday/oe/openembedded/recipes/lzo/lzo_1.08.bb, do_compile=
 (1873)
> NOTE: 3: /home/rpjday/oe/openembedded/recipes/gnome/gconf_2.26.2.bb, do_i=
nstall (7090)
> NOTE: Waiting for 2 active tasks to finish
> NOTE: 1: /home/rpjday/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_pack=
age (18349)
> NOTE: 2: /home/rpjday/oe/openembedded/recipes/gnome/gconf_2.26.2.bb, do_i=
nstall (7090)
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /home/rpjday/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_pack=
age (18349)
> NOTE: Tasks Summary: Attempted 2033 tasks of which 0 didn't need to be re=
run and 1 failed.
> ERROR: '/home/rpjday/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb=
' failed
>
>
> =C2=A0thoughts? =C2=A0i attached the relevant log file, looks like a comp=
iler
> error.

A gcc ICE is always a compiler issue.
Can you reduce the testcase. Or create  a preprocessed
file from below commands by adding -E to the options.
btw. whats the version of gcc. For me gcc 4.4.1 does not
ICE on this file but I dont use armv7 either.

/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC
--mode=3Dcompile ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a
-mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -DHAVE_CONFIG_H -I.
-I..  -I../src -I../src
-isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/=
usr/include
-I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/in=
clude
-isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/=
usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 -fvisibility=3Dhidden -Wall -Wpointer-arith -MT twofish.lo -MD
-MP -MF .deps/twofish.Tpo -c -o twofish.lo twofish.c


arm-angstrom-linux-gnueabi-libtool: compile:  ccache
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -DHAVE_CONFIG_H -I. -I.. -I../src
-I../src -isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux=
-gnueabi/usr/include
-I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/in=
clude
-isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/=
usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 -fvisibility=3Dhidden -Wall -Wpointer-arith -MT twofish.lo -MD
-MP -MF .deps/twofish.Tpo -c twofish.c  -fPIC -DPIC -o .libs/twofish.o

twofish.c: In function 'twofish_setkey':
twofish.c:713: internal compiler error: Segmentation fault


>
> rday
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Waterloo, Ontario, CANADA
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux Consulting, Training and K=
ernel Pedantry.
>
> Web page: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0http://crashcourse.ca
> Twitter: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http:=
//twitter.com/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


