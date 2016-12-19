Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id B5C0977269
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:27:56 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x186so13214496vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 05:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=fAp9AEj0StSOcwxdJwC8hVl+HmYt1rmHPbXSrn7wDME=;
	b=svwZK6Jl2kWNOCzHsipFQj0kA7u+qqsuYhSgCaTBHt8Qzb1ypmIt8HNJMpnYFJjNjQ
	C445/JltP/5b8YfAVY9gFtWHCzVwHTF5Ex9EyyCoVAL4eHmnb4KHlk5K00+K2hl63MsN
	QrozVzt/iPuLyKxC+XbAz6ZHFOL7i03n/Pdbbfp6qHVk8U98/xRiVUJY3DZTiQ1IuaPA
	WqSL7MfmRt0dnnci2x0Pdn1hnA6x3d9dlvk4NGD1OumYhaFBRf7XLEBHw5ld+GeyD3pJ
	4Pos2S7XoFoo3IpJ8yPK7rc3xYupd24eMtgWxoT4HA8geILlvcjFVPsFP1to5rcRhRMh
	SG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=fAp9AEj0StSOcwxdJwC8hVl+HmYt1rmHPbXSrn7wDME=;
	b=GJvSwkX61/sFwGfGV9Sl4wRGKM6MWgbrl8b3J5xMcaI9/0NP0jEpTiuZPUyoBSdSRS
	VTAm6q80lCydYfAu9ndtq4l/JL6ksJiqNvrnt8gComu9LLTbe6AphHJ1tA1BYU8Fyo73
	WDTv86jYg/pKFCOnDID9FtXSRlTg361bNaZTMTFDRATDOOWTctwQ1jHrCOVvrGxeh8eq
	xP3wz1hJoagoH8+RVEZa5nhUJ2Xb/AkGaCHSVw9oTvIsImF4QYNVOJKIfdrZWZGA3NlZ
	emsJheFGFV/cx2A61+e5I0fy3fGFI6Hq1nlVHSHW6BjqzPk6CMy/Af0l7vZPna+3iYGp
	wHIw==
X-Gm-Message-State: AIkVDXK3A75Y7Z+uCEMOegh9fexJuJP6Rtmk/I4a12SSBLqooONutDXCUrk1i8VYXI0S9zf4H3rXPeWI3LIedA==
X-Received: by 10.31.242.74 with SMTP id q71mr5987996vkh.46.1482154077522;
	Mon, 19 Dec 2016 05:27:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Mon, 19 Dec 2016 05:27:57 -0800 (PST)
In-Reply-To: <1482152989-3982-1-git-send-email-armccurdy@gmail.com>
References: <1482152989-3982-1-git-send-email-armccurdy@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 19 Dec 2016 14:27:57 +0100
Message-ID: <CALbNGRT1MSt=O90M6g9GHMmqm8nYSk4mdcSm59EK2u=f4i-qKw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libconfig: add support for libconfig-native
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
X-List-Received-Date: Mon, 19 Dec 2016 13:27:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 2:09 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> index fb6e50e..94daa88 100644
> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> @@ -12,3 +12,5 @@ inherit autotools-brokensep pkgconfig
>
>  SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
>  SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
> +
> +BBCLASSEXTEND = "native"
> --
> 1.9.1
>
Please tell us why libconfig needs native biuld in commit message.

Andreas

