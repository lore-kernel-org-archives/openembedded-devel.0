Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P3YCp-0004UZ-Bx
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 19:55:07 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id DE7F31D3616D; Wed,  6 Oct 2010 19:54:44 +0200 (CEST)
Date: Wed, 6 Oct 2010 19:54:44 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101006175444.GN28423@ibawizard.net>
References: <1286388898-7029-1-git-send-email-ynezz@true.cz>
	<i8ibof$3pq$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i8ibof$3pq$1@dough.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] init-scripts: introduce DONTUSETIMESTAMP variable	in bootmisc.sh
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
X-List-Received-Date: Wed, 06 Oct 2010 17:55:08 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Koen Kooi <k.kooi@student.utwente.nl> [2010-10-06 19:30:55]:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 06-10-10 20:14, Petr =A9tetiar wrote:
> > This variable is useful on systems with battery backed RTC. Imagine, =
that the
> > board is shut down and then switched on after, for example three days=
.
> > Althought the value in RTC is correct, this scripts sets system time =
with the
> > wrong values.
>=20
> So you shut it down at 20101003 and boot it at 20101006, that should
> give you roughly:
>=20
> SYSTEMDATE=3D`date "+%Y%m%d"` -> 20101006
> TIMESTAMP=3D`cat /etc/timestamp | awk '{ print substr($0,9,4)
> substr($0,1,4);}'` -> 20101003
>=20
> NEEDUPDATE=3D`expr \( $TIMESTAMP \> $SYSTEMDATE \)` -> 0
>=20
> So why is your rtc having a date older than the shutdown date?

Well, who knows, now it works and I see now, that the patch is wrong
completly. Maybe it was connected to bbappend and following patches[1,2],
sometimes it happens, that the package isn't rebuild even if I -c clean i=
t.
Thanks for the review, anyway. Removed the patch from the patchwork.

1. http://patchwork.openembedded.org/patch/3156
2. http://patchwork.openembedded.org/patch/3152

-- ynezz


