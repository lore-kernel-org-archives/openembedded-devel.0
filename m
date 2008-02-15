Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JQ4tX-0003GA-MZ
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 19:02:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FI2QJv023001
	for <openembedded-devel@openembedded.org>; Fri, 15 Feb 2008 18:02:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22973-01 for <openembedded-devel@openembedded.org>;
	Fri, 15 Feb 2008 18:02:21 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FI2GQ6022985
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 15 Feb 2008 18:02:16 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47B5CA89.6000805@dls.net>
References: <E1JPfb1-0006hO-Ll@linuxtogo.org>
	<74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>
	<200802151245.30040.mickey@vanille-media.de>	<fp48t2$i8$1@ger.gmane.org>
	<47B5A9A4.3040400@dls.net> <fp4dk4$kgh$1@ger.gmane.org>
	<1203093711.8636.72.camel@dax.rpnet.com>  <47B5CA89.6000805@dls.net>
Date: Fri, 15 Feb 2008 18:02:18 +0000
Message-Id: <1203098538.8636.107.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFD: is bitbake 1.8.10 minimum supported standard?	(was:	[oe-commits] org.oe.dev anki: fix parse error)
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
X-List-Received-Date: Fri, 15 Feb 2008 18:02:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-02-15 at 11:23 -0600, Mike (mwester) wrote:
> Ok, ok -- let's not get too far off the point here.
> 
> I'm not saying that we shouldn't upgrade bitbake.  I'm just observing 
> that a one-line change to a recipe has broken the build environment for 
> many people, without any notice in advance that they should have 
> upgraded bitbake.  My point is that if we want to be "friendly" to those 
> environments that are looking for controlled and stable environments, we 
> can't be checking in recipes that break the build for everyone, and then 
> just say that the fix is for everyone to go upgrade bitbake.
> 
> It may be really, really really easy to upgrade to 1.8.10 -- and I'll do 
> that sometime.  But until I get the time to create a reference build 
> with my current bitbake version, clone that environment and create a 
> reference build with 1.8.10 and compare the two -- well, until then I'm 
> going to continue deleting the recipe that's forcing this change on me 
> at this inopportune time.  THAT, my friends, is real life -- few other 
> than hobbyists can just upgrade the core build engine at the drop of a 
> hat because somebody checked in a new file (unrelated to what I might be 
> using).

But lets also not forget what OE.dev is - a development branch. Stable
'branches' of OE exist and those stable branches have different policies
for dealing with this kind of change. For OE.dev, its fine to upgrade it
now given my understanding of what OE.dev represents.

I'm not basing the need for an upgrade on the one recipe btw, just that
in general I see OE.dev upgrading sometime, hopefully soon.

The change in question shouldn't have been committed whilst we still
have a minimum version of 1.8.8, I agree with that.

Cheers,

Richard



