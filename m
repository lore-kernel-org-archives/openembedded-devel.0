Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZbpb-0000xt-N7
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 02:02:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2D0xv0h010785
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 00:59:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10574-05 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 00:59:53 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2D0xqBG010777
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 00:59:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47D872D7.4060404@whitby.id.au>
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
	<1205358843.4530.22.camel@dax.rpnet.com>
	<47D872D7.4060404@whitby.id.au>
Date: Thu, 13 Mar 2008 00:59:54 +0000
Message-Id: <1205369994.4530.82.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Thu, 13 Mar 2008 01:02:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-13 at 10:48 +1030, Rod Whitby wrote:
> Richard Purdie wrote:
> > Whilst I've argued against it in the past I would consider a move of
> > bitbake from svn to git too.
> 
> I'd like to see bitbake made part of the *same* repository, since 
> bitbake and OE are so intimately linked, and no-one uses bitbake for 
> anything other than OE, and no-one uses OE with anything other than bitbake.

As I've said before I'm dead set against this. Bitbake was split from OE
for good reason.

1. The code separation forces people to recognise the metadata and the
tool parsing it are two separate things. One of OE's problems in the
past has been the lack of clear definition between layers and keeping
them separate makes the boundaries clear.

2. Assuming we have more branches for OE in the future, having a
potentially different and incompatible copy of bitbake for each branch
is a really bad idea.

3. Bitbake is its own project with releases and branches. It can't do
that effectively if you combine it with OE. Different people use
different branches of bitbake with OE.dev.

4. Whilst its not happened, you could use bitbake for different metadata
and I would welcome anyone doing that.

I'm not adverse to people having branches where bitbake and OE metadata
are combined for ease of end user use, Poky would be an example. I agree
there is a problem if the end user has to download multiple tools as it
complicates the setup. I also agree the combining does create technical
challenges with updating but with poky it is literally a case of copying
the latest 1.8 release or sometimes 1.8 svn branch in.

If we produce stable release tarballs, merging in a copy of bitbake
would be something I'd support.

Cheers,

Richard



