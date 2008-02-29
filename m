Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JVDyL-00067e-Ik
	for openembedded-devel@openembedded.org; Fri, 29 Feb 2008 23:44:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1TMi44l019923
	for <openembedded-devel@openembedded.org>; Fri, 29 Feb 2008 22:44:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19851-02 for <openembedded-devel@openembedded.org>;
	Fri, 29 Feb 2008 22:43:59 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1TMhsmN019915
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 29 Feb 2008 22:43:54 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0802291029o2cc478dr278b40e103350326@mail.gmail.com>
References: <1204303564.8126.38.camel@dax.rpnet.com>
	<c384c5ea0802290924i636e65dey9b6bfdceda20d17f@mail.gmail.com>
	<1204308250.8126.42.camel@dax.rpnet.com>
	<c384c5ea0802291029o2cc478dr278b40e103350326@mail.gmail.com>
Date: Fri, 29 Feb 2008 22:43:56 +0000
Message-Id: <1204325036.8126.55.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Feb 2008 22:44:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 2008-02-29 at 19:29 +0100, Leon Woestenberg wrote:
> On Fri, Feb 29, 2008 at 7:04 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Fri, 2008-02-29 at 18:24 +0100, Leon Woestenberg wrote:
> >  > excellent work and plan of attack.
> >
> >  > Could you explain why this must be TARGET_VENDOR instead of BUILD_VENDOR?
> >
> >  Its a little bit hacky but there is a good reason. Basically you don't
> >  want -native and -sdk packages in the same directory. If you don't
> >
> Could we just add a comment explaining this approach above the assignment?
> Everything that is not trivial by code inspection surely deserves a comment.

Agreed, I will add something before I commit it.

> I recon I could try the patch already.

I'm happy for anyone to do so, its been tested locally so does basically
work although as I'm sure is clear, this is a fundamental change and
some things will break :/. 

FWIW, its what Poky has been using for a while so the 'GMAE stack' is
well tested, its the areas outside that which I worry about.

Cheers,

Richard



