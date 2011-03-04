Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PvbjV-0007BZ-SL
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 21:36:19 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pvbi6-0005zA-By
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 21:34:50 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D7122B1.3080609@opendreambox.org>
References: <4D705C07.20508@freescale.com>
	<1299244359-5345-1-git-send-email-obi@opendreambox.org>
	<4D7107F9.90008@gmail.com> <1299255257.3830.37.camel@mattotaupa>
	<4D7122B1.3080609@opendreambox.org>
Date: Fri, 04 Mar 2011 20:34:44 +0000
Message-ID: <1299270884.3930.5.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] mrouted-3.9.4: intitial recipe
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
X-List-Received-Date: Fri, 04 Mar 2011 20:36:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-04 at 18:34 +0100, Andreas Oberritter wrote:
> Other than using bison, there are no dependencies that I know of.
> Binutils already depends on bison, so it's always available to cross
> recipes.

That's not something you should rely on, for at least three reasons:

a) if an external toolchain is in use then the bison dependency might
not exist; or

b) future versions of binutils, or binutils-equivalents on some
particular targets, might not require bison anymore; or, last but most
significantly...

c) in a future utopia of per-recipe dynamic sysroots, the fact that some
previously-built package DEPENDed on bison-native won't necessarily mean
it is available to you.  The only things whose existence you can rely on
are the ones you mention in your own DEPENDS, and the ones that those
packages in turn have as RDEPENDS (and so on).

p.




