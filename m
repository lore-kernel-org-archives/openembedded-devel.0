Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 66652773EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 18:37:12 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id d5so31152073uag.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 10:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=myYxwejBslwNVAos/VbUgWYygT5l/FyLXEsWb7No9TE=;
	b=L3zn/c1ntiY4EjGfFZl02CkKhemJJJbE6nTkjbYeFmBZ8xzGHUGKDKOGdaySU1szs+
	jBGmh9XX96Y9L/cfkoYxZS5KPI/vZ0JzN4cp4/2dbG5N/aVJpraMhql5l43zuojoB5Bk
	8V5mjukmzj5pnNxPlodwcfYlBZxnQeSXj4ojPjWlNZsBoRFv6H2Lra/JpDT4tjgdoGAV
	jQJYspsqqD8ovH9YjJCfV/8lvjeZQ18PtVuweWNccZYLvmfOFtnrSWdk0hsBv11okNbQ
	7VFDZN1xNaPGmeM3EW7oNM+dGEA2DjRnSE3EwZjilxOk0FWpB9ncxOpo56l9bQC3Xsls
	yW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=myYxwejBslwNVAos/VbUgWYygT5l/FyLXEsWb7No9TE=;
	b=mjsUjrszH4PoBvHNKiQjVLQHM1fP00+vGItuHXveVgqpBcCI0HZWeJqtgVO/KK6Me8
	FIRkpyKyYuY4vanqdOSeq3+h9PlMBQV8nGFIE8K5NjOY2FA1UEomGigcvusaTSxNdMeM
	wCCHbsLLc9ybTSG5v8I5MKim2zsgT5N5atS95GMkKCByZ+qajpiCJwnxQZbUiH3RZfBx
	152otg7jfP0BLf3+LW6SrKysUvpzjSx8H+1y/JigxkEv4sfY3aCsb/x3xP6MEZxX8wMS
	RO/U0T8nhzdteh4LpnU7edi+7AiP+uW7bIZdI7J4IJmlbbAPdvoae+O9v9k2a5MYtxkB
	7YyQ==
X-Gm-Message-State: AIkVDXKSPuLrTFNhSbnG3xlNNwjzisdgFwKv7txf8UJOGoZcfulrzxlT3JwOa6ZPcdaQujGA2krq+pnrFAcB4A==
X-Received: by 10.176.90.144 with SMTP id w16mr11754116uae.101.1485801433183; 
	Mon, 30 Jan 2017 10:37:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 30 Jan 2017 10:36:42 -0800 (PST)
In-Reply-To: <000e7909-80c8-6f48-a35b-b3ccda7a82fe@igalia.com>
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
	<8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
	<a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
	<529a997b-8ebf-28c7-5dad-1411de15dcf7@gmail.com>
	<1F119876-0AF6-4918-AE7A-0C2809A0C5C9@neuf.fr>
	<CAMKF1srK12QsoH0Xw_68U5EgJ37B2fTMPWK_SKPQ-Cwy=mh5NQ@mail.gmail.com>
	<000e7909-80c8-6f48-a35b-b3ccda7a82fe@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2017 10:36:42 -0800
Message-ID: <CAMKF1soJMZ+xtn8juW8n-MiKEB5zhTiWfPGAPtS6qs-sSUs6nA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 30 Jan 2017 18:37:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 10:33 AM, Jacobo Aragunde P=C3=A9rez
<jaragunde@igalia.com> wrote:
> Hi Khem Raj,
>
> sorry, I didn't understand your response. Do you prefer I send a new
> version of the rebase patch, including Herve's fix? In that case, Herve,
> I think I could use jbriance's upstream patch so you don't need to
> generate it, if you all agree. I'd use the one that didn't get merged
> [1], because we need the .gyp part too.
>
> Future rebases will require changes to use GN, at that point we should
> probably get rid of this custom patch. That's a problem for another day,
> though :)

I was thinking both of Herve and you will send your patches
independently after rework but if you can integrate both that would be
wonderful.

>
> [1] https://codereview.chromium.org/2239833003/#ps1
>
> Thank you all,
> --
> Jacobo Aragunde
> Software Engineer at Igalia
>
>
> On 29/01/17 02:13, Khem Raj wrote:
>> Hi Herve
>>
>> Yes please send a V2 with suggested changes.
>>
>> On Sat, Jan 28, 2017 at 7:05 AM, Herve Jourdain <herve.jourdain@neuf.fr>=
 wrote:
>>> Hi Khem,
>>>
>>> Shall I generate a proper patch with the proper header? Or should Jacob=
o add that to his patch?
>>> I'm not even sure the patch is accepted on master yet.
>>>
>>> Cheers,
>>> Herve
>>>
>>>> On 28 Jan 2017, at 01:51, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 1/27/17 6:06 AM, Julien Brianceau (jbriance) wrote:
>>>>>> -----Original Message-----
>>>>>> From: openembedded-devel-bounces@lists.openembedded.org
>>>>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=
 Of
>>>>>> Khem Raj
>>>>>> Sent: vendredi 27 janvier 2017 02:47
>>>>>> To: openembedded-devel@lists.openembedded.org
>>>>>> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update =
to
>>>>>> 53.0.2785.14
>>>>>>
>>>>>>
>>>>>>
>>>>>>> On 1/25/17 9:50 PM, Herve Jourdain wrote:
>>>>>>> Hi Jacob,
>>>>>>>
>>>>>>> I've been able to compile chromium-wayland 53.0.2785.14 on
>>>>>> RaspberryPi, with Wayland only (no X11), BUT I had to add an additio=
nal
>>>>>> patch for it to work, or else I get an error in
>>>>>> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
>>>>>>> I'm using VC4, which has a DRM/KMS interface (it seems that DRM
>>>>>> interface is required by ozone-wayland), but this patch seems to not=
 be
>>>>>> related to RaspberryPi itself.
>>>>>>> Basically, it seems that USE_XKBCOMMON is not defined when compilin=
g
>>>>>> keycodes.
>>>>>>>
>>>>>>> Is it something that you saw as well? Or do you have a different
>>>>>> setting/experience?
>>>>>>>
>>>>>>> Just for reference, here is the patch I need (right now, I'm
>>>>>> triggering it from meta-raspberrypi, but I believe it may be needed =
in
>>>>>> meta-browser).
>>>>>>>
>>>>>>> --- a/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>>> 19:12:01.767271256 +0800
>>>>>>> +++ b/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>>>> 19:12:11.503048216 +0800
>>>>>>> @@ -21,6 +21,9 @@
>>>>>>>         'scoped_xkb.h',
>>>>>>>         'xkb_keysym.h',
>>>>>>>       ],
>>>>>>> +      'defines': [
>>>>>>> +        'USE_XKBCOMMON',
>>>>>>
>>>>>> This seems fine to me. It should also be proposed upstream as well I
>>>>>> think.
>>>>>>
>>>>>
>>>>> For the record, I've already tried to upstream a similar change (see =
Patch Set 1 of review https://codereview.chromium.org/2239833003/), but onl=
y the GN part has been accepted as gyp support has been removed in Chromium=
 54.
>>>>>
>>>>
>>>> thats we should make a note of this in patch header. We will have to
>>>> remove it or replace it as well when we upgrade chromium.
>>>>> Julien
>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

