Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1ObKTJ-00004u-RK
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 23:35:34 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1ObKT0-0003f2-Qo
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 22:35:10 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279656272.8360.4.camel@utx.lan>
References: <1279656272.8360.4.camel@utx.lan>
Date: Tue, 20 Jul 2010 22:35:21 +0100
Message-ID: <1279661721.21888.136.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RDEPENDS_${PN} overwrites RDEPENDS_foo - bug or feature?
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
X-List-Received-Date: Tue, 20 Jul 2010 21:35:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-07-20 at 22:04 +0200, Stanislav Brabec wrote:
> While verifying all aspects of proposed udev change, I experienced a
> strange behavior of an udev recipe with RDEPENDS_udev:
> 
> RDEPENDS_udev is always ignored. Searching in deep, I found that
> RDEPENDS_${PN} defined in update-rc.d.bbclass overwrites RDEPENDS_udev.
> 
> Once RDEPENDS_${PN} is defined, RDEPENDS_udev has no effect.
> 
> Is it a bug or documented feature?

Possibly neither of the above.  It's not a bug, but I'm not certain that
it is very well documented either.

p.




