Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pp0KU-0002Cc-KA
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 16:27:10 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pp0JP-0008Rf-M9
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 16:26:03 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110214102232.GB8619@localhost.jama.net>
References: <20110214102232.GB8619@localhost.jama.net>
Date: Mon, 14 Feb 2011 15:27:23 +0000
Message-ID: <1297697243.2178.97.camel@phil-desktop>
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
X-List-Received-Date: Mon, 14 Feb 2011 15:27:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-02-14 at 11:22 +0100, Martin Jansa wrote:
> So can someone explain why we need that 'newpkg = pkg.replace(orig_pkg, devname, 1)' in else?

If that line was removed altogether then the -dev packages (and -doc,
-bin, ...) would stop being renamed, which wouldn't be a very good
thing.  In other words, you'd get libncurses5 but ncurses-dev (not
libncurses5-dev) etc.

However you're right that the logic as it stands does look fairly
broken.  Two ways of fixing it come to mind:

a) have it explicitly search for (and rename) [orig_pkg]-dev,
[orig_pkg]-doc etc, and remove the catch-all altogether; or

b) switch to a two-phase approach where it first renames all the
libraries themselves, then uses some heuristic to match the remaining
packages against the libraries and apply an appropriate renaming to
them.  Probably just matching on longest substring would be good enough
here.

I think (b) is probably a better solution although it would be a little
harder to implement.

p.




