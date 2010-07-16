Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OZniU-0005cp-FV
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 18:24:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6GGOQ4k024779;
	Fri, 16 Jul 2010 17:24:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24509-04; Fri, 16 Jul 2010 17:24:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6GGOJvQ024773
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Jul 2010 17:24:20 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Michael Smith <msmith@cbnco.com>
In-Reply-To: <4C407EE5.6050802@cbnco.com>
References: <1279290319.10837.1747.camel@rex>  <4C407EE5.6050802@cbnco.com>
Date: Fri, 16 Jul 2010 17:24:16 +0100
Message-ID: <1279297456.10837.1942.camel@rex>
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
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Fri, 16 Jul 2010 16:24:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-16 at 11:46 -0400, Michael Smith wrote:
> Richard Purdie wrote:
> > The idea is that if bitbake finds any X.bbappend files, when it loads
> > X.bb, it will also include these files after it parses the base .bb file
> > (but before finalise and the anonymous methods run). This means that
> > the .bbappend file can poke around and do whatever it might want to the
> > recipe to customise it.
> 
> Does this do anything different than amendrecipes.bbclass?

Several people have mentioned the amend bbclass. This implements
something very similar in quite a different way as part of the bitbake
tool itself. There are advantages and disadvantages to doing this.

The features I liked about the bbappend approach was the small amount of
code change required to bitbake compared to the functionality it offers
and also the overhead of the bbappend code is minimal.

I also feel the bbappend format is slightly easier for users to
comprehend but that is subjective.

A downside is that the .bbappend applies to specific versions, not all
versions as amend.bbclass can be setup. There are ways that could be
changed.

The amend class has a greater degree of flexibility in that you can make
changes to the class and it could be argued not changing the core is an
advantage too.

Cheers,

Richard



