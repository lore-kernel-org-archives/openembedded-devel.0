Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id E130174230
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 07:37:10 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so79661080igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=NKUuFuDfEfTO2FcabR88p/rNgc6LxMDyLaHpFpsGAzM=;
	b=SjswQPss6UXtHYmeBL1dL7abUxHAPHW+pMaLqdwrvSe3hWqmIaWQBWZkUGCtt5HGZ/
	HFNKEG95CHBSIKEV0LvMv4SJEpVxCLloaLNiJ7z+aMHWVJ/+uxxRWjAA0evcuvBfZzSn
	Ibi86FT47iNWoHSKVghK6ZBP5Y2m6RQoR+cJgIZuRRA4vd55qtZomrD8HoEFU5evEfdw
	YEyjpiXkOwtMb8Q5ZaTerZcCUSttX3qNPF0jWe+MvXGfQQ0PlZy9pSgPZxllnWnRInsj
	A976QpzysAOmVSDVG5GXZXZpIYz3T1leWuN/6p9FgWOBivWJVemcopODJh9eQzGUjvlw
	f54w==
X-Received: by 10.43.173.70 with SMTP id ob6mr1773907icc.45.1432712231305;
	Wed, 27 May 2015 00:37:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Wed, 27 May 2015 00:36:40 -0700 (PDT)
In-Reply-To: <CALbNGRRCTv8EBGdz9UEHfvvL3wRUjrfct36KUR-zED9MDe7Frw@mail.gmail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-3-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1so3YuLs49Ng1e08+WK4kOp4Ocpb60gGPVn3LZUOMGQaDw@mail.gmail.com>
	<CALbNGRRCTv8EBGdz9UEHfvvL3wRUjrfct36KUR-zED9MDe7Frw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 May 2015 00:36:40 -0700
Message-ID: <CAMKF1sr+ZM4YtWjGDAaK1uTBnN7wCwN+qA=0Vz8Rp36XwMndaw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 02/12] openjpeg: initial add 2.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 May 2015 07:37:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2015 at 11:25 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, May 26, 2015 at 6:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> there is a recipe available here
>> http://layers.openembedded.org/layerindex/recipe/25686/
>> may be you want to coordinate with that layer to migrate it into meta-oe=
 ?
>>
>> On Mon, May 25, 2015 at 2:13 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>>  meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb | 18 +++++++++++++=
+++++
>>>  1 file changed, 18 insertions(+)
>>>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
>>>
>>> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb b/meta=
-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
>>> new file mode 100644
>>> index 0000000..9f6dd57
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
>>> @@ -0,0 +1,18 @@
>>> +DESCRIPTION =3D "OpenJPEG library is an open-source JPEG 2000 codec"
>>> +HOMEPAGE =3D "http://www.openjpeg.org/index.php?menu=3Dmain"
>>> +
>>> +LICENSE =3D "BSD"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc648878b4840d7babaade1303e7=
f108c"
>>> +
>>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}.mirror/${PV}/${BPN}-=
${PV}.tar.gz"
>>> +SRC_URI[md5sum] =3D "f6419fcc233df84f9a81eb36633c6db6"
>>> +SRC_URI[sha256sum] =3D "1232bb814fd88d8ed314c94f0bfebb03de8559583a33ab=
be8c64ef3fc0a8ff03"
>>> +
>>> +inherit cmake
>>> +
>>> +DEPENDS =3D "libpng tiff lcms"
>>> +
>>> +# standard path for *.cmake
>>> +EXTRA_OECMAKE +=3D "-DOPENJPEG_INSTALL_PACKAGE_DIR=3D${baselib}/cmake"
>>> +
>>> +FILES_${PN}-dev +=3D "${libdir}/cmake/*.cmake"
>>> --
>>> 1.9.3
> I checked: That layer uses openjpeg only native. Suggestion: Will try
> to extend openjpeg for native / build mupdf from
> meta-alt-desktop-extras and send a follow up. OK?

sounds good. mupdf is a meta-oe candidate btw.

>
> Andreas

