Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnGvA-0001pf-Pq
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 21:45:54 +0100
Received: by yxd5 with SMTP id 5so271341yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 12:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=slQutXN5R8MH26Kp0lqN3kHPdauqxTH2ezVhQlftOHI=;
	b=g7dZwOS5RnBYJQO/F8n+9YmAmNegAkopxsDvzsll1DMShYUhHqt7nkDk8SxifnikAG
	FyKDl4ZZiu+nDE/eBAQlFZkOm5HvX1hrkiPuwqr6JRsfDjq0RcTfuUSWLSP8MYAzFgPm
	YR/C2cZuz2zB0KdTSYpn4A5IK418Pf8zWxQFg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=pVtoe3bB4RK8gkkIvsZ+pPuQ+85ZFhh0AztXUwRu+nvXrmXPAgt5c5/P5qx/qPKHIF
	tc73ZNVLXm6NPFLDqKze441h2VUWdD2s37iiF6hhbWh83Nbw3CjWUe12UqlqH7ag3Fnc
	Kn9udoEQ4R7bxUm7jkvWQ6gwlhZ6j5sxKZDY8=
Received: by 10.91.160.30 with SMTP id m30mr1895033ago.61.1297284288691; Wed,
	09 Feb 2011 12:44:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Wed, 9 Feb 2011 12:44:28 -0800 (PST)
In-Reply-To: <4D52EEE5.9030309@mentor.com>
References: <1297199824-3712-1-git-send-email-morphis@gravedo.de>
	<4D51B81D.8000800@mentor.com>
	<AANLkTikbfyoZfnJq9k1fSkMVMkReNw0G8APuXjc_rTyY@mail.gmail.com>
	<iium4d$gau$1@dough.gmane.org> <20110209193129.GA15397@nirvana>
	<4D52EEE5.9030309@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2011 12:44:28 -0800
Message-ID: <AANLkTin0nJfcj1wFiYcbXLyLa9tk_Dy8yn8Lp3=PGNHC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] evas: disable cpu neon support for palmpre machine
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
X-List-Received-Date: Wed, 09 Feb 2011 20:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 9, 2011 at 11:45 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/09/2011 12:31 PM, Simon Busch wrote:
>>
>> On 02/09/11 at 07:24pm, Koen Kooi wrote:
>>>
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>
>>> On 09-02-11 19:16, Khem Raj wrote:
>>>>
>>>> On Tue, Feb 8, 2011 at 1:39 PM, Tom Rini<tom_rini@mentor.com> =C2=A0wr=
ote:
>>>>>
>>>>> On 02/08/2011 02:17 PM, Simon Busch wrote:
>>>>>>
>>>>>> Neon support in evas is currently broken for the palmpre machine. If
>>>>>> we
>>>>>> enable neon
>>>>>> support evas causes alignment trap errors and lets the device freeze
>>>>>> in
>>>>>> the end. This
>>>>>> should be reverted after the bug in evas code is found and fixed.
>>>>>>
>>>>>> Signed-off-by: Simon Busch<morphis@gravedo.de>
>>>>>> ---
>>>>>> =C2=A0recipes/efl1/evas.inc | =C2=A0 =C2=A05 ++++-
>>>>>> =C2=A01 files changed, 4 insertions(+), 1 deletions(-)
>>>>>>
>>>>>> diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
>>>>>> index eb64d7a..ad30eba 100644
>>>>>> --- a/recipes/efl1/evas.inc
>>>>>> +++ b/recipes/efl1/evas.inc
>>>>>> @@ -7,7 +7,7 @@ DEPENDS_virtclass-native =3D "freetype-native
>>>>>> libxext-native
>>>>>> libpng-native jpeg-na
>>>>>> =C2=A0inherit efl
>>>>>>
>>>>>> =C2=A0BBCLASSEXTEND =3D "native"
>>>>>> -INC_PR =3D "r0"
>>>>>> +INC_PR =3D "r1"
>>>>>> =C2=A0FILESPATHPKG =3D. "${BPN}-${PV}:${BPN}:"
>>>>>>
>>>>>> =C2=A0python populate_packages_prepend () {
>>>>>> @@ -83,6 +83,9 @@ EVAS_CPU_TWEAKS =3D ""
>>>>>> =C2=A0# Disabled for now, see
>>>>>>
>>>>>> http://thread.gmane.org/gmane.comp.window-managers.enlightenment.dev=
el/25194
>>>>>> =C2=A0#EVAS_CPU_TWEAKS_armv7a =3D "--enable-cpu-neon"
>>>>>>
>>>>>> +# Neon support for evas is broken on palmpre currently (causes the
>>>>>> device
>>>>>> to freeze)
>>>>>> +EVAS_CPU_TWEAKS_palmpre =3D "--disable-cpu-neon"
>>>>>> +
>>>>>> =C2=A0# common options
>>>>>> =C2=A0EVAS_OECONF =3D " \
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--x-in=
cludes=3D${STAGING_INCDIR}/X11 \
>>>>>
>>>>> Shouldn't this be changing the armv7a EVAS_CPU_TWEAKS that's above
>>>>> yours to
>>>>> be uncommented and as a --disable?
>>>>
>>>> that would disable neon for all armv7a machines probably not what is
>>>> needed here.
>>
>>> Actually, that was how I did it :) The NEON code that was added doesn't
>>> build with gcc 4.3.x and binutils 2.18.x, so I disabled it by not
>>> enabling it. If it builds and works with gcc 4.3.x nowadays we should
>>> enable it and find out why the palmpre breaks.
>>
>> Evas builds fine these days with neon support enabled but it enables it =
by
>> default. I really need to find the cause of the breakage on the palmpre
>> but
>> don't have too much time to debug it so this is a interim solution only
>> until the bug is found and fixed.

that would be nice because once we add machine override it can become
a common escape for other machines
and changing this to be a machine specific recipe is not desired
unless absolutely needed

>
> My only concern is that are we sure other armv7a targets aren't also havi=
ng
> fatal problems?

we don't fix what we don't know is broken

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


