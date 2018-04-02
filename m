Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 70207747F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 16:53:33 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id m185-v6so5215335ybm.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KQ+1vnfBiRmGx4uj3kIKtyvUxm4SQbHlNbHq740SMZM=;
	b=N69CJ5A25oNv/+QRMi/IY7WOEcGMrUPe8a2Z3KSllXLW3cU8JMF59lfQrsZNQaSQ59
	ShCwhnBoGpTz00aE5ze7GrgzYGy4nPPJ76ysIshNp3ag8+q/DLeMPm0mEU+u0r2v7Hke
	xQkYN0aVdbiOxmcaiUq0FsuFV6ZYx2jKUoFsC0PWnqj3Av/+2Wu5ICZUV9NgaYzFZ1Gt
	YzlH9+6WfWVu1tRuEMyKVy2l8CHHBcVXWHQ8JAnT2vJxgI1qUJZTpGKdAsZrfIUCVu1n
	eWkHYTu4eKDzUx6jrA6+2Lk2lA6bEFImgybnkqp4MDka1cAjJiMP1eoqwXmJWFC/GSKm
	cm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KQ+1vnfBiRmGx4uj3kIKtyvUxm4SQbHlNbHq740SMZM=;
	b=bqQ4ErnTm+GUY8rnlFc1maRoaGjbSDiK+h9U38FK+KcaYd6gFO+Tpi0sA7PjmEnk1O
	ynPGm8S21FQw2Fo1O9tzDB2X329gd2Abt5uOjtEBeQcxqN3fyuIPn0KTH8WPQHuhH/Ca
	28IMjTfgnzQySAkCO22VhW1RrtNyOOymlXeT/JiFba5oNohGjRuKPS6pGInr/e/WlxuV
	5hLYtPhMFp//FSv68KWXH4GW1dtULSP42SpG49LAPqOLM7clhLQJmBRsZMBaOaDyxX0d
	IRG+UKhAa/Eo4+LDXZeeWCeGVKReYMRjEHQ1fnsHones7851vqhk8s4s/3FkFDNULD7t
	q1gg==
X-Gm-Message-State: ALQs6tCTgFrcr9MM0Md2dLG4p2uWJ+aB5//YXuWhd904kSHM0BWxzRVR
	mR6eEJO4N5+gGVLJiHzDLAh+Vo132vLwgIRvMC8=
X-Google-Smtp-Source: AIpwx49XZMo+pZiv+AEXgeWMxkUvlifestxUtqU4DRnuFvUD/TLFBBh/73Ofb2sMt5txdYeqGtz1eGU/OBRLpTOoRos=
X-Received: by 2002:a25:d24a:: with SMTP id
	j71-v6mr5604294ybg.108.1522688014067; 
	Mon, 02 Apr 2018 09:53:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Mon, 2 Apr 2018 09:53:33 -0700 (PDT)
In-Reply-To: <b1471fc8-6512-169a-7f9b-e46abe766f7d@gmail.com>
References: <1522636575-23776-1-git-send-email-akuster808@gmail.com>
	<CALbNGRSO8ZNb5gad6ZPGOzMmhXcm6XQ7Uv3BjGOoDcp=kZb=Jg@mail.gmail.com>
	<b1471fc8-6512-169a-7f9b-e46abe766f7d@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 2 Apr 2018 18:53:33 +0200
Message-ID: <CALbNGRRjaaDQysfOmdYTCo3ssqMwGyiq4Eew9pnJ+0uUPGkk_Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Apr 2018 16:53:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 2, 2018 at 4:54 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 04/02/2018 04:56 AM, Andreas M=C3=BCller wrote:
>> On Mon, Apr 2, 2018 at 4:36 AM, Armin Kuster <akuster808@gmail.com> wrot=
e:
>>> disable glib  via new PACKGAGECONFIG option
>>>
>>> glib.so, not found (try using -rpath or -rpath-link)
>>> | ./libpoppler-glib.so: undefined reference to `FormWidgetText::noSpell=
Check() const'
>>> | ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::desel=
ectAll()'
>>> | ./libpoppler-glib.so: undefined reference to `StructElement::getTextS=
pansInternal(MarkedContentOutputDev&) const'
>>> | ./libpoppler-glib.so: undefined reference to `PopplerCache::PopplerCa=
che(int)'
>>> | ./libpoppler-glib.so: undefined reference to `MemStream::MemStream(ch=
ar*, long long, long long, Object&&)'
>>> | ./libpoppler-glib.so: undefined reference to `StructElement::appendSu=
bTreeText(GooString*, bool) const'
>>> | ./libpoppler-glib.so: undefined reference to `typeinfo for LinkOCGSta=
te'
>>> | ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::noSpe=
llCheck() const'
>>> | ./libpoppler-glib.so: undefined reference to `XRef::okToChange(bool)'
>>> | ./libpoppler-glib.so: undefined reference to `globalParams'
>>> | ./libpoppler-glib.so: undefined reference to `MarkedContentOutputDev:=
:MarkedContentOutputDev(int)'
>>> | ./libpoppler-glib.so: undefined reference to `GfxPath::lineTo(double,=
 double)'
>>> | ./libpoppler-glib.so: undefined reference to `FormWidgetButton::getBu=
ttonType() const'
>>> | ./libpoppler-glib.so: undefined reference to `GfxPath::close()'
>>> | ./libpoppler-glib.so: undefined reference to `PDFDoc::getID(GooString=
*, GooString*)'
>>> | ./libpoppler-glib.so: undefined reference to `pdfDocEncoding'
>>> | ./libpoppler-glib.so: undefined reference to `BaseStream::BaseStream(=
Object&&, long long)'
>>> | ./libpoppler-glib.so: undefined reference to `GfxGouraudTriangleShadi=
ng::getTriangle(int, double*, double*, double*, double*, double*, double*, =
double*, double*, double*)'
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>  meta-oe/recipes-support/poppler/poppler_0.62.0.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb b/meta-o=
e/recipes-support/poppler/poppler_0.62.0.bb
>>> index 6966219..d20751f 100644
>>> --- a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
>>> +++ b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
>>> @@ -21,6 +21,7 @@ PACKAGECONFIG[curl] =3D "-DENABLE_LIBCURL=3DON,-DENAB=
LE_LIBCURL=3DOFF,curl"
>>>  PACKAGECONFIG[openjpeg] =3D "-DENABLE_LIBOPENJPEG=3Dopenjpeg2,-DENABLE=
_LIBOPENJPEG=3Dnone,openjpeg"
>>>  PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON,-DENABLE_QT5=3DOFF,qtbase qt=
tools-native"
>>>  PACKAGECONFIG[nss] =3D "-DWITH_NSS3=3DON,-DWITH_NSS3=3DOFF,nss"
>>> +PACKAGECONFIG[glib] =3D "-DENABLE_GLIB=3DON,-DENABLE_GLIB=3DOFF, glib-=
2.0"
>>>
>>>  # surprise - did not expect this to work :)
>>>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', =
d)}
>>> --
>>> 2.7.4
>>>
>> This looks odd to me: poppler depends on cairo and cairo depends on
>> glib-2.0 - both dependencies are unconditional. So glib-2.0 should be
>> in poppler's recipe specific sysroot. Seems there is something else
>> wrong here.
> Its why I sent out the patch.
>
>>
>> I am a bit afraid that this will break evince which is THE pdf-viewer
>> we have in our common layers. Are there some public log I can look
>> into?
>
> Please see: http://errors.yoctoproject.org/Errors/Build/57086
>
I found

| warning: libpoppler.so.73, needed by ./libpoppler-glib.so, not found
(try using -rpath or -rpath-link)

Looks like some some race for missing dependencies within poppler's
build. Will investigate and hope to come back with a solution soon.

Andreas

