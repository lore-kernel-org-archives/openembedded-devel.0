Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbZOU-0008Al-2Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 14:26:58 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE0025BD05 for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 14:10:25 +0200
Message-ID: <4A8402B0.1000308@atmel.com>
Date: Thu, 13 Aug 2009 14:10:24 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A83BD15.7070006@atmel.com>
	<h60je5$992$1@ger.gmane.org>	<4A83E5FC.2020002@atmel.com>
	<h60t34$5kl$1@ger.gmane.org>
In-Reply-To: <h60t34$5kl$1@ger.gmane.org>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 12:26:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi skrev:
> On 13-08-09 12:07, Ulf Samuelsson wrote:
>> Koen Kooi skrev:
>>> On 13-08-09 09:13, Ulf Samuelsson wrote:
>>>> Since I will need to test multiple boards,
>>>> I decided to write some scripts which I will
>>>> check in later today in origin/ulf/linux-2.6.30.2
>>>>
>>>> I generated a "MAKEALL" script which will
>>>> source a file "board_list.sh" with board build commands
>>>>
>>>> <SOF>
>>>> build_board    sam9263dfc    x11-gpe-image
>>>> build_board    sam9g45ek    opie-image
>>>> build_board    sam9g10df    x11-gpe-image
>>>> build_board    sam9g20dfc    console-image
>>>> build_board    sam9260dfc    console-image
>>>> build_board    sam9261df    x11-image
>>>> build_board    sam9xedfc    console-image
>>>> <EOF>
>>>
>>> You do know that you can do that with MACHINE=foo bitbake bar, right?
>>>
>>
>> Didn't try that.
>> I assume this means that the cross compiler is not rebuilt,
> 
> Unless you poked at the gcc recipes, no, it won't get rebuilt.
> 
>> Is the root fs assembled from ipks then?
> 
> if you use rootfs_ipk.bbclass, yes.
> 
> Note that the official angstrom buildguide has mentioned that for years:
> http://www.angstrom-distribution.org/building-angstrom
> 

Thanks for helping out, but it does not work as expected.

I first create a local.conf for the at91sam9261df
and bitbake x11-image.
Then I do "MACHINE=at91sam9g20dfc bitbake console-image".
A console-image is built,but for the at91sam9261df,
which is stored in "tmp/deploy/glibc/images/at91sam9261df"

The bitbake does not generate u-boot/kernel or at91bootstrap
for the at91sam9260dfc


I believe that most at91 chips can use the same file system,
so it makes sense to do it this way anyway.

I assume that the at91sam9261df setup is used for the console-image.
There could be a few cases where this is ineffient or simply wrong.




> regards,
> 
> Koen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



