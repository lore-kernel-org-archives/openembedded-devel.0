Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuVMH-0007Ot-Kb
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 20:35:45 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PuVKs-0004Cc-J4 from Tom_Rini@mentor.com ;
	Tue, 01 Mar 2011 11:34:18 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 1 Mar 2011 11:33:59 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 1 Mar 2011 11:33:59 -0800
Message-ID: <4D6D4A14.5010107@mentor.com>
Date: Tue, 1 Mar 2011 12:33:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
	<4D6D19AD.5010505@mentor.com>
	<AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>
	<4D6D2F3F.7060403@mentor.com>
	<AANLkTik7Cm2P6KL5aRDVf4sOUGsnAbpACyS+PucRpHiX@mail.gmail.com>
	<4D6D32B9.9080708@mentor.com>
	<1299003013.23547.118.camel@phil-desktop>
	<4D6D3B0E.9030309@mentor.com>
	<AANLkTim2CcNy4f_mXGmyeJ9yTfSsXnMFgZTMM6g8sOQ=@mail.gmail.com>
In-Reply-To: <AANLkTim2CcNy4f_mXGmyeJ9yTfSsXnMFgZTMM6g8sOQ=@mail.gmail.com>
X-OriginalArrivalTime: 01 Mar 2011 19:33:59.0077 (UTC)
	FILETIME=[9C8A2D50:01CBD847]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-*: add -g to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Tue, 01 Mar 2011 19:35:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2011 12:14 PM, Khem Raj wrote:
> On Tue, Mar 1, 2011 at 10:29 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>> On 03/01/2011 11:10 AM, Phil Blundell wrote:
>>>
>>> On Tue, 2011-03-01 at 10:54 -0700, Tom Rini wrote:
>>>>
>>>> That's why I'm asking for the -g part to be put into a variable so that
>>>> it can be overriden easily, in all cases, without needing to know the
>>>> special cases (ie glibc).
>>>
>>> Why is glibc special anyway (or, why is the optimization in a
>>> libc-specific conf file)?  It seems a bit bogus that the choice of your
>>> C library would be having such a global impact on the compiler flags for
>>> everything else.
>>
>> There is some odd papering over that's going on to switch out a flag or two
>> (and force -O2) for glibc (but not eglibc).  But my point is that today we
>> have a few special case FULL_OPTIMIZATION_pn-'s and it'd be great to just
>> not have to worry about that when setting the debug level we build with.
>>
>
> May be debugability can be expressed via another variable say
> DEBUG_FLAGS or somesuch which can then we appended to global CFLAGS

With the caveat that I want to control native vs target at different 
levels, yes.

-- 
Tom Rini
Mentor Graphics Corporation


