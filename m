Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB366EADD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 06:32:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1E6WsiD020154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 22:32:54 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 13 Feb 2014 22:32:53 -0800
Message-ID: <52FDB894.5090403@windriver.com>
Date: Fri, 14 Feb 2014 14:32:52 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>	<CAP9ODKr5h8uX9yp+b9n8MpniGGosZ+MW_YEk9dKPR8QHj-XO7A@mail.gmail.com>	<52FC361E.4030708@windriver.com>	<CAP9ODKoWiCTHvBbDaupueGM5buzvGTG6fYSrZ2+eTipmpDMVyg@mail.gmail.com>
	<20140214032954.GL23405@deserted.net>
In-Reply-To: <20140214032954.GL23405@deserted.net>
Subject: Re: [meta-networking] [PATCH] traceroute: filter-out patches dir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2014 06:32:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/14/2014 11:29 AM, Joe MacDonald wrote:
> [Re: [oe] [meta-networking] [PATCH] traceroute: filter-out patches dir] On 14.02.13 (Thu 08:40) Otavio Salvador wrote:
>
>> On Thu, Feb 13, 2014 at 1:03 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>
>>>
>>> On 01/22/2014 10:21 PM, Otavio Salvador wrote:
>>>>
>>>> On Mon, Jan 20, 2014 at 10:52 AM, Robert Yang <liezhi.yang@windriver.com>
>>>> wrote:
>>>>>
>>>>> The $(subdirs) contains all the dirs under the ${B}, and this one:
>>>>>
>>>>> do_unpack[cleandirs] = "${S}/patches"
>>>>>
>>>>> will create a "patches" dir, then there will be compile errors, filter
>>>>> out the patches will fix the problem.
>>>>>
>>>>> Note: poky doesn't have this problem since it separates the ${S} and
>>>>> ${B}
>>>>>
>>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>>
>>>>
>>>> Couldn't we change it for OE-Core as well? So we avoid having to patch
>>>> the build system.
>>>>
>>>
>>> I'm sorry, I don't quite understand what do you mean, this patch didn't
>>> change the build system, it changed the Make.rules.
>>
>>
>> To be sincere I didn't understand my comment as well ...  don't recall
>> what I thought... I'd say to ignore it.
>
> Oh.  Heh.  I thought you were proposing a change to oe-core's build
> approach that would mean we didn't need to have a patch here to
> traceroute to separate $(B) and $(S).  At least that's what I got from
> it based on the commit log.  I'm still a bit confused about what's so
> different about traceroute's build system that it needs special handling

traceroute uses this:

EXEDIRS := $(filter-out $(INCLUDEDIRS) $(LIBDIRS) $(MODDIRS), $(subdirs))

the "patches" dir will be included in EXEDIRS which will cause errors, so
we need filter out it.

// Robert


> ...
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

