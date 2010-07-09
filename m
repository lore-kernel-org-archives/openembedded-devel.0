Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OXB9k-0006eT-82
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:50:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o69AjGut015114
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Jul 2010 11:45:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15041-01 for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jul 2010 11:45:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o69AjAva015108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Jul 2010 11:45:11 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C35F08F.1040705@freyther.de>
References: <4C356475.2060208@gmail.com>  <4C35F08F.1040705@freyther.de>
Date: Fri, 09 Jul 2010 11:44:54 +0100
Message-ID: <1278672294.28835.95.camel@rex>
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
Subject: Re: [RFC] Badness with -ibad, a replacement for zecke-no-host-includes.patch.
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
X-List-Received-Date: Fri, 09 Jul 2010 10:50:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-07-08 at 23:36 +0800, Holger Freyther wrote:
> On 07/08/2010 01:39 PM, Graham Gower wrote:
> > This patch introduces a new command line parameter to gcc (at
> > Zecke's suggestion), -ibad, which may be used to specify
> > blacklisted include prefixes. E.g.
> > 
> > grg@eye7:/tmp$ ~/oe2/tmp/cross/mipsel/bin/mipsel-angstrom-linux-gcc -c test.c -ibad /usr/include -I /usr/include
> > CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
> 
> nice! The only thing that is worrying is the question how we make sure
> these bad path's are enforced.
> 
> E.g. a recipe not honoring our CPPFLAGS might silently pass this check
> (while before it was hardcoded into the compiler). My proposal would be
> to extend the sanity check and grep the compile log for gcc and -ibad
> and fail if gcc exists but -ibad does not occur?

How about making this option an environmental variable rather than a
flag? I've seen that technique used to great effect for this exact
reason before...

Cheers,

Richard



