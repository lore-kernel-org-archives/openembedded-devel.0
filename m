Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NuwGQ-0007WG-De
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 00:14:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2PNBlXj018675
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 23:11:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18180-10 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 23:11:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2PNBf4T018669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 23:11:42 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269456365.3545.9.camel@trini-m4400>
References: <4B99791E.1020102@zenlinux.com> <4BA981A5.5030609@zenlinux.com>
	<19c1b8a91003232245y3409bca3p4b74ab5562424b5c@mail.gmail.com>
	<4BA9B440.2050608@zenlinux.com>  <1269426516.1681.35.camel@rex>
	<1269444453.2395.5.camel@trini-m4400> <1269445040.1681.147.camel@rex>
	<1269446279.3545.8.camel@trini-m4400> <1269453955.1681.165.camel@rex>
	<1269456365.3545.9.camel@trini-m4400>
Date: Thu, 25 Mar 2010 23:11:39 +0000
Message-ID: <1269558699.1681.191.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND sdk vs. nativesdk
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
X-List-Received-Date: Thu, 25 Mar 2010 23:14:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-24 at 11:46 -0700, Tom Rini wrote:
> On Wed, 2010-03-24 at 18:05 +0000, Richard Purdie wrote:
> > On Wed, 2010-03-24 at 08:57 -0700, Tom Rini wrote:
> > > On Wed, 2010-03-24 at 15:37 +0000, Richard Purdie wrote:
> > > > On Wed, 2010-03-24 at 08:27 -0700, Tom Rini wrote:
> > > > > Or a really bad thing, yes.  I think nativesdk will help out a lot for
> > > > > making canadian style builds cleaner.  But going so far as to say 'Oh,
> > > > > lets just throw a libc into the SDK export' is going pretty far down a
> > > > > questionable road.  I'm not so naive to think that there's not problems
> > > > > with my next suggestion, but there's this thing called LSB for a reason.
> > > > > If you want build once, run many distributions, you do that, not go and
> > > > > own even more dependencies.
> > > > 
> > > > However, an LSB compliant SDK becomes a case of installing "LSB" libs
> > > > into the right sysroot and then setting some
> > > > ASSUME_PROVIDED/PREFERRED_PROVIDER lines.
> > > > 
> > > > So I think its good all around, we achieve independence of the SDK from
> > > > the build system and make it depend on exactly what we do or don't want
> > > > it to. Where is the bad bit (ignoring build time)? :)
> > > 
> > > How is this working on the runtime?  How relocatable is it?
> > 
> > Its no more or less reclocatable than the original was, that wasn't an
> > objective. Some postprocessing with the same code we use in
> > packaged-staging shouldn't see it being too bad though.
> 
> Today it's fully relocatable, if you use $ORIGIN.  Is that still true?

Yes, this doesn't change. You just gain control over which libc it links
against.

Cheers,

Richard




