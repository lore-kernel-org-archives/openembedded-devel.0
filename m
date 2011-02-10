Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pncs6-0006BW-WC
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 21:12:11 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pncr3-0003yW-Ek from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 12:11:05 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Feb 2011 12:11:05 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Feb 2011 13:11:04 -0700
Message-ID: <4D544652.4090709@mentor.com>
Date: Thu, 10 Feb 2011 13:10:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinb5Yueix_q94X84VpwHbAUBJ09myVj9DCTbE86@mail.gmail.com>
In-Reply-To: <AANLkTinb5Yueix_q94X84VpwHbAUBJ09myVj9DCTbE86@mail.gmail.com>
X-OriginalArrivalTime: 10 Feb 2011 20:11:04.0422 (UTC)
	FILETIME=[A519A060:01CBC95E]
Subject: Re: how to add multiple versions?
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
X-List-Received-Date: Thu, 10 Feb 2011 20:12:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2011 12:24 PM, AJ ONeal wrote:
> I've got
>
> nodejs-0.2.6.bb
> and
> nodejs-0.4.0.bb
>
> If I do
>    `bitbake nodejs-0.2.6`
> it builds 0.4.0 anyway with this message
>
> ERROR: Multiple .bb files are due to be built which each provide nodejs
> (/home/coolaj86/overo-oe/org.openembedded.dev/recipes/nodejs/nodejs_0.2.6.bb/home/coolaj86/overo-oe/org.openembedded.dev/recipes/nodejs/
> nodejs_0.4.0.bb).
>   This usually means one provides something the other doesn't and should
>
> How do I make the file such that it knows one is different from the other?
>
> There's api breakage, so current users may want to continue using the 0.2.x
> branch. I don't want to remove that in favor of 0.4.0 quite yet.

There's a few ways to do this.  The first is to just put D_P = -1 on the 
new version and let distros opt to upgrade everything at once.  The 
second is to play virtual games like we do for libusb.  The first option 
is easier to implement than the second and depending on how wide spread 
the usage is might be the best route.

-- 
Tom Rini
Mentor Graphics Corporation


