Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCE86011B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Sep 2017 21:29:52 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id o22so1363865vke.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Sep 2017 14:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OK/QotPCDnC/gYDc5O/kO/3xtDBb8zMj2TPEPbo1s/w=;
	b=i1pIHgcqiGhfipbZx0s/kIE84qIxmRBij0GMDq/I2ohUOwW+VTEnP1I2LvChYmRLsP
	Ha/ZScVnbag5fTdllXxuYe+wpbzCIrCEy1L4zHFlugZk4Dc5J84iXz2Tlrroy/XdOoK9
	xlhrewIqpp8uDLqAYZTDtPHIzrNPUCdZkcDj1UFdlDqEo22EiA2hFm9qHJOdZkyi5AzO
	LphI9yvNVjcBwsTSxGMhe3S8JpRSIjFER0eRbTSXOh0le/cSQpSllJ16H4Sjb8vfguBt
	o9NSbo0QDcpk4pyLA13A3IawSU5wNvTehZmvwI/awRudPogjx8AXqy4TvqFyyRSKE4QP
	OMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OK/QotPCDnC/gYDc5O/kO/3xtDBb8zMj2TPEPbo1s/w=;
	b=JbXqRDGyooEGDh9R07OwcOCoDohSu3PNBeCwZZTGIrI9lbgDBPKbNjdwS3DfxWzv42
	Rtp9QgYxcXLVW+Zrd0d2yL5k5tyykRrfArkKGPfZ0nJN1BtrXdBg6Kmvjk3w6Ydjc9il
	jReB7hIwthfXL2NE+9IiWWD70mzyWm7s88aD29YNofuCQyHwX5PxyC9zSDNC8sip0R9I
	NYt9ELK+csdQu/A/eejDhWtAkhFijERxE7oIZj45bpJwygrfiuApLSBLFeqqbgsCUCff
	cmSfAaPO1fRAkRQmaiWWvqd4WTKZVFuS/AqMRqVEy1sQPiJs6WjjJrvcXJDYRMffpZ/L
	UEfA==
X-Gm-Message-State: AHPjjUgA7shNgR2oDZW0O9QhqqJHtVDwIXcr5+mlmTYW0ha4xHCM4/WI
	LLT8eF8n3g1wI6pI8Dw3fppD5WE0/g==
X-Google-Smtp-Source: AOwi7QAqEB8Hq0QNQx3YqdhxvgmHDjSbE/mpSwyJrhTG7oTvBrgMIv6uGTS3LyW3p/XM86yh/w/uuT3itN1f4hsaMgQ=
X-Received: by 10.31.128.14 with SMTP id b14mr4914454vkd.56.1504992594073;
	Sat, 09 Sep 2017 14:29:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Sat, 9 Sep 2017 14:29:53 -0700 (PDT)
In-Reply-To: <1504991970-596-1-git-send-email-athoik@gmail.com>
References: <1504991970-596-1-git-send-email-athoik@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 9 Sep 2017 22:29:53 +0100
Message-ID: <CA+chaQdFG-Az8_8cxxzLB3fwVjyAAPQe7+AOaCsdL+7s=FgvgA@mail.gmail.com>
To: Athanasios Oikonomou <athoik@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] v4l-utils: added missing dependency on udev
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
X-List-Received-Date: Sat, 09 Sep 2017 21:29:53 -0000
Content-Type: text/plain; charset="UTF-8"

Missing Signed-off-by line.

On Sat, Sep 9, 2017 at 10:19 PM, Athanasios Oikonomou <athoik@gmail.com>
wrote:

> Upgrading to newer v4l-utils 1.12.3 on commit
> f84a551f2d419df88b85987855fec866d9e84b4a
> Is causing issues because libdvbv5 now require libudev in order to work
> (commit db42484881bf5e6a902de51fe42444ddf286d52a on v4l-utils).
>
> First issue is missing dvb utils dvb-fe-tool, dvb-format-convert,
> dvbv5-daemon, dvbv5-scan, dvbv5-zap
> because libdvbv5 requires now libudev.
>
> Another issue was the failure of building dvb-apps (currently removed from
> master)
> because the v4l-utils-native is missing dvb-format-convert.
>
> This commit adds the missing udev dependency only on target and brings
> back the missing dvb utils.
>
> Adding udev on native build is not possible because nothing provides
> udev-native.
> ---
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
> index 42da5cc..dacc406 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
> @@ -7,6 +7,7 @@ PROVIDES = "libv4l media-ctl"
>  DEPENDS = "jpeg \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'virtual/libx11', '', d)}"
>  DEPENDS_append_libc-musl = " argp-standalone"
> +DEPENDS_append_class-target = " udev"
>
>  inherit autotools gettext pkgconfig
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

