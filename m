Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 383357F53B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 01:00:06 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id w12so17854341iol.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 18:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vrO8sy8KwMtE2mV8toCdzBb56Ow7cN8hP0Jdt47lLCE=;
	b=VaD7shwo4w5NwjQLlScKdfZD/A6un1r6DGGOhkptqx1eBLX/FO5owJPKrjUwKMsk8x
	vdAlX7YPeKj1RvB5I3D7C0Fo84YzUXfmkl4f0XphEc5KZhJYoujn69vGRlJZLwDDeby+
	+m6s/BfCvQlBO6VskrSlM8iUXU89HJvsTbPjDDbEU/57O8XcKpCV9yo3GjikC8ZABE22
	k/YVn4Eu8Gi17sTfPSAJPDT8MTs+hBMlJSDZzH55q2hrR08/cXzZa0RAhQEK7G/gsHry
	KjHtPqOOvljG7obl7/VR8Nj6FFqbUCxdbJFBGMtgCrIyHD6Sfv71XOagAh70wVABwAE1
	9xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vrO8sy8KwMtE2mV8toCdzBb56Ow7cN8hP0Jdt47lLCE=;
	b=pTGLq5dAcBleQc8FCtj8gCnsQptzqIYpQvr+5fozEFjBwroAu96Wb88d59PkmTRZ9/
	+WgdgYfcGzqvYD3W/CnFJ9zeC7H/qn9U36C4Lbx8vNa8Pg8B4OrZr6s/aDrKMP+8yrG4
	x9eIVImlcvRkM40StGJ14kJUnJPxMl3IREjpeol3PNBZ5YuwOtXa8uhL82Rwgn1P0enb
	yhZu+Okkqq2X534A+HpLWjFurv3NzRTIbz85Kz+tAPOGQ46ck7LxPidWQnuYrrxqmph8
	Lf/fNFi5CDBABAFKHWG/HEQx5APkgCKrsIIJUJEfe4AIhe0rCj4f8O1qQH7aQLqQImT8
	3dSw==
X-Gm-Message-State: APjAAAVaOsiVsqQeLCwK1FIpVjWSW5u+gEOEWJ11gNYp44Rfc5af7Mtu
	u7yKbtAij+mdqtqZHKIKIkLjmRKVAfqHhgSr8o0=
X-Google-Smtp-Source: APXvYqwYK6fosBmn8diiZ+b5BLABBWwEYjHgm4/cZeo0hXYdzj40/3oHbZJD81Mj5bWRfv9b+ZRuOI1gNXT/Ct02bN4=
X-Received: by 2002:a02:13c6:: with SMTP id 189mr14147801jaz.46.1570755607000; 
	Thu, 10 Oct 2019 18:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191011004907.1347765-1-raj.khem@gmail.com>
In-Reply-To: <20191011004907.1347765-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 10 Oct 2019 17:59:56 -0700
Message-ID: <CANx9H-AcNDNWpj55uNXbMdBpPncTMN2shsEEiOUF9HrMt8pC2Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] jsonrpc: Disable coverage in default build
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
X-List-Received-Date: Fri, 11 Oct 2019 01:00:06 -0000
Content-Type: text/plain; charset="UTF-8"

PACKAGECONFIG  option? Or do you just think users wanting coverage would
override EXTRA_OECMAKE?

On Thu, Oct 10, 2019 at 5:49 PM Khem Raj <raj.khem@gmail.com> wrote:

> Building with intrumentation is only useful during development or
> optimization phases, in production, this will just make it slow and in
> some cases not work where file system might be readonly.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
> b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
> index b23775708a..6ad0a49abd 100644
> --- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
> +++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
> @@ -18,6 +18,7 @@ inherit cmake
>
>  EXTRA_OECMAKE += "-DCOMPILE_TESTS=NO -DCOMPILE_STUBGEN=NO
> -DCOMPILE_EXAMPLES=NO \
>                    -DBUILD_SHARED_LIBS=YES -DBUILD_STATIC_LIBS=YES \
> +                  -DWITH_COVERAGE=NO \
>                    -DCMAKE_LIBRARY_PATH=${libdir} \
>  "
>
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

