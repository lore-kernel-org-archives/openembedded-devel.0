Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1B47E417
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 13:16:17 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id a3so2028379pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/IALj3oH/Bnot77GyhNH5dcZ+pCZ1dcPDtKhdLIoenc=;
	b=D99xGLrCLuunLhJON9SB4/eV0VefoQ5ktCZmtBe9c5zKd2X6RaTN5JYjprCoJu03b9
	t3impbwre8jWIyeTFNNrDTraMbY4VEf1WlJCDpa5Nb+mnainu2S7P4vG9JJB8uOeY7Cg
	d58HxyTQceeq/BrKR8OoUhtolR1iiquqbGLlc2NnbICbz22vxFBP1YVZX63Q6voM70EL
	eDW4v/NmrMoz5Z5xzADTStr1lslNGbd4hGLZGcf9kbcu7ERijB1EUxRagAb9OYU/visY
	rgzGk4dCOV5a57nman+yhIyAU7rpC0Yn3oZhmrotm2xB/CC/UW1iBdaUv5fx8IuciR9I
	Ib0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=/IALj3oH/Bnot77GyhNH5dcZ+pCZ1dcPDtKhdLIoenc=;
	b=GlK9laG8qU9Gn+B7v45jb65/fU48ePkeQ/ly72nl0c3TUCZvhFm6Qea35Mm01lQhh4
	Qz2t4LXPdxV/6FUkVW95kWqRfSfmhUt9AF1dGAb3A3VqjpuRQjLjjAJMSVxYlpvTcnzx
	AUrlb0ulQXgB575TD7njc0WuOQri+6dC7F+Pr/9aYnqdjN/6P9xFJKQP/ZVzpeaOiqBS
	AfLucoIi4m4oMqKTPqaNmOlnb5P/kPz+m7fhLKrMbXUgNjPcCF40I7bkVWRUdaQaHKvZ
	p5SlzbV7VHFDPHFCI0RhfPQOoy7fttLmK6GMdvBRYgHVfLIlrhONcd7IE/c5g7Utp3QS
	qCzA==
X-Gm-Message-State: APjAAAXxuw5sxAGON5iHZlIe1mJ4gR/xVEhgo1i1xFMHSBPohot1QI52
	q84ccHxYMvXdHMlRVnR3mXk1Rmug
X-Google-Smtp-Source: APXvYqzg0oediV/A9GFAym1IytKvWAL2po/k2Dik693iYDT5vBXXeXtsSQPgM+x2B2pEHQ023XuReQ==
X-Received: by 2002:a62:5587:: with SMTP id j129mr3668893pfb.45.1559222178287; 
	Thu, 30 May 2019 06:16:18 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4865:9151:ec2:e220?
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id
	x17sm2356431pgh.47.2019.05.30.06.16.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 06:16:17 -0700 (PDT)
To: Scott Ellis <scottellis.developer@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1559207054-32056-1-git-send-email-scott@jumpnowtek.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d9e8c97c-892a-473b-c48d-eccffce6f071@gmail.com>
Date: Thu, 30 May 2019 06:16:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559207054-32056-1-git-send-email-scott@jumpnowtek.com>
Subject: Re: [meta-networking][warrior][PATCH] wireguard: Upgrade 20190123 -> 20190406
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
X-List-Received-Date: Thu, 30 May 2019 13:16:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/30/19 2:04 AM, Scott Ellis wrote:
> Fixes issues with kernels 5.1 and greater.
>
> Backport from master fc1b5310b28f70900a8a432048e08ee06ae309d7

What is in this update?

- armin
>
> Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
> ---
>  ...eguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} | 0
>  ...ireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} | 0
>  meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} (100%)
>  rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} (100%)
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
> similarity index 100%
> rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb
> rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
> similarity index 100%
> rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
> rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> index 8314e79..5cf745e 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
> -SRC_URI[md5sum] = "8a0a232f65d5d86dd408efd9ac30bcf9"
> -SRC_URI[sha256sum] = "edd13c7631af169e3838621b1a1bff3ef73cf7bc778eec2bd55f7c1089ffdf9b"
> +SRC_URI[md5sum] = "c11254fe48695e61c145a7e82756ecba"
> +SRC_URI[sha256sum] = "2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b"
>  
>  S = "${WORKDIR}/WireGuard-${PV}/src/"


