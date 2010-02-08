Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Ned7h-0004FA-OP
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 00:34:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o18NW17B014760
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Feb 2010 23:32:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14432-02 for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2010 23:31:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o18NVtdp014748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Feb 2010 23:31:55 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100204190730.GB5641@denix.org>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
	<1265308970.13632.6.camel@conroy-linux>
	<20100204190730.GB5641@denix.org>
Date: Mon, 08 Feb 2010 23:31:53 +0000
Message-ID: <1265671913.26725.374.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by	using $SDK_PATH var in env setup script
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
X-List-Received-Date: Mon, 08 Feb 2010 23:34:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-04 at 14:07 -0500, Denys Dmytriyenko wrote:
> On Thu, Feb 04, 2010 at 01:42:50PM -0500, Chris Conroy wrote:
> > On Thu, 2010-02-04 at 12:22 -0500, Denys Dmytriyenko wrote:
> > > First of all, they are the same. Check conf/bitbake.conf:
> > > 
> > > SDKPATH = "${SDK_PATH}"
> > > 
> > > Second, ask RP why he introduced SDKPATH, when we had SDK_PATH for years (my 
> > > guess - that's what is used in Poky, so makes porting changes easier):
> > Fair enough, but saying 'ask RP' doesn't justify away the fact that
> > having these two variables is confusing. If they really are the same,
> > then one should be removed. If one shouldn't be removed, then there is
> > some difference that should probably be documented. It's just a matter
> > of consistency/readability.
> 
> All I was trying to say is that, while it's a valid question, it is out of 
> scope of this patch. I don't want to mix 2 things in one patch (if we decide 
> to remove one of SDKPATH/SDK_PATH). And it would still be good to hear RP's 
> rationale.

As best I remember, historically, there was SDK_PREFIX. When we created
the SDK_ variables, this conflicted with things like TARGET_PREFIX,
HOST_PREFIX and BUILD_PREFIX so it had to be renamed. OE went with
SDK_PATH, Poky went with SDKPATH. When I merged a load of toolchain
stuff between the two, I think I realised halfway through a merge there
was a problem and inserted that variable to make sure everything worked.
I'm sure I intended to clean it up at some point but never got around to
it.

In summary, one needs to go. 

I have a preference for not having an underscore in the name as SDKPATH
does something different to the other SDK_*, TARGET_*, HOST_* and
BUILD_* variables and does not have a counterpart.

Cheers,

Richard





