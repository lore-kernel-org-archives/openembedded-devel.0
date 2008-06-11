Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K6OeO-0006uS-HG
	for openembedded-devel@openembedded.org; Wed, 11 Jun 2008 13:38:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5BBWUJZ005324
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Jun 2008 12:32:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05091-07 for <openembedded-devel@openembedded.org>;
	Wed, 11 Jun 2008 12:32:25 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5BBWLWv005312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Jun 2008 12:32:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <g2obvj$45d$1@ger.gmane.org>
References: <g2h415$pk1$1@ger.gmane.org> <484ED558.7070907@bolloretelecom.eu>
	<1213135673.5013.60.camel@dax.rpnet.com>
	<c384c5ea0806110123k4682543btfd87a864f374741f@mail.gmail.com>
	<1213177678.5010.9.camel@dax.rpnet.com>  <g2obvj$45d$1@ger.gmane.org>
Date: Wed, 11 Jun 2008 12:32:20 +0100
Message-Id: <1213183940.5010.40.camel@dax.rpnet.com>
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
X-List-Received-Date: Wed, 11 Jun 2008 11:38:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-06-11 at 13:12 +0200, Koen Kooi wrote:
> The problem case Leon and I are seeing:
> 
>   Multiple kernel recipes are getting built when doing 'bitbake 
> something', which makes builds fail, or worse, succeed and you end up 
> with bogus kernels for your machine.

Ouch, thats bad :(.

> In the past we have worked around it by adding COMPATIBLE_MACHINE to 
> each kernel (people should do that, yes, I'm looking at you, 
> linux-bd-neon). But now we have linux_<version>.bb that are meant to be 
> reused, we are stuck with this 'feature' again.
> 
> Maybe we should special case recipes that do 'inherit kernel'?

Lets find the real problem. Do we know which dependency is causing the
problem? What is one recipe providing which the other isn't? There has
to be a reason bitbake is doing this, we just need to work out what it
is. That can be hard unfortunately and we need to improve on that...

Cheers,

Richard




