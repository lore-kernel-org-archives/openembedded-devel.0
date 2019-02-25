Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id C042E7CA5C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 15:06:33 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id x6so5458347qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 07:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IuAGVUHbXHWbtwf73sHpZwXonXZQEStuBRbB13OJzyA=;
	b=msWmdRoPUPQVBd7f94c49xfsWfBT4nIdRUPc7xwRjDK0isXfoECjrxQe769C4EIrsE
	L4G2peeBVJRl3jjScoF9Krf+P1qMdV0trkgTcq1fceavz0PBRaqQUTZ+x8AcIVe/yCyd
	AsRLd1RhdLRN4d6rY6F/PcPkfRdiY+4fIw+2LZ/P6uCJBQzwrH3B0SFSqbDXNgCcKLTX
	RBVH+MAJpz7Ij3e/Y9t4Vsf2//znpgh4t0rkx6N3x8SmQiFC/0d2fCvov2FPpsHhpQ3q
	zPbyRlJR5XVvZ2gG1x6kVKWjOkD7N71+XAqVHgh7hsMZWK3xyOoLtN4PTbrKiXcuTNDE
	kv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IuAGVUHbXHWbtwf73sHpZwXonXZQEStuBRbB13OJzyA=;
	b=i2ZYe/SVXZ982MlEuQcTEHE5aEi7ZVLIQrrzYH0vF7FQsrKw8FoWhe51R113+h+5Gv
	uGHZPgSwgoTxFRyZl6NN7YBrQgRtvNAbLAnLBJiDLgzIRH1CLWfb1WpOG1p0fKc242LQ
	sNOQi8xk8rcbAc7LOFH8MkBYfM3hGa0G8esvAzinIz1NYnrCU5WIX2Q7pI/mQOGU/Mwy
	FeTIRUgE90TqEi1Y9oWOaFU9GFPuVtooL8H8nCsU+JKsSp3VxL0DNWafLIod9ZuDCOjL
	5XX2BSYUXT4Nn1QGtRFcXOfXAjVM/YRKsVTgPxVuY0CzA2KH4agMuxiT/nV40omPf0X1
	k6Rg==
X-Gm-Message-State: AHQUAubcrNfs+O3NPu2aFzTxgREUIRCvnPrRjBEqqNzAlwOVNdKAoUjt
	ViFnKS+IfxvalNx2kmk4vNj/+GztgSFiMIlNJnTGD1ZA
X-Google-Smtp-Source: AHgI3Ib5kT78yWnBs5CXV6wB7ZFrkYp8sS7TcOpMHhwHC2EyrVCKXAR77ybrLd8spTDbIiV+2J18C1ts/xfLcBi42UY=
X-Received: by 2002:a37:9e15:: with SMTP id h21mr13755588qke.2.1551107194241; 
	Mon, 25 Feb 2019 07:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20190225140010.19025-1-otavio@ossystems.com.br>
In-Reply-To: <20190225140010.19025-1-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2019 07:06:08 -0800
Message-ID: <CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' from `.egg-info/` directory
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
X-List-Received-Date: Mon, 25 Feb 2019 15:06:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 6:00 AM Otavio Salvador <otavio@ossystems.com.br> wrote:
>
> The chmod was removing the executing bit from the directory and then
> the native version was failing to build.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta-python/recipes-devtools/python/python-idna.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
> index 436b58606..519812ddc 100644
> --- a/meta-python/recipes-devtools/python/python-idna.inc
> +++ b/meta-python/recipes-devtools/python/python-idna.inc
> @@ -16,7 +16,3 @@ do_compile_prepend() {
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> -
> -do_install_append() {
> -    chmod 664 -R ${D}${PYTHON_SITEPACKAGES_DIR}/*.egg-info/
> -}

this overturns a prior fix
https://git.openembedded.org/meta-openembedded/commit/?id=79bb01985260800f80b393e73b387543f86f9e62

I think it would be better to resolve the original issue before reverting
it or maybe just appy this for target recipe alone

> \ No newline at end of file
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

