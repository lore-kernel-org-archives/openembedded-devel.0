Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K6N1o-0001MQ-0m
	for openembedded-devel@openembedded.org; Wed, 11 Jun 2008 11:54:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5B9m5h6030154
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Jun 2008 10:48:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30137-01 for <openembedded-devel@openembedded.org>;
	Wed, 11 Jun 2008 10:48:00 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5B9lxLJ030147
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Jun 2008 10:47:59 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0806110123k4682543btfd87a864f374741f@mail.gmail.com>
References: <g2h415$pk1$1@ger.gmane.org> <484ED558.7070907@bolloretelecom.eu>
	<1213135673.5013.60.camel@dax.rpnet.com>
	<c384c5ea0806110123k4682543btfd87a864f374741f@mail.gmail.com>
Date: Wed, 11 Jun 2008 10:47:58 +0100
Message-Id: <1213177678.5010.9.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 11 Jun 2008 09:54:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, 2008-06-11 at 10:23 +0200, Leon Woestenberg wrote:
> I would like to re-issue the problem where bitbake gives an ERROR that
> multiple packages provide something and that bitbake then happily
> starts building two packages.
> 
> Even though the user has specified one.
> In one case this happens even when the user has specified a specific
> provider but that provider is somehow not fully "providing something
> but should".
> 
> After the two packages built, there is no way to get rid of this behaviour.

This last bit is no longer true, bitbake now no longer looks for the
populate_staging stamps to influence its choice of providers making
builds more deterministic. To put this another way, bitbake no longer
cares whether packages have built or not, it no longer influences it.

I guess what you're suggesting is that the "multiple packages provide
something" error should be fatal. I seem to remember trying this and
people were not happy. That warning is still experimental and I'd
probably prefer to leave it as an error for now, perhaps considering
making it fatal for the release after next?

Cheers,

Richard




