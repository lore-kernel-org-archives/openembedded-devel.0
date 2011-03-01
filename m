Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuULw-0005ja-Bk
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 19:31:20 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PuUKX-0003ja-PY from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 10:29:53 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 1 Mar 2011 10:29:53 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 1 Mar 2011 10:29:53 -0800
Message-ID: <4D6D3B0E.9030309@mentor.com>
Date: Tue, 1 Mar 2011 11:29:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>	<4D6D19AD.5010505@mentor.com>	<AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>	<4D6D2F3F.7060403@mentor.com>	<AANLkTik7Cm2P6KL5aRDVf4sOUGsnAbpACyS+PucRpHiX@mail.gmail.com>	<4D6D32B9.9080708@mentor.com>
	<1299003013.23547.118.camel@phil-desktop>
In-Reply-To: <1299003013.23547.118.camel@phil-desktop>
X-OriginalArrivalTime: 01 Mar 2011 18:29:53.0571 (UTC)
	FILETIME=[A8708730:01CBD83E]
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
X-List-Received-Date: Tue, 01 Mar 2011 18:31:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2011 11:10 AM, Phil Blundell wrote:
> On Tue, 2011-03-01 at 10:54 -0700, Tom Rini wrote:
>> That's why I'm asking for the -g part to be put into a variable so that
>> it can be overriden easily, in all cases, without needing to know the
>> special cases (ie glibc).
>
> Why is glibc special anyway (or, why is the optimization in a
> libc-specific conf file)?  It seems a bit bogus that the choice of your
> C library would be having such a global impact on the compiler flags for
> everything else.

There is some odd papering over that's going on to switch out a flag or 
two (and force -O2) for glibc (but not eglibc).  But my point is that 
today we have a few special case FULL_OPTIMIZATION_pn-'s and it'd be 
great to just not have to worry about that when setting the debug level 
we build with.

-- 
Tom Rini
Mentor Graphics Corporation


