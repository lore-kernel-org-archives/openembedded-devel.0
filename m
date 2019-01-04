Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 890C47BE1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jan 2019 17:53:54 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id o125so21957884qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 09:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Icy8Y1LdCm7raZFpI3Nwzr/fQDNcnWUGQd8znilu07o=;
	b=CGHV+ffIuebOPbPkFxgibkVinSCmxabjbiIXCcoPK679CDg6N0D7iGEh/8KBqCfRAx
	gbgw8rd41g4SOcej/eVEntx4x7Pk2LIMF0mz8nY4+j1XDPX3Yd9TV3o1OEiXL29xDFFg
	8sPjkv1H+zV+hfGL7Ao7qaiP4L5xtHSShOJYhej8ESDuSrC0Of2Y2Nr3x36y+VYOYHPZ
	sOzJzM362ZPz/bUp6V1g7dAR1qUvlLsq8hBhClyiYFfT9e3fGV3JT71z46fwg3j9uQvZ
	j4u6HBhScaC937soYuIwN4oz4OfJm5psp7750hcL9lWG5bjB//LQC0H9oi5OsqZYTLk6
	lcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Icy8Y1LdCm7raZFpI3Nwzr/fQDNcnWUGQd8znilu07o=;
	b=LLoapsaHPky+738aE/XTUdCy1IgBNPzkznZWeLqxuJJ25l6JnQzf4eJy3VTW/T976v
	Vf4FeJaoesIuNuuiQwTbP8OFuDTytQit/QmHpsKWa1mJJGyvHiW38DMkjcyWZ5uCwx9s
	EIYn+thLCLlxepU+38PgDPZ2CgMBJ4EVa6UcgPUiVnbqnG4ETTq/tqecY4ZXUrob1TCB
	W2GDbIRsmNV8oCl2fQ/IpEtFyHsJXJHxulRvzNwoEyv8WhZ4HkS+OkflQV1XTQAsazM7
	qIFABdQQcpm0aG/auM8tAD5VP76tX77cZV3e70XAAgKVrNJpkracD0s6qTcZhkHRZ2SH
	SonA==
X-Gm-Message-State: AJcUukcRHpd16RMWtBsgCQFKtBE94+RWyQukdGlqLqnDqU8iJN5p+sxa
	CuOD3W+JWFM9CM/AJzh/Yqt8m0TZXD6U7a7OOEg=
X-Google-Smtp-Source: ALg8bN7RTSKNbOoPB8mP+RXLu2Fful0JKXWQoL3jNWbcgPO7YEEXgFeTUGZ6Dmb+LiWA3G/B0qHslp4KNgs/r7H/rkM=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr47484065qkf.223.1546624435011;
	Fri, 04 Jan 2019 09:53:55 -0800 (PST)
MIME-Version: 1.0
References: <1546597268-28446-1-git-send-email-athoik@gmail.com>
In-Reply-To: <1546597268-28446-1-git-send-email-athoik@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Jan 2019 09:53:29 -0800
Message-ID: <CAMKF1spPv3_R+0AEJqNhryyweBYS+_tEXDdGHALT8mWDsx_VMg@mail.gmail.com>
To: Athanasios Oikonomou <athoik@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] fuse-exfat: fix multilib build
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
X-List-Received-Date: Fri, 04 Jan 2019 17:53:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 4, 2019 at 2:25 AM Athanasios Oikonomou <athoik@gmail.com> wrote:
>
> Replace the PN with BPN to fix the multilib build.
> ---
>  meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> index 99bf2be..ea00222 100644
> --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> @@ -17,5 +17,5 @@ inherit autotools pkgconfig
>  SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
>  SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9"
>
> -S = "${WORKDIR}/${PN}-${PV}"
> +S = "${WORKDIR}/${BPN}-${PV}"

Could you try using S = "${WORKDIR}/${BP}

>  EXTRA_OECONF += "sbindir=${base_sbindir}"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

