Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NhJbv-0005n3-U3
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 10:20:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1G9IDUU022770
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:18:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22327-08 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:18:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1G9I7b0022764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:18:08 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f941002160108p2e8a880atba367857e3552a22@mail.gmail.com>
References: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com>
	<hldk2b$5tt$2@ger.gmane.org>
	<ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
	<d1b08f941002160108p2e8a880atba367857e3552a22@mail.gmail.com>
Date: Tue, 16 Feb 2010 09:18:06 +0000
Message-ID: <1266311886.6436.108.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Cleanup / janitors
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
X-List-Received-Date: Tue, 16 Feb 2010 09:20:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-02-16 at 10:08 +0100, Andrea Adami wrote:
> > Problem is to do that reliable.
> I would follow RP steps: starting in nov 2009
> http://git.pokylinux.org/cgit.cgi/poky/log/
> 
> >It is easy to remove the do_stage section from a recipe, and it is
> >easy to verify that it builds, but it is already becoming less trivial
> >to verify that everything that depends on it builds too, and it
> >becomes complicated if you want to verify that it actually works
> >(especially if you have no clue what the package does).
> That's the reason why I did not dare too
> 
> > The other thing that comes to mind is better describing the job. If it
> I'd define it "Monkey-picking from Poky" for the most recipes.
> 
> How dangerous could it be? I have no idea about eventual subtle diffs
> between Poky and OE.

The key thing is to make sure the starting recipes were the same. If
they are, the same change probably applies to OE as they are very
similar, I try and keep them roughly in sync in all important ways.

It would actually make sense to add some function which compares the
results of a staging changes, I don't know if anyone would feel up to
that?

Cheers,

Richard



