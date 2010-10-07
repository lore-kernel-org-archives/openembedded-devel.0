Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P3u0v-0001cq-Cs
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 19:12:18 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P3u0W-0005PM-0r from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 10:11:52 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 7 Oct 2010 10:11:51 -0700
Received: from [172.30.80.69] ([172.30.80.69]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 7 Oct 2010 11:11:50 -0600
Message-ID: <4CADFF48.1050504@mentor.com>
Date: Thu, 07 Oct 2010 10:11:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CADCF1E.3090602@mentor.com>	<4CADD11C.6020800@freyther.de>
	<AANLkTimRidGM5_Lob02ZqFtENcYi2hjigKs80=bkLjLh@mail.gmail.com>
In-Reply-To: <AANLkTimRidGM5_Lob02ZqFtENcYi2hjigKs80=bkLjLh@mail.gmail.com>
X-OriginalArrivalTime: 07 Oct 2010 17:11:50.0613 (UTC)
	FILETIME=[BB481850:01CB6642]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Updating libtiff
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
X-List-Received-Date: Thu, 07 Oct 2010 17:12:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/10/7 Holger Freyther <holger+oe@freyther.de>:
>> On 10/07/2010 09:46 PM, Tom Rini wrote:
>>
>>> I think we should go with:
>>> - Add tiff_4.0.0beta6.bb which should be compatible with beta5 and will get
>>> upgrades right.
>> but not with tiff_4.0.0.bb... then you would need to bump PE...
>>
> 
> Yeah, that's why I was told to use the 3.9.2+ construct.
> 
> Forgot if there was a reason (e.g. security vulnerability) not to keep 3.9.2

Why not just have this:
# Bump for 4.0.0 release!
PE = 1

In tiff_4.0.0beta6.bb ?

-- 
Tom Rini
Mentor Graphics Corporation


