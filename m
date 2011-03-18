Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0hMa-0005l9-7D
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 22:37:40 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0hKq-0003hy-0y
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 22:35:52 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=1fr0ZVD9WmsaBY_E3veZvdppTsJtVXY-1O88g@mail.gmail.com>
References: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>
	<AANLkTi=1fr0ZVD9WmsaBY_E3veZvdppTsJtVXY-1O88g@mail.gmail.com>
Date: Fri, 18 Mar 2011 21:35:41 +0000
Message-ID: <1300484141.3026.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: blacklist.bbclass
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
X-List-Received-Date: Fri, 18 Mar 2011 21:37:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-18 at 21:33 +0100, Frans Meulenbroeks wrote:
> 2011/3/18 Dr. Michael Lauer <mickey@vanille-media.de>:
> > Salut,
> >
> > the blacklisting of packages as found in angstrom.bbclass
> > is pretty helpful and would be beneficial to all kinds
> > of distribution configurations in OE. Would there be
> > a strong objection of renaming this to blacklist.bbclass?
> >
> > Copying, of course, is also a possibility, but
> > in my opinion it would only be the second best choice.
> >
> > Cheers,
> >
> > :M:
> 
> If blacklisting a certain package for all distro's is there then still
> a need to keep those blacklisted packages ????

The class that Mickey is talking about is just the mechanism to allow
blacklisting.  It doesn't actually contain a list of blacklisted
packages; I think that typically goes in DISTRO.conf for distros that
use it.

However, if we do want to rename it to something more global (which I
agree seems like a good idea) then the contents would need a bit of
tweaking since both the variables that it looks at, and the messages
that it outputs, make reference to Angstrom specifically.

p.




