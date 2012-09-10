Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TB54K-0007EW-2B
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 16:34:32 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TB4sG-0008Go-Jy
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 16:22:04 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2012 15:22:03 +0100
In-Reply-To: <504DF65B.4080805@communistcode.co.uk>
References: <504DE45C.2010202@communistcode.co.uk>
	<1347282537.2673.239.camel@phil-desktop>
	<504DF65B.4080805@communistcode.co.uk>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1347286924.2673.250.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Couple of autotools configure problems
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
X-List-Received-Date: Mon, 10 Sep 2012 14:34:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-10 at 15:16 +0100, Jack Mitchell wrote:
> Ok, re-building now - will let you know how it goes. I removed the -Wall 
> flag. It makes no sense at all as the -Wall flag is passed using the := 
> operator, is that not a contradiction in itself?!

Sounds like you might be looking at the wrong -Wall.  The one that
matters here is the one in AM_INIT_AUTOMAKE(), not to be confused with
the compiler option of the same name which gets set in CFLAGS.

p.





