Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 41C77773EE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 18:33:14 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3Ah7/p0xTBhe0NuLy08Brg7Gf1fdpsv+yvbD5Q0YIu?=
	=?us-ascii?q?jvd0So/mwa6ybByN2/xhgRfzUJnB7Loc0qyN4vymBzdLuM/c+Fk5M7V0Hycfjs?=
	=?us-ascii?q?sXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFRrwLxd6?=
	=?us-ascii?q?KfroEYDOkcu3y/qy+5rOaAlUmTaxe71/IRG5oAnLt8Qbj4RuJrssxhbJv3BFZ/?=
	=?us-ascii?q?lYyWR0KFyJgh3y/N2w/Jlt8yRRv/Iu6ctNWrjkcqo7ULJVEi0oP3g668P3uxbD?=
	=?us-ascii?q?SxCP5mYHXWUNjhVIGQnF4wrkUZr3ryD3q/By2CiePc3xULA0RTGv5LplRRP0lC?=
	=?us-ascii?q?sKMSMy/WfKgcJyka1bugqsqQFhzY7aYI+bN/Rwca3SctwYWWVPUd1cVzBDD46m?=
	=?us-ascii?q?c4cDE+QMMOZeooLgp1UOtxy+BQy0Ce3r0DBHmnj20rY90+s5DQzGxhYvH90TsH?=
	=?us-ascii?q?TSsdr6Kr8dX/qvy6nS0zrCbu5d1DD/6IfSaBAuu/6MXa92ccXM10YiDALFjlqK?=
	=?us-ascii?q?pozhPjOazP4BvHSc7+plTO+ijXMspQ92ojiq3Mgsi4/Ji5oJxVDE7yV5x4M1Jd?=
	=?us-ascii?q?ylSE5+e9KkF4FQty6CO4txWsMtXWdotzg/yrIdp5G0YTUFx4o6yBLFbPyHaYeI?=
	=?us-ascii?q?7xT+X+iSOTd1nHZodK+lixqv7EStyPfwW82w3VpQsyZIktnBu3YQ3BLJ8MeHUO?=
	=?us-ascii?q?Fy/kK51DaK0ADc9/9LLFgvlareN54h2rkwlocPsUjbHi/5hkH2jKiOe0Uq4Oeo?=
	=?us-ascii?q?7eXmYrTgppCCLYN0iw7+Pb4qmsy+G+s0KBQBX2+e+eik1b3j+1P2QKlSg/Ayj6?=
	=?us-ascii?q?XVqo3WKdkZq6KjBwJY1pwv5wu/AjqmyNgYmGMILFNBeBKJlYjpPFTOLej6Dfil?=
	=?us-ascii?q?mVSjijhrx+3APrL8HJrANXnDkLj7crZ56k5T0hA/wsxY55JREr0BOu78WlfttN?=
	=?us-ascii?q?zECR80Kwu0w/75B9V7yIweXHmADbGEP6zPr1CH+/sjLPSSa48Lpjn9L+Mo5/rv?=
	=?us-ascii?q?jX8ihV8dZrOl3ZwPaH+mGPRpPUCZbmHyjdgcDGgFoBcxQPbtiF2YXj4AL0q1Cq?=
	=?us-ascii?q?Uk6zc2DYirAYvOSsWhjaKM2A+/H4ZKfSZBEl2KHHLieomIVvtKbzidceF7lTlR?=
	=?us-ascii?q?d7GqTIUm4ji0vQDnzbZqGdJV4CAK/cbh3cJ86PDVmRwa9DN9C8WUlWqKSjcnzS?=
	=?us-ascii?q?szWzYq0fUn8gRGwVCZ3P0gjg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2C7DgDHhY9Y/5tjdVtdGwEBAQMBAQEJA?=
	=?us-ascii?q?QEBFgEBAQMBAQEJAQEBgyhhKl+OUJESiAmNURmBRAcfC4JCgmxKAoIiQxQBAQE?=
	=?us-ascii?q?BAQEBAQEBAWEogjMZgh0BAQEBAwEBbBcECxEEAQEBJwchBgEeCQgTBgIBAYlFA?=
	=?us-ascii?q?xkBCa1MhzINg1QBAQEBAQEBAwEBAQEBAQEBAQEehkuCBYJqglGHXQWbHDiGZ4Y?=
	=?us-ascii?q?DgQCEEYF5U4RCiWmIJoIBiFg2IYFLUIQ8HIFiPzWIMgEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2C7DgDHhY9Y/5tjdVtdGwEBAQMBAQEJAQEBFgEBAQMBAQE?=
	=?us-ascii?q?JAQEBgyhhKl+OUJESiAmNURmBRAcfC4JCgmxKAoIiQxQBAQEBAQEBAQEBAWEog?=
	=?us-ascii?q?jMZgh0BAQEBAwEBbBcECxEEAQEBJwchBgEeCQgTBgIBAYlFAxkBCa1MhzINg1Q?=
	=?us-ascii?q?BAQEBAQEBAwEBAQEBAQEBAQEehkuCBYJqglGHXQWbHDiGZ4YDgQCEEYF5U4RCi?=
	=?us-ascii?q?WmIJoIBiFg2IYFLUIQ8HIFiPzWIMgEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,312,1477954800"; d="scan'208";a="105058927"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 30 Jan 2017 19:33:13 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYGlN-000174-7V for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 19:33:13 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYGlN-0002xv-4s for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 19:33:13 +0100
To: openembedded-devel@lists.openembedded.org
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
	<8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
	<a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
	<529a997b-8ebf-28c7-5dad-1411de15dcf7@gmail.com>
	<1F119876-0AF6-4918-AE7A-0C2809A0C5C9@neuf.fr>
	<CAMKF1srK12QsoH0Xw_68U5EgJ37B2fTMPWK_SKPQ-Cwy=mh5NQ@mail.gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <000e7909-80c8-6f48-a35b-b3ccda7a82fe@igalia.com>
Date: Mon, 30 Jan 2017 19:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srK12QsoH0Xw_68U5EgJ37B2fTMPWK_SKPQ-Cwy=mh5NQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 Jan 2017 18:33:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Khem Raj,

sorry, I didn't understand your response. Do you prefer I send a new
version of the rebase patch, including Herve's fix? In that case, Herve,
I think I could use jbriance's upstream patch so you don't need to
generate it, if you all agree. I'd use the one that didn't get merged
[1], because we need the .gyp part too.

Future rebases will require changes to use GN, at that point we should
probably get rid of this custom patch. That's a problem for another day,
though :)

[1] https://codereview.chromium.org/2239833003/#ps1

Thank you all,
-- 
Jacobo Aragunde
Software Engineer at Igalia


On 29/01/17 02:13, Khem Raj wrote:
> Hi Herve
> 
> Yes please send a V2 with suggested changes.
> 
> On Sat, Jan 28, 2017 at 7:05 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
>> Hi Khem,
>>
>> Shall I generate a proper patch with the proper header? Or should Jacobo add that to his patch?
>> I'm not even sure the patch is accepted on master yet.
>>
>> Cheers,
>> Herve
>>
>>> On 28 Jan 2017, at 01:51, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>
>>>
>>> On 1/27/17 6:06 AM, Julien Brianceau (jbriance) wrote:
>>>>> -----Original Message-----
>>>>> From: openembedded-devel-bounces@lists.openembedded.org
>>>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>>>> Khem Raj
>>>>> Sent: vendredi 27 janvier 2017 02:47
>>>>> To: openembedded-devel@lists.openembedded.org
>>>>> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update to
>>>>> 53.0.2785.14
>>>>>
>>>>>
>>>>>
>>>>>> On 1/25/17 9:50 PM, Herve Jourdain wrote:
>>>>>> Hi Jacob,
>>>>>>
>>>>>> I've been able to compile chromium-wayland 53.0.2785.14 on
>>>>> RaspberryPi, with Wayland only (no X11), BUT I had to add an additional
>>>>> patch for it to work, or else I get an error in
>>>>> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
>>>>>> I'm using VC4, which has a DRM/KMS interface (it seems that DRM
>>>>> interface is required by ozone-wayland), but this patch seems to not be
>>>>> related to RaspberryPi itself.
>>>>>> Basically, it seems that USE_XKBCOMMON is not defined when compiling
>>>>> keycodes.
>>>>>>
>>>>>> Is it something that you saw as well? Or do you have a different
>>>>> setting/experience?
>>>>>>
>>>>>> Just for reference, here is the patch I need (right now, I'm
>>>>> triggering it from meta-raspberrypi, but I believe it may be needed in
>>>>> meta-browser).
>>>>>>
>>>>>> --- a/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>> 19:12:01.767271256 +0800
>>>>>> +++ b/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>> 19:12:11.503048216 +0800
>>>>>> @@ -21,6 +21,9 @@
>>>>>>         'scoped_xkb.h',
>>>>>>         'xkb_keysym.h',
>>>>>>       ],
>>>>>> +      'defines': [
>>>>>> +        'USE_XKBCOMMON',
>>>>>
>>>>> This seems fine to me. It should also be proposed upstream as well I
>>>>> think.
>>>>>
>>>>
>>>> For the record, I've already tried to upstream a similar change (see Patch Set 1 of review https://codereview.chromium.org/2239833003/), but only the GN part has been accepted as gyp support has been removed in Chromium 54.
>>>>
>>>
>>> thats we should make a note of this in patch header. We will have to
>>> remove it or replace it as well when we upgrade chromium.
>>>> Julien
>>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



