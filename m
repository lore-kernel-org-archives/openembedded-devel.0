Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OlEVe-00074L-Ob
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 07:15:06 +0200
Received: by pwj1 with SMTP id 1so2209461pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 22:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ITfXRSP0I45VLG8nnBLniYb3eduuGLAgzY+bebezcgY=;
	b=AnvsvVximVYRpB5Y49/sZHoYCubzYyoWUkDzjhyMrBYP4xKxmfZJGt+CCZOrjp0VuJ
	YtDgB05lHcYEkTBvk0Sic6Cc8g0urJkNsTdRWOu01UOw71/hOgIy0BIEOZGBzoJ6I1hX
	sckJR+8ViOomJuzqtNI0kNhP3x+E1hpIT+fdU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=nzYD4c+YA9p9YJC/no9AtVTCpKmvYWjeY8Ff10Pjmv7MKeGORLfry/8pElSSYnqY2r
	CzGr1r3Ks15SU/L6MouJRrezhB/RnsNpE9Qs79idUWaCF9e26eytghqXaeD1wUoBYf6O
	E6dBpEGp/0tjmWWA5QXrm8EkVzQBwdaabV+iw=
Received: by 10.114.109.6 with SMTP id h6mr7341443wac.75.1282022072013;
	Mon, 16 Aug 2010 22:14:32 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s5sm13581162wak.0.2010.08.16.22.14.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 22:14:31 -0700 (PDT)
Date: Mon, 16 Aug 2010 22:14:41 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100817051441.GB17124@gmail.com>
References: <4C69F11C.8060808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C69F11C.8060808@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Martin Jansa : eglibc: build with -ggdb3 as workaround for alignment traps
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
X-List-Received-Date: Tue, 17 Aug 2010 05:15:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On (17/08/10 11:47), Graham Gower wrote:
> Commit 0dee8eb3458f655ff7e21a898178051c521e5891 broke eglibc on mipsel.

yeah I guess this commit was a temporary fix for arm. May be it should be
localised using arm override.

something like this

FULL_OPTIMIZATION_append_pn-eglibc_arm =3D " -ggdb3"

instead would be better.

Thx
-Khem

>=20
> mipsel-oe-linux-gcc -march=3Dmips32 -mabi=3D32   -shared -static-libgcc -=
Wl,-O1  -Wl,-z,defs -Wl,-dynamic-linker=3D/lib/ld.so.1  -B/mnt/oe/tmp/work/=
mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/csu/  -Wl=
,--version-script=3D/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr=
10690/build-mipsel-oe-linux/libc.map -Wl,-soname=3Dlibc.so.6 -Wl,-z,relro -=
nostdlib -nostartfiles -e __libc_main -L/mnt/oe/tmp/work/mipsel-oe-linux/eg=
libc-2.11-r11.6+svnr10690/build-mipsel-oe-linux -L/mnt/oe/tmp/work/mipsel-o=
e-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/math -L/mnt/oe/tm=
p/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/el=
f -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mips=
el-oe-linux/dlfcn -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr=
10690/build-mipsel-oe-linux/nss -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2=
=2E11-r11.6+svnr10690/build-mipsel-oe-linux/nis -L/mnt/oe/tmp/work/mipsel-o=
e-linux/eglibc-2.11-r11.6+svn
> r10690/build-mipsel-oe-linux/rt -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc=
-2.11-r11.6+svnr10690/build-mipsel-oe-linux/resolv -L/mnt/oe/tmp/work/mipse=
l-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/crypt -L/mnt/o=
e/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linu=
x/nptl -Wl,-rpath-link=3D/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6=
+svnr10690/build-mipsel-oe-linux:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.=
11-r11.6+svnr10690/build-mipsel-oe-linux/math:/mnt/oe/tmp/work/mipsel-oe-li=
nux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf:/mnt/oe/tmp/work/=
mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/dlfcn:/mn=
t/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-l=
inux/nss:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build=
-mipsel-oe-linux/nis:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svn=
r10690/build-mipsel-oe-linux/rt:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.1=
1-r11.6+svnr10690/b
> uild-mipsel-oe-linux/resolv:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-=
r11.6+svnr10690/build-mipsel-oe-linux/crypt:/mnt/oe/tmp/work/mipsel-oe-linu=
x/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/nptl -o /mnt/oe/tmp/wor=
k/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/libc.so=
 -T /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mips=
el-oe-linux/shlib.lds /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+sv=
nr10690/build-mipsel-oe-linux/csu/abi-note.o /mnt/oe/tmp/work/mipsel-oe-lin=
ux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf/soinit.os /mnt/oe/=
tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/=
libc_pic.os /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/bu=
ild-mipsel-oe-linux/elf/sofini.os /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2=
=2E11-r11.6+svnr10690/build-mipsel-oe-linux/elf/interp.os /mnt/oe/tmp/work/=
mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf/ld.so=
 -lgcc=20
> /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel=
-oe-linux/libc_pic.os: In function `_mcount':
> (.debug_macinfo+0x5ccf524): relocation truncated to fit: R_MIPS_HI16 agai=
nst `_gp_disp'
> collect2: ld returned 1 exit status
> make[1]: *** [/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr1069=
0/build-mipsel-oe-linux/libc.so] Error 1
> make[1]: Leaving directory `/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-=
r11.6+svnr10690/eglibc-2_11/libc'
> make: *** [all] Error 2
> FATAL: oe_runmake failed
>=20
>=20
> Full log.do_compile here: http://pastebin.com/k4D9etWP
>=20
> -Graham
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


