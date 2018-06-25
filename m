Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 188EB65CE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 09:05:26 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id e135-v6so4642281oib.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/spJv0WsN6EeHPKS8vzBa+xNCk7WUqTQism0en2txOE=;
	b=e3u13T0JSuB2d0ASgg0Z88g0hzpoqZdjC8aw/r/EKUNGjINHvLnwGyoNwwOlo4glHe
	7rAzqcNouUkLSJ4l8uJITHhBeoT2BYaXfVR+kThbYm8wgM390YCE8yG7WkdLYNMTUmzt
	jaCuZvTg6ceVxhtfitlvNjkBCT11wgMz73G/qaC+s/GKIoeRzGCDpvP4S8QRseZbAlDa
	YTCh3pSnwIsCTYwKuWK+YMivAREKqh5/YQJnelTY1bClba47XCvyBS21h8tbBSm5yuaG
	q9B0O7JMSPNkJb9NhFADTTGU4OSOdKpMi6GRmdJ/q+W3JZdEUr8zk4YvXOlRX6e1BF7P
	+vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/spJv0WsN6EeHPKS8vzBa+xNCk7WUqTQism0en2txOE=;
	b=BrNrnsOYBN0SVKz5uxm5SPlX+/ICDDMQ7IdTgwLHRfQf77pcJzcbEYT3j9+p+t6rYk
	4Bf6+uNXmHzyBgjsz6Wx4j0utAZoUFoc8mDZlppCKSl2/2o6+LHuV2xDaadG0qtE0n8C
	MYTTfyQxog75QZ121XlCnulJdbJYHymSj0jJWSbRQQgV1eCkAR2v2w8UhzKAojWRIDEu
	CfP9LdsyVncE+eKOj5hi6Ks2bERtazIkm4JqZY+8NyXryoXe06PK6PUUTZpaTl20GYB/
	+qe8oWRIfhLiolSPiIBW8zKidKX2weI//WTtdgr0BKMPlrpLNrs3tLwZCpKjS/f1Cru3
	w2Hw==
X-Gm-Message-State: APt69E3idgcYlGQ84XUAzISxUyCElfmL/AlJN+CJLF7smDGkiZecFOrm
	49Aa7jlblgsOoV/iWa/jnweZj5ZL+pD259jq4hlt7w==
X-Google-Smtp-Source: ADUXVKII6F4QgIP+2j52ViyUOSYhCWaPdwgNl+CeXQWf4cvDZMLAYBSNeJJ6x6WR2orNQLi+tC68uWpsNYwtqSFo0EY=
X-Received: by 2002:aca:cd4d:: with SMTP id
	d74-v6mr6903962oig.170.1529917528113; 
	Mon, 25 Jun 2018 02:05:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 02:05:07
	-0700 (PDT)
In-Reply-To: <20180624191845.31082-18-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
	<20180624191845.31082-18-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jun 2018 10:05:07 +0100
Message-ID: <CAJTo0LZUq3ptRy_TrWdhZFyBw72Jb9wXCbQ2QZPFWj0JEhkFFA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 18/20] check: add recipe
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
X-List-Received-Date: Mon, 25 Jun 2018 09:05:27 -0000
Content-Type: text/plain; charset="UTF-8"

Already in oe-core: meta/recipes-support/libcheck/libcheck_0.12.0.bb

Ross

On 24 June 2018 at 20:18, Khem Raj <raj.khem@gmail.com> wrote:
> It is a C unittest framework
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-test/check/check_git.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-test/check/check_git.bb
>
> diff --git a/meta-oe/recipes-test/check/check_git.bb b/meta-oe/recipes-test/check/check_git.bb
> new file mode 100644
> index 0000000000..e7bfece3cf
> --- /dev/null
> +++ b/meta-oe/recipes-test/check/check_git.bb
> @@ -0,0 +1,21 @@
> +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "A unit testing framework for C"
> +HOMEPAGE = "https://libcheck.github.io/check/"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +PV = "0.12.0+git${SRCPV}"
> +
> +SRCREV = "285d04b3d461ba68dc39e0f9e847784fb6064bb3"
> +
> +SRC_URI = "git://github.com/libcheck/check"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +do_install_append() {
> +    rm -rf ${D}${exec_prefix}/cmake
> +}
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

