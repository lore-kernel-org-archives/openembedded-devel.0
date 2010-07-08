Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OX986-0007Z2-Iv
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 10:40:19 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1OWy08-0001GK-Tr; Thu, 08 Jul 2010 21:47:20 +0100
From: Phil Blundell <philb@gnu.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com>
Date: Thu, 08 Jul 2010 21:47:30 +0100
Message-ID: <1278622050.15825.18.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 08:40:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2010-07-08 at 12:02 -0700, Khem Raj wrote:
> I would have a feature called 'nobx' because most of the machines
> we support actively in OE has BX. With current state this needs to
> be added to MACHINE features for almost all arm machines. We can instead
> have nobx and keep USE_BX enabled and only disable it if nobx appears
> in machine_features. Otherwise I have tested the patches myself
> and they seems to work well.

I'm not sure that putting bx (or nobx) in MACHINE_FEATURES really
conveys any information that you can't already get from TARGET_ARCH plus
THUMB_INTERWORK.  It's also worth noting that the latter is a DISTRO
variable so, if you did add a competing bx flag to MACHINE_FEATURES, it
would be difficult to ensure that the two were consistent.

p.




