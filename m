Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id BC9A071E53
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 08:57:06 +0000 (UTC)
Received: from [10.119.82.161] (42-72-133-22.EMOME-IP.hinet.net [42.72.133.22])
	by msfrf2623.sfr.fr (SMTP Server) with ESMTP id 55F5C1C000C32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 09:57:05 +0100 (CET)
Received: from [10.119.82.161] (42-72-133-22.EMOME-IP.hinet.net
	[42.72.133.22])	(using TLSv1
	with cipher ECDHE-RSA-AES256-SHA (256/256 bits))	(No client certificate
	requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2623.sfr.fr (SMTP Server) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 09:57:04 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
Mime-Version: 1.0 (1.0)
Date: Tue, 31 Jan 2017 16:56:56 +0800
Message-Id: <120E29E8-A60B-4CC3-8B2B-F22C2340D724@neuf.fr>
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
In-Reply-To: <71f15770-9aad-30aa-006c-63efb124e531@igalia.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: iPhone Mail (14C92)
X-sfr-mailing: LEGIT
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
X-List-Received-Date: Tue, 31 Jan 2017 08:57:09 -0000
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: quoted-printable

Hi Jacobo, Khem,

I'm traveling, so not able to access my build system for a few more days.
I didn't check Julien's patch yet, so as long as it does at least what mine d=
oes, it should be OK for me.
I'm open to whatever solution, whether I regenerate a patch or Jacobo integr=
ates it in his.
One thing I will do, though, is test the resulting recipe on my build platfo=
rm, to see if it's still working in my configuration.

Cheers,
Herve

> On 31 Jan 2017, at 03:04, Jacobo Aragunde P=A8=A6rez <jaragunde@igalia.com=
> wrote:
>=20
>> On 30/01/17 19:36, Khem Raj wrote:
>> On Mon, Jan 30, 2017 at 10:33 AM, Jacobo Aragunde P=A8=A6rez
>> <jaragunde@igalia.com> wrote:
>>> Hi Khem Raj,
>>>=20
>>> sorry, I didn't understand your response. Do you prefer I send a new
>>> version of the rebase patch, including Herve's fix? In that case, Herve,=

>>> I think I could use jbriance's upstream patch so you don't need to
>>> generate it, if you all agree. I'd use the one that didn't get merged
>>> [1], because we need the .gyp part too.
>>>=20
>>> Future rebases will require changes to use GN, at that point we should
>>> probably get rid of this custom patch. That's a problem for another day,=

>>> though :)
>>=20
>> I was thinking both of Herve and you will send your patches
>> independently after rework but if you can integrate both that would be
>> wonderful.
>>=20
>=20
> I definitely can, it's easy enough by picking Julien's diff from
> Chromium code review. I've updated my patch and just triggered a build
> to make sure everything is in place, it will compile overnight. I just
> don't want to "steal" Herve's idea, so I'll wait for his blessing :)
>=20
> Best,
> --=20
> Jacobo Aragunde
> Software Engineer at Igalia
>=20
>>>=20
>>> [1] https://codereview.chromium.org/2239833003/#ps1
>>>=20
>>> Thank you all,
>>> --
>>> Jacobo Aragunde
>>> Software Engineer at Igalia
>>>=20
>>>=20
>>>> On 29/01/17 02:13, Khem Raj wrote:
>>>> Hi Herve
>>>>=20
>>>> Yes please send a V2 with suggested changes.
>>>>=20
>>>>> On Sat, Jan 28, 2017 at 7:05 AM, Herve Jourdain <herve.jourdain@neuf.f=
r> wrote:
>>>>> Hi Khem,
>>>>>=20
>>>>> Shall I generate a proper patch with the proper header? Or should Jaco=
bo add that to his patch?
>>>>> I'm not even sure the patch is accepted on master yet.
>>>>>=20
>>>>> Cheers,
>>>>> Herve
>>>>>=20
>>>>>> On 28 Jan 2017, at 01:51, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>> On 1/27/17 6:06 AM, Julien Brianceau (jbriance) wrote:
>>>>>>>> -----Original Message-----
>>>>>>>> From: openembedded-devel-bounces@lists.openembedded.org
>>>>>>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behal=
f Of
>>>>>>>> Khem Raj
>>>>>>>> Sent: vendredi 27 janvier 2017 02:47
>>>>>>>> To: openembedded-devel@lists.openembedded.org
>>>>>>>> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update=
 to
>>>>>>>> 53.0.2785.14
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> On 1/25/17 9:50 PM, Herve Jourdain wrote:
>>>>>>>>> Hi Jacob,
>>>>>>>>>=20
>>>>>>>>> I've been able to compile chromium-wayland 53.0.2785.14 on
>>>>>>>> RaspberryPi, with Wayland only (no X11), BUT I had to add an additi=
onal
>>>>>>>> patch for it to work, or else I get an error in
>>>>>>>> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
>>>>>>>>> I'm using VC4, which has a DRM/KMS interface (it seems that DRM
>>>>>>>> interface is required by ozone-wayland), but this patch seems to no=
t be
>>>>>>>> related to RaspberryPi itself.
>>>>>>>>> Basically, it seems that USE_XKBCOMMON is not defined when compili=
ng
>>>>>>>> keycodes.
>>>>>>>>>=20
>>>>>>>>> Is it something that you saw as well? Or do you have a different
>>>>>>>> setting/experience?
>>>>>>>>>=20
>>>>>>>>> Just for reference, here is the patch I need (right now, I'm
>>>>>>>> triggering it from meta-raspberrypi, but I believe it may be needed=
 in
>>>>>>>> meta-browser).
>>>>>>>>>=20
>>>>>>>>> --- a/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>>>>> 19:12:01.767271256 +0800
>>>>>>>>> +++ b/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>>>>> 19:12:11.503048216 +0800
>>>>>>>>> @@ -21,6 +21,9 @@
>>>>>>>>>        'scoped_xkb.h',
>>>>>>>>>        'xkb_keysym.h',
>>>>>>>>>      ],
>>>>>>>>> +      'defines': [
>>>>>>>>> +        'USE_XKBCOMMON',
>>>>>>>>=20
>>>>>>>> This seems fine to me. It should also be proposed upstream as well I=

>>>>>>>> think.
>>>>>>>>=20
>>>>>>>=20
>>>>>>> For the record, I've already tried to upstream a similar change (see=
 Patch Set 1 of review https://codereview.chromium.org/2239833003/), but onl=
y the GN part has been accepted as gyp support has been removed in Chromium 5=
4.
>>>>>>>=20
>>>>>>=20
>>>>>> thats we should make a note of this in patch header. We will have to
>>>>>> remove it or replace it as well when we upgrade chromium.
>>>>>>> Julien
>>>>>>>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


