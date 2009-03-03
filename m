Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LeWQQ-0000uD-TR
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 16:20:55 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090303151649.HJBT22254.fed1rmmtao106.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 3 Mar 2009 10:16:49 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id NfGp1b0024dMFYL03fGpD1; Tue, 03 Mar 2009 10:16:49 -0500
X-Authority-Analysis: v=1.0 c=1 a=uScoJcWiD1UA:10 a=XXFRhCI6BIMA:10
	a=C2fOdq07eGq1GACAM1EA:9 a=nElqyFzM7Z2WN4CgxhkA:7
	a=v8C3Kt6wjpSfmhPgsHscRx57raAA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 3 Mar 2009 08:16:48 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090303151648.GL26343@smtp.west.cox.net>
References: <gh8v57$5nk$1@ger.gmane.org> <49380C4F.1050809@dls.net>
	<49380EAC.5020809@dls.net> <gh94ov$rdk$1@ger.gmane.org>
	<20090303051111.GD26643@denix.org> <goilvs$ps$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <goilvs$ps$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: invalidating udev cache, how?
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
X-List-Received-Date: Tue, 03 Mar 2009 15:20:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2009 at 08:24:44AM +0100, Koen Kooi wrote:
> On 03-03-09 06:11, Denys Dmytriyenko wrote:
>> On Thu, Dec 04, 2008 at 06:41:50PM +0100, Koen Kooi wrote:
>>> On 04-12-08 18:09, Mike (mwester) wrote:
>>>> Mike (mwester) wrote:
>>>>
>>>>> A slight improvement would be to make the dev.tar file dependent upon
>>>>> the bootargs; i.e. invalidate /etc/dev.tar file if the boot command line
>>>>> doesn't match the current command line.  This could be a very fast
>>>>> operation, just "cmp /proc/cmdline /etc/dev_cmdline" or similar.
>>>> As I consider this further, we could actually just save and compare
>>>> /proc/atags if that's present on the device in question (falling back to
>>>> /proc/cmdline if not present).  That would catch *any* changes passed in
>>>> to the kernel via the bootloader.
>>>>
>>>> Flashing a new kernel would seem to be another logical place to
>>>> invalidate the cache, so adding a comparison of "uname -rv" would be a
>>>> reasonable way to catch that.
>>> That should indeed take care of bootargs and kernel version changes. I'm
>>> still tempted to add option 2) to all that :)
>>
>> Sorry for bringing up this old discussion. Are there any plans to implement
>> the above checks in udev?
>
> Plans yes, time no :(

Can we make sure they're optional?

-- 
Tom Rini


