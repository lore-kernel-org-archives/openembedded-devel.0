Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1RH6nx-0002KY-FG
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 06:34:01 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTE00GTAC9UZZ10@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Oct 2011 22:27:31 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 1EDCDE; Thu, 20 Oct 2011 22:27:26 -0500
Received: from [192.168.254.252] by rkmorris.us with HTTP; Thu,
	20 Oct 2011 22:27:25 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Thu, 20 Oct 2011 22:27:25 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1319167645202064500@rkmorris.us>
In-reply-to: <CAMKF1soL9oEShqjfAfpyfEvq1XrHDNqE_-1R6PCdnsqUCPHmLg@mail.gmail.com>
References: <1319132705374102500@rkmorris.us> <4EA073C0.7000502@mlbassoc.com>
	<j7q4nl$akr$1@dough.gmane.org> <1319149069203727500@rkmorris.us>
	<CAMKF1soL9oEShqjfAfpyfEvq1XrHDNqE_-1R6PCdnsqUCPHmLg@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 2
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
X-List-Received-Date: Fri, 21 Oct 2011 04:34:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yep, that works - thanks!

... Russell


On Thu, 10/20/2011 06:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Oct 20, 2011 at 3:17 PM, Russell Morris
> <openembedded@rkmorris.us> wrote:
> > Makes sense - thanks!
> > But I do have to ask ... why does "oebb.sh config am3517-evm" not set =
this? I would have thought it does, but could be wrong of course.
>=20
> I think it should update the MACHINE entry in auto.conf but it only
> does that if auto.conf does not exist.
> Can you try this patch
>=20
> http://paste.ubuntu.com/714716/
>=20
> and see if it works for you
>=20
>=20
> > Thanks again,... Russell
> >
> >
> > On Thu, 10/20/2011 04:44 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> Op 20-10-11 21:17, Gary Thomas schreef:
> >> > On 2011-10-20 11:45, Russell Morris wrote:
> >> >> Hi,
> >> >>
> >> >> I am trying to do some builds for an am3517-evm ... but the machin=
e
> >> >> configuration doesn't seem to be working (or I'm doing it wrong, m=
ore
> >> >> likely ... :-().
> >> >>
> >> >> I have successfully built console-image for qemuarm, and then use
> >> >> oebb.sh to set the machine (to am3517-evm, followed bu ./oebb.sh
> >> >> update) - but then when I try to build for this machine I see the
> >> >> following ...
> >> >>
> >> >> OE Build Configuration: BB_VERSION        =3D "1.13.3" TARGET_ARCH
> >> >> =3D "arm" TARGET_OS         =3D "linux-gnueabi" MACHINE           =
=
=3D
> >> >> "qemuarm" DISTRO            =3D "angstrom" DISTRO_VERSION    =3D
> >> >> "v2011.10-core" TUNE_FEATURES     =3D "armv5 dsp thumb arm926ejs"
> >> >> TARGET_FPU        =3D "soft"
> >> >>
> >> >> So it's still building for qemuarm, not am3517-evm ... :-(. Is any=
one
> >> >> else having this issue? Any suggestions of how to fix this?
> >> >
> >> > You need to always specify MACHINE=3D"am3517-evm" on your command l=
ine,
> >> > e.g. % MACHINE=3D"am3517-evm" bitbake systemd-image
> >> >
> >> > Alternatively, you can add just a single line to conf/local.conf an=
d then
> >> > it will be "sticky"
> >>
> >> not local.conf, auto.conf
> >>
> >>
> >> -----BEGIN PGP SIGNATURE-----
> >> Version: GnuPG v1.4.5 (Darwin)
> >> Comment: GPGTools - http://gpgtools.org
> >>
> >> iD8DBQFOoJY1MkyGM64RGpERAliKAKCfu0E2K3Qn+lsTx5YzNRgkxrA+QwCgqJjT
> >> 0ZsSMZCZArrGVc54VNa4dDA=3D
> >> =3Dzm3i
> >> -----END PGP SIGNATURE-----
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From gcho-openembedded-devel@m.gmane.org Fri Oct 21 08:01:45 2011
Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RH8Ar-0005uj-LH for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 08:01:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RH85C-0005cy-6T for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 07:55:54 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 07:55:54 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim=
 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 07:55:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Oct 2011 07:55:41 +0200
Lines: 20
Message-ID: <j7r1gt$3jk$1@dough.gmane.org>
References: <cover.1319168013.git.otavio@ossystems.com.br>
	<1d63385213ee2d6741906cf2e61ccfb6fee58270.1319168013.git.otavio@ossystems=
.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset
