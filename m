Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PpHzt-0004F5-Og
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 11:19:05 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PpHyn-0000bQ-Jm
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 11:17:57 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110215091517.GD8619@localhost.jama.net>
References: <20110214102232.GB8619@localhost.jama.net>
	<1297697243.2178.97.camel@phil-desktop>
	<20110215091517.GD8619@localhost.jama.net>
Date: Tue, 15 Feb 2011 10:19:31 +0000
Message-ID: <1297765171.2178.109.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: debian.bbclass issues when some package is substring of another
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
X-List-Received-Date: Tue, 15 Feb 2011 10:19:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-02-15 at 10:15 +0100, Martin Jansa wrote:
> On Mon, Feb 14, 2011 at 03:27:23PM +0000, Phil Blundell wrote:
> > b) switch to a two-phase approach where it first renames all the
> > libraries themselves, then uses some heuristic to match the remaining
> > packages against the libraries and apply an appropriate renaming to
> > them.  Probably just matching on longest substring would be good enough
> > here.
> > 
> > I think (b) is probably a better solution although it would be a little
> > harder to implement.
> 
> I'll try (b), but imho you have same problem there (if you have
> -dev/-dbg for such package names and they are in wrong order, even worse ie:
> PKG_ncurses-libncurses-dev, libncurses-dev    <= ok
> PKG_ncurses-libncursesw-dev, libncursesw-dev  <= works only because
>   ncurses-libncursesw is mapped to libncursesw which is the same like
>   s/ncurses-libncurses/libncurses
> 
> but if you imagine stranger situation with SONAMES which are not
> substrings of each other in package names which are substrings, like:
> ncurses-libncurses > libncurses
> ncurses-libncursesw > libwidecurses
> 
> then still
> PKG_ncurses-libncurses-dev, libncurses-dev    <= ok
> PKG_ncurses-libncursesw-dev, libncursesw-dev  <= bad, because libwidecurses-dev was expected 
> 
> and later you won't find ncurses-libncursesw-dev to replace
> ncurses-libncursesw with libwidecurses

I'm not quite sure I understand the difficulty here.

If I understand right you're talking about two output packages,
"ncurses" and "ncursesw", which contain sonames "libncurses.so.5" and
"libwidecurses.so.5", right?  In that case, during the first phase you'd
get:

PKG_ncurses = "libncurses5"
PKG_ncursesw = "libwidecurses5"

and a dictionary of renames performed which would look a bit like:

ncurses: { pkgname: libncurses5, devname: libncurses }
ncursesw: { pkgname: libwidecurses5, devname: libwidecurses }

which is all expected.  Then, during the second phase, you'd consider
the other packages like ncurses-dev and ncursesw-dev.  In this case, the
longest prefix match for ncurses-dev in the dictionary is "ncurses", so
it'd get renamed to libncurses-dev.  The longest matching prefix for
ncursesw-dev in the dictionary is "ncursesw", so it'd get renamed to
libwidecurses-dev.  That all seems like it should work out fine.

p.




