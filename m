Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id D972D7FC8C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 19:13:20 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id c26so14273927qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 12:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DYfN/9ESKvkYwz6QqwOYoPQ3U0+e5F2vNFyBMpKFp7s=;
	b=EPgoCMrLJ9+/lmFJNDt3sdpvQFBAQtcprCzswtOjCMlI7E5HDdQ0jhbaywxX7/8/FY
	aUREcqiyOnawJKuvbq7nMXBjneWML8QQzZgfz050VeB1HaV3BydXZc5jl3lKc4T/NE4O
	HGAus325RTnalG9f5ElVt63+SumX/To2riRC4zdZmCl/j3wXl/eOGsGIUWDit7Ha1Znm
	av+Og2TzDezaTvjpxf6sHSG2UsBhPZ2ZNISw9G3isSIGOtY9oLwVqFPx8AaPeDLGsXcI
	uv94ItFVNYNzHjpNB+cbYAFeYUkSz67mjYgxGa/aIXPSvvH3gpWwTB/W9R9iKBaF0xbN
	76sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DYfN/9ESKvkYwz6QqwOYoPQ3U0+e5F2vNFyBMpKFp7s=;
	b=WyZcGJUuyqyTv/0Yed5NeTmhRL0+ZJCjO28LWKxmvAwGXAY0SrrfdaImowysBhmYIo
	8JTx75SDwLSFRIikc5g51A6mcqr74QIOh1GMYIuasEFyektefIudHzeqngsjDJXflZ+g
	2lRPKmS6XAs7De+Hm6ApY4Wyl84kDrYdLWP/nikfW+qaZ30U2L5iDc1loIo2N1rz09wB
	MMhrWDialn8JJmy7MrKP1GwFGsk4qbY16DarDwfReaR3+wES2fCTCqokyjwYQSKP9AGN
	oAnkYxuBLGncZ11s8aN7c/7xv09IPHBT6SkbW89rMK58IojxzY1dXco9zz4+0scgk3lt
	uTMw==
X-Gm-Message-State: APjAAAVOnisDZ2oa5ecZ1ty8E+aO6XkWlf8VObvgxy5VjX4Q2PqBC4xm
	GbgJZTCs5F4PJFoEyr6X2JK5Yv5lnqylsnIzwXM=
X-Google-Smtp-Source: APXvYqyvnuEyOacNyppuF3yDVQNJNJhYBbfAbHmTW8vvSyZy6dLOp0K8tu8bhmYu5iLNCRTHgcs5+K4f3/akBnFAJL0=
X-Received: by 2002:ad4:5349:: with SMTP id v9mr10405019qvs.55.1572635601089; 
	Fri, 01 Nov 2019 12:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191101055734.2056-1-alex.kiernan@gmail.com>
In-Reply-To: <20191101055734.2056-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 12:12:50 -0700
Message-ID: <CAMKF1sqEJgqCPAxhjZPQ11XRXiJOi487gQBkPLhUy5oS6ZsLgA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ostree: Upgrade 2019.4 -> 2019.5
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
X-List-Received-Date: Fri, 01 Nov 2019 19:13:21 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to patch

RROR: ostree-2019.5-r0 do_patch: Command Error: 'quilt --quiltrc
/mnt/b/yoe/build/tmp/work/aarch64-yoe-linux-musl/ostree/2019.5-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch 0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
patching file Makefile-ostree.am
patching file configure.ac
Hunk #1 FAILED at 192.
1 out of 1 hunk FAILED -- rejects in file configure.ac
Patch 0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
does not apply (enforce with -f)

On Thu, Oct 31, 2019 at 10:57 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  .../ostree/{ostree_2019.4.bb => ostree_2019.5.bb}               | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/ostree/{ostree_2019.4.bb => ostree_2019.5.bb} (99%)
>
> diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> similarity index 99%
> rename from meta-oe/recipes-extended/ostree/ostree_2019.4.bb
> rename to meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> index 505c9fcccc59..efe1b3616f23 100644
> --- a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
> +++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> @@ -28,7 +28,7 @@ SRC_URI = " \
>      file://0001-Always-enable-trivial-httpd-for-tests.patch \
>      file://0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch \
>  "
> -SRCREV = "9d39e7d91e8497987cad69a3fbed5c5fc91eebdc"
> +SRCREV = "980ca07b03b3aa7e0012729dd6c84b0878775d93"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

