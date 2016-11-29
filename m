Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id C9A9F719DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 22:43:51 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x186so7853713vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 14:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=NeC4pclS+sqwUFGNTE7zyU7Q/i5zactLyqMD+AzW3ec=;
	b=BeD3Ok7PqclBLWfYTuTgWNDBm/+UG6Di7w8RT5+xyfr5cdQ3c0mkKKXZ9qW7HhkloY
	bG+18KY2eLwrDUU87esPZIxF71LM+0NDA1/dFU9tL1umOXyQiqogsHkBRXFgj1gWoViH
	vfX4/0riUC5FMgHp4rbeMmakfcU/SXFoWA23XXHpcCMz0Ekvahe6Nos+NibdrOsjVV7T
	eTRKNfnwA9zMgWomT5AZsgOnbK8YkhHWQiMTYHRwn5rdohUatztg6qqEq1WmDGQpx8jn
	w4eykpRzbRRa3KoidCLUJaQTn/2y5KNofCGZg8AyI0lly8NXAoJ/57o4E++oF1ypw0US
	FLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=NeC4pclS+sqwUFGNTE7zyU7Q/i5zactLyqMD+AzW3ec=;
	b=mLsH985MfiRoG8eClyllDhU9ZG5aP7hlLjcKdyrbsMmRg+oeIV+rt2RiAl7rbwG4/w
	wxfFDYDRXZCZ+wEoViXCf2IUWD5iL9bDgF16XEQh8bkRtfwbSJ70VwmwLUdNlalszF7Y
	8AyJpsCEL3+CPaupOUAm2jUqG3MLZRKuFMk06jaMX3Xu4e8zDb/cPxdYK3U4wkjIdmjT
	WFjWNMW1u8f1BQFr6506KO3etyIUhgeefAikxkMsUUsDmxMoI/NLCxyodhN0E2v+w6W+
	u00+yNyQMdZWcTTeoMLkng2cohOflPDb0YbCIO2rqftAt/KnyGOxr7ID8A1vV5BJPu2Z
	tVOg==
X-Gm-Message-State: AKaTC01VVfEyp6wVFRNhhm8aWZD0Bf8YvMk2KiiCbF5WG0thddEEBisWozPR1lvkZTGc74tfYsvn+MHL1AmyEg==
X-Received: by 10.31.8.8 with SMTP id 8mr10646573vki.173.1480459432715; Tue,
	29 Nov 2016 14:43:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 29 Nov 2016 14:43:22 -0800 (PST)
In-Reply-To: <20161129195922.GD2700@jama>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<20161129195922.GD2700@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2016 14:43:22 -0800
Message-ID: <CAMKF1sog=+RPyNRKK1hrDJDOJhGm3ycJD=H0iyFbdbfomfajtQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Tue, 29 Nov 2016 22:43:52 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 29, 2016 at 11:59 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Nov 28, 2016 at 02:57:59PM -0800, Khem Raj wrote:
>> This recipe is used by intel and amd BSP layers
>> additional copies are also there see
>> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libva
>
> I'm sorry to report more and more issues, but this is causing few more autodetected dependencies

its good. We will keep fixing them :)

>
> mpv-0.15.0: mpv rdepends on libva-x11, but it isn't a build dependency, missing libva in DEPENDS or PACKAGECONFIG? [build-deps]
> mpv-0.15.0: mpv rdepends on libva, but it isn't a build dependency, missing libva in DEPENDS or PACKAGECONFIG? [build-deps]
>
> and there is another one caused by libvdpau I haven't noticed before:
> ffmpeg-3.2: libavutil rdepends on libvdpau, but it isn't a build dependency, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-graphics/libva/libva_1.7.3.bb | 48 +++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>  create mode 100644 meta-oe/recipes-graphics/libva/libva_1.7.3.bb
>>
>> diff --git a/meta-oe/recipes-graphics/libva/libva_1.7.3.bb b/meta-oe/recipes-graphics/libva/libva_1.7.3.bb
>> new file mode 100644
>> index 0000000..9994158
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/libva/libva_1.7.3.bb
>> @@ -0,0 +1,48 @@
>> +SUMMARY = "Video Acceleration (VA) API for Linux"
>> +DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
>> +and API specification which enables and provides access to graphics \
>> +hardware (GPU) acceleration for video processing on Linux and UNIX \
>> +based operating systems. Accelerated processing includes video \
>> +decoding, video encoding, subpicture blending and rendering. The \
>> +specification was originally designed by Intel for its GMA (Graphics \
>> +Media Accelerator) series of GPU hardware, the API is however not \
>> +limited to GPUs or Intel specific hardware, as other hardware and \
>> +manufacturers can also freely use this API for hardware accelerated \
>> +video decoding."
>> +
>> +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/vaapi"
>> +BUGTRACKER = "https://bugs.freedesktop.org"
>> +
>> +SECTION = "x11"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
>> +
>> +SRC_URI = "http://www.freedesktop.org/software/vaapi/releases/libva/${BP}.tar.bz2"
>> +SRC_URI[md5sum] = "dafb1d7d6449e850e9eb1a099895c683"
>> +SRC_URI[sha256sum] = "22bc139498065a7950d966dbdb000cad04905cbd3dc8f3541f80d36c4670b9d9"
>> +
>> +DEPENDS = "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 virtual/egl"
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF = "--disable-dummy-driver"
>> +
>> +PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
>> +                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
>> +PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
>> +PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland"
>> +
>> +PACKAGES =+ "${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland"
>> +
>> +RDEPENDS_${PN}-tpi =+ "${PN}"
>> +RDEPENDS_${PN}-x11 =+ "${PN}"
>> +RDEPENDS_${PN}-glx =+ "${PN}-x11"
>> +RDEPENDS_${PN}-egl =+ "${PN}-x11"
>> +
>> +FILES_${PN}-dbg += "${libdir}/dri/.debug"
>> +
>> +FILES_${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
>> +FILES_${PN}-tpi =+ "${libdir}/libva-tpi*${SOLIBS}"
>> +FILES_${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
>> +FILES_${PN}-egl =+ "${libdir}/libva-egl*${SOLIBS}"
>> +FILES_${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

