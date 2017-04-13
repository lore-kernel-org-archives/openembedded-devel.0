Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 85F0477A8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:52:31 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id q26so4145280uaa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HV643QXdkpszS0tTT3qdezO2VUAfwZijeRNbAtiW13M=;
	b=IQ6cfRP0KFV5cVyfWhtN8gAZZauzObUIXSgGs1wK+59BljKMi8AwpbYBUgPZL2PV6c
	Gbb1jjdtgs3wdMQqOuFG+3uHiwDoR2yBqDasReFZbZEd5YDCRnS2T0iRomH634whdET+
	sn/bvEqsBBsXhVL1dl9PZvIC2/hSoMkydkWmIzK646mM9kyQHJDXPSLEzVRP+SN0ehcw
	ELOSZJw68DBELyV/+my9Cnad+b+jlY6D/nNma6Xn9k+glBSCM02c60nkTjR9gLlzaG8+
	Okav2D4jj3+9lgNdZsvGWQZmBlcD8tZfhhSMPjwUqKFuzA5742E9fRGPKeuCgRnB6KTw
	6Zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HV643QXdkpszS0tTT3qdezO2VUAfwZijeRNbAtiW13M=;
	b=azlD6c4+H0lNZLd4hLq31QGGzXiPUIDnY2Bj5lw/naztUp+kA2JuK6wfF4M/FduBCu
	Z8Yp+pYu+cScFVKi76mYttHeIUJS3o2DX1nuGX+2/k3kaClH5Vt6CNGMeEYY3cUFaDrA
	JHtC7QLng5ZLZOKSD6TcfwlpxdT69llMDFTsPP0eF3Uj0Fs13H6neOrIhx+WzS46PcER
	eiVdfBzjLsa9SiB+f2xzenOpR8O/jlnMYW+rxSkrwC0Tznu3kAe/bHxmugOQ4ICrBa8J
	eSyFhAo8xrDj4a29eUCOFMmyECyoiXthfg3QJ9ZgX1LgO59P+MXVsRE78yj8PRN91bKo
	6N7Q==
X-Gm-Message-State: AN3rC/4Np6tnoq66AS+FNj/0SqMz3+17TblzorvyJz+B9bHZLI1THnDv
	mZgExryMvaUS9A5rSv0qe3ChOvxN+A==
X-Received: by 10.176.90.200 with SMTP id x8mr1038749uae.44.1492077152328;
	Thu, 13 Apr 2017 02:52:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.81.53 with HTTP; Thu, 13 Apr 2017 02:52:31 -0700 (PDT)
In-Reply-To: <58EF4902.2090906@linaro.org>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
	<20170412195638.3243-27-schnitzeltony@googlemail.com>
	<58EF4902.2090906@linaro.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 13 Apr 2017 11:52:31 +0200
Message-ID: <CALbNGRR0K_YiR-OF+x2_0VTgWdMDRCq-wuhsj4CjFr4RHA2VTw@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Apr 2017 09:52:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 11:46 AM, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
> On 04/12/2017 10:56 PM, Andreas M=C3=BCller wrote:
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>   meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
>> b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
>> index 3f46dc1..60f653a 100644
>> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
>> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION =3D "mpv is a fork of mplayer2 and MPlayer. =
It
>> shares some features wi
>>   SECTION =3D "multimedia"
>>   HOMEPAGE =3D "http://www.mpv.io/"
>>   DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
>> -           libxscrnsaver libv4l libxinerama libvdpau \
>> +           libxscrnsaver libv4l libxinerama \
>>   "
>>
>>   REQUIRED_DISTRO_FEATURES =3D "x11"
>> @@ -24,14 +24,23 @@ SRC_URI[waf.sha256sum] =3D
>> "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f2
>>   inherit waf pkgconfig pythonnative distro_features_check
>>
>>   # Note: both lua and libass are required to get on-screen-display
>> (controls)
>> -PACKAGECONFIG ??=3D "lua libass"
>> +PACKAGECONFIG ??=3D " \
>> +    lua \
>> +    libass \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
>> +"
>> +PACKAGECONFIG[drm] =3D "--enable-drm,--disable-drm,libdrm"
>> +PACKAGECONFIG[gbm] =3D "--enable-gbm,--disable-gbm,virtual/mesa"
>>   PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
>>   PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass"
>>   PACKAGECONFIG[libarchive] =3D
>> "--enable-libarchive,--disable-libarchive,libarchive"
>>   PACKAGECONFIG[jack] =3D "--enable-jack, --disable-jack, jack"
>>   PACKAGECONFIG[vaapi] =3D "--enable-vaapi, --disable-vaapi,libva"
>> +PACKAGECONFIG[vdpau] =3D "--enable-vdpau, --disable-vdpau,libvdpau"
>> +PACKAGECONFIG[wayland] =3D "--enable-wayland, --enable-wayland,wayland"
>
>
> Should it be:
> PACKAGECONFIG[wayland] =3D "--enable-wayland, --disable-wayland,wayland"
> ?
Yes - Thanks - needs V2

Andreas

