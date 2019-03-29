Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id B8E5C7D1AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 21:34:17 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q1so4298361wrp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ELpjibPaA2RCQwoEScxWd8OeyrQB8iu7D0zxsKtfN6g=;
	b=XE0lbSt6o6HSpc0wJrT3izcwvBMuJYUQiFLUxJgLssKJTID0eKgFmIysUpbSik/uuI
	26sl8PKpj4uav9WsRyHIHYsyrh7sUMEpZ1KXggOXvUZG3oyQ+3IMgIQQWvtcCP3CKu1G
	4Q+L0z9oWQXqxMnLRYl5Lza7TZKEN3DRgcnyMt5gmgGk2WLTkGmWm7264PXcqntkf+9Z
	jlUDWBsR5nkVCDi14AQ1iyctsXl0BxALcNsmLMFTeYTK8K95fNU+UMtG6AJ4R+TEGUcq
	kAYwDOFPgGcHwBIgxmSfJ466RzNKj6BqHyjDff/xNz+vpVx6UkkIxIdykFPSIsCxUaYF
	gAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ELpjibPaA2RCQwoEScxWd8OeyrQB8iu7D0zxsKtfN6g=;
	b=UTrWlCVfCUOoSMIEfazdD1aCI/BtIFOqd/wFcHDor/Oqmx9T/wuQwmia5IeBxtHRfX
	xUnSsf/aszCAFdP2igY07CiiPToYUHpAj2yIb0mm+0ApeZO3br8wCjXu5RB+rmyKcsdt
	IsvKi2yvTEhCuxFIk7lMWKSA9DfyTi2S0ahEtH0eAAcY4918QseD49gk2GVFFY5g0Ps+
	axlOv9FNI8qHZ19+dpbQ9fFzGHIsLvtXQPbxuoHdGEjOVnp2t3uLdjpn5AxyFtm0/UdP
	spYbJv+Dw/bbo7zIEHrCftL6wFgmJHULdwg+7HZLwwNtXmuGE/Mp4KCNHF8H3+Ml9RCa
	Mj3g==
X-Gm-Message-State: APjAAAWPlVi654SrKMzhD0j7j8K6aRk4nrtCXxNW6FaBga52oLz3hgSM
	SW01Hcgn9XIUhUiBj3eX7wOwtUhyFdsOEVxUUKY=
X-Google-Smtp-Source: APXvYqxtguNmGsK7YMIM9F7krJjPS8yqE6GCKXe5Gx22bi7ODK0lsySLQzaYvNeL0FnL1gBHD4bvkV7JGyXEWPiJc2Y=
X-Received: by 2002:a5d:68c6:: with SMTP id p6mr34368357wrw.321.1553895258315; 
	Fri, 29 Mar 2019 14:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190329204710.22747-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20190329204710.22747-1-Randy.MacLeod@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 29 Mar 2019 22:34:06 +0100
Message-ID: <CA+chaQdaQJOXCjvx8F-5NQa=13eiPzQEGaE5XUF2KhLtP3RYWw@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Fri, 29 Mar 2019 21:34:18 -0000
Content-Type: text/plain; charset="UTF-8"

Don't use github archive which are generated from time to time with
different checksums. Either use developer uploaded releases (if available)
or git fetcher.

On Fri, Mar 29, 2019 at 9:47 PM Randy MacLeod <Randy.MacLeod@windriver.com>
wrote:

> The previous SRC_URI did not work for the new version and
> when looking at the site, users are required to navigate
> through a click-through license agreement.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}         | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb
> => wolfssl_3.15.8.bb} (78%)
>
> diff --git a/meta-networking/recipes-connectivity/wolfssl/
> wolfssl_3.15.7.bb b/meta-networking/recipes-connectivity/wolfssl/
> wolfssl_3.15.8.bb
> similarity index 78%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> index 0a0a6075d..7690925f8 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> @@ -13,8 +13,9 @@ PROVIDES += "cyassl"
>  RPROVIDES_${PN} = "cyassl"
>
>  SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
> -SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
> -SRC_URI[sha256sum] =
> "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
> +SRC_URI = "https://github.com/wolfSSL/wolfssl/archive/v${PV}.zip"
> +SRC_URI[md5sum] = "5ba7af2bae27716a3d90e55565a08784"
> +SRC_URI[sha256sum] =
> "34605bb540ed091b1e4b2f14a1f6c7e3f26302f7c65f46378a27a6f0aa944881"
>
>  inherit autotools
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

