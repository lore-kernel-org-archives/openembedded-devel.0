Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol5Jz-0008UE-88
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:26:11 +0200
Received: by gyd8 with SMTP id 8so2092521gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=N6de1JkEzPo6VOj8O8toGGsHuHahmQr9ogf9XMw1hIE=;
	b=GRDbqHSFmw/xY5hWckpn9q/kGdeYU38mmp60x0rvvBvwD839P8aO4LIkPv3xdeqgEk
	95Fbp1JqE/QJ7XrxEqMGhDCPaDUNTTCNqgYlYeohYo4lzBdoFcoKmYPdzY6ruEj3pULo
	fAtVfXqVHjaJpDD89jI3bNieiQGdz3zqVgq9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=r5YRFMvNw2gfAefZ+dJOyr/MtcsfD+xSTnUc2Hc25xELOZMgSHXHs9HfU27I7kzxYt
	MKzhPCLAIa/9zZ+FWAkVGD4aaTuZenvopJWQApwBEJRnmqSvAx4FFhBFy9EJwYMPFgBN
	aZYaHf9Ztt8r+xK2zuMpT5flWJ8mX6sh6VpWw=
MIME-Version: 1.0
Received: by 10.231.12.73 with SMTP id w9mr6310938ibw.99.1281986751861; Mon,
	16 Aug 2010 12:25:51 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 12:25:51 -0700 (PDT)
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 16 Aug 2010 21:25:51 +0200
Message-ID: <AANLkTinbdx5rKQOckS3BEuEE=mZsnLmER8TqA0U87YUY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xorg recipes cleanup
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
X-List-Received-Date: Mon, 16 Aug 2010 19:26:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/16 Martin Jansa <martin.jansa@gmail.com>:
> Hi,
>
> all distributions are now using
> preferred-xorg-versions-X11R7.5.inc or
> preferred-xorg-versions-live.inc or
> no preferred-xorg-versions*.inc at all
>
> So we can remove some older versions not pinned in those 2
> to make future maintanance of xorg-* dirs a bit easier.
>
> As this is really easy to test (if you apply all 9 and build your
> favourite target again, no xorg package should be rebuilt - version changed),
> please test and ACK or don't scream later that you had some strange version
> preferred from local.conf.

I could not test, as patch 2 is not on patchwork (and retrieving them
from gmail is somewhat tricky)

Do we indeed want to move this to obsolete? Is there a point in
retaining it? Why not just rm them (they are still in git)
Or do we want obsolete to become the graveyard of old recipes?

Frans


