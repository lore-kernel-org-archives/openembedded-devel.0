Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PexNl-0001ov-9i
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 23:17:01 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PexN8-0003Te-4m from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 14:16:22 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 17 Jan 2011 14:16:20 -0800
Received: from [172.30.80.246] ([172.30.80.246]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 17 Jan 2011 15:16:19 -0700
Message-ID: <4D34BFB2.6030605@mentor.com>
Date: Mon, 17 Jan 2011 15:16:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D34BD0A.3010206@atmel.com>
In-Reply-To: <4D34BD0A.3010206@atmel.com>
X-OriginalArrivalTime: 17 Jan 2011 22:16:20.0169 (UTC)
	FILETIME=[2AEB9B90:01CBB694]
Subject: Re: Bulding multiple U-Boot configs for one machine
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
X-List-Received-Date: Mon, 17 Jan 2011 22:17:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2011 03:04 PM, Ulf Samuelsson wrote:
> Managed to get some time over and checked in a recipe
> for u-boot-2010.12 which builds all u-boot configs
> specified in the UBOOT_MACHINES (note "S" at the end)
>
> The frecipe is available in a private branch:
> "ulf/linux-2.6.30-2011-01-16" (or similar).
>
> There is a SAM9M10 machine checked in as well as a test case.
> grep for UBOOT_MACHINES in the conf/machine directory to find out which.
>
> Note that
> UBOOT_MACHINE = "at91sam9m10g45ek_config"
>
> but
>
> UBOOT_MACHINES = "at91sam9m10g45ek_dataflash at91sam9m10g45ek_sd"
>
> I.E: No "_config" in the list.
>
> The goal of the new branch is to test booting from an SD-Card
> without any other flash in the system.
> Have tested this outside openembedded so far, but
> the current branch is still to be tested on a board.

I can see a number of other use cases for this type of functionality so 
+1 on the concept from me.

-- 
Tom Rini
Mentor Graphics Corporation


