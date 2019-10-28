Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD997FA7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 22:25:21 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id g50so17135039qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 15:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uyGmPOqw4AU4gyucGGMw+DPDmoolCrp8ehQwPbwAjoY=;
	b=GypxC+h8USaS2yZrIIrS+Fq4S8NEH/rMS3xtfyUHm+BE7PnZfQJixO0BhOsNuuUZfP
	HgyEqAJMSsyG5LRauiW90+7F5K1S+4Ec68tkbYrHIPzPa10gGzg1QKrQmEB5vIlpoG8V
	9AqMwfyX0ySfxAf+KKAj8i1d05gzDXN0oeMSj0hF7st+HdXhEBSTDSuCnHEfB6AFDVns
	ElBsvJJScI+pyNXwbRqki/iS6f1Jtm3Ot5B9uO+nJstJlvS4mU0CruPIM7CzB+PwpeKw
	OFNyx6+gN5AZKhe6W4zY5/oJ70aLnom5eJykj4tjdjDMvOunNpUQ3zsazsQzaTMUkMU2
	JWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uyGmPOqw4AU4gyucGGMw+DPDmoolCrp8ehQwPbwAjoY=;
	b=n83bHxxmfO2K1m33FM/hmtB970eyhI4tHL7O9ZMBqtDGf9ip8NyGP707b+iwPQAru1
	fCpsofaeYl53GnI7Ec23RzRw5Hbfi9CnzuJZGdl/6Sd1UXj6agLXhL+WVQNcN6QGmjrV
	4tqKATqsPtWbEvFXXzPK2JDg/xyEV/mASz+JZc19i2nZUpLANxcclIqhu+97PkkJi3sW
	UPtUPb+OIItio+xkgzlGcT8kujA9NW0x7IcTG0zDIuApN5RWDvhrYAAFwv4YLe6Ku7El
	4kRwrvWCe1cNhN8iodXbmr284BAAJ0LKVEtb8QUriAGJuILCT5BfqlCFW9ZRHyLYX6eP
	dhtA==
X-Gm-Message-State: APjAAAVGgX3DDGWcrxuDTJSaUCCLpCRWP1v2lvKVwBO8bYcD18UYWJNV
	az0FfX/1diLMcy9DI+xjAoZTWy+KldYKCMOIn+c=
X-Google-Smtp-Source: APXvYqydPT6Vp2g8kly99D0PdAzjvavbDNUS6+XeGQZHCPuaIt/QXF8X20yF4oO64o4fqqGCUnJDoMSu7x184tvWtXY=
X-Received: by 2002:a0c:ff44:: with SMTP id y4mr19048383qvt.99.1572301521874; 
	Mon, 28 Oct 2019 15:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <1572261898-121933-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572261898-121933-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 23:24:55 +0100
Message-ID: <CAMKF1sobidrrj0aE62buy4H1nJk_AMUCoXANgds4or7bnZkkNg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] autofs: upgrade 5.1.5 -> 5.1.6
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
X-List-Received-Date: Mon, 28 Oct 2019 22:25:21 -0000
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/274854/
i already mentioned it to another similar patch

On Mon, Oct 28, 2019 at 4:30 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> 1) Upgrade autofs from 5.1.5 to 5.1.6.
>
> 2) Update 0001-Do-not-hardcode-path-for-pkg.m4.patch for 5.1.6.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch      | 14 ++++++--------
>  .../autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb}            |  4 ++--
>  2 files changed, 8 insertions(+), 10 deletions(-)
>  rename meta-networking/recipes-daemons/autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb} (95%)
>
> diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> index 410827b..364b05c 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> +++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> @@ -1,9 +1,4 @@
> -From a27217a5437da313d251b4a765bf7cb60ffaa62d Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Tue, 27 Nov 2018 15:27:47 +0800
> -Subject: [PATCH] From 6d24365f0828185fd1bb4d199209ca07eb95c41d Mon Sep 17
> - 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: Fri, 24 Aug 2018
> - 06:24:36 +0000 Subject: [PATCH] Do not hardcode path for pkg.m4
> +Subject: [PATCH] Do not hardcode path for pkg.m4
>
>  Upstream-Status: Pending
>
> @@ -11,16 +6,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  update patch to version 5.1.5
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +update patch to version 5.1.6
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>  ---
>   configure.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.in b/configure.in
> -index 493b9f1..268d06b 100644
> +index 859eaa6..2ae04bd 100644
>  --- a/configure.in
>  +++ b/configure.in
>  @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
> - AC_INIT(.autofs-5.1.5)
> + AC_INIT(.autofs-5.1.6)
>
>   # for pkg-config macros
>  -m4_include([/usr/share/aclocal/pkg.m4])
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
> similarity index 95%
> rename from meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
> rename to meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
> index 9e43549..67d03d6 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
> @@ -28,8 +28,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
>             "
>
>
> -SRC_URI[md5sum] = "03b13168ec7bd66a6f2d5f6fea705eee"
> -SRC_URI[sha256sum] = "86a8e56ea9d72bb53ff8cdfeefb5cafe983592c6b0178fb99c4a731e59879181"
> +SRC_URI[md5sum] = "e6800e0afd6009ecdff148088c564050"
> +SRC_URI[sha256sum] = "82094cad44f4e5c4f93eff2789cd66b57d7ab3fa646b7722d97608571001e694"
>
>  UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
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

