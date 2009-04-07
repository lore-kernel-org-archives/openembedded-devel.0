Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrEkS-0000Yi-7L
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 19:06:32 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090407170218.SOQV4363.fed1rmmtao103.cox.net@fed1rmimpo01.cox.net>;
	Tue, 7 Apr 2009 13:02:18 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id ch2H1b00C4dMFYL03h2H6t; Tue, 07 Apr 2009 13:02:17 -0400
X-Authority-Analysis: v=1.0 c=1 a=LLXGQB_n1EEA:10 a=Li_4dJr9FsMA:10
	a=mDV3o1hIAAAA:8 a=b2ZvGRdsAAAA:8 a=pJjET-105FfTcYPG4X8A:9
	a=HWl9rla0zMzQ4mIuIu6PdJAzWDIA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 10:02:17 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: David Huggins-Daines <dhuggins@cs.cmu.edu>
Message-ID: <20090407170216.GF2195@smtp.west.cox.net>
References: <1239117404-2263-1-git-send-email-dhuggins@cs.cmu.edu>
	<20090407164400.GD2195@smtp.west.cox.net>
	<49DB854A.4070908@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <49DB854A.4070908@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.43
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] fix GCC 4.3.3 sources in stable/2009 branch
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
X-List-Received-Date: Tue, 07 Apr 2009 17:06:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 12:54:34PM -0400, David Huggins-Daines wrote:
> Tom Rini wrote:
>>
>> First, this is fixed in .dev now, by fixing all of the gcc recipes
>> (except for csl ones) to use ${GNU_MIRROR} and updating the checksums
>> file.  Second, ftp.gnu.org/gnu is correct as 'pub' is just a symlink to
>> '.'.
>>   
> Yeah, actually, after trying to rebuild, I agree.  Changing bitbake.conf  
> is a very bad idea.
>
> However I still think the changes to the gcc recipes and checksums.ini  
> should be merged into the stable branch, otherwise it is not possible to  
> build any recent versions of GCC (and in particular, thumb support seems  
> not to work properly without using 4.3.3)

I'll propose
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=e053ff45acfa098921fc7e8c124ae0d96ed33750
shortly (need to make breakfast).

-- 
Tom Rini


