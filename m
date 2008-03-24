Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JdobI-0002Vn-E7
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 16:28:40 +0100
X-ASG-Debug-ID: 1206372518-544700450000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP
	id 77C3028A1E; Mon, 24 Mar 2008 10:28:38 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id vC7NVKV51hFLdAiZ; Mon, 24 Mar 2008 10:28:38 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 - stops at gcc-cross-4.2.1 configure
	GCC_NO_EXECUTABLES
Date: Mon, 24 Mar 2008 10:28:40 -0500
User-Agent: KMail/1.9.7
References: <47E7757A.6080807@linuxdevelopment.de>
In-Reply-To: <47E7757A.6080807@linuxdevelopment.de>
MIME-Version: 1.0
Message-Id: <200803241028.40698.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1206372518
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: AVR32 - stops at gcc-cross-4.2.1 configure GCC_NO_EXECUTABLES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Mar 2008 15:28:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 24 March 2008 04:33:46 am Robert W=F6rle wrote:
> Dear All
>
> I am still fighting to get a clean build for the avr32
> The build i try is on a x86_64 host (if that makes a differecen)

Could be.  I have a Core 2 Duo, but I use it as a 32-bit system.  Too many=
=20
little gotchas with x86_64 without any advantage for what I do, IMO.  I don=
't=20
think that's the problem here, though.

> First i have to "fake" external-toolchin do_populate_staging with
> touching the stamp.

Not sure why you need to use the external-toolchain anymore.  I submitted s=
ome=20
patches that got applied on March 14 that allow OE to build the same=20
toolchain that Atmel's latest AVR32 buildroot system uses.

Here's my local.conf file, stripped of all comments and blank lines:

=2D--begin---
DL_DIR =3D "${PRJROOT}/sources"
BBFILES =3D "${PRJROOT}/org.openembedded.dev/packages/*/*.bb"
BBMASK =3D ""
PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS +=3D "=20
virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
PREFERRED_VERSION_linux =3D "2.6.23"
MACHINE =3D "at32stk1000"
TARGET_FPU_avr32 =3D "soft"
TARGET_OS =3D "linux-uclibc"
DISTRO =3D "angstrom-2008.1"
ANGSTROM_MODE =3D "uclibc"
IMAGE_FSTYPES =3D "ext3 jffs2 tar"
BBDEBUG =3D "yes"
PARALLEL_MAKE =3D "-j 3"
BBINCLUDELOGS =3D "yes"
=2D--end---

I have some more patches that I'm working on, but they're for stuff much af=
ter=20
getting minimal-image working.  I can almost get through the entire=20
base-image build now.  I'm looking at an ICE while building OpenSSH right=20
now.

=2D--
Geoffrey



