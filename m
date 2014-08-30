Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 29CD062252
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Aug 2014 08:37:13 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so3110580wgg.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Aug 2014 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PymM6v7dzmlZQ7V/sJIgHjHPnSeqMbWEU7+ROVYTWfA=;
	b=EQJl7xwvIkBRAv9QktfmKmAp1ztyHMI8hu2Q65KIeo42FUT09NKY6YaPAhRAmYKO9y
	jRwscTUdpBAnwz+t1u0oCMOqgwhDWv2C16x4lG63dDKgQc+1YX+3HCjKq4txk4BMtOZR
	qxF0WNqoNZIAHskHslTeLcIGRro5YG++89X2gbpznN50QOGtz/YpJbuFuWs1T44o6Ru4
	ltcYKOdaHqg3TtEGML5J+gJAXDTdq+52q4/TNhdQDNq5MiQBxXSqkRcmPIRpmpL5xnOi
	1GhbaNiT3ar+pdfUhq5trqHAOD1rLIH31LV9kT3v8688FpHIcmEc/tzHeoVZCQlTR01I
	h3qQ==
X-Received: by 10.180.108.147 with SMTP id hk19mr9091730wib.4.1409387834190;
	Sat, 30 Aug 2014 01:37:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s14sm3627203wik.23.2014.08.30.01.37.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Aug 2014 01:37:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 30 Aug 2014 10:37:24 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140830083724.GQ16066@jama>
References: <1408903501-5728-1-git-send-email-andrei@gherzan.ro>
	<20140827120857.GD20524@jama>
	<CAK18fxEBqgkznp0dBMeP+6X=VwMzzR4RgZ6Jc6F=d3o9JqousA@mail.gmail.com>
	<CANx9H-C0O1WzvJ7NyRO8W73rQfr2N53NYycsBpFYJ1_=xnehjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-C0O1WzvJ7NyRO8W73rQfr2N53NYycsBpFYJ1_=xnehjg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-multimedia][PATCH V2 1/1] xbmc: Update to v13.2
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
X-List-Received-Date: Sat, 30 Aug 2014 08:37:17 -0000
X-Groupsio-MsgNum: 51929
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sr8SBrQ3fbgntwtR"
Content-Disposition: inline

--sr8SBrQ3fbgntwtR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2014 at 07:05:29PM -0700, Tim Orling wrote:
> On Fri, Aug 29, 2014 at 4:06 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>=20
> > On Wed, Aug 27, 2014 at 2:08 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > On Sun, Aug 24, 2014 at 08:05:01PM +0200, Andrei Gherzan wrote:
> > > > * refactor dependencies
> > > > * remove already merged patches
> > > > * define PACKAGECONFIG for different configurations
> > > > * have above PACKAGECONFIG values activated by default
> > > > * various cleanups and refactoring
> > > > * use internal ffmpeg - there are some known issues while compiling
> > > > with external libav
> > > > * define --with-arch to be passed to internal ffmpeg configuration
> > > > script
> > > > * add support for qemuarm
> > > > * add libcec, rtmpdump to DEPENDS
> > > > * add libpulsecommon to RDEPENDS
> > > >
> > > > Tested on Fedora 20 host using poky + meta-oe master:
> > > > 1. build only qemux86
> > > > 2. build only qemuarm
> > > > 3. build and runtime test raspberrypi - (patches to come).
> > >
> > > Fails in world builds for qemux86-64 with:
> > >
> > > | [ 48%] Building CXX object CMakeFiles/projectM.dir/fftsg.cpp.o
> > > | CC    libavfilter/vf_histeq.o
> > > | CC    libavfilter/vf_histogram.o
> > > | CPP     xbmc/utils/SortUtils.o
> > > | CPP     xbmc/utils/Splash.o
> > > | depbase=3D`echo ../common.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
> > > |       x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> > > -mfpmath=3Dsse
> > > --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux=
86-64
> > > -DHAVE_CONFIG_H -I. -I../..  -DPKGDATADIR=3D\"/usr/share/rsxs\" -I./..
> > > -I../../lib  -D_LINUX -DXBMC    -O2  -O2 -pipe -g
> > > -feliminate-unused-debug-types -fvisibility-inlines-hidden -fPIC -DPIC
> > > -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEB=
UG
> > -Wall
> > > -MT ../common.o -MD -MP -MF $depbase.Tpo -c -o ../common.o ../common.=
cc
> > &&\
> > > |       mv -f $depbase.Tpo $depbase.Po
> > > | CC    libavfilter/vf_hqdn3d.o
> > > | CPP     xbmc/guilib/GUIListGroup.o
> > > | CPP     xbmc/utils/Stopwatch.o
> > > | CPP     xbmc/utils/StreamDetails.o
> > > | CC    libavfilter/vf_hue.o
> > > | In file included from ../common.cc:50:0:
> > > |
> > >
> > /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/incl=
ude/c++/4.9.1/ctime:70:11:
> > > error: '::gmtime' has not been declared
> > > |    using ::gmtime;
> > > |            ^
> > > |
> > >
> > /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/incl=
ude/c++/4.9.1/ctime:71:11:
> > > error: '::localtime' has not been declared
> > > |    using ::localtime;
> > > |            ^
> > > | make[5]: *** [../common.o] Error 1
> > > | make[5]: Leaving directory
> > >
> > `/home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/xbmc=
/13.2-r0/git/xbmc/screensavers/rsxs-0.9/src/euphoria'
> > > | make[4]: *** [all-recursive] Error 1
> > >
> > > (this is the same error which was mentioned in PNBLACKLIST before)
> > >
> >
>=20
> I am fairly certain I had my disable rsxs patch applied locally (which Ja=
Ma
> is applying in master-next), so I did not see this error.

I've re-cherry-picked that one into master next after reporting the
failure, but it doesn't work because:

xbmc-13.2: xbmc: configure was passed unrecognised options:
--disable-rxsx [unknown-configure-option]

> > Will try to reproduce it on 64.
> >
> >
> > >
> > > and qemuarm:
> > > | CC      lib/vgmstream/src/coding/mpeg_decoder.o
> > > | OpenMaxVideo.cpp:59:8: error: 'PFNEGLCREATEIMAGEKHRPROC' does not n=
ame
> > a
> > > type
> > > |  static PFNEGLCREATEIMAGEKHRPROC eglCreateImageKHR;
> > > |         ^
> > > | OpenMaxVideo.cpp:60:8: error: 'PFNEGLDESTROYIMAGEKHRPROC' does not =
name
> > > a type
> > > |  static PFNEGLDESTROYIMAGEKHRPROC eglDestroyImageKHR;
> > > |         ^
> > > ....
> > > | In file included from OpenMaxVideo.cpp:32:0:
> > > | DVDVideoCodec.h:48:7: error: forward declaration of 'class
> > COpenMaxVideo'
> > > |  class COpenMaxVideo;
> > > |        ^
> > >
> > >
> > I tested build on quemuarm and it worked on my host. This is strange...
> >
> > Likewise, I saw no problem on Fedora 20 building for distroless qemuarm.
> However, running in core-image-sato is still seg faulting for me. I have
> not had time to dig any deeper on that front.
>=20
> --Tim
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sr8SBrQ3fbgntwtR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQBjUQACgkQN1Ujt2V2gBxEZgCbB1e+qqctB72/Kpl0omEgvYgo
tkMAn1sD7KYK5QvE882wnO5i4IMlQGxD
=992z
-----END PGP SIGNATURE-----

--sr8SBrQ3fbgntwtR--
