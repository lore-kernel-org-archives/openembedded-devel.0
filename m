Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBA1y-0001MB-7S
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 19:43:24 +0200
Received: by yxe42 with SMTP id 42so621678yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=IynsdfbO5hqHfz5pe/3jGLe1p7wpXlywOr/81vrZUmc=;
	b=OeAKvNsa3MEcaiQbau3nJgmHg33G6L7xt93tbFkK4gGprrRHcGPfmk8/82ODL9wIPP
	58LmJPhU2uV+ChGdUl82wrDJeIQNNU0GGnUKawKfwYghudwZWcSUB96Huu9K0ndxPmzO
	vwKraBqBqMu9d6hBRoRRYmC/x7FrR1S/2hsPA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=p6JB82/OLBwK4HiL5VpcJXD6hJGR0JMF/5iNCZ2yTHtpnMfJOeQy3QgBRfGfUEx7ZK
	RVUCRvfvmm6v9pSV2ZGXFluDh2psnhDhn37OmofUYQnh5uJxIAuzH82EZaZ5+BnftpoV
	fLMcZ8dC70CizNC82MSI0aoXxAPVGCUZrLwVI=
Received: by 10.91.11.30 with SMTP id o30mr1313679agi.94.1288201352352; Wed,
	27 Oct 2010 10:42:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Wed, 27 Oct 2010 10:42:11 -0700 (PDT)
In-Reply-To: <AANLkTinVJOyat7dpZwrxz-QaBANbqkktf2vt-3MsYoqL@mail.gmail.com>
References: <4CC61633.3080808@gmail.com>
	<AANLkTikkXFLFr0iTWTmxzF6iUM9RMmfvQppxvptuNyLG@mail.gmail.com>
	<AANLkTimsFmMeU2TG+uQ2Z_zLsS3KATGJ2KzB22_AoUPD@mail.gmail.com>
	<AANLkTinVJOyat7dpZwrxz-QaBANbqkktf2vt-3MsYoqL@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Oct 2010 10:42:11 -0700
Message-ID: <AANLkTik+KUF4Y-KoCFUKqh8tZ=darErbxeK+wXCRgWOe@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] espgs_8.15.3.bb: Depend on cups as EXTRA_OECONF has --enable-cups.
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
X-List-Received-Date: Wed, 27 Oct 2010 17:43:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2010 at 2:40 AM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> On 27 October 2010 16:50, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Oct 25, 2010 at 11:36 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2010/10/26 Graham Gower <graham.gower@gmail.com>:
>>>>
>>>> pstoraster/gdevcups.c:74:25: fatal error: cups/raster.h: No such file =
or directory
>>>>
>>>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>>>> ---
>>>> =C2=A0recipes/espgs/espgs_8.15.3.bb | =C2=A0 =C2=A02 +-
>>>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/recipes/espgs/espgs_8.15.3.bb b/recipes/espgs/espgs_8.15.=
3.bb
>>>> index ba03f00..c2349e0 100644
>>>> --- a/recipes/espgs/espgs_8.15.3.bb
>>>> +++ b/recipes/espgs/espgs_8.15.3.bb
>>>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "ESP Ghostscript is an up-to-date GNU =
Ghostscript distribution \
>>>> =C2=A0including bug fixes, new drivers, and additional support for CUP=
S."
>>>> =C2=A0HOMEPAGE =3D "http://www.cups.org/espgs/"
>>>> =C2=A0SECTION =3D "libs"
>>>> -DEPENDS =3D "jpeg zlib libpng tiff fontconfig"
>>>> +DEPENDS =3D "jpeg zlib libpng tiff fontconfig cups"
>>>> =C2=A0LICENSE =3D "GPL"
>>>> =C2=A0PR =3D "r1"
>>>>
>>>>
>>>
>>> Three small remarks:
>>> - not sure if changes like this require a PR bump. I always choose the
>>> the safe way and bump when in doubt.
>>
>> Well if in doubt always read
>> http://wiki.openembedded.org/index.php/When_To_Bump_PR
>> and in this case a PR bump is not needed.
>>
>>> - it would be nice if, when you are fixing a recipe you would also
>>> improve the LICENSE =3D "GPL" thing
>>
>> yes.
>>
>>> - and there is also a 7.07.1 recipe. Should this apply to this version
>>> as well (or alternately should we remove that recipe?)
>>>
>>
>> probably remove the old recipe.
>
> Both espgs recipes can be moved to obsolete, as the project has been
> merged into ghostscript 3 years ago. There are a couple of dependent
> recipes to be moved to depend on gs instead. But I need to fix the gs
> recipe to build for me before i can test them.
>

good find fantastic.

> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


