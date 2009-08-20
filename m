Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Me8pb-0005Rj-1W
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 16:41:35 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C780028440A for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 16:24:15 +0200
Message-ID: <4A8D5C8E.8030806@atmel.com>
Date: Thu, 20 Aug 2009 16:24:14 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8C1EB7.4050500@atmel.com> <20090820033157.GB32010@denix.org>
	<20090820042324.GC4952@smtp.west.cox.net>
In-Reply-To: <20090820042324.GC4952@smtp.west.cox.net>
Subject: Re: fbv neutered
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
X-List-Received-Date: Thu, 20 Aug 2009 14:41:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Tom Rini skrev:
> On Wed, Aug 19, 2009 at 11:31:57PM -0400, Denys Dmytriyenko wrote:
> 
>> On Wed, Aug 19, 2009 at 05:48:07PM +0200, Ulf Samuelsson wrote:
>>> I added "fbv" "frame buffer viewer" to the file system,
>>> and happily tried to watch my Mustang rental car.
>>>
>>> -- fbv did not recognize the file format.
>>>
>>> Generated a nice bmp file and tried this...
>>>
>>> --  fbv did not recognize the file format.
>>>
>>> I then checked the recipe:
>>>
>>>
>>> ---------------------------------
>>> 	CC="${CC}" ./configure --without-libungif --without-bmp \
>>> 		--without-libjpeg
>>> ---------------------------------
>>>
>>> Beats me why someone would want to have it built this way.
> 
> Yes, I pushed it that way as I only needed it as a png viewer (we needed
> a simple "can we display graphics?" test program) and someone on IRC
> also only needed PNGs, I guess.
> 
> Of course, it'd be pretty easy to add ungif/bmp/jpeg to the dependancies
> list and recompile if you wanted more support.
> 

Anyone mind if I make it the default?
ungif breaks, so I might skip this for simplicity right now.


>>> Is there another application one should use?
>> Try fbida - worked for me just fine
> 
> It didn't when I tried, way way back when.  It also wanted way more
> stuff :)
> 


-- 
Best Regards
Ulf Samuelsson



