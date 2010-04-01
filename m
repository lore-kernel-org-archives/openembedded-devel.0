Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxPPo-0003vl-09
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 20:46:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31IhXaU024986;
	Thu, 1 Apr 2010 19:43:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24658-07; Thu,  1 Apr 2010 19:43:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31IhRHA024979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Apr 2010 19:43:27 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270146830.6277.127.camel@trini-m4400>
References: <1270135981.4993.128.camel@rex>
	<1270136509.6277.97.camel@trini-m4400>
	<1270136609.6277.98.camel@trini-m4400> <1270138027.4993.139.camel@rex>
	<1270140349.6277.110.camel@trini-m4400> <1270145385.4993.155.camel@rex>
	<1270146830.6277.127.camel@trini-m4400>
Date: Thu, 01 Apr 2010 19:43:25 +0100
Message-ID: <1270147405.4993.161.camel@rex>
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
Cc: "Lock, Joshua" <joshua.lock@intel.com>
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 18:46:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-01 at 11:33 -0700, Tom Rini wrote:
> On Thu, 2010-04-01 at 19:09 +0100, Richard Purdie wrote:
> > On Thu, 2010-04-01 at 09:45 -0700, Tom Rini wrote:
> > > There's two uglies here.  Ugly one, above.  Quoting isn't nice to read
> > > and gdb/gcc/binutils are special.  It does however, work from the
> > > get-go.  And the only cases it doesn't get right, right off the bat are
> > > some perl (and possibly python) module cases where we aren't giving the
> > > right relative path there, but we can always figure it out and fix that
> > > up per recipe.  Ugly two, the chrpath way.  Depends on having a big
> > > enough RPATH in the initial binary to patch over.  Doesn't work if the
> > > RPATH isn't long enough as you say, which is why you can't do it on
> > > -cross.  
> > 
> > I've done the maths and it will always work within the sysroots/staging
> > directory as there is always enough length available. Since we want rid
> > of /cross/ for various reasons anyway I don't think this is a reason
> > against this approach.
> 
> What do you want to do on nativesdk ?  That's where this gets real
> important as well.

I'd argue for the same approach. We'd just have to ensure the base path
used for the SDK is long enough to accommodate this but again, thats not
difficult to arrange.

Cheers,

Richard




