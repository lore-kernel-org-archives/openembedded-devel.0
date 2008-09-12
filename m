Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KeEFY-0004vr-T4
	for openembedded-devel@openembedded.org; Fri, 12 Sep 2008 21:24:13 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080912192125.WSQQ774.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 12 Sep 2008 15:21:25 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id DvMQ1a0021E665w04vMQN5; Fri, 12 Sep 2008 15:21:24 -0400
X-Authority-Analysis: v=1.0 c=1 a=rCeM5v77lmsA:10 a=OZgQiQfKk9MA:10
	a=b2ZvGRdsAAAA:8 a=1wdDnFz-AG2DKnfZByQA:9 a=6rOXTJ-jtNNhSujr9KcA:7
	a=bWQw9F8qnih4NkJWiIsuSO18_-kA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 12 Sep 2008 12:21:23 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080912192123.GF29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
	<gaeef7$cvi$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gaeef7$cvi$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Fri, 12 Sep 2008 19:24:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 12, 2008 at 09:04:07PM +0200, Koen Kooi wrote:
> Tom Rini wrote:
>> [ This is all also available at
>> http://bugs.openembedded.net/show_bug.cgi?id=4549 ]
>>
>> A number of xorg dev packages (both literally -dev and util-macros) are
>> uninstallable on the target.  The problem is that by default (with ipk)
>> any given -dev package will depend on the main package, for example
>> xproto-dev depends on xproto.  But in these packages case, there is no
>> main package (no xproto).  The following patch fixes the issue.
>
> No, it doesn't, your patch actually *breaks* the depends chaining, the  
> real fix would be to do ALLOW_EMPTY_${PN} = "1" in the recipes.

Well, they did all suddenly actually install.  I'll rework the patch per
your suggestion, make sure that works too and re-post.  Thanks.

-- 
Tom Rini


