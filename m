Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8D179C64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 23:03:18 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id e3-v6so8719404oiy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yEPWS+08OCK4S+unz0UTY7TR74wg5UWfrk3McqhgrBQ=;
	b=qewdkoCL6PxKJm54f9A7ZfjKwYzjQdvDJ9VE8zjIhKxMj3oeEMf38xX/vDLTVUurlI
	CCaBMfmeYFHgEn/hiij/T0xij4FkJdEf5qr/npLprrqjTS4bVBLkcxtR79V/CILWTFoj
	2xsNbdfZ5FEDATIxNiJ1SzJcEZ04PAOx1Qvz7uDd9Lz7sVIJvCLjwp0gNwTq0GpfJ1uQ
	8bMLzAeZSay+dgLYIUq181e/v7hVT4+iN/xQ47BrRFsJps/slqHcpGboPGJBm5mZ4ZP+
	I7ckJ2amHwnXVdnvJj6Au5YTKbqg3r+UaUkiCzs/WQBR8WlXSQh9CIm0XVznHVNoljYb
	5sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yEPWS+08OCK4S+unz0UTY7TR74wg5UWfrk3McqhgrBQ=;
	b=bMghMpFD/LNvFf+nDHoC+zln9pgCJJkrYRPoXNBX9l4aWMmkHEDZc4akgbDLPRBz6o
	T7Zwhb4nsLMjaLKpBoHAPT8IU8JFgL6bc8abt6aadsMym2YvIjQeGgDyY/9MpNoA2RJa
	Zt9LKojMNTd25v2X7Wuliek5zjM0oxcJvEMFxu5pnQmL/Fq6I54midrYsuMp1KV+mEKi
	oU1rMo9SDyW1oJhA6s1BYBD8Rnzh9BTniXP89NDvrhGlAisrTOuAk6FQVodtUNf8XGtm
	X58+J7+qdjnoR7HQ2k5NTimdm0DTA/7efznpINCe7TXYiTW7Xjj6S612LMOHZ6Gf2gfH
	huwQ==
X-Gm-Message-State: AGRZ1gJRzzDIqV6MjEq93HxUkRg8Qa2p+VUB0DpL2JHuUpuOK3qR4Cr5
	PZNQTZat+m+HL1tjl5EA8y7PPIBBtd5XkG2W+q19RQ==
X-Google-Smtp-Source: AJdET5fsq0+3GqPUA9Drl4elCWD3+JO9ZbrA0CA3ayFV+/KWRlKDzPzBdrmNs1iBeFDSSerb99uz9ZP3HDXbKZYLq2I=
X-Received: by 2002:aca:3f87:: with SMTP id
	m129-v6mr9142034oia.228.1540854199958; 
	Mon, 29 Oct 2018 16:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<9f5b028fdf90a7650a62e538889580dc31864a6b.1540830650.git.brendank310@gmail.com>
In-Reply-To: <9f5b028fdf90a7650a62e538889580dc31864a6b.1540830650.git.brendank310@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 30 Oct 2018 00:03:07 +0100
Message-ID: <CALbNGRSPpACzKV+5-RsGvJVRdMf5H_S+OTLX41YJGjGX6mJj6w@mail.gmail.com>
To: brendank310@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 14/16] packagegroup-gnome3-base: add packagegroup for installing gnome3/gnome-shell
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
X-List-Received-Date: Mon, 29 Oct 2018 23:03:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 5:41 PM brendank310 <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../packagegroups/packagegroup-gnome3-base.bb | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb
>
> diff --git a/meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb b/meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb
> new file mode 100644
> index 000000000..8484087b8
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "All packages required for a base install of Gnome Shell"
> +SECTION = "x11/wm"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +PR = "r0"
^ Please remove - we have auto-pr
> +
> +inherit packagegroup distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +RDEPENDS_${PN} = " \
> +    packagegroup-core-x11 \
> +    xinit \
> +    atk \
> +    at-spi2-core \
> +    at-spi2-atk \
> +    cairo \
> +    gnome-shell \
> +    gnome-bluetooth \
> +    upower \
> +    pulseaudio \
> +    librsvg \
> +    ibus \
> +    gnome-desktop3 \
> +    accountsservice \
> +    gnome-settings-daemon \
> +"
> --
> 2.17.1
>

