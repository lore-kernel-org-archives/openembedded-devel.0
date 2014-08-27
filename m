Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id F145C6FE64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:32:46 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so550199wiw.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pdBZ0+ut4U6firlqBRYko1Uto2iywas/bBay43+r9Uo=;
	b=pEevP1r/7JWT8Ot/WHKIv1/05sD8wqqPuWMOpJ7ptKAl0y38pwUvndAV6Y3j5xWOlT
	f7eGBKRIGMAASMcmjth7G7cK5JC3zJ3RKFvW4x0rR2ei5Fx0eAUUeyRGD2U9nnnPcSAO
	osODpLfzuhwgxI7bxXrxdLWtTfuZG/NMjt1X1uc4sly5k6kUsGYSHoDc1/NRd1kjdbY1
	3E7EKp/lKtc9J3jK1lJm0Zj7y7dg5b2VQYAbDz/ln/cYJAUixSc8mo6OA1ups+vkKkvB
	jvT8F/aY2B9XBDEcSjlI/yvl4NtMIK/NiQs23I+r/sP9NQBNVAqnDkfocDv+E7YJrg6U
	EpJQ==
X-Received: by 10.180.19.97 with SMTP id d1mr29400791wie.19.1409149967285;
	Wed, 27 Aug 2014 07:32:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w20sm24448330wie.7.2014.08.27.07.32.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Aug 2014 07:32:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Aug 2014 16:32:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140827143255.GE20524@jama>
References: <1408903501-5728-1-git-send-email-andrei@gherzan.ro>
	<20140827120857.GD20524@jama> <ltkin8$p68$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ltkin8$p68$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 27 Aug 2014 14:32:53 -0000
X-Groupsio-MsgNum: 51873
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iTgyUaBDSpHJk5wi"
Content-Disposition: inline

--iTgyUaBDSpHJk5wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2014 at 02:25:12PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Martin Jansa schreef op 27-08-14 14:08:
> > On Sun, Aug 24, 2014 at 08:05:01PM +0200, Andrei Gherzan wrote:
> >> * refactor dependencies * remove already merged patches * define
> >> PACKAGECONFIG for different configurations * have above PACKAGECONFIG
> >> values activated by default * various cleanups and refactoring * use
> >> internal ffmpeg - there are some known issues while compiling with
> >> external libav * define --with-arch to be passed to internal ffmpeg
> >> configuration script * add support for qemuarm * add libcec, rtmpdump
> >> to DEPENDS * add libpulsecommon to RDEPENDS
> >>=20
> >> Tested on Fedora 20 host using poky + meta-oe master: 1. build only
> >> qemux86 2. build only qemuarm 3. build and runtime test raspberrypi -
> >> (patches to come).
> >=20
> > Fails in world builds for qemux86-64 with:
> >=20
> > | [ 48%] Building CXX object CMakeFiles/projectM.dir/fftsg.cpp.o | CC
> > libavfilter/vf_histeq.o | CC	libavfilter/vf_histogram.o | CPP
> > xbmc/utils/SortUtils.o | CPP     xbmc/utils/Splash.o | depbase=3D`echo
> > ../common.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\ | 	x86_64-oe-linux-g++
> > -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
> > --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86=
-64
> > -DHAVE_CONFIG_H -I. -I../..  -DPKGDATADIR=3D\"/usr/share/rsxs\" -I./..
> > -I../../lib  -D_LINUX -DXBMC    -O2  -O2 -pipe -g
> > -feliminate-unused-debug-types -fvisibility-inlines-hidden -fPIC -DPIC
> > -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG
> > -Wall -MT ../common.o -MD -MP -MF $depbase.Tpo -c -o ../common.o
> > ../common.cc &&\ | 	mv -f $depbase.Tpo $depbase.Po | CC
> > libavfilter/vf_hqdn3d.o | CPP     xbmc/guilib/GUIListGroup.o | CPP
> > xbmc/utils/Stopwatch.o | CPP     xbmc/utils/StreamDetails.o | CC
> > libavfilter/vf_hue.o | In file included from ../common.cc:50:0: |
> > /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/incl=
ude/c++/4.9.1/ctime:70:11:
> > error: '::gmtime' has not been declared |    using ::gmtime; |
> > ^ |
> > /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/incl=
ude/c++/4.9.1/ctime:71:11:
> > error: '::localtime' has not been declared |    using ::localtime; |
> > ^ | make[5]: *** [../common.o] Error 1 | make[5]: Leaving directory
> > `/home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/xbmc=
/13.2-r0/git/xbmc/screensavers/rsxs-0.9/src/euphoria'
> >
> >=20
> | make[4]: *** [all-recursive] Error 1
> >=20
> > (this is the same error which was mentioned in PNBLACKLIST before)
>=20
> That's fixed by --disable-rsxs, no?

Probably yes, someone should integrate
http://patchwork.openembedded.org/patch/67379/
in next patch set

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFT/c4oMkyGM64RGpERAli9AKCjcd/o2Ha55NcpV3k3hSAdyyw5wgCfRNfx
> wix5RoY71AKQC/PXo2cG5Oc=3D
> =3DJnwm
> -----END PGP SIGNATURE-----
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iTgyUaBDSpHJk5wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP97BcACgkQN1Ujt2V2gBz7tQCdG8+6sdnORsl6AD2eDmhCCkvs
GLAAn1OAQIaiazJBwZCZrbG1st6KMU7T
=KSIn
-----END PGP SIGNATURE-----

--iTgyUaBDSpHJk5wi--
