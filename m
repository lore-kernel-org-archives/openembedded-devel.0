Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1M3V7k-0007kc-Iq
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 15:00:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4BCsKiI011629
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 13:54:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11330-04 for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 13:54:16 +0100 (BST)
Received: from [192.168.1.30] (dynamic0.rpnet.com [192.168.1.30])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4BCsAHS011622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 13:54:12 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4A080E5F.6080602@balister.org>
References: <4A07EE70.2010408@gmx.net>
	<200905111210.44913.mickey@vanille-media.de>
	<4A080E5F.6080602@balister.org>
Date: Mon, 11 May 2009 13:54:09 +0100
Message-Id: <1242046449.5824.29.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: python 2.6 warning
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
X-List-Received-Date: Mon, 11 May 2009 13:00:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-11 at 07:39 -0400, Philip Balister wrote:
> Michael 'Mickey' Lauer wrote:
> > On Monday 11 May 2009 11:22:56 Robert Schuster wrote:
> >> Hi all,
> >> those who are using bitbake with Python 2.6 (e.g. Ubuntu 09.04, Debian
> >> sid) will notice this warning:
> >>
> >> /home/rschus/oe/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets
> >> module is deprecated
> >>   import types, sets
> >>
> >> Is anyone from OE in the know how to fix that properly?
> > 
> > Basically you need to rewrite COW.py to work with the new built-in sets. Might 
> > be a chance to get another BitBake release out.
> 
> Will this still work with python 2.5?

There were patches for this on the bitbake list. I suspect 2.5 will be
fine, not sure about 2.4 or earlier. I've not had a chance to look into
this yet :(

Cheers,

Richard



