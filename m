Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MH0iT-0004eC-DN
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:22:37 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MH0YK-000264-PF
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 20:12:09 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h1b7fr$qjo$1@ger.gmane.org>
References: <1245248446.15129.1.camel@mill.internal.reciva.com>
	<h1b0c2$va$1@ger.gmane.org>
	<1245251936.15129.7.camel@mill.internal.reciva.com>
	<h1b7fr$qjo$1@ger.gmane.org>
Date: Wed, 17 Jun 2009 20:12:06 +0100
Message-Id: <1245265926.29153.120.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: rfc: delete flow-lossage.bbclass
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
X-List-Received-Date: Wed, 17 Jun 2009 19:22:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 19:00 +0200, Koen Kooi wrote:
> On 17-06-09 17:18, Phil Blundell wrote:
> > On Wed, 2009-06-17 at 16:59 +0200, Koen Kooi wrote:
> >> On 17-06-09 16:20, Phil Blundell wrote:
> >>> I think this class has probably outlived its usefulness and I propose to
> >>> delete it.  Any objections?
> >>
> >> There are still recipes using it, are you going to fix those as well?
> >
> > Depends what you mean by "fix".  I would remove "inherit flow-lossage"
> > from the recipes in question, obviously, but I don't plan to do any more
> > than that.
> 
> You are sure nobody is using gcc 3.4 in OE anymore?

I imagine there probably are people using gcc-3.4 still, but I doubt
there are many, if any, who are using gcc-3.4 on an affected target and
building the packages that suffered from this problem (predominantly
gnome).

But, if there's consensus on this list that the flow-lossage thing is
likely to still be a real issue for some folks, I guess an alternative
plan would be to rework the class so that it simply has no effect with
newer compilers. 

p.




