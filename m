Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 87FB265CB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:57:35 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so16973075wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 23:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=B4ini1YqonDh0AjUFcV4G/0WHejNfavCTxTPbSbDodI=;
	b=o58Eff8vWokkcXuniXcRsj4gtDMKijdb6Y8sJN2mB3qVNkv7ElN2cOiwR+fXTDbrej
	wV4rk0q25s7GQ/8/Obb6Ax0uqNI6OkpcB+cfm2lKAqcWbcMVcmtgx7Q002vrWPllR8lQ
	mG6Vrhnyoivx4TaulAgJzM5Oe9ygQTxp9BGG8RA9VfqyKWrKPGepLOqSC3q2SxyAwC3H
	SgDE8hAWMkZvxZ+1D+XtrjN+HUxJDjS2hTuJFXf2sNVGVX80RPoj+l7VtAnidXsYb7zA
	EcL/IQoVnWooJpyQyT4NdZUtOrBYVotH1Vxsrg5v8L3Ef9GgnAKf2EUaAkHnCpzCWeFa
	naQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=B4ini1YqonDh0AjUFcV4G/0WHejNfavCTxTPbSbDodI=;
	b=AarfeeUfxTgav5VdAXQWFRdidwWczlVHfDRDU1r/fDTtt1Dc2JwNA7AqmxJVVlmVfT
	GQM/PWjuHh4EFYoJDnh7k/liVQEMFJ5x7KauNHdnsPTz0r656T6+NP4jmcPRmBVLS5p5
	rwefviDM9r00gk4WrDuCG8YdFKBJ8KWRu7pZf/yUVW+ZLwtKiDyUNyrls6LrgWr1Tg07
	YOmCU2LVAnMrsuU1PwRijLWd/kFHgGdqUl6JvaK9s0r5xuwbdtLx2K5YxCp5QCN614dM
	Q4ca2ombLqouCcT0n2HgsyCJNtiFihqoQyYzl9Z3+KjifCnrzbuFVm7WEtPvjAG7i1Tb
	P98A==
X-Gm-Message-State: AD7BkJLxjhKBP1Z9TdOxwje+sRg4HBS5UFsAejSPC9BtSex0urtXJTUQCMvJPRCSovWF8YqoH7v7SC5KqhHj3A==
MIME-Version: 1.0
X-Received: by 10.28.170.137 with SMTP id t131mr2110485wme.74.1457596655627;
	Wed, 09 Mar 2016 23:57:35 -0800 (PST)
Received: by 10.194.31.71 with HTTP; Wed, 9 Mar 2016 23:57:35 -0800 (PST)
In-Reply-To: <56E12501.1070909@mlbassoc.com>
References: <1457504433-21548-1-git-send-email-gary@mlbassoc.com>
	<20160309191532.GI2542@jama> <56E0FB3F.3020004@mlbassoc.com>
	<20160310073340.GR2542@jama> <56E12501.1070909@mlbassoc.com>
Date: Thu, 10 Mar 2016 08:57:35 +0100
Message-ID: <CA+chaQfjDkzXNBzMkRQg2xzqh43Ph-+iLQBPi5Rb+F1-C_1Xqg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] mpv: Media Player
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
X-List-Received-Date: Thu, 10 Mar 2016 07:57:39 -0000
Content-Type: text/plain; charset=UTF-8

I did and there was still:
FILES_${PN} += "${prefix}"

that's why I've asked again here.

On Thu, Mar 10, 2016 at 8:40 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2016-03-10 08:33, Martin Jansa wrote:
>
>> On Thu, Mar 10, 2016 at 05:42:39AM +0100, Gary Thomas wrote:
>>
>>> On 2016-03-09 20:15, Martin Jansa wrote:
>>>
>>>> On Wed, Mar 09, 2016 at 07:20:33AM +0100, Gary Thomas wrote:
>>>>
>>>>> mpv is a fork of mplayer2 and MPlayer. It shares some features with
>>>>> the former projects while introducing many more.
>>>>>
>>>>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>>>>> ---
>>>>>    meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 60
>>>>> ++++++++++++++++++++++++
>>>>>    1 file changed, 60 insertions(+)
>>>>>    create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>>>
>>>>> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>>> b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>>> new file mode 100644
>>>>> index 0000000..37e4b02
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>>> @@ -0,0 +1,60 @@
>>>>> +SUMMARY = "Open Source multimedia player"
>>>>> +SECTION = "multimedia"
>>>>> +HOMEPAGE = "http://www.mpv.io/"
>>>>> +DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv libxscrnsaver"
>>>>> +
>>>>> +# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
>>>>> +REQUIRED_DISTRO_FEATURES = "x11"
>>>>> +
>>>>> +LICENSE = "GPLv2+"
>>>>> +LIC_FILES_CHKSUM =
>>>>> "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
>>>>> +
>>>>> +SRC_URI = "
>>>>> https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
>>>>> +
>>>>> http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf \
>>>>> +"
>>>>> +SRC_URI[mpv.md5sum] = "9042bd3fbff2bc8ba0b7fadaa4a22101"
>>>>> +SRC_URI[mpv.sha256sum] =
>>>>> "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
>>>>> +SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
>>>>> +SRC_URI[waf.sha256sum] =
>>>>> "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
>>>>> +
>>>>> +EXTRA_OECONF = " \
>>>>> +    --prefix=${D}/usr \
>>>>>
>>>> why not ${prefix} and does it really need to be prefixed with ${D}
>>>> (unlike mandir bellow)? Ugly waf.
>>>>
>>>
>> What about ${D}?
>>
>> +    --mandir=${mandir} \
>>>>> +    --target=${SIMPLE_TARGET_SYS} \
>>>>> +    --disable-gl \
>>>>> +    --disable-libsmbclient \
>>>>> +    --disable-libass \
>>>>> +    --disable-lua \
>>>>> +    --disable-libass-osd \
>>>>> +    --disable-encoding \
>>>>> +    --disable-libbluray \
>>>>> +    --disable-dvdread \
>>>>> +    --disable-dvdnav \
>>>>> +    --disable-cdda \
>>>>> +    --disable-enca \
>>>>> +    --disable-libguess \
>>>>> +    --disable-uchardet \
>>>>> +    --disable-rubberband \
>>>>> +    --disable-lcms2 \
>>>>> +    --disable-vapoursynth \
>>>>> +    --disable-vapoursynth-lazy \
>>>>> +    --enable-libarchive \
>>>>> +"
>>>>> +
>>>>> +do_configure() {
>>>>> +    if [ ! -L ../waf ]; then
>>>>> +        chmod a+x ../waf-1.8.12
>>>>> +       ln -s waf-1.8.12 ../waf
>>>>> +    fi
>>>>> +    ../waf configure ${EXTRA_OECONF}
>>>>> +}
>>>>> +
>>>>> +do_compile () {
>>>>> +    ../waf build
>>>>> +}
>>>>> +
>>>>> +do_install() {
>>>>> +    ../waf install
>>>>> +}
>>>>> +
>>>>> +FILES_${PN} += "/usr/"
>>>>>
>>>>
>>>> ${prefix}?
>>>>
>>>> Does it install files in strange directories not covered by standard
>>>> FILES?
>>>>
>>>>
>>> Use of ${prefix} does seem correct, I've updated the recipe.
>>> Patch v2 has been dispatched, including a required update to
>>> the libass package which was necessary to get a fully functional
>>> mpv.
>>>
>>
>> Does it install files in strange directories not covered by standard
>> FILES?
>>
>
> No, but it doesn't seem to have any notion of adjusting the install
> directory except at configure time, hence ${D}${prefix}
>
> Please refer to the new patchset to see how I've changed the recipe.
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

