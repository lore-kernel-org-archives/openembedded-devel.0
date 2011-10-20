Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1RH1y5-0004tt-2M
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 01:24:09 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTD00BKAXXTYI60@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Oct 2011 17:17:54 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 1C711D; Thu, 20 Oct 2011 17:17:50 -0500
Received: from [192.168.254.24] by rkmorris.us with HTTP; Thu,
	20 Oct 2011 17:17:49 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Thu, 20 Oct 2011 17:17:49 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1319149069203727500@rkmorris.us>
In-reply-to: <j7q4nl$akr$1@dough.gmane.org>
References: <1319132705374102500@rkmorris.us> <4EA073C0.7000502@mlbassoc.com>
	<j7q4nl$akr$1@dough.gmane.org>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 1
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Machine Configuration
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
X-List-Received-Date: Thu, 20 Oct 2011 23:24:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Makes sense - thanks!
But I do have to ask ... why does "oebb.sh config am3517-evm" not set this=
? I would have thought it does, but could be wrong of course.
Thanks again,... Russell


On Thu, 10/20/2011 04:44 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 20-10-11 21:17, Gary Thomas schreef:
> > On 2011-10-20 11:45, Russell Morris wrote:
> >> Hi,
> >>=20
> >> I am trying to do some builds for an am3517-evm ... but the machine=
=20
> >> configuration doesn't seem to be working (or I'm doing it wrong, more
> >> likely ... :-().
> >>=20
> >> I have successfully built console-image for qemuarm, and then use
> >> oebb.sh to set the machine (to am3517-evm, followed bu ./oebb.sh
> >> update) - but then when I try to build for this machine I see the
> >> following ...
> >>=20
> >> OE Build Configuration: BB_VERSION        =3D "1.13.3" TARGET_ARCH
> >> =3D "arm" TARGET_OS         =3D "linux-gnueabi" MACHINE           =3D
> >> "qemuarm" DISTRO            =3D "angstrom" DISTRO_VERSION    =3D
> >> "v2011.10-core" TUNE_FEATURES     =3D "armv5 dsp thumb arm926ejs"=20
> >> TARGET_FPU        =3D "soft"
> >>=20
> >> So it's still building for qemuarm, not am3517-evm ... :-(. Is anyone
> >> else having this issue? Any suggestions of how to fix this?
> >=20
> > You need to always specify MACHINE=3D"am3517-evm" on your command line=
,
> > e.g. % MACHINE=3D"am3517-evm" bitbake systemd-image
> >=20
> > Alternatively, you can add just a single line to conf/local.conf and t=
hen
> > it will be "sticky"
>=20
> not local.conf, auto.conf
>=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFOoJY1MkyGM64RGpERAliKAKCfu0E2K3Qn+lsTx5YzNRgkxrA+QwCgqJjT
> 0ZsSMZCZArrGVc54VNa4dDA=3D
> =3Dzm3i
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From raj.khem@gmail.com Fri Oct 21 01:56:20 2011
Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH2TE-0005qh-Hj
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 01:56:20 +0200
Received: by ggnj1 with SMTP id j1so1811276ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 16:50:27 -0700 (PDT)
DKIM-Signature: v
