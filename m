Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuTnX-0004Lf-50
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:55:47 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PuTm8-0007BI-J4 from Tom_Rini@mentor.com ;
	Tue, 01 Mar 2011 09:54:20 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 1 Mar 2011 09:54:20 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 1 Mar 2011 09:54:19 -0800
Message-ID: <4D6D32B9.9080708@mentor.com>
Date: Tue, 1 Mar 2011 10:54:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>	<4D6D19AD.5010505@mentor.com>	<AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>	<4D6D2F3F.7060403@mentor.com>
	<AANLkTik7Cm2P6KL5aRDVf4sOUGsnAbpACyS+PucRpHiX@mail.gmail.com>
In-Reply-To: <AANLkTik7Cm2P6KL5aRDVf4sOUGsnAbpACyS+PucRpHiX@mail.gmail.com>
X-OriginalArrivalTime: 01 Mar 2011 17:54:20.0405 (UTC)
	FILETIME=[B0F93A50:01CBD839]
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
X-List-Received-Date: Tue, 01 Mar 2011 17:55:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2011 10:50 AM, Otavio Salvador wrote:
> On Tue, Mar 1, 2011 at 17:39, Tom Rini<tom_rini@mentor.com>  wrote:
>> On 03/01/2011 10:03 AM, Otavio Salvador wrote:
>>> Having -g shouldn't hurt since the debugging symbols end up on the
>>> -dbg packages. Why having it "disabled" by default?
>>
>> In the case of host packages, I disable debug symbols (don't want, takes up
>> space when shipping).  In the case of target stuff, we may want more debug
>> info to be available.  Or one may want to have less because again, it takes
>> up space when shipping.
>
> I see but this could be overriden by distro, couldn't it?

That's why I'm asking for the -g part to be put into a variable so that 
it can be overriden easily, in all cases, without needing to know the 
special cases (ie glibc).

-- 
Tom Rini
Mentor Graphics Corporation


