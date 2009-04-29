Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LzAel-0005P3-DI
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 16:21:03 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090429141544.YCQY10385.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 29 Apr 2009 10:15:44 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id lSFk1b00K4dMFYL03SFknL; Wed, 29 Apr 2009 10:15:45 -0400
X-Authority-Analysis: v=1.0 c=1 a=9VPdEZR8EBsA:10 a=eQmQFGOYtZwA:10
	a=ZceZqKTTYryabFTKGBIA:9 a=bF7KAhC9bUMiHcwp-0Vsl5Ann7IA:4
X-CM-Score: 0.00
Date: Wed, 29 Apr 2009 07:15:44 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090429141544.GZ18788@smtp.west.cox.net>
References: <1240945982.12505.23.camel@utx.utx.cz>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF7A7@hiob.intern.dresearch.de>
	<49F8463B.7040102@balister.org>
MIME-Version: 1.0
In-Reply-To: <49F8463B.7040102@balister.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] gcc_4.2.4.bb: QA Issue: No GNU_HASH in theelf binary
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
X-List-Received-Date: Wed, 29 Apr 2009 14:21:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2009 at 08:21:15AM -0400, Philip Balister wrote:
> Sledz, Steffen wrote:
>>> I can confirm the failure in the default angstrom build for spitz from
>>> the last week. Linking of gcc wrapper and few other utilities reported
>>> the standard GNU_HASH QA error.
>>>
>>> Here is a possible fix or work-around. It's tested and it works, but
>>> maybe it is not fully correct.
>>>
>>> It may be one of following problems. I did not search deeper which one
>>> is true:
>>> - Ignoring LDFLAGS passed to configure
>>> - LDFLAGS x LDFLAGS_FOR_TARGET clash
>>> - ???LDFLAGS_FOR_TARGET are not set in cross builds of native gcc 
>>> compiler
>>>   (i. e. not canadian)
>>
>> Fix works for me. But it would be nice if some members of the core team could ack it.
>
> Does anyone see any downside for this patch? Have other people tested  
> it? I hate blind acking things.

Khem has a patch for this issue too but wants to test it more.

-- 
Tom Rini


