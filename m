Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nhrix-0000E4-Mu
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 22:46:27 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NhrgM-0004OO-Jf from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 13:43:42 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 17 Feb 2010 13:43:42 -0800
Received: from 172.30.80.84 ([172.30.80.84]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 17 Feb 2010 21:43:39 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	17 Feb 2010 14:43:38 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hlhmn0$5c2$1@ger.gmane.org>
References: <E1Nhfko-0005KL-8Z@melo.openembedded.org>
	<1266437931.5691.30.camel@trini-m4400>  <hlhmn0$5c2$1@ger.gmane.org>
Organization: Mentor Graphics Corporation
Date: Wed, 17 Feb 2010 14:43:38 -0700
Message-ID: <1266443018.5691.42.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 17 Feb 2010 21:43:42.0235 (UTC)
	FILETIME=[45EE16B0:01CAB01A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : opkg-native: bump to r522 to get a fix to remove duplicate messages from do_rootfs logs
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
X-List-Received-Date: Wed, 17 Feb 2010 21:46:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-02-17 at 22:22 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 17-02-10 21:18, Tom Rini wrote:
> > On Wed, 2010-02-17 at 08:59 +0000, git version control wrote:
> >> Module: openembedded.git
> >> Branch: org.openembedded.dev
> >> Commit: 74501117c261f743c76ae3c2988cbcfdc141cf3a
> >> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommi=
t;h=3D74501117c261f743c76ae3c2988cbcfdc141cf3a
> >>
> >> Author: Koen Kooi <koen@openembedded.org>
> >> Date:   Tue Feb 16 13:08:53 2010 +0100
> >>
> >> opkg-native: bump to r522 to get a fix to remove duplicate messages fr=
om do_rootfs logs
> >=20
> > I'd like to RFC that we do something like:
> > OPKGREV ?=3D "522"
> > SRCREV_pn-opkg ?=3D "${OPKGREV}"
> > SRCREV_pn-opkg-native ?=3D "${OPKGREV}"
> > SRCREV_pn-opkg-sdk ?=3D "${OPKGREV}"
> >=20
> > And if -nogpg or what have you is broken, it either gets fixed or the
> > distribution takes advantage of that ?=3D.=20
>=20
> I haven't been able to properly test a target opkg yet, so no bump for
> that. Unless people would like broken opkg binaries on their target ;)

Seriously tho, this isn't the first or fifth time the revs have gotten
wildly out of sync.  I'm suggesting that we want to keep them together,
intentionally.  We don't say we have different versions of gcc or bison
between native and target.  This is possibly even more important to make
sure all of the operations are right, all around.

> Personally, I want sanesrcrev.inc to die and put the revs in the recipes
> where they belong.

Unless opkg's would live in opkg.inc, same problem.

> > It seems a bit silly,
> > especially given the nature of the fixes, to split things up like this.
> > Heck, assuming 521 -> 522 is the patch from RP, the original report was
> > for on target opkg, not do_rootfs
>=20
> The commit does what is says in the message, it removes duplicate
> entries in do_rootfs logs (and makes narciusses XHR smaller), so what is
> it you're complaining about?

I'm saying that this is a bugfix for a problem that you reported (or at
least commented on the thread / bug entry) as being a problem on device.
Is it intentional that you didn't update on device to have this fixed
too?  I was guessing no, it wasn't (and that you would have found time
to test on device).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


