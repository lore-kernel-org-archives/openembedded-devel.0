Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B4EDD6E671
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:24:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 77so29800759wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 23:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7Mv6NF6o0ZdRujbikYkwt3lZ1xqxYswQN65M/horyT4=;
	b=BTjADjJ4zJw1hVeGptrBhlsfrGDu/wBYaVsdujPUBoYzq06tl+tbORw65n3CX88xZY
	lUGGGMiB91hU+K+MTKPuLKUQq4LKVp/2AyEDfc6u8n9dHxqIYDubBXjFVUhl6Ew6wSjZ
	WIi87SOeDkQksbwIFmB70org+MLqs+RqdH/6+KSfkklWIwLq2jrGgKRqtkJgmINgiBGh
	XVGCplx9Ce7cgZ1KHTF7mjmm3qEkAOjvffudV5fK413v94lUKa1UJHlQlrkIW/3tI51n
	IW5qeRwl+HVgKkR7Hj35VUbcWXmtP86SqrbgAhanplSLMYfIE8Z3f2LkKjzARhwVSvA8
	7n6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7Mv6NF6o0ZdRujbikYkwt3lZ1xqxYswQN65M/horyT4=;
	b=PK/XK3KZgEGTDY/0q1Nx5GJ82kDX2QST6VkCwlVi7N06++rSL0QzPN9W0h1jYZcHvd
	K1anvMGViKavJhMz8KN6c5B67omjL3mv/N/ySzYDs9C/7sxRP4dqeqSJSc3SUaHtQCNP
	2O9gZYK7q6T+DhFkF8reH3hWSvoYvfMk62HcLI+WLEuf2k9Yxn4ObTOuNIvajfgtKXLQ
	08FNMjS1x9VGlFh8v9vvw36yGEN31Q/jTLwvEstp2EFJo4T2kPDX2POoZHOtr5RKu9yh
	J08Um2VPUnyCwMF/13jKrE8+2eVDw+oC5wS1qXr7HhO8ThEVMvZakTEsjCRz4pPV1c+4
	bJIQ==
X-Gm-Message-State: AIVw111+Pp/EEFdarjFzITdY6NUbfEWCn2Er///P577bV8Z1YmZpA17U
	E3n0nJZQZVpDacE53544UtYeZMdObw==
X-Received: by 10.223.136.11 with SMTP id d11mr8548819wrd.73.1499754272375;
	Mon, 10 Jul 2017 23:24:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.63.69 with HTTP; Mon, 10 Jul 2017 23:24:31 -0700 (PDT)
In-Reply-To: <CAD4b0_LYeFonQzv7bqTZxO=vq0fwcHtEw49ZDL_vDuki-UXH4w@mail.gmail.com>
References: <20170706093039.30435-1-johannes.pointner@br-automation.com>
	<CAD4b0_LYeFonQzv7bqTZxO=vq0fwcHtEw49ZDL_vDuki-UXH4w@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Tue, 11 Jul 2017 08:24:31 +0200
Message-ID: <CAHvQdo3L34KbWREUuVAn+SqrSo6Q3UMwCvSKiX=4Va6s9htFQw@mail.gmail.com>
To: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libtinyxml2: upgrade to 5.0.1
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
X-List-Received-Date: Tue, 11 Jul 2017 06:24:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2017-07-11 8:13 GMT+02:00 Maciej Borz=C4=99cki <maciej.borzecki@rndity.com>=
:
> On Thu, Jul 6, 2017 at 11:30 AM, Johannes Pointner
> <johannes.pointner@br-automation.com> wrote:
>> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
>> ---
>>  .../{libtinyxml2_4.0.1.bb =3D> libtinyxml2_5.0.1.bb}          | 13 ++++=
++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>  rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_4.0.1.bb =3D> l=
ibtinyxml2_5.0.1.bb} (63%)
>>
>> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb b/=
meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> similarity index 63%
>> rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
>> rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> index 3a6659815..edf836814 100644
>> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
>> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> @@ -6,10 +6,21 @@ LIC_FILES_CHKSUM =3D "file://tinyxml2.cpp;endline=3D22=
;md5=3Dc19221dbd8a66ad3090462af4
>>
>>  SRC_URI =3D "git://github.com/leethomason/tinyxml2.git"
>>
>> -SRCREV =3D "74d44acb176f8510abf28ee0a70961eb26631988"
>> +SRCREV =3D "37bc3aca429f0164adf68c23444540b4a24b5778"
>>
>>  S =3D "${WORKDIR}/git"
>>
>>  inherit cmake
>>
>> +FILES_${PN} =3D " \
>> +    ${libdir}/lib*${SOLIBS} \
>> +    ${includedir}/* \
>
> pretty sure whatever is in ${includedir} it should be a part of -dev pack=
age.
You are right.
But this would still leave us with this rule:
FILES_${PN}-dev =3D " \
    ${includedir}/* \
    ${libdir}/lib*${SOLIBSDEV} \
    ${libdir}/cmake/* \
    ${libdir}/pkgconfig/* \
    "
Is this OK?
>
>> +    "
>> +
>> +FILES_${PN}-dev =3D " \
>> +    ${libdir}/lib*${SOLIBSDEV} \
>> +    ${libdir}/cmake/* \
>> +    ${libdir}/pkgconfig/* \
>> +    "
>> +
>>  BBCLASSEXTEND =3D "native"
>> --
>> 2.13.2
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
> Maciej Borzecki
> RnDity
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

