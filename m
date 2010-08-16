Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1Ol0FU-0001gg-PQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 16:01:13 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id ACD3D140CD; Mon, 16 Aug 2010 16:00:55 +0200 (CEST)
Date: Mon, 16 Aug 2010 16:00:55 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100816140055.GB7983@zlo.nu>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<20100816132317.GA7983@zlo.nu>
	<AANLkTikB5uioXp0BwFg4Gj6GV9MjgMmyOgvjLLOwS8fh@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikB5uioXp0BwFg4Gj6GV9MjgMmyOgvjLLOwS8fh@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 14:01:13 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2010 at 03:43:10PM +0200, Frans Meulenbroeks wrote:
> > Hmm, the "guidelines" do not mention anything about licenses. Thus th=
e
> > only version you left of coreutils after
> > 82dcd385984ba059b346a0e37fd3e14d536074ad is infected with GPLv3, whil=
e
> > the older (6.0) GPLv2 version works fine for us. =A0I do not know
> > whether other people mind about licenses, but we cannot use any GPLv3
> > software in our image, because of its viral nature.
> >
> > Marc
>=20
> Valid point.
> I did not consider licenses. Although the company I work for has no
> problems with GPLv2, I understand your concern
> What would be the most recent version of coreutils that is still using =
v2?
> We can reinstate that one.

In the case of coreutils, that is 6.0.
GPLv2 is ok here as well. The problem with GPLv3 here is that as soon as
we incorporate some GPLv3 package we need to provide the abilitiy for
customers to rebuild their image (Right to Tinker), which we cannot and
will not do.

> Thanks alot for your feedback.
> Frans

No problem, if I encounter any other license issues I'll let you know.

Marc


