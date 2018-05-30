Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E644060750;
	Wed, 30 May 2018 13:08:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t11-v6so47823327wmt.0;
	Wed, 30 May 2018 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PhB0yw8zziJcOFOZykrsHy8fQgc2FBkQT7AT5sp9OTU=;
	b=tphMrEsgAb71hdG2qelwraAojbAFXbxFFWFUJ7fe+cwevYv9tPpxyRsSFwR0gi3HZG
	RpO8lkS0zZWjPeRVJNx4k104Rrdv8jdIxpOgJ63F15LsTccfdlRaTN/VnQJEg2gpD1MQ
	ikL9ImG2ZkCGLVMfj9/sbD45I7WhcFvow0r7SxAp2yyzvsEJBfzPMcYdL8Oq6NGHHSAa
	YR9j3pENKU3w8iofGOqrNzqm+BBOoL6bDB9zBZyL9b3qrZ5FqD9mVm5btC48S2Od1KmM
	ya6TRFZB27nV6FXFTP6O88x+Zle04OFAYwjjwj9c16kOho2r7oO9CDse09x76tQ9WgGE
	r55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PhB0yw8zziJcOFOZykrsHy8fQgc2FBkQT7AT5sp9OTU=;
	b=UG6JkTqmQjDfIMpJ1+br4yvkCv9q+T5LlS9uXPEIWk5dnnzyyOb7b51J+ctbZlOK/s
	A5KIHhIbyNxNm/podKp9rs5LRtND118LmqXXuR8QixBlPPA55xakJofRFZqqRDuNFYYe
	Hy2Rh1bAd/4laNtME3sChEFl6cT7+3jFr3Kypz6SDpBIJ052NfMxHusrogO/NTD1p/re
	urR8erp4ZuOPXmHE+oHKb0JUfPfSKCUFNHHVE3ydqh3ev0tFVqxogPc339xfwsxo59pi
	TZMBMyfAf2LilBTKO1UzlKwp/s+fFegtC+u/55z0nO+gUHU/m/qOruC2UAM7pCDIT0kr
	JPOA==
X-Gm-Message-State: ALKqPwept8QLaE1c6ixPIDjVDtMvFvp85x7pw6qni48vqMsGEOsb7+um
	Tamr7lpTrE7JpiT54KW1p4y+FrdhEmixql3DPhY=
X-Google-Smtp-Source: ADUXVKKdNmJB66OvNdWlw9OiESzeb4l34Adc1e7wsfgWnxj2SaJitTPZWbxSabC+W7qnC1mbkW0iOW/GNMTSpg3WXTc=
X-Received: by 2002:a1c:4249:: with SMTP id
	p70-v6mr1458702wma.17.1527685727480; 
	Wed, 30 May 2018 06:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180530130016.18864-1-george.mccollister@gmail.com>
In-Reply-To: <20180530130016.18864-1-george.mccollister@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 May 2018 15:08:36 +0200
Message-ID: <CA+chaQfsqr6opc79LGEswd48uodj2ergv_8Lfb1A8iGPXQgqTw@mail.gmail.com>
To: george.mccollister@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][rocko][PATCH] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 13:08:47 -0000
Content-Type: text/plain; charset="UTF-8"

This doesn't just rely on SRCREV (bitbake fetcher would be complaining if
the SRCREV isn't found in the branch used in SRC_URI), it relies on this
SRCREV to be in master branch (which is the default branch for git fetcher):

docker-shr @ ~/projects/protobuf $ git branch -a --contains
b04e5cba356212e4e8c66c61bbe0c3a20537c5b9
* master
  remotes/origin/3.5.1.1
  remotes/origin/3.5.x
  remotes/origin/3.6.x
  remotes/origin/HEAD -> origin/master
  remotes/origin/cython_protobuf
  remotes/origin/master
  remotes/origin/php-generated-dev
  remotes/origin/python-wheel
  remotes/origin/python_deps


On Wed, May 30, 2018 at 3:01 PM George McCollister <
george.mccollister@gmail.com> wrote:

> The 3.4.x branch was removed upstream but the commit referenced in
> SRCREV is the 3.4.1 release and is still available:
> https://github.com/google/protobuf/releases/tag/v3.4.1
>
> Drop branch=3.4.x from SRC_URI and just rely on SRCREV.
>
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> index fae7c18a1..fe28f475a 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> @@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
>
>  PV = "3.4.1+git${SRCPV}"
>
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
> +SRC_URI = "git://github.com/google/protobuf.git"
>
>  EXTRA_OECONF += " --with-protoc=echo"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

