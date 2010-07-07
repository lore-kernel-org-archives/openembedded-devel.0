Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OWacT-0008BB-HA
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 21:49:22 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OWaXn-0008WN-C5
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 20:44:31 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTil6ZzCLdFEKksqKwjzCj_DV2DT7eifCJakP1HhR@mail.gmail.com>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
	<1278529036.4413.67.camel@lenovo.internal.reciva.com>
	<AANLkTil6ZzCLdFEKksqKwjzCj_DV2DT7eifCJakP1HhR@mail.gmail.com>
Date: Wed, 07 Jul 2010 20:44:40 +0100
Message-ID: <1278531880.4413.70.camel@lenovo.internal.reciva.com>
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
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 07 Jul 2010 19:49:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-07-07 at 21:11 +0200, Frans Meulenbroeks wrote:
> COMPATIBLE_ARCH does not exist at the moment.
> Is there interest in it? (or in other words, do I have a chance I get
> acks for it, if not I'd rather save myself the effort writing a patch

Sorry, you're right, I had remembered it wrong.  It's ${COMPATIBLE_HOST}
that I was thinking of, and I guess that doesn't do what you need in the
specific case of cross packages.

I guess I would be happy enough to see support for ${COMPATIBLE_TARGET}
added to cross.bbclass if such a thing doesn't already exist.

p.




