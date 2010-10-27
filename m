Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1PBAHe-0004TT-7x
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 19:59:35 +0200
Received: by vws17 with SMTP id 17so222685vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fHnD3aJLc4adMaUVMFD4OQnqOQYJr+cA2vJUkjTSIjo=;
	b=tmFKx/ghs6wJlk3vzGS3BjY+URL/VG8BEUriPQTECIg1fgEz09P1gxmB7uJTzJvbEb
	5CPLvX/wXxw59w275VvWxagKi3ZAqZASTBa7qYheUFXC7aj22hXfZWA9WrhtygFhX48f
	3yw1/ZyzGsjgymgcbIhYIo+qu0lH7/oz4f5NU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=j6Z3lgcECcX5VB7tlLxo6QjTs/YpkouC47ruRp/msIDsGia/yxinTRdZQB/aHzG9uu
	biMO2JqOe6HcOjHOSAmvoBk0jdn99MwViRhd5qBjEx+m3L09IJLmg+rQXLsj4rqaU+W9
	N/wBeJf60hD/0BSvMhKiKErwLZ/NJoBtM+L9Q=
MIME-Version: 1.0
Received: by 10.42.11.12 with SMTP id s12mr8184079ics.101.1288202324048; Wed,
	27 Oct 2010 10:58:44 -0700 (PDT)
Received: by 10.142.165.17 with HTTP; Wed, 27 Oct 2010 10:58:43 -0700 (PDT)
In-Reply-To: <AANLkTinVJOyat7dpZwrxz-QaBANbqkktf2vt-3MsYoqL@mail.gmail.com>
References: <4CC61633.3080808@gmail.com>
	<AANLkTikkXFLFr0iTWTmxzF6iUM9RMmfvQppxvptuNyLG@mail.gmail.com>
	<AANLkTimsFmMeU2TG+uQ2Z_zLsS3KATGJ2KzB22_AoUPD@mail.gmail.com>
	<AANLkTinVJOyat7dpZwrxz-QaBANbqkktf2vt-3MsYoqL@mail.gmail.com>
Date: Wed, 27 Oct 2010 10:58:43 -0700
Message-ID: <AANLkTi=KuVPBsUsZktE9NGMLONKT=7i4+RahnK7RxhDD@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: sakoman@gmail.com
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
X-List-Received-Date: Wed, 27 Oct 2010 17:59:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
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
>>>> =A0recipes/espgs/espgs_8.15.3.bb | =A0 =A02 +-
>>>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/recipes/espgs/espgs_8.15.3.bb b/recipes/espgs/espgs_8.15.=
3.bb
>>>> index ba03f00..c2349e0 100644
>>>> --- a/recipes/espgs/espgs_8.15.3.bb
>>>> +++ b/recipes/espgs/espgs_8.15.3.bb
>>>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "ESP Ghostscript is an up-to-date GNU =
Ghostscript distribution \
>>>> =A0including bug fixes, new drivers, and additional support for CUPS."
>>>> =A0HOMEPAGE =3D "http://www.cups.org/espgs/"
>>>> =A0SECTION =3D "libs"
>>>> -DEPENDS =3D "jpeg zlib libpng tiff fontconfig"
>>>> +DEPENDS =3D "jpeg zlib libpng tiff fontconfig cups"
>>>> =A0LICENSE =3D "GPL"
>>>> =A0PR =3D "r1"
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

I've been working on this too.

The current state of the recipe is in my working branch (sakoman):

http://www.sakoman.com/cgi-bin/gitweb.cgi?p=3Dopenembedded.git;a=3Dshortlog=
;h=3Drefs/heads/sakoman

It builds, but there is some strangeness in generating the cups-gs and
cup-gs-dbg packages that I still haven't quite figured out.

Steve


