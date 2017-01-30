Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id DE47F773FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 19:04:45 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AXnpyIBNHpGwm+oiK8zQl6mtUPXoX/o7sNwtQ0KIM?=
	=?us-ascii?q?zox0Ivn/rarrMEGX3/hxlliBBdydsKMYzbSN+Pm6ACQp2tWoiDg6aptCVhsI24?=
	=?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
	=?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9GiTe5br5+NhS7oAveusULn4duN7s6xwfUrHdPZ+?=
	=?us-ascii?q?lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2465MvwtRne?=
	=?us-ascii?q?VgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVzmu87tnRRn1gy?=
	=?us-ascii?q?oBKjU38nzYitZogaxGvhyhqRxxzY3abo6bO/VxfL/Sc9wBSGpdXctcTTBNDp+y?=
	=?us-ascii?q?YoYNCecKIOZWr5P6p1sLtRawAROjC//oyjBTgX/5xbE30/47HgHJwQwgGc8Bv2?=
	=?us-ascii?q?rMo9vvLqASS/66zajVxjjEbfNZwy3955LHchA8p/GDQKx/fNHQyUkgDQzFilSQ?=
	=?us-ascii?q?ppb/MzyJ0eQNtnGW4ux9XuyhjG4nrht+ojmpxso0lobJhpgVylfB9SV43YY1IM?=
	=?us-ascii?q?e0SElhYd6rFpZbqiKUN5NuT84mXm1kojs2xqAEtJKheCUHzI4rywPfZvGHdYWD?=
	=?us-ascii?q?/wjtW/yLIThigXJoYLe/hxGv/ke+0uD8Tcy00EpSripCj9nMqmgB1xzN5ciDTf?=
	=?us-ascii?q?tw5kmh1iyJ1wHS6+FEJ147mbDaK54u2LEwkpsTvl7ZEiDqn0X2ibeadkQi+ue2?=
	=?us-ascii?q?9+TqerHrqoKGO4Nplw3zML4il8i7DOgiLwQDX2iW9fy51LL5/E35RLtKjucxkq?=
	=?us-ascii?q?ncqJ3aJ94UprSjDA9az4Yj7QuwACm93dQZknkINlZFeBOdgITzJ17OJ/X4Ae+l?=
	=?us-ascii?q?g1uwiDdr2+zGPrr5D5XKNnjMjrHhcqh460FH1gU80M1Q6IxJBb0YPf38RFHxu8?=
	=?us-ascii?q?LcDhIiNwy0wv3nCMlm1o8EXmKPGrGWMKXMvl+N/e0gPfSDa5ILtzngMfQl4OTu?=
	=?us-ascii?q?jXBq0WMaKK6x0J0abXq1EvhrLwCVbGThhv8FEHwWpUw5VOHshViIXDJfanr0WL?=
	=?us-ascii?q?gztR8hD4fzL47IQYqqt5Wb1SimGJFbUVjHEF2eWSPqfp+NVOoKZC+6I8Bolj0N?=
	=?us-ascii?q?E7OmTtlyhlmVqAbmxu8/faLv8SoCuMe72Q=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2C6FwD/jY9Y/5tjdVtdhARhKl+DVYp7k?=
	=?us-ascii?q?RKICY1RGYFEBx8LgkKDNgKCI0MUAQEBAQEBAQEBAQFhKIIzGYIdAQEBAQMBIg8?=
	=?us-ascii?q?BUgQLEQQBAQECAiMDAgIhBx4JCBMGAgEBiUUDGQEJqyGCJYczDYNUAQEBAQEFA?=
	=?us-ascii?q?QEBAQEBAQEggQuFQIIFgWGBCYJRhH6CXwWbHDiGZ4YDgQCEEYF5hRWJaYgmggG?=
	=?us-ascii?q?IWDYhgUuFDByBYj81iDIBAQE?=
X-IPAS-Result: =?us-ascii?q?A2C6FwD/jY9Y/5tjdVtdhARhKl+DVYp7kRKICY1RGYFEBx8?=
	=?us-ascii?q?LgkKDNgKCI0MUAQEBAQEBAQEBAQFhKIIzGYIdAQEBAQMBIg8BUgQLEQQBAQECA?=
	=?us-ascii?q?iMDAgIhBx4JCBMGAgEBiUUDGQEJqyGCJYczDYNUAQEBAQEFAQEBAQEBAQEggQu?=
	=?us-ascii?q?FQIIFgWGBCYJRhH6CXwWbHDiGZ4YDgQCEEYF5hRWJaYgmggGIWDYhgUuFDByBY?=
	=?us-ascii?q?j81iDIBAQE?=
X-IronPort-AV: E=Sophos;i="5.33,312,1477954800"; d="scan'208";a="105065899"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 30 Jan 2017 20:04:29 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYHFd-0001bp-Gk for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 20:04:29 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYHFd-0001tA-EC for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 20:04:29 +0100
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
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <71f15770-9aad-30aa-006c-63efb124e531@igalia.com>
Date: Mon, 30 Jan 2017 20:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soJMZ+xtn8juW8n-MiKEB5zhTiWfPGAPtS6qs-sSUs6nA@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 Jan 2017 19:04:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 30/01/17 19:36, Khem Raj wrote:
> On Mon, Jan 30, 2017 at 10:33 AM, Jacobo Aragunde Pérez
> <jaragunde@igalia.com> wrote:
>> Hi Khem Raj,
>>
>> sorry, I didn't understand your response. Do you prefer I send a new
>> version of the rebase patch, including Herve's fix? In that case, Herve,
>> I think I could use jbriance's upstream patch so you don't need to
>> generate it, if you all agree. I'd use the one that didn't get merged
>> [1], because we need the .gyp part too.
>>
>> Future rebases will require changes to use GN, at that point we should
>> probably get rid of this custom patch. That's a problem for another day,
>> though :)
> 
> I was thinking both of Herve and you will send your patches
> independently after rework but if you can integrate both that would be
> wonderful.
> 

I definitely can, it's easy enough by picking Julien's diff from
Chromium code review. I've updated my patch and just triggered a build
to make sure everything is in place, it will compile overnight. I just
don't want to "steal" Herve's idea, so I'll wait for his blessing :)

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

>>
>> [1] https://codereview.chromium.org/2239833003/#ps1
>>
>> Thank you all,
>> --
>> Jacobo Aragunde
>> Software Engineer at Igalia
>>
>>
>> On 29/01/17 02:13, Khem Raj wrote:
>>> Hi Herve
>>>
>>> Yes please send a V2 with suggested changes.
>>>
>>> On Sat, Jan 28, 2017 at 7:05 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
>>>> Hi Khem,
>>>>
>>>> Shall I generate a proper patch with the proper header? Or should Jacobo add that to his patch?
>>>> I'm not even sure the patch is accepted on master yet.
>>>>
>>>> Cheers,
>>>> Herve
>>>>
>>>>> On 28 Jan 2017, at 01:51, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 1/27/17 6:06 AM, Julien Brianceau (jbriance) wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: openembedded-devel-bounces@lists.openembedded.org
>>>>>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>>>>>> Khem Raj
>>>>>>> Sent: vendredi 27 janvier 2017 02:47
>>>>>>> To: openembedded-devel@lists.openembedded.org
>>>>>>> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update to
>>>>>>> 53.0.2785.14
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> On 1/25/17 9:50 PM, Herve Jourdain wrote:
>>>>>>>> Hi Jacob,
>>>>>>>>
>>>>>>>> I've been able to compile chromium-wayland 53.0.2785.14 on
>>>>>>> RaspberryPi, with Wayland only (no X11), BUT I had to add an additional
>>>>>>> patch for it to work, or else I get an error in
>>>>>>> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
>>>>>>>> I'm using VC4, which has a DRM/KMS interface (it seems that DRM
>>>>>>> interface is required by ozone-wayland), but this patch seems to not be
>>>>>>> related to RaspberryPi itself.
>>>>>>>> Basically, it seems that USE_XKBCOMMON is not defined when compiling
>>>>>>> keycodes.
>>>>>>>>
>>>>>>>> Is it something that you saw as well? Or do you have a different
>>>>>>> setting/experience?
>>>>>>>>
>>>>>>>> Just for reference, here is the patch I need (right now, I'm
>>>>>>> triggering it from meta-raspberrypi, but I believe it may be needed in
>>>>>>> meta-browser).
>>>>>>>>
>>>>>>>> --- a/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>>>> 19:12:01.767271256 +0800
>>>>>>>> +++ b/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>>>> 19:12:11.503048216 +0800
>>>>>>>> @@ -21,6 +21,9 @@
>>>>>>>>         'scoped_xkb.h',
>>>>>>>>         'xkb_keysym.h',
>>>>>>>>       ],
>>>>>>>> +      'defines': [
>>>>>>>> +        'USE_XKBCOMMON',
>>>>>>>
>>>>>>> This seems fine to me. It should also be proposed upstream as well I
>>>>>>> think.
>>>>>>>
>>>>>>
>>>>>> For the record, I've already tried to upstream a similar change (see Patch Set 1 of review https://codereview.chromium.org/2239833003/), but only the GN part has been accepted as gyp support has been removed in Chromium 54.
>>>>>>
>>>>>
>>>>> thats we should make a note of this in patch header. We will have to
>>>>> remove it or replace it as well when we upgrade chromium.
>>>>>> Julien
>>>>>>

