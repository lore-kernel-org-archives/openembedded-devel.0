Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1StPUp-0001bz-H1
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 22:44:51 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id EA1BEEA040
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2012 22:36:45 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 1461860C09; Mon, 23 Jul 2012 22:33:24 +0200 (CEST)
Date: Mon, 23 Jul 2012 22:33:23 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120723203323.GC10225@hermes>
References: <cover.1342677797.git.apelete@seketeli.net>
	<20120723194807.GB8985@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20120723194807.GB8985@bill-the-cat>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 0/9] Pull request 20120719
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
X-List-Received-Date: Mon, 23 Jul 2012 20:44:51 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 23-Jul-12, Tom Rini a =E9crit:
> On Thu, Jul 19, 2012 at 07:20:31PM +0200, Apelete Seketeli wrote:
>=20
> > Hello,
> >=20
> > The patches that come as a follow-up of this message fix issues found
> > while building muffinman-image on top of the 2011.03-maintenance
> > branch.
> > These modifications were tested by successfully building
> > muffinman-image from scratch on a Debian Squeeze host.
> > Please pull into 2011.03-maintenance branch.
> >=20
> > The following changes since commit f9611c025109a3e0d6cebf12f49ae24c97=
759c09:
> >=20
> >   psplash: convert from svn.o-hand.com to git.yoctoproject.org (2012-=
07-04 22:34:04 +0200)
> >=20
> > are available in the git repository at:
> >=20
> >   git://seketeli.net/~apelete/oe.git muffinman-image-fix
>=20
> I have a concern right now.  It is that 9160263 was reported to have
> changed the behavior slightly such that some SDK tasks/images now
> fail.  So..

I can't seem to find the commit corresponding to the 9160263 hash in
the 2011.03 branch. Could you point it to me please ?

> [snip]
> >   opkg-utils: bump SRCREV to keep python2.6 compatibility
>=20
> Is a little concerning.  Denys, can you point to an upstream task /
> image that fails currently?  Thanks!

I did that change because muffinman-image wasn't building on a Debian
Squeeze host, which runs python2.6. Maybe that was not a good way to
proceed; I would gladly change the approach if necessary.

Cheers.
--=20
        Apelete


