Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LjbBq-00072g-42
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 16:27:15 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LjbB6-0007U5-CY
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 10:26:04 -0500
Message-ID: <49BFC107.5050806@dls.net>
Date: Tue, 17 Mar 2009 10:25:59 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200903171538.21499.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903171538.21499.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.145.245.199
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 15:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Hi
> 
> I know that there were lot of talks about creating stable branch of 
> OpenEmbedded in last months. But we need stable branch for vendors which 
> use our product.
> 
> As some people know I am working for Bug Labs company. Their product 
> named 'BUG Linux' is based on Poky 'pinky' (last stable release). We 
> were considering switch to newer (but never released) version named 
> 'elroy' but recently we decided to switch to OpenEmbedded. 
> 
> But to what kind of OE? Development branch change every day and things 
> break from time to time, packages get version bumps without notifying 
> anyone etc. Other possibility would be switch to stable branch but 
> current one is deprecated and not maintained anymore.
> 
> So the situation looks like we will need new stable branch with few 
> maintainers (I will be one of them) and with proper policies for merging 
> updates from development tree of OE. I maintained OE branches used for 
> OpenZaurus/Familiar few years ago so can say that I have needed 
> experience for it.
> 
> Which things needs defining? I have few in mind:
> 
> 1. Adding new things. This should be possible only by backporting from
>    OE.dev tree and needs to be Acked by at least 2-3 developers which
>    use stable branch. New code has to build for at least one distro and
>    ARM+x86 architectures (unless it is related to one arch or even one 
>    machine).
> 
> 2. Marking recipes as buildable or not. With over 6000 of them it is
>    really hard to check everything for status. We can remove many old
>    versions but sometimes they are useful for some projects. I would   
>    rather add things like BUILDABLE_armv4t = "1" into recipe or into
>    conf/distro/include/${DISTRO}-status.inc file. Similar status for
>    recipes which are known to not work for some archs.
> 
> 3. Dealing with non buildable stuff. We have 'nonworking' and 'obsolete' 
>    dirs in metadata - both should be dropped in stable branch. Other
>    recipes can be marked as not buildable or dropped from branch - I did
>    not thought yet on it.
> 
> 4. Lifetime of branch. Will we do new stable release after 6 months or
>    after one year? For how long stable branch will be supported by OE
>    itself? I know that there will be companies which will provide
>    support for longer time - thats what I do with Poky 'pinky' now.
> 
> What do you feel about it? Any opinions or suggestions? Want to join 
> effort?

+1 from me.

I'd also suggest that it might be helpful if we could define one or a
few "reference host configurations".  On this side of the pond, for
commercial work that would be RHEL4 or RHEL5.  I'll volunteer to set up
such a reference host, and document the necessary packages/patches
required to build the stable branch on that platform.


-Mike (mwester)


