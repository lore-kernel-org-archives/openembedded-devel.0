Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id A7E3771C5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 18:24:55 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AUIb8JRaSkBOg8mekIqQl5ID/LSx+4OfEezUN459i?=
	=?us-ascii?q?sYplN5qZr8m+bnLW6fgltlLVR4KTs6sC0LuK9f69EjVZud6oizMrSNR0TRgLiM?=
	=?us-ascii?q?EbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ/iOgVr?=
	=?us-ascii?q?O+/7BpDdj9it1+C15pbffxhEiCCzbL52Ixi6twTcu8kZjYd/N6o91gbCr2dVde?=
	=?us-ascii?q?hR2W5mP0+YkQzm5se38p5j8iBQtOwk+sVdT6j0fLk2QKJBAjg+PG87+MPktR/Y?=
	=?us-ascii?q?TQuS/XQcSXkZkgBJAwfe8h73WIr6vzbguep83CmaOtD2TawxVD+/4apnVAPkhS?=
	=?us-ascii?q?EaPDM/7WrZiNF/jLhDrRy8uRJ/zY7aboKbOvVwcazSf88VS2VaU8ZNVCFMGJ+w?=
	=?us-ascii?q?Y5cBAuQdO+tTsonzp0EJrRu7HQSiAPngxSNPhnDt2q01y/gsERvc0wwvAtIOtm?=
	=?us-ascii?q?nbo8vtO6kIS+e11rfHzDTeZP5R2zfy8pLIfQouofGRW7J/bNTexFIuFwPKlFqQ?=
	=?us-ascii?q?rY3lMCmP2usRtGib6vNtWOSygGAprAFxpyKgxsYqioTRmo0VykrE9SJ8wIY0ON?=
	=?us-ascii?q?24TVR3Ydm+EJtfsSyRKoh4Qts6TmxspSo20KAKtYO5cSQQzJkqwwTTZ+GHfoWI?=
	=?us-ascii?q?5B/oSfyfLi1ihH1/fbKynxOy8U+9xeLiTsS0y1NKrjZdktnLq3ANywTf6siZRf?=
	=?us-ascii?q?t5+UeswTiP2BrV6uBFIEA0k7TUJ4Qgwr4/jJUTtUXDETXslErqi6+Wc10o+umu?=
	=?us-ascii?q?6+v5frXrvpuRO5Juhg3jL6gjmNazDOA8PwQUQmSW+eSx2KXm/ULjQbVKivM2kr?=
	=?us-ascii?q?PesJDfPckbpLS2AxVP3YYs9ha/CSqp38oDkHkGI1JKYhaHj4nzNF3UPP/4CvK/?=
	=?us-ascii?q?j0y2kDh33/DGIqHhApLVI3jEiLfuY7B95FBZyAUo099Q+o9bBa8cL/7qR0D+qs?=
	=?us-ascii?q?LYAQE9MwGvx+bnCc591p8FWW6VBa+ZKL3dsVmW6eIqOOaDepIatyvjJPc4/fLu?=
	=?us-ascii?q?imU5mVBONZWuiJwPZXa1G/5rL0mUbT/gj8kMFU8OvxEiV6rtkFCEXDtZanq+Uq?=
	=?us-ascii?q?564Ss0W6y8CoKWZImmh7aG6w6hF5JLYGxLPWgNC3r6P9GGUu0FZz+ULsJJkzMN?=
	=?us-ascii?q?UbmoDYQm0Ef950fB17N7I7+MqWUjvpX52Y0t6g=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AUFgDm1ZBY/5tjdVtdHAYMGQYMgyphK?=
	=?us-ascii?q?l+DVop7kHYfiAqNKSgZgUUHHwuCQoJsSgKCNUAXAQEBAQEBAQEBAQFhKIIzGYI?=
	=?us-ascii?q?dAQEBAQMBATABOxcECxEEAQEBBCMFAiEGAR4JCBMGAgEBF4k7AxkBCY5NnUgIg?=
	=?us-ascii?q?iOHPQ2DaAEBAQEBBQEBAQEBAQEBAR+BB4VEggUIgVmBCYJRhEc2gmMFmx84hme?=
	=?us-ascii?q?GA4EAhBSBeVOEQolqiCaCAYhYIQE1gUtQhDwcgWI/NYgqAQEB?=
X-IPAS-Result: =?us-ascii?q?A2AUFgDm1ZBY/5tjdVtdHAYMGQYMgyphKl+DVop7kHYfiAq?=
	=?us-ascii?q?NKSgZgUUHHwuCQoJsSgKCNUAXAQEBAQEBAQEBAQFhKIIzGYIdAQEBAQMBATABO?=
	=?us-ascii?q?xcECxEEAQEBBCMFAiEGAR4JCBMGAgEBF4k7AxkBCY5NnUgIgiOHPQ2DaAEBAQE?=
	=?us-ascii?q?BBQEBAQEBAQEBAR+BB4VEggUIgVmBCYJRhEc2gmMFmx84hmeGA4EAhBSBeVOEQ?=
	=?us-ascii?q?olqiCaCAYhYIQE1gUtQhDwcgWI/NYgqAQEB?=
X-IronPort-AV: E=Sophos;i="5.33,315,1477954800"; d="scan'208";a="234698941"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 31 Jan 2017 19:24:55 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYd6t-0002CF-5b for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 19:24:55 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYd6t-0000me-2G for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 19:24:55 +0100
To: openembedded-devel@lists.openembedded.org
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
	<8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
	<a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
	<529a997b-8ebf-28c7-5dad-1411de15dcf7@gmail.com>
	<1F119876-0AF6-4918-AE7A-0C2809A0C5C9@neuf.fr>
	<CAMKF1srK12QsoH0Xw_68U5EgJ37B2fTMPWK_SKPQ-Cwy=mh5NQ@mail.gmail.com>
	<000e7909-80c8-6f48-a35b-b3ccda7a82fe@igalia.com>
	<CAMKF1soJMZ+xtn8juW8n-MiKEB5zhTiWfPGAPtS6qs-sSUs6nA@mail.gmail.com>
	<71f15770-9aad-30aa-006c-63efb124e531@igalia.com>
	<120E29E8-A60B-4CC3-8B2B-F22C2340D724@neuf.fr>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <02a1d637-8af8-3246-c78d-11701e9721c2@igalia.com>
Date: Tue, 31 Jan 2017 19:24:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <120E29E8-A60B-4CC3-8B2B-F22C2340D724@neuf.fr>
Subject: Re: [meta-browser][PATCH v2] chromium-wayland: update to 53.0.2785.14
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2017 18:24:57 -0000
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit

Hi again,

Otavio already merged the v2 of the update patch (thanks!), so I'll send
the change we are discussing as a separate patch.

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia


On 31/01/17 09:56, Herve Jourdain wrote:
> Hi Jacobo, Khem,
> 
> I'm traveling, so not able to access my build system for a few more days.
> I didn't check Julien's patch yet, so as long as it does at least what mine does, it should be OK for me.
> I'm open to whatever solution, whether I regenerate a patch or Jacobo integrates it in his.
> One thing I will do, though, is test the resulting recipe on my build platform, to see if it's still working in my configuration.
> 
> Cheers,
> Herve
> 
>> On 31 Jan 2017, at 03:04, Jacobo Aragunde P¨¦rez <jaragunde@igalia.com> wrote:
>>
>>> On 30/01/17 19:36, Khem Raj wrote:
>>> On Mon, Jan 30, 2017 at 10:33 AM, Jacobo Aragunde P¨¦rez
>>> <jaragunde@igalia.com> wrote:
>>>> Hi Khem Raj,
>>>>
>>>> sorry, I didn't understand your response. Do you prefer I send a new
>>>> version of the rebase patch, including Herve's fix? In that case, Herve,
>>>> I think I could use jbriance's upstream patch so you don't need to
>>>> generate it, if you all agree. I'd use the one that didn't get merged
>>>> [1], because we need the .gyp part too.
>>>>
>>>> Future rebases will require changes to use GN, at that point we should
>>>> probably get rid of this custom patch. That's a problem for another day,
>>>> though :)
>>>
>>> I was thinking both of Herve and you will send your patches
>>> independently after rework but if you can integrate both that would be
>>> wonderful.
>>>
>>
>> I definitely can, it's easy enough by picking Julien's diff from
>> Chromium code review. I've updated my patch and just triggered a build
>> to make sure everything is in place, it will compile overnight. I just
>> don't want to "steal" Herve's idea, so I'll wait for his blessing :)
>>
>> Best,
>> -- 
>> Jacobo Aragunde
>> Software Engineer at Igalia
>>
>>>>
>>>> [1] https://codereview.chromium.org/2239833003/#ps1
>>>>
>>>> Thank you all,
>>>> --
>>>> Jacobo Aragunde
>>>> Software Engineer at Igalia
>>>>
>>>>
>>>>> On 29/01/17 02:13, Khem Raj wrote:
>>>>> Hi Herve
>>>>>
>>>>> Yes please send a V2 with suggested changes.
>>>>>
>>>>>> On Sat, Jan 28, 2017 at 7:05 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
>>>>>> Hi Khem,
>>>>>>
>>>>>> Shall I generate a proper patch with the proper header? Or should Jacobo add that to his patch?
>>>>>> I'm not even sure the patch is accepted on master yet.
>>>>>>
>>>>>> Cheers,
>>>>>> Herve
>>>>>>
>>>>>>> On 28 Jan 2017, at 01:51, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 1/27/17 6:06 AM, Julien Brianceau (jbriance) wrote:
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: openembedded-devel-bounces@lists.openembedded.org
>>>>>>>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>>>>>>>> Khem Raj
>>>>>>>>> Sent: vendredi 27 janvier 2017 02:47
>>>>>>>>> To: openembedded-devel@lists.openembedded.org
>>>>>>>>> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update to
>>>>>>>>> 53.0.2785.14
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> On 1/25/17 9:50 PM, Herve Jourdain wrote:
>>>>>>>>>> Hi Jacob,
>>>>>>>>>>
>>>>>>>>>> I've been able to compile chromium-wayland 53.0.2785.14 on
>>>>>>>>> RaspberryPi, with Wayland only (no X11), BUT I had to add an additional
>>>>>>>>> patch for it to work, or else I get an error in
>>>>>>>>> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
>>>>>>>>>> I'm using VC4, which has a DRM/KMS interface (it seems that DRM
>>>>>>>>> interface is required by ozone-wayland), but this patch seems to not be
>>>>>>>>> related to RaspberryPi itself.
>>>>>>>>>> Basically, it seems that USE_XKBCOMMON is not defined when compiling
>>>>>>>>> keycodes.
>>>>>>>>>>
>>>>>>>>>> Is it something that you saw as well? Or do you have a different
>>>>>>>>> setting/experience?
>>>>>>>>>>
>>>>>>>>>> Just for reference, here is the patch I need (right now, I'm
>>>>>>>>> triggering it from meta-raspberrypi, but I believe it may be needed in
>>>>>>>>> meta-browser).
>>>>>>>>>>
>>>>>>>>>> --- a/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>>>>>> 19:12:01.767271256 +0800
>>>>>>>>>> +++ b/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>>>>>> 19:12:11.503048216 +0800
>>>>>>>>>> @@ -21,6 +21,9 @@
>>>>>>>>>>        'scoped_xkb.h',
>>>>>>>>>>        'xkb_keysym.h',
>>>>>>>>>>      ],
>>>>>>>>>> +      'defines': [
>>>>>>>>>> +        'USE_XKBCOMMON',
>>>>>>>>>
>>>>>>>>> This seems fine to me. It should also be proposed upstream as well I
>>>>>>>>> think.
>>>>>>>>>
>>>>>>>>
>>>>>>>> For the record, I've already tried to upstream a similar change (see Patch Set 1 of review https://codereview.chromium.org/2239833003/), but only the GN part has been accepted as gyp support has been removed in Chromium 54.
>>>>>>>>
>>>>>>>
>>>>>>> thats we should make a note of this in patch header. We will have to
>>>>>>> remove it or replace it as well when we upgrade chromium.
>>>>>>>> Julien
>>>>>>>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 



