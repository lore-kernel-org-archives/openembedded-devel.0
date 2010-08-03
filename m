Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OgHWQ-0005DW-EB
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 15:27:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o73DR2W0012619;
	Tue, 3 Aug 2010 14:27:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10043-06; Tue,  3 Aug 2010 14:26:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o73DQrJX012601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 3 Aug 2010 14:26:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
In-Reply-To: <1279290319.10837.1747.camel@rex>
References: <1279290319.10837.1747.camel@rex>
Date: Tue, 03 Aug 2010 14:26:42 +0100
Message-ID: <1280842002.16235.83.camel@rex>
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
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 03 Aug 2010 13:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-16 at 15:25 +0100, Richard Purdie wrote:
> Whilst our layers mechanism, is great it does have a drawback which has
> bugged me for a while. If you have a recipe like pointercal which has
> machine specific information in it and you have your new machine code in
> a layer, how do you add a pointercal file for your machine?
> 
> Answer is you copy the whole pointercal recipe and files into your
> layer, then add the single file for your machine. To me this is ugly,
> ugly, ugly. We hate code duplication and as soon as you create two
> copies of the same information, we've failed.
> 
> So how could we do this better? Somehow we need to say that a given
> directory X has some information which should be merged with the
> original recipe. I've thought through several different ways of doing
> this and the best solution I found was "bbappend".
> 
> The idea is that if bitbake finds any X.bbappend files, when it loads
> X.bb, it will also include these files after it parses the base .bb file
> (but before finalise and the anonymous methods run). This means that
> the .bbappend file can poke around and do whatever it might want to the
> recipe to customise it.
> 
> I went ahead and tried it out as its quite simple to code this in
> bitbake. I liked the result enough I've already merged this into Poky:
> 
> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=63e6ba85677b8aa9f4cf9942a1fccbb8a8c72660
> 
> I'm proposing to push it to bitbake master if there are no serious
> objections.

Whilst I think there were some initial concerns the consensus seemed to
be that this was a good thing to have in bitbake, its something that has
been on the feature wishlist since day one so I've merged the patch into
bitbake master.

Cheers,

Richard



