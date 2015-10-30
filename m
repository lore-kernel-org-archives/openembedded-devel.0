Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id A2D6375894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 22:01:35 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so20500750igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 15:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=/lIFEOGlHHMTv6jwVn7KVStlsszarar7UTqVsat9Lww=;
	b=aqGzis1gYVVOGMSmQjq/LKqgkwaPuu34D4gT491BHNCOXOeR5/fUSJE5EYOLRUuSwA
	bC38Mhcwt4UfKZX3AyQ8dUC8AS3KCpsYHNDrZYKOkyH5hZHnw8/ZFunGeLTz7C55RS2C
	O1NUUGoOOXUwpnhIRNbA49c4oP4CQYim/Vkto3X9pxlygfRGWfewEehAhD7oYsnFIlZc
	vjVsR12LLoiN6rrgoCIzE4Jwi52aOaO+OEoBCN7FJ+y62t5z6NSBNthQyefR4rDhUgSy
	RgZnWwE6gi0EPYBuG1pE7y+zpkWIppe+478qtjzC5DBAp3Mx6EGz/O5EK9CV4FXxcL/e
	IqIQ==
X-Received: by 10.50.20.67 with SMTP id l3mr516779ige.75.1446242495455; Fri,
	30 Oct 2015 15:01:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 30 Oct 2015 15:01:05 -0700 (PDT)
In-Reply-To: <CALbNGRTL5Q-enOj1dp4kZvu1=122ebseTizbhh+ondfH31ieHw@mail.gmail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
	<1446207225-15386-14-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1spmiD9ohoORXi7wnLBFNOFKeG0vgdpJ_n+-5b8-gp_F3A@mail.gmail.com>
	<CALbNGRTL5Q-enOj1dp4kZvu1=122ebseTizbhh+ondfH31ieHw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2015 15:01:05 -0700
Message-ID: <CAMKF1sqRg-WzvMpN=WwXj08zf7vS5kgC1Zr8-QRUt-eNsXhr7w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/13] fontforge: avoid cloning uthash during do_compile
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
X-List-Received-Date: Fri, 30 Oct 2015 22:01:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 2:24 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Oct 30, 2015 at 10:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Oct 30, 2015 at 5:13 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>>  meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 11 ++++++++=
+--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b=
/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>>> index eb40eaa..21f955f 100644
>>> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>>> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D " \
>>>      file://LICENSE;md5=3D3f922b42ed0033fa0fd4cd3268f6429c \
>>>  "
>>>
>>> -DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
>>> +DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool ut=
hash"
>>>  DEPENDS_append_class-target =3D " libxi"
>>>
>>>  inherit bootstrap pkgconfig pythonnative distro_features_check
>>> @@ -20,7 +20,14 @@ S =3D "${WORKDIR}/git"
>>>
>>>  EXTRA_OECONF_append_class-native =3D " with_x=3Dno --disable-python-ex=
tension --disable-python-scripting"
>>>
>>> -EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS} -I${B}/uthash/src'"
>>> +do_configure_prepend() {
>>> +    # uthash sources are expected in uthash/src
>>> +    currdir=3D`pwd`
>>> +    cd ${S}
>>> +    mkdir -p uthash/src
>>> +    cp ${STAGING_INCDIR}/ut*.h uthash/src
>>
>> why not teach the component's build system to refer it from sysroot
>> and avoid copying this.
> Simple answer: This solution is far more simple: Headers are exactly
> there where Makefile would put them by cloning. Have no idea how many
> files expect a fixed location for the uthash headers.
>

whereever they are used in sources use #include <foo.h>
and make sure that it respects -I$(STAGING_INCDIR) that should do it.

> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

