Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SFWfw-0002wD-K2
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 22:19:28 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1Y00BCBYK8AWL1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	04 Apr 2012 14:09:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8493020120; Wed,
	04 Apr 2012 15:09:44 -0400 (EDT)
Date: Wed, 04 Apr 2012 15:09:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120404190944.GB30445@denix.org>
MIME-version: 1.0
References: <20120404091720.4b743c5b@eb-e6520> <jli1uf$7nt$1@dough.gmane.org>
	<CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Wed, 04 Apr 2012 20:19:28 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Wed, Apr 04, 2012 at 11:59:38AM -0700, Chris Larson wrote:
> On Wed, Apr 4, 2012 at 10:55 AM, Koen Kooi <koen@dominion.thruhere.=
net> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 04-04-12 00:17, Eric B??nard schreef:
> >> Hi,
> >>
> >> would that make sense to support systemd as a DISTRO_FEATURES ? =
That
> >> would make builds using older udev (< 174) possible with meta-oe=
 as this
> >> actually fails because of systemd.
> >
> > We talked about this during the yocto bsp summit this week and I'=
m working
> > on a patchset to send as RFC later this month (post 1.2 release):
> >
> > commit b98d45b1bc2d9cf9ba41629240e6c21f19ddceff
> > Author: Koen Kooi <koen@dominion.thruhere.net>
> > Date: =A0 Tue Apr 3 14:13:59 2012 -0700
> >
> > =A0 =A0meta-systemd: move over systemd from meta-oe
> >
> > =A0 =A0Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >
> > commit 59c57bd73d1f157dfada233df889852fdb4a692f
> > Author: Koen Kooi <koen@dominion.thruhere.net>
> > Date: =A0 Tue Apr 3 14:12:42 2012 -0700
> >
> > =A0 =A0meta-systemd: create layer
> >
> > =A0 =A0Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
>=20
> Woot! We can stop using BBMASK to exclude bbappends from meta-oe wh=
en
> this happens :)

Chris,

You should have been at the BSP Summit, especially as it was hosted a=
t=20
Mentor. :) That was one of the important decisions made, but this top=
ic=20
in particular was being discussed for a while... So, I second your Wo=
ot! :)

--=20
Denys



