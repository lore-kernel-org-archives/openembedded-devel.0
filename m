Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mjzi1-0000pg-8m
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 20:09:57 +0200
Received: by qw-out-1920.google.com with SMTP id 4so393851qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 10:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=k0dQ5natNcRQ5RoT0p0zcOzK2mKtsjacxzBOLD5hi/g=;
	b=bPcqYYyy06NlAozETitjuuGDRD0yo7weVZMmx8gvfivpRP0a+zkKSdriretEbcn1+o
	30QbCuHeZmVTN5pLiQ/jjDx5X7DRVT9Cx39zPgXle+gtayEnIGAi0v3qOo2up7dquhoE
	lICT2omSBQcwBr/0iHmpago2bPSEj9z7C+r68=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=d4U2xiEgQ0PuuZbmq/Fr2aMQjyyJ2NipG+QdbiYGTZNMOo/tt2WuA+B0+Zu2XuhuGz
	idWnntNHog8J3ziav4fSE4DLqnt+fIEpv2UEJiuWhL9l80voTqySGCvNVK4SmZwJ9fgn
	WrihNv4D5caluuYXRUZo5JTSg+Y48ug7qV8UE=
MIME-Version: 1.0
Received: by 10.229.29.85 with SMTP id p21mr3459340qcc.101.1252173052198; Sat, 
	05 Sep 2009 10:50:52 -0700 (PDT)
In-Reply-To: <27c25bc40909050924o3632ba7dp8dd84e950a689617@mail.gmail.com>
References: <27c25bc40909050924o3632ba7dp8dd84e950a689617@mail.gmail.com>
Date: Sat, 5 Sep 2009 10:50:52 -0700
Message-ID: <19c1b8a90909051050s382dcbf1of5aed8482cfd25aa@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: unable to bitbake ortp
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
X-List-Received-Date: Sat, 05 Sep 2009 18:09:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2009 at 9:24 AM, Juan Backson<juanbackson@gmail.com> wrote:
> Hi,
>
> I don't know why, but I am getting a strange problem with not being able =
to
> bitbake ortp. =C2=A0We are pretty desperate right now at this problem as =
we can't
> move forward with our project without this fixed. =C2=A0Could someone ple=
ase help
> us out?

If you are using .dev then there is ortp-0.13 which I built here
without any problem
on a sidenote it says DEPENDS =3D "glibc " which I think should be
changed to virtual/libc
but as long as you are using glibc/eglibc based system it should not
be a problem.

>
>
> OE:beagleboard [juan@localhost openembedded]$ cat
> /home/anne/oe/tmp/work/armv7a-angstrom-linux-gnueabi/ortp-0.7.1-r1/temp/l=
og.do_compile.21313
> NOTE: make
> make =C2=A0all-recursive
> make[1]: Entering directory
> `/home/anne/oe/tmp/work/armv7a-angstrom-linux-gnueabi/ortp-0.7.1-r1/ortp-=
0.7.1'
> Making all in src
> make[2]: Entering directory
> `/home/anne/oe/tmp/work/armv7a-angstrom-linux-gnueabi/ortp-0.7.1-r1/ortp-=
0.7.1/src'
> Making all in .
> make[3]: Entering directory
> `/home/anne/oe/tmp/work/armv7a-angstrom-linux-gnueabi/ortp-0.7.1-r1/ortp-=
0.7.1/src'
> /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC =C2=A0 --mode=3D=
compile
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon
> -mfloat-abi=3Dsoftfp -DHAVE_CONFIG_H -I. -I.. -I../include/
> -isystem/home/anne/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/inclu=
de
> -D_ORTP_SOURCE =C2=A0-DG_LOG_DOMAIN=3D\"oRTP\" -I.. -pthread
> -I/home/anne/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/home/anne/oe/tm=
p/staging/x86_64-linux/usr/include/glib-2.0
> -I/home/anne/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/home/anne/oe/tm=
p/staging/x86_64-linux/usr/lib/glib-2.0/include
> -isystem/home/anne/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/inclu=
de
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -Wa=
ll
> -MT str_utils.lo -MD -MP -MF .deps/str_utils.Tpo -c -o str_utils.lo
> str_utils.c
> arm-angstrom-linux-gnueabi-libtool: compile: =C2=A0arm-angstrom-linux-gnu=
eabi-gcc
> -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp
> -DHAVE_CONFIG_H -I. -I.. -I../include/
> -isystem/home/anne/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/inclu=
de
> -D_ORTP_SOURCE -DG_LOG_DOMAIN=3D\"oRTP\" -I.. -pthread
> -I/home/anne/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/home/anne/oe/tm=
p/staging/x86_64-linux/usr/include/glib-2.0
> -I/home/anne/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/home/anne/oe/tm=
p/staging/x86_64-linux/usr/lib/glib-2.0/include
> -isystem/home/anne/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/inclu=
de
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -Wa=
ll
> -MT str_utils.lo -MD -MP -MF .deps/str_utils.Tpo -c str_utils.c =C2=A0-fP=
IC -DPIC
> -o .libs/str_utils.o
> In file included from str_utils.c:20:
> ../include/ortp/rtpport.h:146:18: error: glib.h: No such file or director=
y
> In file included from str_utils.c:20:
> ../include/ortp/rtpport.h:291: error: expected specifier-qualifier-list
> before 'guint16'
> ../include/ortp/rtpport.h:298: error: expected specifier-qualifier-list
> before 'guint32'
> In file included from str_utils.c:21:
> ../include/ortp/rtp.h:48: error: expected specifier-qualifier-list before
> 'guint16'
> ../include/ortp/rtp.h:66: error: expected specifier-qualifier-list before
> 'guint64'
> In file included from str_utils.c:22:
> ../include/ortp/str_utils.h:42: error: expected specifier-qualifier-list
> before 'guint'
> ../include/ortp/str_utils.h:49: error: expected specifier-qualifier-list
> before 'gint'
> ../include/ortp/str_utils.h:68: error: expected ')' before 'size'
> ../include/ortp/str_utils.h:92: error: expected '=3D', ',', ';', 'asm' or
> '__attribute__' before 'msgdsize'
> ../include/ortp/str_utils.h:103: error: expected declaration specifiers o=
r
> '...' before 'gboolean'
> ../include/ortp/str_utils.h:104: error: expected declaration specifiers o=
r
> '...' before 'gboolean'
> str_utils.c: In function 'qinit':
> str_utils.c:31: error: 'queue_t' has no member named 'q_mcount'
> str_utils.c: In function 'allocb':
> str_utils.c:44: error: 'gchar' undeclared (first use in this function)
> str_utils.c:44: error: (Each undeclared identifier is reported only once
> str_utils.c:44: error: for each function it appears in.)
> str_utils.c:44: error: 'buf' undeclared (first use in this function)
> str_utils.c:46: warning: implicit declaration of function 'g_malloc'
> str_utils.c:46: warning: assignment makes pointer from integer without a
> cast
> str_utils.c:48: warning: assignment makes pointer from integer without a
> cast
> str_utils.c:54: error: 'dblk_t' has no member named 'ref_count'
> str_utils.c:55: error: 'g_free' undeclared (first use in this function)
> str_utils.c: In function 'allocb_with_buf':
> str_utils.c:68: warning: assignment makes pointer from integer without a
> cast
> str_utils.c:70: warning: assignment makes pointer from integer without a
> cast
> str_utils.c:75: error: 'dblk_t' has no member named 'ref_count'
> str_utils.c: In function 'freeb':
> str_utils.c:87: warning: implicit declaration of function 'g_return_if_fa=
il'
> str_utils.c:90: error: 'struct datab' has no member named 'ref_count'
> str_utils.c:91: error: 'struct datab' has no member named 'ref_count'
> str_utils.c:95: warning: implicit declaration of function 'g_free'
> str_utils.c: In function 'dupb':
> str_utils.c:115: warning: implicit declaration of function
> 'g_return_val_if_fail'
> str_utils.c:118: error: 'struct datab' has no member named 'ref_count'
> str_utils.c:119: warning: assignment makes pointer from integer without a
> cast
> str_utils.c: In function 'putq':
> str_utils.c:148: error: 'queue_t' has no member named 'q_mcount'
> str_utils.c: In function 'getq':
> str_utils.c:160: error: 'queue_t' has no member named 'q_mcount'
> str_utils.c: In function 'insq':
> str_utils.c:171: error: 'queue_t' has no member named 'q_mcount'
> str_utils.c: In function 'remq':
> str_utils.c:179: error: 'queue_t' has no member named 'q_mcount'
> str_utils.c: At top level:
> str_utils.c:197: error: expected '=3D', ',', ';', 'asm' or '__attribute__=
'
> before 'msgdsize'
> str_utils.c: In function 'msgpullup':
> str_utils.c:210: error: 'gint' undeclared (first use in this function)
> str_utils.c:210: error: expected ';' before 'msgsize'
> str_utils.c:211: error: expected ';' before 'rlen'
> str_utils.c:212: error: expected ';' before 'mlen'
> str_utils.c:215: error: 'msgsize' undeclared (first use in this function)
> str_utils.c:216: error: 'rlen' undeclared (first use in this function)
> str_utils.c:220: error: 'mlen' undeclared (first use in this function)
> str_utils.c: In function 'copyb':
> str_utils.c:246: error: 'gint' undeclared (first use in this function)
> str_utils.c:246: error: expected ';' before 'len'
> str_utils.c:247: error: 'len' undeclared (first use in this function)
> str_utils.c: At top level:
> str_utils.c:266: error: expected declaration specifiers or '...' before
> 'gboolean'
> str_utils.c: In function 'appendb':
> str_utils.c:267: error: 'gint' undeclared (first use in this function)
> str_utils.c:267: error: expected ';' before 'padcnt'
> str_utils.c:269: error: 'pad' undeclared (first use in this function)
> str_utils.c:270: error: 'padcnt' undeclared (first use in this function)
> str_utils.c: At top level:
> str_utils.c:287: error: expected declaration specifiers or '...' before
> 'gboolean'
> str_utils.c: In function 'msgappend':
> str_utils.c:289: error: 'pad' undeclared (first use in this function)
> str_utils.c:289: error: too many arguments to function 'appendb'
> make[3]: *** [str_utils.lo] Error 1
> make[3]: Leaving directory
> `/home/anne/oe/tmp/work/armv7a-angstrom-linux-gnueabi/ortp-0.7.1-r1/ortp-=
0.7.1/src'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory
> `/home/anne/oe/tmp/work/armv7a-angstrom-linux-gnueabi/ortp-0.7.1-r1/ortp-=
0.7.1/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory
> `/home/anne/oe/tmp/work/armv7a-angstrom-linux-gnueabi/ortp-0.7.1-r1/ortp-=
0.7.1'
> make: *** [all] Error 2
> FATAL: oe_runmake failed
>
>
> Thanks,
> jb
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


