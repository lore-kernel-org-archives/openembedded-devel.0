Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuTZB-00041h-Pt
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:40:57 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PuTXm-0005U9-G9 from Tom_Rini@mentor.com ;
	Tue, 01 Mar 2011 09:39:30 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 1 Mar 2011 09:39:30 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 1 Mar 2011 09:39:29 -0800
Message-ID: <4D6D2F3F.7060403@mentor.com>
Date: Tue, 1 Mar 2011 10:39:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>	<4D6D19AD.5010505@mentor.com>
	<AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>
In-Reply-To: <AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>
X-OriginalArrivalTime: 01 Mar 2011 17:39:30.0317 (UTC)
	FILETIME=[9E7093D0:01CBD837]
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
X-List-Received-Date: Tue, 01 Mar 2011 17:40:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2011 10:03 AM, Otavio Salvador wrote:
> On Tue, Mar 1, 2011 at 16:07, Tom Rini<tom_rini@mentor.com>  wrote:
>> On 03/01/2011 02:10 AM, Martin Jansa wrote:
> ...
>> And personally I'd like to see the -g flag (for both target and the rest) be
>> a variable that can be tweaked as needed (for more or less debug in the
>> area).
>
> Having -g shouldn't hurt since the debugging symbols end up on the
> -dbg packages. Why having it "disabled" by default?

In the case of host packages, I disable debug symbols (don't want, takes 
up space when shipping).  In the case of target stuff, we may want more 
debug info to be available.  Or one may want to have less because again, 
it takes up space when shipping.

-- 
Tom Rini
Mentor Graphics Corporation


