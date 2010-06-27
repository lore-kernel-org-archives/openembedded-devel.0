Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OSzv8-0007rJ-NR
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 00:01:49 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OSzqW-0001hg-T4
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jun 2010 22:57:01 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100627203243.GR17650@jama>
References: <1275485971-23536-1-git-send-email-Martin.Jansa@gmail.com>
	<201006272106.36928.bluelightning@bluelightning.org>
	<20100627203243.GR17650@jama>
Date: Sun, 27 Jun 2010 22:57:07 +0100
Message-ID: <1277675827.4745.311.camel@lenovo.internal.reciva.com>
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
Subject: Re: [PATCH] recipes: conform to OE packaging guidelines with RDEPENDS/RREDEPENDS
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
X-List-Received-Date: Sun, 27 Jun 2010 22:01:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-06-27 at 22:32 +0200, Martin Jansa wrote:
> Andrea Adami already asked me about it.
> 
> RPROVIDES_${PN} = "${PN}" looks a bit wrong to me and changing it back
> to
> RPROVIDES = "${PN}"
> doesn't make it much better (more understandable in my eyes).

See the definition of PACKAGES in opie-taskbar-images.inc.  Weird as it
may seem, I think RPROVIDES = "${PN}" really was the intended thing; a
slightly more intuitive approach might be to set RPROVIDES =
"virtual/opie-opie-taskbar-images" and adjust all the dependers to
match.

That package doesn't look like it ships anything other than images so
the usual considerations with -dbg/-dev/-doc packages probably don't
apply in this case.

p.




