Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1PGBfN-0000yI-NQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 15:28:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oAAERpAo003830
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 14:27:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03220-07 for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 14:27:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oAAER4Pm003823
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 14:27:43 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimuTVEWPsZT=hx+fuLLHKtVVrVzud0xq5R_TSEO@mail.gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<1287157281-31597-1-git-send-email-kergoth@gmail.com>
	<i9aai3$tmj$1@dough.gmane.org>
	<AANLkTimuTVEWPsZT=hx+fuLLHKtVVrVzud0xq5R_TSEO@mail.gmail.com>
Date: Wed, 10 Nov 2010 22:26:56 +0800
Message-ID: <1289399216.1272.415.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Wed, 10 Nov 2010 14:28:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-10-15 at 12:44 -0700, Chris Larson wrote:
> On Fri, Oct 15, 2010 at 12:37 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 15-10-10 17:41, Chris Larson wrote:
> > > From: Chris Larson <chris_larson@mentor.com>
> > >
> > > Given the current implementation of OVERRIDES in bitbake, the variable is
> > > expected to contain elements in the order least specific to most
> > specific,
> > > however, our current usage of it does not match that.  As one example,
> > "local"
> > > is supposed to always be the most specific override, yet currently it's
> > the
> > > least specific.  As another example, currently the target architecture is
> > seen
> > > as more specific than the machine, which is also clearly wrong.
> > >
> > > Big thanks to Chase Maupin for investigating and identifying this long
> > > standing issue.
> > >
> > > It becomes clear that a reversal of the current value will bring us to a
> > more
> > > sane behavior, and avoids the need for the dual overrides hack mentioned
> > in
> > > the comments, so this implements this reversal, and drops the unnecessary
> > and
> > > confusing comments.
> > >
> > > This also introduces a MACHINE_OVERRIDES variable as a generic mechanism
> > to
> > > inject overrides elements which are more specific than the distro but
> > less
> > > specific than the machine, which is where things like MACHINE_CLASS or
> > > SOC_FAMILY or the like would go.  This variable is *space* separated, to
> > make
> > > it easier and more convenient to assemble the variable incrementally.
> > >
> > > Reported-by: Chase Maupin <chase.maupin@ti.com>
> > > Signed-off-by: Chris Larson <chris_larson@mentor.com>
> >
> > Acked-by: Koen Kooi <k-kooi@ti.com>
> >
> 
> This is now in master -- thanks to all for the acks, review, comments -- let
> me know if any problems result from this.

You do realise the damage this potentially causes for compatibility of
metadata between OE and Poky?

This change is pretty serious and potentially alters the handling of any
double override. Poky uses them a bit more extensively than OE does. Its
effectively an architecture change to OE yet no discussion was had at
any TSC meeting :(.

I even asked about this a while back and was *told* that "local" was
meant to be weak, I therefore added a strong version to Poky, in the
spirit of maintaining compatibility.

Richard






