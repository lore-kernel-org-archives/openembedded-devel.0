Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id DC31F77E1D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:45:00 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id g30so4019588uab.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dEWBa5i6osf4OyfxNk0KK5AOit0q0ybh0kuRzUv4eWk=;
	b=BFZduYu+VEP8sbam0CDy6kpDI0GA4Tnq8WHd3004kg12FxtfL5jRzHBdrRbVjRKEcy
	LQh7MXLx0DgY5BXvJr8e/XlV+zyQqPBo1n4+ucMkdjZQeGQWX75S3M2K77nfnJ8VoRKY
	D7XhNlFr6QLERndGvvcjUp2O6/4Vr2kGdkuK3KCZu8xiUHd9X1Hlh0nBM04y1k7fpqwm
	mYZjJJW+Ln3DrqY/fBlbEwzCjnht9nRcllN8Zbh/blvs/AyXKL3o8A3pMehqcvANU26i
	48IGV6oOlA5ulLAxp1EUm6+TWx77L0l2w47NGhblSlTZahFUmEOsC/MJbP8cg6WZlQWK
	sk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dEWBa5i6osf4OyfxNk0KK5AOit0q0ybh0kuRzUv4eWk=;
	b=n/2jo2xsyBbRyqRCYQXQlLAERoDhfmNQPmF/xiynyCC5azyaRhq8xUzlMpXWTYW+8p
	ZEkrRHBb1veJG4KRMYkO2LX8/PBErHwRnYPUw+vI7wTJV9tWcvdiNwyaZyFj8Q+2DMlt
	HgeOiKO2ZyxpPU0pSBnoJj1QDUwMB0sxnJ5mu9nXVSbw3duIImKuaMXFTcaB1f1UJ4tl
	hMJiL8TWG6Q8uNKyp/mPwU33HuLSITcTsv1ZRYwhnhslWsm2HwfchyFRD0wsiwx7Z1za
	PXxSsedGkLMcy0EBNhby1CKplGz4BxmGQYalZxn+aLGE2Mc51N+JFcnYzwqqVYzhkeZf
	HutQ==
X-Gm-Message-State: AN3rC/5q+5oyyBAD4z1DHSbgrwl4SZvN5QgZw/XKN00kpNEe1FGUNHKw
	7amdv7cNhZxiJeyCqCY1DY7RxwrYmw==
X-Received: by 10.176.24.134 with SMTP id t6mr1331340uag.79.1492087501751;
	Thu, 13 Apr 2017 05:45:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.81.53 with HTTP; Thu, 13 Apr 2017 05:45:01 -0700 (PDT)
In-Reply-To: <CALbNGRR0K_YiR-OF+x2_0VTgWdMDRCq-wuhsj4CjFr4RHA2VTw@mail.gmail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
	<20170412195638.3243-27-schnitzeltony@googlemail.com>
	<58EF4902.2090906@linaro.org>
	<CALbNGRR0K_YiR-OF+x2_0VTgWdMDRCq-wuhsj4CjFr4RHA2VTw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 13 Apr 2017 14:45:01 +0200
Message-ID: <CALbNGRSB8VrWzs5+BRVEPZYq48pf0322OR1X4Fg-Yk3ZA5jqug@mail.gmail.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 26/29] mpv: add PACKAGECONFIG for drm/gbm/vdpau/wayland
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
X-List-Received-Date: Thu, 13 Apr 2017 12:45:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 11:52 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Apr 13, 2017 at 11:46 AM, Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>> On 04/12/2017 10:56 PM, Andreas M=C3=BCller wrote:
>>>
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>>   meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb | 13 +++++++++++--
>>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
>>> b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
>>> index 3f46dc1..60f653a 100644
>>> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
>>> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
>>> @@ -3,7 +3,7 @@ DESCRIPTION =3D "mpv is a fork of mplayer2 and MPlayer.=
 It
>>> shares some features wi
>>>   SECTION =3D "multimedia"
>>>   HOMEPAGE =3D "http://www.mpv.io/"
>>>   DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
>>> -           libxscrnsaver libv4l libxinerama libvdpau \
>>> +           libxscrnsaver libv4l libxinerama \
>>>   "
>>>
>>>   REQUIRED_DISTRO_FEATURES =3D "x11"
>>> @@ -24,14 +24,23 @@ SRC_URI[waf.sha256sum] =3D
>>> "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f2
>>>   inherit waf pkgconfig pythonnative distro_features_check
>>>
>>>   # Note: both lua and libass are required to get on-screen-display
>>> (controls)
>>> -PACKAGECONFIG ??=3D "lua libass"
>>> +PACKAGECONFIG ??=3D " \
>>> +    lua \
>>> +    libass \
>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
>>> +"
>>> +PACKAGECONFIG[drm] =3D "--enable-drm,--disable-drm,libdrm"
>>> +PACKAGECONFIG[gbm] =3D "--enable-gbm,--disable-gbm,virtual/mesa"
>>>   PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
>>>   PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass"
>>>   PACKAGECONFIG[libarchive] =3D
>>> "--enable-libarchive,--disable-libarchive,libarchive"
>>>   PACKAGECONFIG[jack] =3D "--enable-jack, --disable-jack, jack"
>>>   PACKAGECONFIG[vaapi] =3D "--enable-vaapi, --disable-vaapi,libva"
>>> +PACKAGECONFIG[vdpau] =3D "--enable-vdpau, --disable-vdpau,libvdpau"
>>> +PACKAGECONFIG[wayland] =3D "--enable-wayland, --enable-wayland,wayland=
"
>>
>>
>> Should it be:
>> PACKAGECONFIG[wayland] =3D "--enable-wayland, --disable-wayland,wayland"
>> ?
> Yes - Thanks - needs V2
>
Saw that Martin already applied and sent out a fix on top.

Andreas

