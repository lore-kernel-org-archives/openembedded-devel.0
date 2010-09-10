Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OuA5N-0000HI-Us
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:20:38 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OuA4g-00071B-CW
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 21:19:54 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100910183714.GE28148@denix.org>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFAA13@dlee06.ent.ti.com>
	<AANLkTikLhZ-vsO34S30T5RekoaKJpwyECmjyryY8d6wV@mail.gmail.com>
	<20100910183714.GE28148@denix.org>
Date: Fri, 10 Sep 2010 22:20:10 +0100
Message-ID: <1284153610.4698.32.camel@lenovo.internal.reciva.com>
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
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Fri, 10 Sep 2010 20:20:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-09-10 at 14:37 -0400, Denys Dmytriyenko wrote:
> I'd like us to find a compromise and a solution that satisfies everybody. 
> 
> Unfortunately, the original discussion about SOC_FAMILY vs. MACHINE_CLASS 
> never came to any fruition - Graeme explained his motives behind MACHINE_CLASS 
> and said that it is now deprecated.
> 
> It was also mentioned, while SOC_FAMILY is slightly newer than MACHINE_CLASS, 
> the feature itself is over a year old and used quite extensively, although 
> limited mainly to recipes/ti location...
> 
> And if technically SOC_FAMILY may be similar to MACHINE_CLASS, logically they 
> try to solve grouping problem from different direction, which was also 
> explained.
> 
> After that the original discussion was stalled and there were no strong 
> opinions one way or another. Based on that, Chase's change was pushed.
> 
> I see and understand Phil's position - if that's strong enough, we can 
> re-consider.

I take the point about MACHINE_CLASS and SOC_FAMILY being different in
intent.  However, I do feel that these are just two out of a whole
universe of possible machine groupings and I remain somewhat uneasy
about adding this sort of thing to base.bbclass: if we admit SOC_FAMILY
(or even MACHINE_CLASS) there then it seems like it will set an
undesirable precedent for the next guy who wants his favourite machine
grouping to be given the same treatment.  (The same thing applies to the
OVERRIDES patch that was posted recently and which I am not very fond of
either.)

How many recipes are there for which this is a big deal?  It's worth
remembering that the whole COMPATIBLE_MACHINE thing in base.bbclass is,
essentially, just syntactic sugar and there is nothing to stop you from
implementing whatever compatibility logic you want in your own .bb files
(or in an .inc, or a custom class).  If there are only a handful of
recipes for which gating on SOC_FAMILY is required then I would suggest
that you simply put the appropriate Python bits in those recipes.

p.




