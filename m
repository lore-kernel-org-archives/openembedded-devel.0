Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1PPLYR-0006Gd-Pa
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 21:51:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oB5Ko42Z030306;
	Sun, 5 Dec 2010 20:50:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30249-01; Sun,  5 Dec 2010 20:50:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oB5KnwKu030289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 5 Dec 2010 20:49:58 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
In-Reply-To: <AANLkTimOUSrRJd+bVLmprX+e+tCTtQHLQEC52GNgMCZ=@mail.gmail.com>
References: <AANLkTimOUSrRJd+bVLmprX+e+tCTtQHLQEC52GNgMCZ=@mail.gmail.com>
Date: Sun, 05 Dec 2010 20:49:57 +0000
Message-ID: <1291582197.14277.2908.camel@rex>
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
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [yocto] AUTOTOOLS_STAGE_PKGCONFIG still used?
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
X-List-Received-Date: Sun, 05 Dec 2010 20:51:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-12-05 at 00:31 +0100, Frans Meulenbroeks wrote:
> Is AUTOTOOLS_STAGE_PKGCONFIG still of any use?

No, it used to do something but hasn't for over a year in either OE or
Poky.

> I was trying to fidn out what I did, I ran a grep on both my
> openembedded dir (results see below) and my yocto tree, both trees at
> git head.
> I see a lot of places where it is set but no place where it is used.
> 
> Anyone who can confirm that this is a stale var? Or otherwise anyone
> who can explain how this is used. (and no, bitbake does not know the
> var either, not that I had expected it)

Its not needed and can be removed. I've pushed a patch to poky removing
the references and acked your patch for OE.

Cheers,

Richard




