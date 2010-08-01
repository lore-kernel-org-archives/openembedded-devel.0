Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OfefG-0004bM-5q
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 21:57:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o71Jv7Ns001297
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Aug 2010 20:57:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00649-10 for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Aug 2010 20:57:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o71Jux7V001291
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Aug 2010 20:57:00 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikO742JLzxxxChmVAr6feBwJzzw9ikUEX+-g66v@mail.gmail.com>
References: <AANLkTikO742JLzxxxChmVAr6feBwJzzw9ikUEX+-g66v@mail.gmail.com>
Date: Sun, 01 Aug 2010 20:56:52 +0100
Message-ID: <1280692612.1297.109.camel@rex>
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
Subject: Re: legacy staging: call for action
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
X-List-Received-Date: Sun, 01 Aug 2010 19:57:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-08-01 at 13:49 +0200, Frans Meulenbroeks wrote:
> In the attached file (which I hope will pass the mailing list) you find the
> results.
> I've also uploaded the file to http://filebin.ca/xotgad/do_stage so if it is
> not attached you can find it there.

I'm a little dubious of doing it this way. It also includes some rather
simple cases where do_stage does:

do_stage () {
	autotools_stage_all
}

which are null operations and can be removed in pretty much all cases. I
was surprised to only find myself listed for about 5% of that list :).

In the spirit of helping:

http://git.openembedded.net/cgit.cgi/openembedded/log/?h=rpurdie/for-testing

but I've not tested this so I'm going to need some assistance. I've made
the changes by a combination of inspection and knowledge of what Poky
does. I concentrated on the cross components since people are perhaps
more wary of them.

Cheers,

Richard





