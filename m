Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuZFH-0004O1-Dj
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 23:35:46 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090416213146.NMZK16134.fed1rmmtao104.cox.net@fed1rmimpo01.cox.net>;
	Thu, 16 Apr 2009 17:31:46 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id gMXl1b0044dMFYL03MXl2w; Thu, 16 Apr 2009 17:31:45 -0400
X-Authority-Analysis: v=1.0 c=1 a=Q7dqUReUBcIA:10 a=s9zPVp_aTL4A:10
	a=gJRV-PLIa5bV3nH0yE0A:9 a=dh41pI35TtRADIN4pPoA:7
	a=TWGUw6F-it5Ag_ruTlc0s2jHzVMA:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 14:31:44 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: David Huggins-Daines <dhuggins@cs.cmu.edu>
Message-ID: <20090416213144.GN17629@smtp.west.cox.net>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
	<1239912183-25085-2-git-send-email-dhuggins@cs.cmu.edu>
	<20090416205436.GL17629@smtp.west.cox.net>
	<49E79C40.1050801@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <49E79C40.1050801@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.42
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] fix do_install for MinGW gcc-canadian-sdk
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
X-List-Received-Date: Thu, 16 Apr 2009 21:35:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2009 at 04:59:44PM -0400, David Huggins-Daines wrote:
> Tom Rini wrote:
>>
>> Is this using the distro / machine you mentioned before?  This should
>> all be fine and we just end up making a 'C:' dir.  I'm very curious here
>> as at some point prior to pushing canadian stuff originally I had the
>> same patch, but on trying to confirm I needed it, I suddenly didn't need
>> it anymore.
>>
>>   
> Yeah - I can send you the distro, machine, and local.conf if you like,  
> or publish my git repository. I am using these extra definitions in  
> local.conf for building the MinGW SDK:
>
> SDK_ARCH = "i686"
> SDK_OS = "mingw32"
> SDK_EXEEXT = ".exe"
> OVERRIDES .= ":sdk-mingw32"

Looks fine except for the OVERRIDES.  I don't use any special ones, so
you shouldn't need any either :)  (But yes, there are bits of code that
reference sdk-mingw32 and need fixing).

-- 
Tom Rini


