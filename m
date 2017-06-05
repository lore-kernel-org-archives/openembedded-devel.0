Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 41CDF6B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:19:16 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id p198so2583119yba.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 04:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jbtOQrkHnGAVHR3uiQc/h0UwbxgjrrokfaR29c9WgME=;
	b=iNYx+TZ/NSsx9QBJ9/YCLpARYq0Z+/tjFjgB6kY4yCp2nbi1wyBvmMOCibtEOLFrrL
	u55oZaL0XKxF5QFMzppcNbpf388EGdr+4bmAhlEuhdUpAjFReQ67kWQrKbk0MwMwcM6M
	s701J8mpT2/dx9Xg10aedkJzjMrH0BqouGFqK9BHcDHt0K1KTWtRBJsYLVv68OuhFnHS
	qFmW6yG6tUZojKvoJi30vTWBPP6B1zPDJPxRhknOd90mVFW0Q54wE/SCuQRPU3ed7d6e
	vsJGa59cXcpMgKoGzRobCklkeWXJ0b3YZ9cc1vltyA1s+wivpy00fKmNf++xFT4MYH32
	cX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jbtOQrkHnGAVHR3uiQc/h0UwbxgjrrokfaR29c9WgME=;
	b=tK1BdR++JzQkOGBE6BQx64+ifRv2KMuGMzde3nJ7vm5MMFKFVkxYfHThw8PkESBzA2
	3dAMje6vMrHcL4DXM7uly9AS7C/qdw02lub+p1r44y4CJBbNV8cTwV35LAPv3JbBM+eP
	z7wvmJWWt3z2OUYlVy535lmFlAanzKfMdkqLyV8KmU73zFUfLQ1T2VSTQDAjwzxoPOFt
	eSCOWi2XW5+KqI9EkSSBtxDcHhUtoiNEMuVFavXPtuupIpmqmYi8/5juQU+416SwBLtt
	CkaxxCzfjpDspMw6RCc2ZZhgHxOvWyGsPqNdAj0oTZTAfPZQxDmzSpkx1yPe0iQFiEHO
	x7YA==
X-Gm-Message-State: AODbwcBKFLMR5N8y00+c3BluuW/eUlXueKmeIsG6pMppXxg34G4afsPK
	jtsW4bUKknu4h5g0FW4VKZmyjO28VA==
X-Received: by 10.37.228.69 with SMTP id b66mr8947437ybh.28.1496661558225;
	Mon, 05 Jun 2017 04:19:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Mon, 5 Jun 2017 04:19:17 -0700 (PDT)
In-Reply-To: <1495051031-10963-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1495051031-10963-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 5 Jun 2017 13:19:17 +0200
Message-ID: <CA+chaQddO6uxufQy-zEsM+ufSV8oHrGNpLe9KuZ+XoZ2O=b7VA@mail.gmail.com>
To: Phoong Stanley Cheong Kwan <stanley.cheong.kwan.phoong@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] libsexy: Added glib-2.0-native dependency and removed PNBLACKLIST
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
X-List-Received-Date: Mon, 05 Jun 2017 11:19:18 -0000
Content-Type: text/plain; charset="UTF-8"

Still fails to build, please test it properly before resending:

http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113037.html

On Wed, May 17, 2017 at 9:57 PM, Phoong Stanley Cheong Kwan <
stanley.cheong.kwan.phoong@intel.com> wrote:

> From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>
>
> Found out that libsexy is missing the dependency for glib-2.0-native.
>
> Added glib-2.0-native into DEPENDS and unblacklist libsexy by
> removing PNBLACKLIST.
>
> Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@
> intel.com>
> ---
>  meta-oe/recipes-graphics/libsexy/libsexy.inc       | 2 +-
>  meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/libsexy/libsexy.inc
> b/meta-oe/recipes-graphics/libsexy/libsexy.inc
> index 5a11ca0..d8c41d7 100644
> --- a/meta-oe/recipes-graphics/libsexy/libsexy.inc
> +++ b/meta-oe/recipes-graphics/libsexy/libsexy.inc
> @@ -6,7 +6,7 @@ SECTION = "x11/libs"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>
> -DEPENDS = "gtk+ enchant libxml2"
> +DEPENDS = "gtk+ enchant libxml2 glib-2.0-native"
>
>  SRC_URI = "http://releases.chipx86.com/libsexy/${BPN}/${BP}.tar.gz \
>             file://libsexy-pkgconfig-fixes.patch"
> diff --git a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
> b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
> index 2ba1ebb..86b4958 100644
> --- a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
> +++ b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
> @@ -4,5 +4,3 @@ PR = "r2"
>
>  SRC_URI[md5sum] = "33c079a253270ec8bfb9508e4bb30754"
>  SRC_URI[sha256sum] = "8c4101a8cda5fccbba85ba1a15f46f
> 2cf75deaa8b3c525ce5b135b9e1a8fe49e"
> -
> -PNBLACKLIST[libsexy] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe will
> be removed on 2017-09-01 unless the issue is fixed"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

