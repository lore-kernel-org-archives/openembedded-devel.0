Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OuAHs-0000rP-LN
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:33:33 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OuAH9-0001cn-O4 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 13:32:47 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 10 Sep 2010 13:32:47 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 10 Sep 2010 14:32:46 -0600
Message-ID: <4C8A95E7.7070403@mentor.com>
Date: Fri, 10 Sep 2010 13:32:39 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100903111210.GA17702@game.jcrosoft.org>	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>	<AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>	<AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>	<131E5DFBE7373E4C8D813795A6AA7F080310BFA4A2@dlee06.ent.ti.com>	<AANLkTik599XZfY1Abq+gdDqGSOOLnqHUiqL1VVK9Rh87@mail.gmail.com>
	<20100910185711.GG28148@denix.org>
In-Reply-To: <20100910185711.GG28148@denix.org>
X-OriginalArrivalTime: 10 Sep 2010 20:32:46.0470 (UTC)
	FILETIME=[53FAA260:01CB5127]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it global
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
X-List-Received-Date: Fri, 10 Sep 2010 20:33:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Wed, Sep 08, 2010 at 07:58:39AM +0200, Frans Meulenbroeks wrote:
>> 2010/9/7 Maupin, Chase <chase.maupin@ti.com>:
>>
>>>> Forgot about this, but a variable should go with documentation.
>>>> This already has been raised with the orginal patch, but was ignored
>>>> by the submitters.
>>> Frans, Are you counting me as one of the original submitters?  I mainly 
>>> use the SOC_FAMILY, I didn't create it.  That being said, if you have a 
>>> recommended section of the usermanual that this should be documented in 
>>> I'll try to add something.
>> Hi Chase,
>> I see you indeed as the submitter. The commit carries your name and
>> there is no reference in the commit message of another author.
>>
>> Wrt the manual: actually I thought we had a section for this, but as
>> it stands i cannot find it. Guess I saw it somewhere else.
>> I'm not really sure where it would fit. I guess there are others who
>> have a better view on the manual and its structure.
> 
> Frans,
> 
> I guess then you haven't read the original discussion closely enough. Chase 
> only made a change to add existing SOC_FAMILY override into COMPATIBLE_MACHINE 
> variable... I keep repeating myself - SOC_FAMILY feature is about a year old. 
> It was introduced as part of a large merge from Arago. Here is the original 
> commit and some description:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b788499815bfc1974d4277c0a261b9a7c24aa816

I suppose you could save Chase some time, Denys, and update the manual 
instead :)  But to me, it's perfectly reasonable for Frans to ask that 
when someone renames a not previously documented variable to go ahead 
and document it too (since they must have some knowledge of how it 
works, and some correct knowledge being written down is better than none).

-- 
Tom Rini
Mentor Graphics Corporation


