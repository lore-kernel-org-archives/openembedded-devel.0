Received: from mail.massmicro.com ([71.174.98.229] helo=mail.kumichan.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mark.richards@massmicro.com>) id 1Nx0ue-0001s5-6P
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 18:37:05 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.kumichan.net (Postfix) with ESMTP id 07CBACED2B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 16:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kumichan.net
Received: from mail.kumichan.net ([127.0.0.1])
	by localhost (mail.kumichan.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHsobeLKAErh
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 16:12:17 +0000 (UTC)
Received: from [127.0.0.1] (unknown [71.174.98.226])
	(Authenticated sender: markr)
	by mail.kumichan.net (Postfix) with ESMTP id 69CA6CECF2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 16:12:17 +0000 (UTC)
Message-ID: <4BB37460.3000906@massmicro.com>
Date: Wed, 31 Mar 2010 12:12:16 -0400
From: Mark Richards <mark.richards@massmicro.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1270034881.1681.965.camel@rex>
In-Reply-To: <1270034881.1681.965.camel@rex>
X-SA-Exim-Connect-IP: 71.174.98.229
X-SA-Exim-Mail-From: mark.richards@massmicro.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gcc Recipes
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
X-List-Received-Date: Wed, 31 Mar 2010 16:37:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie , On 3/31/2010 07:28:
> I've just been looking over OE's gcc recipes and they really depress
> me :(. People touch them just enough to tweak their specific problem
> with no real thought going into the overall architecture and its a
> sprawling mess. I tackled some of this a while back. Sadly its just
> getting worse again.
>
>    
I'm prompted to reply, not as I am experienced enough (in the least) to 
help, so sorry about that, but to offer a thought about recipes and OE 
in general.  I hope this thought will apply to this thread.

When starting to use OE I was surprised that it is necessary to tinker 
with recipes at all.  For that matter, I've had to tinker with other 
things as well, which means that every update has a potential to wipe 
out my changes.  Now this is probably just an expression of the fact 
that I am very new to this environment...

In another development system (one I am very fond of) the build process 
checks for the presence of and content of user-created configuration 
files which serve various purposes.  Principally these tell the system 
where it can find additional libraries and source trees to build and 
include in the end-result.  This method protects all the internals from 
mangling, which I think is what I am reading in your description of the 
Recipes as a "sprawling mess".  This then makes the overall system 
dysfunctional downstream and, as you point out, requires fixing to get 
it back into a state that can be understood and worked with properly.  
Now this system I speak of has only 10% of the power of OE, so perhaps 
it is not a fair comparison.  Yet I think a good principle to follow is 
one that provides user-specific hooks that insulate the internals.  One 
should only tinker with the works if it will be consistent with the 
overall design and not break functionality.

/mark




