Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 983016E8E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 04:10:42 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id rd3so7066499pab.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 20:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=PKTPDVyhxBYqIDFmsq8j4rTJXqJeWqos4x/Z6emCFMg=;
	b=AQcqNS38xilojEn5Bb+yyck2zm0S2mxN2p0JJljEYF/3s/zcP0diP3pyf82sVtQMsn
	KlcNisIklNhVmqHlgnr2I+TqzY7aSZbdNSW4faucU5hJfXdPvbI+dV1U3vUPMP97apu1
	YB/QMa1htUmLKF3uM288JfA8cAKGLayBCDN0FdoQ4VDrUn8xypgBUiDFnx2gdPNKIjVu
	K29zEangn213otWg8vZqUyXTcMmSnMdvRGEt02/6Om3lsRLzZ2kSuYJ9RmKLmYyUWoX5
	Jplnyvdfhin8BpGBIX2B78afbTG49Se3xHf8tXjWAQIo1XJrxmjzaenbI9bwdDTeF0pR
	+J7w==
X-Received: by 10.66.194.2 with SMTP id hs2mr29647441pac.79.1392091839529;
	Mon, 10 Feb 2014 20:10:39 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ac5sm47847324pbc.37.2014.02.10.20.10.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 20:10:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANx9H-DMjo0JaHyGqgxh31wX77Z_OmpjF=cgAayLKyYcKLenxw@mail.gmail.com>
Date: Mon, 10 Feb 2014 20:10:35 -0800
Message-Id: <FC0A8257-46FF-46AD-8061-AD3396E8B243@gmail.com>
References: <CANx9H-DMjo0JaHyGqgxh31wX77Z_OmpjF=cgAayLKyYcKLenxw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1827)
Subject: Re: xbmc build failing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2014 04:10:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Nov 28, 2013, at 2:00 PM, Tim Orling <ticotimo@gmail.com> wrote:

> using angstrom-v2013.12-yocto1.5 on Ubuntu 12.04.3 LTS x86_64:
>=20
> xbmc fails building euphoria screen saver-- configure problem?:
>=20
> | make[4]: Entering directory
> =
`/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/work/armv7ahf-=
vfp-neon-angstrom-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55da-r14/git/x=
bmc/screensavers/rsxs-0.9/src'
> | Making all in euphoria
> | make[5]: Entering directory
> =
`/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/work/armv7ahf-=
vfp-neon-angstrom-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55da-r14/git/x=
bmc/screensavers/rsxs-0.9/src/euphoria'
> | depbase=3D`echo ../common.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
> | arm-angstrom-linux-gnueabi-g++  -march=3Darmv7-a -marm =
-mthumb-interwork
> -mfloat-abi=3Dhard -mfpu=3Dneon
> =
--sysroot=3D/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/sys=
roots/beaglebone
> -DHAVE_CONFIG_H -I. -I../..  -DPKGDATADIR=3D\"/usr/share/rsxs\" -I./..
> -I../../lib  -D_LINUX -DXBMC
> =
-I/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/sysroots/beag=
lebone/usr/include/libpng16
>  -fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math
> -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2
> -mno-apcs-stack-check -MT ../common.o -MD -MP -MF $depbase.Tpo -c -o
> ../common.o ../common.cc &&\
> | mv -f $depbase.Tpo $depbase.Po
> | In file included from ../common.cc:50:0:
> |
> =
/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/sysroots/beagle=
bone/usr/include/c++/ctime:70:11:
> error: '::gmtime' has not been declared
> |    using ::gmtime;

seems like its not including proper headers may be you need to include
unistd.h=20


> |            ^
> |
> =
/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/sysroots/beagle=
bone/usr/include/c++/ctime:71:11:
> error: '::localtime' has not been declared
> |    using ::localtime;
> |            ^
> | make[5]: *** [../common.o] Error 1
> | make[5]: Leaving directory
> =
`/mnt/work/setup-scripts/build/tmp-angstrom_v2013_12-eglibc/work/armv7ahf-=
vfp-neon-angstrom-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55da-r14/git/x=
bmc/screensavers/rsxs-0.9/src/euphoria'
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


