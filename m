Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PfPDm-0004We-F3
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 05:00:34 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PfPD1-0001ON-Fk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 19:59:47 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 18 Jan 2011 19:59:46 -0800
Received: from [172.30.80.246] ([172.30.80.246]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 18 Jan 2011 20:59:45 -0700
Message-ID: <4D3661AC.8030708@mentor.com>
Date: Tue, 18 Jan 2011 20:59:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>	<4D34952B.607@mentor.com>
	<201101180730.29536.roman@khimov.ru>
In-Reply-To: <201101180730.29536.roman@khimov.ru>
X-OriginalArrivalTime: 19 Jan 2011 03:59:46.0028 (UTC)
	FILETIME=[4F61EAC0:01CBB78D]
Subject: Re: [PATCH 1/2] minimal.conf: Prefer perl 5.10.1 and opie 1.2.5
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
X-List-Received-Date: Wed, 19 Jan 2011 04:00:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/17/2011 09:30 PM, Roman I Khimov wrote:
> В сообщении от Понедельник 17 января 2011 22:14:51 автор Tom Rini написал:
>> On 01/17/2011 10:50 AM, Khem Raj wrote:
>> I see different problems with perl 5.10.1 + uclibc + p2020ds, so I guess
>> this is fine with me.
>
> What kind of problems?

Khem fixed it tonight.  At heart, there's been a need to make much 
better use of the libc-uclibc override rather than testing TARGET_OS as 
there's at least 'linux-uclibc', 'linux-uclibceabi' and 
'linux-uclibcspe' as valid TARGET_OS combinations.  perl has been doing 
a test for the first two and Khem added a test for the 3rd.  This got me 
to go and audit the recipes for using the _linux-uclibc append and 
switching them en masse to libc-uclibc.  There were a very small number 
of places that had been catching all 3, but for the most part it was 80% 
catching the first two and 20% catching just linux-uclibc.  I believe 
but didn't check that Khem caught the rest of the places that were 
testing for TARGET_OS in shell code and updated them for linux-uclibcspe.

-- 
Tom Rini
Mentor Graphics Corporation


