Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnEbq-0006wX-J4
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 19:17:46 +0100
Received: by yie16 with SMTP id 16so208879yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 10:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=rqGW+Qi+gRQQhYP4ByFCYjiqWbnz1vKI4/kQxx8YvLY=;
	b=HDjDiVvfEES414qlOVdLe6fsn2APX757UWmmWZuhLeyGQ3BhIy7v2kHH1XxaXlay8S
	9++MICyui7pvXSJoV/XLMDo/BvSF/vZjtXVZ2W8Zsu0NxHIC6y8/VvXZicokNMHK3tsV
	XO16dDo6eG9tyw5/2oYb0OUAKgbEhaV7r/qsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=eUPY2xKC6cqrqDnF0aZ3i02/QqhbKgAORhTqj5ecCdx74taVxYgKB4s6qque+FBJWv
	95Gp4eM4+yMk9RvLixUz1RKY3EHFqKwnUN3hAcMVIS1jBDK74DL4Tn6Pfef/nEr4BWfs
	tZAxWlB879gkEsN/c9DaxZ8QDSE4dtl5hWZIM=
Received: by 10.90.51.20 with SMTP id y20mr1687062agy.115.1297275401170; Wed,
	09 Feb 2011 10:16:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Wed, 9 Feb 2011 10:16:05 -0800 (PST)
In-Reply-To: <4D51B81D.8000800@mentor.com>
References: <1297199824-3712-1-git-send-email-morphis@gravedo.de>
	<4D51B81D.8000800@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2011 10:16:05 -0800
Message-ID: <AANLkTikbfyoZfnJq9k1fSkMVMkReNw0G8APuXjc_rTyY@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Feb 2011 18:17:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 8, 2011 at 1:39 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/08/2011 02:17 PM, Simon Busch wrote:
>>
>> Neon support in evas is currently broken for the palmpre machine. If we
>> enable neon
>> support evas causes alignment trap errors and lets the device freeze in
>> the end. This
>> should be reverted after the bug in evas code is found and fixed.
>>
>> Signed-off-by: Simon Busch<morphis@gravedo.de>
>> ---
>> =C2=A0recipes/efl1/evas.inc | =C2=A0 =C2=A05 ++++-
>> =C2=A01 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
>> index eb64d7a..ad30eba 100644
>> --- a/recipes/efl1/evas.inc
>> +++ b/recipes/efl1/evas.inc
>> @@ -7,7 +7,7 @@ DEPENDS_virtclass-native =3D "freetype-native libxext-na=
tive
>> libpng-native jpeg-na
>> =C2=A0inherit efl
>>
>> =C2=A0BBCLASSEXTEND =3D "native"
>> -INC_PR =3D "r0"
>> +INC_PR =3D "r1"
>> =C2=A0FILESPATHPKG =3D. "${BPN}-${PV}:${BPN}:"
>>
>> =C2=A0python populate_packages_prepend () {
>> @@ -83,6 +83,9 @@ EVAS_CPU_TWEAKS =3D ""
>> =C2=A0# Disabled for now, see
>> http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/2=
5194
>> =C2=A0#EVAS_CPU_TWEAKS_armv7a =3D "--enable-cpu-neon"
>>
>> +# Neon support for evas is broken on palmpre currently (causes the devi=
ce
>> to freeze)
>> +EVAS_CPU_TWEAKS_palmpre =3D "--disable-cpu-neon"
>> +
>> =C2=A0# common options
>> =C2=A0EVAS_OECONF =3D " \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--x-includ=
es=3D${STAGING_INCDIR}/X11 \
>
> Shouldn't this be changing the armv7a EVAS_CPU_TWEAKS that's above yours =
to
> be uncommented and as a --disable?

that would disable neon for all armv7a machines probably not what is
needed here. The patch seems ok but I think it will make this recipe
machine specific if it already is not on the other hand punishing
all armv7 will keep the recipe still generic

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


