Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id 1906477442
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 15:05:23 +0000 (UTC)
Received: from [192.168.1.13] (114-44-146-49.dynamic.hinet.net [114.44.146.49])
	by msfrf2604.sfr.fr (SMTP Server) with ESMTP id EFA1A1C0008BC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 16:05:22 +0100 (CET)
Received: from [192.168.1.13] (114-44-146-49.dynamic.hinet.net
	[114.44.146.49])	(using TLSv1
	with cipher ECDHE-RSA-AES256-SHA (256/256 bits))	(No client certificate
	requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2604.sfr.fr (SMTP Server) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 16:05:22 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
Mime-Version: 1.0 (1.0)
Date: Sat, 28 Jan 2017 23:05:17 +0800
Message-Id: <1F119876-0AF6-4918-AE7A-0C2809A0C5C9@neuf.fr>
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
	<8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
	<a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
	<529a997b-8ebf-28c7-5dad-1411de15dcf7@gmail.com>
In-Reply-To: <529a997b-8ebf-28c7-5dad-1411de15dcf7@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: iPhone Mail (14C92)
X-sfr-mailing: LEGIT
Subject: Re: ***SPAM*** Re: [meta-browser][PATCH v2] chromium-wayland: update to 53.0.2785.14
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
X-List-Received-Date: Sat, 28 Jan 2017 15:05:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Shall I generate a proper patch with the proper header? Or should Jacobo add=
 that to his patch?
I'm not even sure the patch is accepted on master yet.

Cheers,
Herve

> On 28 Jan 2017, at 01:51, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>=20
> On 1/27/17 6:06 AM, Julien Brianceau (jbriance) wrote:
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org
>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>> Khem Raj
>>> Sent: vendredi 27 janvier 2017 02:47
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update to
>>> 53.0.2785.14
>>>=20
>>>=20
>>>=20
>>>> On 1/25/17 9:50 PM, Herve Jourdain wrote:
>>>> Hi Jacob,
>>>>=20
>>>> I've been able to compile chromium-wayland 53.0.2785.14 on
>>> RaspberryPi, with Wayland only (no X11), BUT I had to add an additional
>>> patch for it to work, or else I get an error in
>>> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
>>>> I'm using VC4, which has a DRM/KMS interface (it seems that DRM
>>> interface is required by ozone-wayland), but this patch seems to not be
>>> related to RaspberryPi itself.
>>>> Basically, it seems that USE_XKBCOMMON is not defined when compiling
>>> keycodes.
>>>>=20
>>>> Is it something that you saw as well? Or do you have a different
>>> setting/experience?
>>>>=20
>>>> Just for reference, here is the patch I need (right now, I'm
>>> triggering it from meta-raspberrypi, but I believe it may be needed in
>>> meta-browser).
>>>>=20
>>>> --- a/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>> 19:12:01.767271256 +0800
>>>> +++ b/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>> 19:12:11.503048216 +0800
>>>> @@ -21,6 +21,9 @@
>>>>         'scoped_xkb.h',
>>>>         'xkb_keysym.h',
>>>>       ],
>>>> +      'defines': [
>>>> +        'USE_XKBCOMMON',
>>>=20
>>> This seems fine to me. It should also be proposed upstream as well I
>>> think.
>>>=20
>>=20
>> For the record, I've already tried to upstream a similar change (see Patc=
h Set 1 of review https://codereview.chromium.org/2239833003/), but only the=
 GN part has been accepted as gyp support has been removed in Chromium 54.
>>=20
>=20
> thats we should make a note of this in patch header. We will have to
> remove it or replace it as well when we upgrade chromium.
>> Julien
>>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


