Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1ISyF8-0000JS-Bb
	for openembedded-devel@openembedded.org; Wed, 05 Sep 2007 19:00:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l85GwEA0012364
	for <openembedded-devel@openembedded.org>;
	Wed, 5 Sep 2007 17:58:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11989-10 for <openembedded-devel@openembedded.org>;
	Wed,  5 Sep 2007 17:58:10 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l85Gw7tO012353
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 5 Sep 2007 17:58:07 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
Date: Wed, 05 Sep 2007 17:58:06 +0100
Message-Id: <1189011486.7849.35.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] How to handle external kernel patches in oe the	right way?
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
X-List-Received-Date: Wed, 05 Sep 2007 17:00:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-09-04 at 22:29 +0200, Stefan Schmidt wrote:
> Due to my work on OpenEZX (http://www.openezx.org) I'm in touch with
> external kernel patches used in OE to build working kernels for
> different Motorola mobile phones.
> 
> Talking with Koen about the best way to handle this we have some
> slightly different opinions on this. So we like to get some more
> opinions on this before pinning to a strategy.
> 
> Koen like to pull the patches from a known-good rev into oe to have
> them all at one place for less fragile building and tweaking.
> 
> I prefer OE to use our svn server with a fixed SRCREV which gets
> updated once a newer version is known good. I'm not a fan of
> duplicating the patches in OE if some small tweaking patches can also
> handle it.

Personally I agree with this in principle, I've never liked maintaining
kernel patches in OE directly either.

Cheers,

Richard



