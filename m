Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 63DC871CAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 12:15:54 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u65so20947916wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oOS2pKm4CvcDYx+qJcm5WK928i8ijaLSBvj1BegkVxo=;
	b=ih32TmZ0lIAOnwI/FKKKtII1/xfnIo50MlxVRLH9Cumx3W8DsSwGX4aN3JSyRyMBJE
	aFkFG++5S6KAMu+VRMj0LxXJedHtRirMR3gbpecWV5/wJRjHUvox9HnVBGjloxALORoo
	sv+9PXmIiHpYXMGrKvsifuYBrECpxYp8fusoi/EDT5sAw6vLFu0z2UwZPUGR2yWHKgYR
	33AN/jQBvoCJUHriAKmp9V3e5XHGC87KmB4rebLwSbNpRh9bkWgEzJ8RuLJvu5H7G+w1
	1vKD0N/Y7dagXsRhkZKOlCvt0G/5u7CD4nF21xts2F3WSNNgO05KZpJs/Vo1Fjbbx52f
	Znbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oOS2pKm4CvcDYx+qJcm5WK928i8ijaLSBvj1BegkVxo=;
	b=oQqQF7Kb9XPPZz4SnYt2NpaSJS3s0jq0N3cgB6IOs27vRw9MpjyXGzdgR/S97s/MAC
	ljWjOSot9+54Q9cxnwMCDjAfLR8An7LxK565OA3K7fa7uYny6N3pLg7cDN0hWb5ZmQnt
	9388aV4up2olXbMhc3EFc+/4X30EiP6is6tvXli2Eo6HGxgsxZ2m0f7oc4Iv2Gg/B9sn
	5WAlO9SPP8WDRhBDyhK/erRPhAtotDoeAnts+Y0MUC3M7B1NY1Fn7LW0Cv1aKlb/DduN
	C0PwdLoVtWwachAWhglbQrNqDkoClzZaqMQxTieCBendTaPm+IjAAD9ENYxLi1hFv6hZ
	qEgA==
X-Gm-Message-State: AN3rC/6GyNGEmuRbv0frsjMx7H+dU2TCaD9wrUwKCEqnUUvZ9GA+TaWW
	mJxp772tPCVsvxjmcX0Oqdsq/XxTBQ==
X-Received: by 10.80.149.203 with SMTP id x11mr4899968eda.181.1493122556078;
	Tue, 25 Apr 2017 05:15:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 25 Apr 2017 05:15:55 -0700 (PDT)
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Apr 2017 14:15:55 +0200
Message-ID: <CA+chaQfBtntyaOinCNoQ-dNe3KFJBG6Uk8iuqa29KN+UUGTNhg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Jose Lamego <jose.a.lamego@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][ 01/11] mpv: Add libxkbcommon when configuring with wayland
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
X-List-Received-Date: Tue, 25 Apr 2017 12:15:55 -0000
Content-Type: text/plain; charset=UTF-8

Patchwork really doesn't like you, another set of patches completely
ignored by patchwork.

Jose: PING2, can you check the patchwork changes which were integrated in
last few weeks?

On Tue, Apr 25, 2017 at 5:47 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Fixes
>
> Package xkbcommon was not found in the pkg-config search path.
> Perhaps you should add the directory containing `xkbcommon.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'xkbcommon' found
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> index ce7b3d1e1..b1da2175d 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> @@ -37,7 +37,7 @@ PACKAGECONFIG[libarchive] = "--enable-libarchive,--
> disable-libarchive,libarchive
>  PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
>  PACKAGECONFIG[vaapi] = "--enable-vaapi, --disable-vaapi,libva"
>  PACKAGECONFIG[vdpau] = "--enable-vdpau, --disable-vdpau,libvdpau"
> -PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland,wayland"
> +PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland,wayland
> libxkbcommon"
>
>  SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
>
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

