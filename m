Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TTXWZ-0000S3-7d
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:35:59 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TTXJQ-0002oV-Py
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:22:24 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2012 12:22:24 +0000
In-Reply-To: <CAP9ODKqnTYfBa84642qQGzVigVzrsPQuhqvizz1smKmS=Trdww@mail.gmail.com>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com> <1351685486.13864.97.camel@phil-desktop>
	<CAP9ODKqnTYfBa84642qQGzVigVzrsPQuhqvizz1smKmS=Trdww@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351686144.13864.104.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:35:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-31 at 10:15 -0200, Otavio Salvador wrote:
> On Wed, Oct 31, 2012 at 10:11 AM, Phil Blundell <philb@gnu.org> wrote:
> > On Wed, 2012-10-31 at 12:43 +0100, Martin Erts=C3=A5s wrote:
> >
> >> for now I guess we can just use pool.ntp.org
> >
> >
> > I'm not sure that this is a very good idea.  The pool.ntp.org
> > documentation is fairly explicit that they don't want this:
> >
> >
> >         You must absolutely not use the default pool.ntp.org zone names
> >         as the default configuration in your application or appliance.
>=20
> So how we'll fix it? We need to fix it somehow. So give us an alternative=
 to us.

It's not entirely obvious to me that it really does need to be fixed all
that urgently, at least not in the default metadata.  The sky is
probably not going to fall in if you ship a service file which doesn't
sync with NTP by default. =20

In particular, if it's been broken in meta-oe for however long up to
this point, I don't entirely understand why moving the recipe to
meta-networking suddenly means that fixing this issue is super-important
or why the two things need to be done at the same time.

But, anyway, see other email I just sent for a handful of alternatives.

p.




