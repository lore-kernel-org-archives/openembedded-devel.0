Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OMRrV-0001Kd-Sm
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 22:26:58 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OMRnJ-0005Bq-Eu
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 21:22:37 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100609193242.GR14941@mx.loc>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1276103437-2755-4-git-send-email-rep.dot.nop@gmail.com>
	<1276109098.4424.9.camel@lenovo.internal.reciva.com>
	<20100609185240.GP14941@mx.loc>
	<1276111093.4424.21.camel@lenovo.internal.reciva.com>
	<20100609193242.GR14941@mx.loc>
Date: Wed, 09 Jun 2010 21:22:43 +0100
Message-ID: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] busybox: picking IPv6 per default is not up to the package
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
X-List-Received-Date: Wed, 09 Jun 2010 20:26:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-06-09 at 21:32 +0200, Bernhard Reutner-Fischer wrote:
> I disagree. Distros should be fixed to ask for or require a feature if
> they require it.

That's a legitimate and worthy goal, but I can't see that this patch
really goes any way towards achieving it.  As far as I can tell, busybox
doesn't currently respect DISTRO_FEATURES anyway, so even if I did add
ipv6 to that variable for micro (which I'm certainly happy to do) this
patch would still cause busybox to be built without it.  

If the file you were patching was a generic one, and the majority of
distros didn't want ipv6, then I would probably have some sympathy with
this patch.  But in this particular case the file you are patching is
entirely micro specific: nobody else will benefit from this change.

p.




