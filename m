Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id CAB1475D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 22:17:01 +0000 (UTC)
Received: by igdg1 with SMTP id g1so21836662igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=l9cWwCw4gT6yeaUW/aHxBwNE542de49w8hyrBn8BLxs=;
	b=iSsEREQBfwh0/IoS8aRXCO/MT0RgarXyuiDw4GuaS+fHKyy+dcDhQ7WUfXrky9TBQf
	R9VsJ+ak73genl0noXnxnwLkcVVZXA6LmT3VCaDrqop7GBKbnP6nZjerI0no/s8kiN6R
	+qHI854z/KcU9e3WhDPzwfD6mXWO7KSuXgtRZlMJuhaadH7GVpX6U0WMBgtKZzLLewaD
	oCxNY4/ovjZqLj6CuaJ6lMKtGQvz/8u+MvheQmRaNvv1mf17by1HBiJHIZdQesaHf6vQ
	lty/qJiprr9anAAGFTIFPxJgHsIfkaXV/cOp0W/n/UnBzZwf09w41aZdRwrE6IbA9xE8
	D2aA==
MIME-Version: 1.0
X-Received: by 10.50.64.147 with SMTP id o19mr671613igs.52.1446243421903; Fri,
	30 Oct 2015 15:17:01 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Fri, 30 Oct 2015 15:17:01 -0700 (PDT)
In-Reply-To: <CAMKF1sqRg-WzvMpN=WwXj08zf7vS5kgC1Zr8-QRUt-eNsXhr7w@mail.gmail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
	<1446207225-15386-14-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1spmiD9ohoORXi7wnLBFNOFKeG0vgdpJ_n+-5b8-gp_F3A@mail.gmail.com>
	<CALbNGRTL5Q-enOj1dp4kZvu1=122ebseTizbhh+ondfH31ieHw@mail.gmail.com>
	<CAMKF1sqRg-WzvMpN=WwXj08zf7vS5kgC1Zr8-QRUt-eNsXhr7w@mail.gmail.com>
Date: Fri, 30 Oct 2015 23:17:01 +0100
Message-ID: <CALbNGRSuJKWXkJXgYORYqs9jNLS0_s5h9gtS8NFxXt_gSehFgw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 30 Oct 2015 22:17:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 11:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Oct 30, 2015 at 2:24 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Fri, Oct 30, 2015 at 10:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Fri, Oct 30, 2015 at 5:13 AM, Andreas M=C3=BCller
>>> <schnitzeltony@googlemail.com> wrote:
>>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>>> ---
>>>>  meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 11 +++++++=
++--
>>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb =
b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>>>> index eb40eaa..21f955f 100644
>>>> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>>>> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>>>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D " \
>>>>      file://LICENSE;md5=3D3f922b42ed0033fa0fd4cd3268f6429c \
>>>>  "
>>>>
>>>> -DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
>>>> +DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool u=
thash"
>>>>  DEPENDS_append_class-target =3D " libxi"
>>>>
>>>>  inherit bootstrap pkgconfig pythonnative distro_features_check
>>>> @@ -20,7 +20,14 @@ S =3D "${WORKDIR}/git"
>>>>
>>>>  EXTRA_OECONF_append_class-native =3D " with_x=3Dno --disable-python-e=
xtension --disable-python-scripting"
>>>>
>>>> -EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS} -I${B}/uthash/src'"
>>>> +do_configure_prepend() {
>>>> +    # uthash sources are expected in uthash/src
>>>> +    currdir=3D`pwd`
>>>> +    cd ${S}
>>>> +    mkdir -p uthash/src
>>>> +    cp ${STAGING_INCDIR}/ut*.h uthash/src
>>>
>>> why not teach the component's build system to refer it from sysroot
>>> and avoid copying this.
>> Simple answer: This solution is far more simple: Headers are exactly
>> there where Makefile would put them by cloning. Have no idea how many
>> files expect a fixed location for the uthash headers.
>>
>
> whereever they are used in sources use #include <foo.h>
> and make sure that it respects -I$(STAGING_INCDIR) that should do it.
>
I know for sure - but because of this is done by patches this might
cause additional maintenance when updating to next version of
fontforge. But let's stop this here - Seems important to you to fix an
error which nobody has detected before in a very clean way so I will
look into that and probably send V2.

Andreas

