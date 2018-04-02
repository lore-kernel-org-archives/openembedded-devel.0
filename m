Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 662C372ED8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 19:38:20 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id q66so5347347ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zSyYylfmUXA64fZhh5ZyJsE8+yt6vWXzyBzu9jAaPAU=;
	b=RKpiZgqEYlEsS4ViQBLWlUvr+5dR1Pfjg53mzco2b7FrmM2ptZo9veGNoJr7fkAw1n
	RhP0ZkCpK5YZmeUV7l7boPu8x5P0kxB9nGRDE3+WeRQMkJgjE2O6okOpGuKaS2tmA1Xs
	4oeCieLqS9jLWaTS5ZBfr3XIDs83nwzvCwmurHvIzqNe/dkXPi4MlOBbjGduK6+RR/Dr
	WiNKCO516/wOCRllUWxMzyJaLMwyT9XrWmvTev9oHaUiLV1hYwUsvZT+bOEFyaTIpdSW
	Ac97oD27sTt/DbktmsXr9nYqlOxJETrzLN5mTpTt8R0NlzY67Hu3G+IkR2rFRqlB6hH6
	N39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zSyYylfmUXA64fZhh5ZyJsE8+yt6vWXzyBzu9jAaPAU=;
	b=ujXHkKo/Tq5mgXiprQqkwnbMm9/CambBJS/JGXY5dazz10fHlr/Douw1yEhk7/1IxG
	WIomJ1AoMi/1LdYzjfSBcOFvgdiYiEjex/sB5837GBbfy0NFjKKrgk/bI9CC4EmNzN9r
	jklgr+XzK6S8pGA5Y742Q594cYO8S8tYzYPtT5ScieoHtVSSDsqpGPuKB0zS9zVLw69K
	XZerRaOYJ9PefS0lcVzxf1g/7Jyl9xH9r7dEcTROhlOS7DwP9fEMcHWGMvMTZ/s5rd8E
	mOOy6xEjUs130fCnxTCCZy3yMvJtW/IQ2x5JR4BhPH00qYOdawr6TZF6wkKEcz3SRIjk
	eULA==
X-Gm-Message-State: ALQs6tCmZryRdL5s9iSW9E+etc/QZrs5b475l2ym9RTImkh6oGD6reDg
	XOnxHKZsYkd2oMu9BsbbwFLFng4qEy4bJgsUXnxgBA==
X-Google-Smtp-Source: AIpwx4+7YbUT7Y/QQlRe/g0a0IAIyGBeLILEv0RoDFhGqVtP9U7s6MD2Q7RYchUzRhxMTNLopOqxuy4DbVJ+fOswcMA=
X-Received: by 10.13.249.197 with SMTP id j188mr6298094ywf.318.1522697900923; 
	Mon, 02 Apr 2018 12:38:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Mon, 2 Apr 2018 12:38:20 -0700 (PDT)
In-Reply-To: <CALbNGRRjaaDQysfOmdYTCo3ssqMwGyiq4Eew9pnJ+0uUPGkk_Q@mail.gmail.com>
References: <1522636575-23776-1-git-send-email-akuster808@gmail.com>
	<CALbNGRSO8ZNb5gad6ZPGOzMmhXcm6XQ7Uv3BjGOoDcp=kZb=Jg@mail.gmail.com>
	<b1471fc8-6512-169a-7f9b-e46abe766f7d@gmail.com>
	<CALbNGRRjaaDQysfOmdYTCo3ssqMwGyiq4Eew9pnJ+0uUPGkk_Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 2 Apr 2018 21:38:20 +0200
Message-ID: <CALbNGRT+Y9E3PdNc+EA4RoKfe-0-sVzca1vyzLrDHcvxDudxag@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poppler: fix compile errors
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
X-List-Received-Date: Mon, 02 Apr 2018 19:38:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 2, 2018 at 6:53 PM, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> On Mon, Apr 2, 2018 at 4:54 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 04/02/2018 04:56 AM, Andreas M=C3=BCller wrote:
>>> On Mon, Apr 2, 2018 at 4:36 AM, Armin Kuster <akuster808@gmail.com> wro=
te:
>>>> disable glib  via new PACKGAGECONFIG option
>>>>
>>>> glib.so, not found (try using -rpath or -rpath-link)
>>>> | ./libpoppler-glib.so: undefined reference to `FormWidgetText::noSpel=
lCheck() const'
>>>> | ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::dese=
lectAll()'
>>>> | ./libpoppler-glib.so: undefined reference to `StructElement::getText=
SpansInternal(MarkedContentOutputDev&) const'
>>>> | ./libpoppler-glib.so: undefined reference to `PopplerCache::PopplerC=
ache(int)'
>>>> | ./libpoppler-glib.so: undefined reference to `MemStream::MemStream(c=
har*, long long, long long, Object&&)'
>>>> | ./libpoppler-glib.so: undefined reference to `StructElement::appendS=
ubTreeText(GooString*, bool) const'
>>>> | ./libpoppler-glib.so: undefined reference to `typeinfo for LinkOCGSt=
ate'
>>>> | ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::noSp=
ellCheck() const'
>>>> | ./libpoppler-glib.so: undefined reference to `XRef::okToChange(bool)=
'
>>>> | ./libpoppler-glib.so: undefined reference to `globalParams'
>>>> | ./libpoppler-glib.so: undefined reference to `MarkedContentOutputDev=
::MarkedContentOutputDev(int)'
>>>> | ./libpoppler-glib.so: undefined reference to `GfxPath::lineTo(double=
, double)'
>>>> | ./libpoppler-glib.so: undefined reference to `FormWidgetButton::getB=
uttonType() const'
>>>> | ./libpoppler-glib.so: undefined reference to `GfxPath::close()'
>>>> | ./libpoppler-glib.so: undefined reference to `PDFDoc::getID(GooStrin=
g*, GooString*)'
>>>> | ./libpoppler-glib.so: undefined reference to `pdfDocEncoding'
>>>> | ./libpoppler-glib.so: undefined reference to `BaseStream::BaseStream=
(Object&&, long long)'
>>>> | ./libpoppler-glib.so: undefined reference to `GfxGouraudTriangleShad=
ing::getTriangle(int, double*, double*, double*, double*, double*, double*,=
 double*, double*, double*)'
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  meta-oe/recipes-support/poppler/poppler_0.62.0.bb | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb b/meta-=
oe/recipes-support/poppler/poppler_0.62.0.bb
>>>> index 6966219..d20751f 100644
>>>> --- a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
>>>> +++ b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
>>>> @@ -21,6 +21,7 @@ PACKAGECONFIG[curl] =3D "-DENABLE_LIBCURL=3DON,-DENA=
BLE_LIBCURL=3DOFF,curl"
>>>>  PACKAGECONFIG[openjpeg] =3D "-DENABLE_LIBOPENJPEG=3Dopenjpeg2,-DENABL=
E_LIBOPENJPEG=3Dnone,openjpeg"
>>>>  PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON,-DENABLE_QT5=3DOFF,qtbase q=
ttools-native"
>>>>  PACKAGECONFIG[nss] =3D "-DWITH_NSS3=3DON,-DWITH_NSS3=3DOFF,nss"
>>>> +PACKAGECONFIG[glib] =3D "-DENABLE_GLIB=3DON,-DENABLE_GLIB=3DOFF, glib=
-2.0"
>>>>
>>>>  # surprise - did not expect this to work :)
>>>>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '',=
 d)}
>>>> --
>>>> 2.7.4
>>>>
>>> This looks odd to me: poppler depends on cairo and cairo depends on
>>> glib-2.0 - both dependencies are unconditional. So glib-2.0 should be
>>> in poppler's recipe specific sysroot. Seems there is something else
>>> wrong here.
>> Its why I sent out the patch.
>>
>>>
>>> I am a bit afraid that this will break evince which is THE pdf-viewer
>>> we have in our common layers. Are there some public log I can look
>>> into?
>>
>> Please see: http://errors.yoctoproject.org/Errors/Build/57086
>>
> I found
>
> | warning: libpoppler.so.73, needed by ./libpoppler-glib.so, not found
> (try using -rpath or -rpath-link)
>
> Looks like some some race for missing dependencies within poppler's
> build. Will investigate and hope to come back with a solution soon.
>
Hi Armin,

as usual things are not that easy:
* My builds are fine - whatever I do - so I cannot debug properly. And
even worse: CMake scripts of poppler look perfectly fine to me.
* The patch which I added for poppler is good for us but makes it more
complicated to ask for help at poppler-project. So I reworked the
patch to turn into a proper fix and submitted it to poppler [1].

Now I would like to:
* Add this patch to poppler
* Update poppler to 0.63.0
* Wait for autobuilder's result (with these patches applied / undo
your patch disabling glib-2.0 wrapper)

If autobuilder still fails I can open a bug at poppler and hope
they're able to help me. If autobuilder passes - we're done with this.

Since I did all this to get our sumo into good shape (oe-core already
branched): How much time do I have to get recent (and of course fixed)
poppler into sumo?

[1] https://bugs.freedesktop.org/show_bug.cgi?id=3D105852

Cheers

Andreas

