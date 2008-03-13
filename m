Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZbab-0000jy-QW
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 01:46:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2D0iRgK010183
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 00:44:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09970-06 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 00:44:23 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2D0iINh010174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 00:44:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fr9n05$sm7$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>
	<20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
	<1205358843.4530.22.camel@dax.rpnet.com> <fr9n05$sm7$1@ger.gmane.org>
Date: Thu, 13 Mar 2008 00:44:21 +0000
Message-Id: <1205369061.4530.65.camel@dax.rpnet.com>
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
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Thu, 13 Mar 2008 00:46:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-03-12 at 23:54 +0100, Koen Kooi wrote:
> Richard Purdie schreef:
> | Whilst I think OE will always have a central master .dev repository I
> | see a lot of gain from having branches. I would have happily put the
> | sysroot changes into a branch and likewise the packaged-staging stuff
> | I'm working on. As it is I'm keeping it locally uncommitted with no
> | version tracking since I don't really want to play games with monotone.
> 
> Thank you for saying it right out: "I haven't tried to use branches in
> mtn, ever".

That is not what I said. 

Branches in OE have stigma attached to them. Incidents like the zecke
branch that made it onto the server which we had trouble removing didn't
encourage people to experiment and personally I'm slightly paranoid
about what I do in case things end up outside my local system which
shouldn't. 

Steps may have been taken server side to reduce the chances of these
things making it in. If so, that means creating and sharing a branch
isn't easy (server side config has to be changed). If not, it means
creation of branches on our master server isn't restricted and that
could be an equal worry.

As for playing with branches, I did that as illustrated in the mail I
sent at the end of January with total failure as I couldn't do what I
needed. I have also played at other times but have never had enough
confidence to use them.

I appreciate we now have suspend certificates which would be useful for
solving some of the past problems and yes, the situation may be better
now but the branch support isn't comparable to that in git. I also
didn't know the main server supported suspend certificates until the
start of this thread!

I'm not actually that keen on git, monotone has just pushed too many of
us over the edge, me included and this time around I'd like to see
something in more widespread use being chosen. If you believe various
arguments, git and hg are heading for convergence so in the long run it
probably doesn't matter too much which we pick. Short term, git has
features I'd like to use hg doesn't have.

> So we only have Holger saying mtn can't merge the dreambox branch, and
> people ignoring what I said about the avr32 branch.

You basically said that if you hadn't run "mtn propagate" every X days
you would have had an unmergable mess? The dreambox branch is unmergable
because this hasn't been done? This isn't an example of the SCM working
well...

Cheers,

Richard





