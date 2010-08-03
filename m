Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgHeI-0005QC-0b
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 15:35:19 +0200
Received: by fxm12 with SMTP id 12so2076397fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=JO5BzdMUR92QISG6t+Myqc/EKyl2//fL1x2vWoORpW8=;
	b=hnXjkOc7SDVH9p+axnJhUxea4U8Sg8yaxmBhwjO/47Li8IGJQSPvLydxNZrYAgOvYS
	EdrDztRPqV2MAJITvCjWAq68jQfroR4zhCrhpzfBWODp9HzhH0/fdRTQmVALPiclGinx
	UaKeQIl1snS7AgwTwD/R+j6iDR7I2y98CBzlw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=w01R/9xJXpQQhacM3+vD9209KKy196F7+nKwPoyB2PVgKCHnrfluSRbwua4JXzMcbv
	KBNiW/xHLnJCuONR97+LML4WmxIJyqgl8fXiOT2sOKo7eRGdQv6ZHlBkbi1IqxsB6xYD
	oBFej2qDRVCmvBUkoLqHkT49rvyGhnuWL6oOw=
Received: by 10.223.121.16 with SMTP id f16mr7305362far.72.1280842514152;
	Tue, 03 Aug 2010 06:35:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f11sm2463554fak.44.2010.08.03.06.35.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 06:35:13 -0700 (PDT)
Date: Tue, 3 Aug 2010 15:35:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803133515.GD12134@jama>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org>
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
	<i38q56$4hq$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i38q56$4hq$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Tue, 03 Aug 2010 13:35:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2010 at 12:13:58PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Acked-by: Koen Kooi <k-kooi@ti.com>
>=20
> If noone objects, can we get this in ASAP?

Building from scratch armv4t then armv6 was ok, building few more
packages for armv4t again still worked, but now I've upgraded gcc/eglibc
and building eglibc-initial for armv4t first fails:

http://tinderbox.openembedded.org/packages/665289/
http://build.shr-project.org/tests/jama/config.log

see=20
configure: error: compiler support for __thread is require
and
Fatal error: Invalid -march=3D option: `armv4t'

shr@opmbuild:~/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/eglibc-initial=
-2.12-r11.2+svnr11028/build-arm-oe-linux-gnueabi$ which arm-oe-linux-gnueab=
i-gcc
/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/bin/arm-oe-linu=
x-gnueabi-gcc

shr@opmbuild:~/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/eglibc-initial=
-2.12-r11.2+svnr11028/build-arm-oe-linux-gnueabi$ /home/shr/shr-unstable/tm=
p/sysroots/x86_64-linux/usr/armv6-novfp/bin/arm-oe-linux-gnueabi-gcc -v
Using built-in specs.
COLLECT_GCC=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv6-no=
vfp/bin/arm-oe-linux-gnueabi-gcc
COLLECT_LTO_WRAPPER=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/=
armv6-novfp/libexec/gcc/arm-oe-linux-gnueabi/4.5.1/lto-wrapper
Target: arm-oe-linux-gnueabi
Configured with: /home/shr/shr-unstable/tmp/work/armv6-novfp-oe-linux-gnuea=
bi/gcc-cross-4.5-r1+svnr162398/gcc-4.5/configure --build=3Dx86_64-linux --h=
ost=3Dx86_64-linux --target=3Darm-oe-linux-gnueabi --prefix=3D/home/shr/shr=
-unstable/tmp/sysroots/x86_64-linux/usr/armv6-novfp --exec_prefix=3D/home/s=
hr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv6-novfp --bindir=3D/home/=
shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv6-novfp/bin --sbindir=3D=
/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv6-novfp/bin --libe=
xecdir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv6-novfp/l=
ibexec --datadir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/arm=
v6-novfp/share --sysconfdir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-li=
nux/etc --sharedstatedir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux=
/com --localstatedir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/var=
 --libdir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv6-novf=
p/lib --includedir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/a=
rmv6-novfp/include --oldincludedir=3D/home/shr/shr-unstable/tmp/sysroots/x8=
6_64-linux/usr/armv6-novfp/include --infodir=3D/home/shr/shr-unstable/tmp/s=
ysroots/x86_64-linux/usr/armv6-novfp/share/info --mandir=3D/home/shr/shr-un=
stable/tmp/sysroots/x86_64-linux/usr/armv6-novfp/share/man --with-gnu-ld --=
enable-shared --enable-languages=3Dc,c++,objc --enable-threads=3Dposix --di=
sable-multilib --enable-c99 --enable-long-long --enable-symvers=3Dgnu --ena=
ble-libstdcxx-pch --program-prefix=3Darm-oe-linux-gnueabi- --enable-target-=
optspace --enable-lto --enable-libssp --disable-bootstrap --disable-libgomp=
 --disable-libmudflap --with-float=3Dsoft --with-local-prefix=3D/home/shr/s=
hr-unstable/tmp/sysroots/armv6-novfp-oe-linux-gnueabi/usr --with-gxx-includ=
e-dir=3D/home/shr/shr-unstable/tmp/sysroots/armv6-novfp-oe-linux-gnueabi/us=
r/include/c++ --with-sysroot=3D/home/shr/shr-unstable/tmp/sysroots/armv6-no=
vfp-oe-linux-gnueabi --with-build-sysroot=3D/home/shr/shr-unstable/tmp/sysr=
oots/armv6-novfp-oe-linux-gnueabi --with-build-time-tools=3D/home/shr/shr-u=
nstable/tmp/sysroots/x86_64-linux/usr/armv6-novfp/bin --disable-libunwind-e=
xceptions --with-mpfr=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/us=
r --with-system-zlib --program-prefix=3Darm-oe-linux-gnueabi- --enable-__cx=
a_atexit
Thread model: posix
gcc version 4.5.1 20100722 (prerelease) (GCC)
shr@opmbuild:~/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/eglibc-initial=
-2.12-r11.2+svnr11028/build-arm-oe-linux-gnueabi$ /home/shr/shr-unstable/tm=
p/sysroots/x86_64-linux/usr/armv4t/bin/arm-oe-linux-gnueabi-gcc -v
Using built-in specs.
COLLECT_GCC=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/b=
in/arm-oe-linux-gnueabi-gcc
COLLECT_LTO_WRAPPER=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/=
armv4t/libexec/gcc/arm-oe-linux-gnueabi/4.5.2/lto-wrapper
Target: arm-oe-linux-gnueabi
Configured with: /home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/gc=
c-cross-initial-4.5-r1+svnr162808/gcc-4.5/configure --build=3Dx86_64-linux =
--host=3Dx86_64-linux --target=3Darm-oe-linux-gnueabi --prefix=3D/home/shr/=
shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t --exec_prefix=3D/home/shr=
/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t --bindir=3D/home/shr/shr=
-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/bin --sbindir=3D/home/shr/sh=
r-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/bin --libexecdir=3D/home/sh=
r/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/libexec --datadir=3D/ho=
me/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/share --sysconfdir=
=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/etc --sharedstatedir=3D=
/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/com --localstatedir=3D/hom=
e/shr/shr-unstable/tmp/sysroots/x86_64-linux/var --libdir=3D/home/shr/shr-u=
nstable/tmp/sysroots/x86_64-linux/usr/armv4t/lib --includedir=3D/home/shr/s=
hr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/include --oldincludedir=3D=
/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/include --infod=
ir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/share/info=
 --mandir=3D/home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/armv4t/sha=
re/man --with-local-prefix=3D/home/shr/shr-unstable/tmp/sysroots/armv4t-oe-=
linux-gnueabi/usr --with-newlib --without-headers --disable-shared --disabl=
e-threads --disable-multilib --disable-__cxa_atexit --enable-languages=3Dc =
--program-prefix=3Darm-oe-linux-gnueabi- --with-local-prefix=3D/home/shr/sh=
r-unstable/tmp/sysroots/armv4t-oe-linux-gnueabi/usr --with-gxx-include-dir=
=3D/home/shr/shr-unstable/tmp/sysroots/armv4t-oe-linux-gnueabi/usr/include/=
c++ --with-sysroot=3D/home/shr/shr-unstable/tmp/sysroots/armv4t-oe-linux-gn=
ueabi --with-build-sysroot=3D/home/shr/shr-unstable/tmp/sysroots/armv4t-oe-=
linux-gnueabi --with-build-time-tools=3D/home/shr/shr-unstable/tmp/sysroots=
/x86_64-linux/usr/armv4t/bin --disable-libmudflap --disable-libgomp --disab=
le-libssp --enable-decimal-float=3Dno --enable-target-optspace --with-float=
=3Dsoft --program-prefix=3Darm-oe-linux-gnueabi- --enable-__cxa_atexit
Thread model: single
gcc version 4.5.2 20100802 (prerelease) (GCC)

Any hint? I'll check better later.. just wanted to report that maybe not al=
l problems are solved with this serie.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


