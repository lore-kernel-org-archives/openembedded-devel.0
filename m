Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE3A7FA7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 22:26:32 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m4so10139654qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 15:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J91NHVjF2SHJWLHPVvw6aHvuF38obtf1BUHc5ryK74c=;
	b=Cp5CDyew2K1hd7P8gJts6EEnUaIzU9AV0TBiJagnIH5VKiiP5zLThRK/+G3rDgW7DW
	YbXq/ykrCtV2MFuslSRDrk56xC+4sFuVSxfYyGjkq+LeDaYFxYp38A2k7GDUE/GsV60T
	egm8/ErCLcKQHxr2WPpIYJ7w9jl7ync6fjIoGg3b2aSnTHpQIkuj2ObRJqdQB55g1tra
	6N/Mu7b99joC6mxVaetFJtUNQk+NEfqB8iu1uF7s9r/FkYNx1q3yITiTnQw+nM/jWv6D
	SwS166WaO3U+zqFaJbc0arc+XX1MLxcTvehkM+tXhiqACVLBQvva+WD4DWHEiJO+1s9e
	sAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J91NHVjF2SHJWLHPVvw6aHvuF38obtf1BUHc5ryK74c=;
	b=bOdXjWmC9RMhpLswmLHQp9Wv6Y+6mw0s6EiXlpb/seVqrKtYRY6b2NrhbZVw/A8Svf
	0pDCxo2pfT6XuMZwXOS2DOMvn8ZKp/ixjuzpVaCyQNpgwVyv8ieMZu0i5TJX3HRiKhs7
	PLBX6osOzy9fanGMfp81pOc8mOPhARaZ9o6cKT97+BEBRlEQmeyQD+EMCkELs72lskFA
	omJMfnY/BvMNzldX0D31++yPF3GuRSlCQn8e5LFdeXzKSrieFqkjjJFepuOy/MPX1UQO
	8OXNUjgxzB36jGfgpjJvY66tND/nMB94S7gZKDJlpWHVtpViGqWvv+FfBOxf8qxFnF2F
	znfg==
X-Gm-Message-State: APjAAAX6rGMCEH6x8/NnnvCQDSPAxNW6VQ8ZV8w0IZbi23tKh5Z71vGC
	bZgAeQ1mbRGhwOASbM+bpdU3WQDubLSa/UgDsCU=
X-Google-Smtp-Source: APXvYqwnFwFd1lLBGFOT+qq2IF7f6NRbvYaKrXDCn8WRHHiaGe1400U0vKxyI+Xk+FxoPgsBVmYW6kriq1yBiXKjd/A=
X-Received: by 2002:a37:b985:: with SMTP id
	j127mr18316735qkf.337.1572301592793; 
	Mon, 28 Oct 2019 15:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <1572261818-121860-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572261818-121860-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 23:26:06 +0100
Message-ID: <CAMKF1soBJg4dXOHuqNLY_-bToMgFLOzd9JttS8m7CkdgGOZjow@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] dhcpcd: upgrade 8.0.2 -> 8.1.1
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
X-List-Received-Date: Mon, 28 Oct 2019 22:26:32 -0000
Content-Type: text/plain; charset="UTF-8"

fails on musl

https://errors.yoctoproject.org/Errors/Details/274853/

On Mon, Oct 28, 2019 at 4:29 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-connectivity/dhcpcd/{dhcpcd_8.0.2.bb => dhcpcd_8.1.1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_8.0.2.bb => dhcpcd_8.1.1.bb} (86%)
>
> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
> similarity index 86%
> rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
> rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
> index 79d1dad..87e0bb4 100644
> --- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
> @@ -11,8 +11,8 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
>
>  SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
>             file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
> -SRC_URI[md5sum] = "c0375a1f725f1c191b43af60e4f7175b"
> -SRC_URI[sha256sum] = "33a26ad561546cd2cfe1e6de6352a85df72b41c37def8c7eb00e90e57c627a5c"
> +SRC_URI[md5sum] = "dc4f29a62afc53cdac311e925cfd1bc7"
> +SRC_URI[sha256sum] = "485d308fe10febd36b6f936e4260e4ab34a146e4f00a9f7a5509c4377ad5ea82"
>
>  inherit pkgconfig autotools-brokensep
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

