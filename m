Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OgkvR-0005JE-1N
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 22:51:04 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Ogkul-0002g9-Ic
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 21:50:15 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0802E9149F9B@dlee06.ent.ti.com>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<20100804001959.GF17391@denix.org>  <20100804052042.GB7085@gmail.com>
	<1280920678.26249.33.camel@saphir>
	<1280922518.2692.377.camel@mill.internal.reciva.com>
	<131E5DFBE7373E4C8D813795A6AA7F0802E9149F9B@dlee06.ent.ti.com>
Date: Wed, 04 Aug 2010 22:50:29 +0100
Message-ID: <1280958629.10932.16.camel@lenovo.internal.reciva.com>
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
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 20:51:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-08-04 at 09:11 -0500, Maupin, Chase wrote:
> From what I've learned it seems that MACHINE_CLASS and SOC_FAMILY are different in what they are trying to accomplish.
> 
> SOC_FAMILY is defining a family of processors and the features that processor has.  Whereas MACHINE_CLASS is defining a type of device and its features which can use different processors.  So basically SOC_FAMILY defines common processors and MACHINE_CLASS defines common end devices.
> 
> This difference is why SOC_FAMILY exists.  We can have many processors that fit into an SOC_FAMILY that can be used across a variety of end applications from DVR to ip net camera to mobile phone.

It's not completely obvious to me that, at the level of concrete
semantics, there is any real difference between those two scenarios.  If
you consider a hardware design as being a black box which contains a
bunch of features, the question of how exactly those features are
partitioned between particular ICs seems more or less irrelevant. 

It probably is true that there are multiple ways to carve up the
universe of machines into different "family" sets, and it might well
also be true that MACHINE_CLASS and SOC_FAMILY are currently using
slightly different rules for that, but I remain to be convinced that
both of them serve a useful and distinct purpose.  If they do, that
would suggest that what you really want to be using is MACHINE_FEATURES
rather than having a different variable for each possible grouping.

p.




