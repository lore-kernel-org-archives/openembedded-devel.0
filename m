Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OUSK9-00062V-5B
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:33:43 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OUSFZ-0002Pp-Ba
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 23:28:53 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C2D13AE.9030903@mentor.com>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
	<i0iv84$7qt$1@dough.gmane.org>  <4C2D13AE.9030903@mentor.com>
Date: Thu, 01 Jul 2010 23:29:02 +0100
Message-ID: <1278023342.4507.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Thu, 01 Jul 2010 22:33:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-07-01 at 15:16 -0700, Tom Rini wrote:
> One of the issues with some form of USE flags, and I believe this is one 
> of the big ones for Angstrom as well as any other public feed publishing 
> distribution is that having a single recipe that does different things 
> based on variables makes maintaining their feed (and allowing users to 
> publish their own compatible feeds) a nightmare.

It's only a nightmare if the flags in question are user-frobbable.  If
they are all nailed down in the DISTRO configuration (which
DISTRO_FEATURES certainly ought to be), and those folks who want to
build compatible binaries just leave them alone, then there oughtn't to
be any real problem.  To that extent it doesn't really seem any
different to the choice of compiler or tuning flags or glibc version or
any of the other ways in which you can already produce incompatible
binaries by flipping the wrong switches.

p.




