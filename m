Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE156C4DA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 06:19:09 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id u47so23351292qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 22:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/m1xotR9cqBFiMuh8SUrzIMzIp+V4rtXg/Qj4+ThdDw=;
	b=OCFJgCOiyRoCAURiTIVIN2c++Z46sCMVEkYRk//W3QTjArH8pYtQ9cDX+y9RQiwOaX
	oTI0owkzi4bdg4DsobNZrhecL6j6TW+vHUGMmyWdhYvIWr9PB/gM3pVSgRAtTuhWRUUA
	3D2dJ0SUmSxkMo/51JyaXX4UuLhBvBDrscCQZjJn7nexXVR98dxXu7pWwkeLe3FufoXX
	D3naATDCkGmPhHvRwpPFIIzfwq8pJV+D84Ssr2+FgXPjaiWi8PcqOFqJqw8nVB1Nid7u
	Y7OyBkWmULvg8HfIYAw/X5jl31wtAvLXAdMhsNyVLtw26ozjhNpsISe3cOnCeE1CBGkn
	SjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/m1xotR9cqBFiMuh8SUrzIMzIp+V4rtXg/Qj4+ThdDw=;
	b=hJ5bS5hRHp7Oopk6eDdzx6Pm28ISUYxByLohwhKHmGzbubitURhIYLr/VMc37nuXfq
	sEn/1PTzCzOyMHZfQR5YFMtBff3y1Y9DDU4/4LZrs29XPzBFFF1yTnzeqUpZjhtM9Aaz
	0NTkhOKR/s5KnYEf4a56kDV+ykm63cb9ifh8ARPs96Ue2hRiCvICOGGu6TBMDyi03HS2
	9NnW7U8QUahb2yPbgEy9Ey8X0lQ4Nzt1LQOTVQGe3antwrjexlIgYXK2Q6h9TO+PVlBA
	T/fRohYrGzS0XqT5y1tz18nbjtkS2UYTWIGi1NL7YaYLQmNmjES5ZxaqrfQClNTSakad
	Ztlg==
X-Gm-Message-State: AJcUukccmcV4nHXUR6nDix9w/mc2LHiElv9kmM8WPTaAIJUPY5Hd4ugN
	s+SqOnYi6zmhTN4OHUmvitTVR826D2Q3P2xbIGg=
X-Google-Smtp-Source: ALg8bN5cqdb4yv/d15S3IV/aP3J8i6KY24ts1uGtYVnx31wduSTdySuOAsWupGtyS5a9FWKQmBIAC3TIVo03VlFtHqk=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr19727697qte.29.1547360349850; 
	Sat, 12 Jan 2019 22:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20190112213132.2501-1-akuster808@gmail.com>
	<20190112213132.2501-5-akuster808@gmail.com>
In-Reply-To: <20190112213132.2501-5-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 22:18:44 -0800
Message-ID: <CAMKF1sqFoVK7ndgQ4msBjsHrFLmGbHbyPWZLs3grEvPhLwjMTg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/9] meta-multimedia: add pgk group and images
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
X-List-Received-Date: Sun, 13 Jan 2019 06:19:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 1:32 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../images/meta-multimedia-image-base.bb      |  7 +++
>  .../images/meta-multimedia-image.bb           |  3 ++
>  .../packagegroup-meta-multimedia.bb           | 53 +++++++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
> new file mode 100644
> index 0000000000..249f989a4b
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
> @@ -0,0 +1,7 @@
> +SUMMARY = "meta-multimedia build test image"
> +
> +IMAGE_INSTALL = "packagegroup-core-boot"
> +
> +LICENSE = "MIT"
> +
> +inherit core-image
> diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
> new file mode 100644
> index 0000000000..9f2fda9fef
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
> @@ -0,0 +1,3 @@
> +require  meta-multimedia-image-base.bb
> +
> +IMAGE_INSTALL += "packagegroup-meta-multimedia"
> diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> new file mode 100644
> index 0000000000..1251ac0a09
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> @@ -0,0 +1,53 @@
> +SUMMARY = "Meta-multimedia packagegroups"
> +
> +inherit packagegroup
> +
> +PROVIDES = "${PACKAGES}"
> +PACKAGES = ' \
> +    packagegroup-meta-multimedia \
> +    packagegroup-meta-multimedia-connectivity \
> +    packagegroup-meta-multimedia-dvb \
> +    packagegroup-meta-multimedia-mkv \
> +    packagegroup-meta-multimedia-support \
> +'
> +
> +RDEPENDS_packagegroup-meta-multimedia = "\
> +    packagegroup-meta-multimedia \
> +    packagegroup-meta-multimedia-connectivity \
> +    packagegroup-meta-multimedia-dvb \
> +    packagegroup-meta-multimedia-mkv \
> +    packagegroup-meta-multimedia-support \
> +"
> +
> +RDEPENDS_packagegroup-meta-multimedia = "\
> +    libdvbpsi libdc1394 gstd gst-shark \
> +    bigbuckbunny-720p tearsofsteel-1080p bigbuckbunny-1080p bigbuckbunny-480p \

some of these large'ish packages are blacklisted in world builds and I get

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86/987/console

so my question is should these packagegroups be excluded from world builds ?

> +    openal-soft dleyna-core dleyna-renderer dleyna-server dleyna-connector-dbus \
> +    gst-meta-base gstreamer gst-plugins-base gst-plugins-good \
> +    gst-rtsp gst-plugins-bad alsa-equal libdvdnav libmusicbrainz tinyalsa \
> +    fluidsynth cdparanoia vorbis-tools tremor caps libao libavc1394 \
> +    opusfile gerbera libdvdcss webrtc-audio-processing \
> +    rtmpdump libopenmpt schroedinger mpd mpc libmpdclient \
> +    ncmpc libmpd libsquish dcadec libiec61883 \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "", "", d)} \
> +    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna gst-fluendo-mpegdemux vlc", "", d)} \
> +    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265 gst-openmax", "", d)} \
> +    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "streamripper gst-plugins-ugly gst-fluendo-mp3 gst-plugins-gl", "", d)} \
> +    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "openh264 opencore-amr faac vo-amrwbenc", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-multimedia-connectivity = "\
> +    rygel gupnp gupnp-igd gssdp gupnp-dlna gupnp-av libupnp \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gupnp-tools", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-multimedia-dvb = "\
> +    oscam "
> +
> +RDEPENDS_packagegroup-meta-multimedia-mkv = "\
> +    libmatroska libebml \
> +    "
> +
> +RDEPENDS_packagegroup-meta-multimedia-support = "\
> +    liboil libmediaart libmediaart-2.0 gst-instruments libsrtp crossguid \
> +    "
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

