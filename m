Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id BE58678291
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:47:31 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id h82so2553381ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 12:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a0oBPBQAsATFdeFQVKEzQZb38x/Uv8KWmNBBGT56vh0=;
	b=LOoH6XuGZa4+wP8OJ8Q9MkbSRLcUbzJXg709mAibgoO13kgAth47UhrQb6kF4U+PTq
	61ZId+r5JsWzmgux+C3/t9uceCYPnnk9ds+6Zs5ehrGEWQiVUm7y2+hHvPxrq9ThShnm
	FYNk3dLCFukeEwzZ23COhNb5AyoBRYwfeFgXrOi/c02VtKvaPdqt7mT3GBr8GBxDOet0
	A52gg/YnXcqJGETmRxtvDrJEgx7I+YmmcDLNUtvfh2p5YsAeQKvQxrFChsQrPDV9lL/l
	RKOYI0OhOl0zHU/kwdCzSXkf8bgq7JI+hzBqSVeOlOR2sUia+IqXS/RM6oj8DBcfyWbp
	1FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a0oBPBQAsATFdeFQVKEzQZb38x/Uv8KWmNBBGT56vh0=;
	b=RYNIVD61o732fQ6e8SeVmg76IF3mUq5r7nIVI5r5AJPXfkxPDI5h2fkcNtfuq0yRIH
	ByyHhu2CUvHW+eVIv45V2paUpCpOM233lHHUKGD8D18pmnRrUGdS07LPir3qaKxABNYw
	N77ymW57sttxiymdNpdROlFW48qNLhtFTIWTttAFnwG7yNMVWbBWeMfOqKFJIn33781T
	CiXWFobRPF6S81zphqCE6Ky8UXvYEJnDIBZgTyZ7OPUOBoPMsBHYY4TRNvjbquP6TGu7
	neCLNNQRhxerjN0DcQSK3l12ifVLLqeuXks4vlYEioQq1mOHy9sCfx9Dp/87eqoJLdjl
	Blgg==
X-Gm-Message-State: AODbwcAuU3gf6OgPrnN7OlcJST6MgXfCp2Mm9ZhVRF0lZsAB1cQfT1Fa
	Bt954Tdpfjj87xH3WKp7lCWvAC4hDA==
X-Received: by 10.129.80.193 with SMTP id e184mr13118672ywb.44.1496951252553; 
	Thu, 08 Jun 2017 12:47:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 8 Jun 2017 12:47:32 -0700 (PDT)
In-Reply-To: <20170605172321.12557-1-acfoltzer@galois.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Jun 2017 21:47:32 +0200
Message-ID: <CA+chaQc8rh2LmM8S1Da50r8+w6MSrSttJ_jkUtFg7nsy9dsa_w@mail.gmail.com>
To: "Adam C. Foltzer" <acfoltzer@galois.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] meson: update Meson devtool to 0.40.1
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
X-List-Received-Date: Thu, 08 Jun 2017 19:47:33 -0000
Content-Type: text/plain; charset="UTF-8"

Doesn't work well with some other meson changes we have:

http://errors.yoctoproject.org/Errors/Details/144180/

On Mon, Jun 5, 2017 at 7:23 PM, Adam C. Foltzer <acfoltzer@galois.com>
wrote:

> Signed-off-by: Adam C. Foltzer <acfoltzer@galois.com>
> ---
>  meta-oe/recipes-devtools/meson/{meson_0.37.1.bb => meson_0.40.1.bb} | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/meson/{meson_0.37.1.bb => meson_0.40.1.bb}
> (88%)
>
> diff --git a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
> b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> similarity index 88%
> rename from meta-oe/recipes-devtools/meson/meson_0.37.1.bb
> rename to meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> index dbbea64..fd96b42 100644
> --- a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
> +++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> @@ -9,7 +9,7 @@ SRC_URI = " \
>      file://native_bindir.patch \
>  "
>
> -SRCREV = "3d4bfdcb22314ea7db45a5b075f8b2a9c1498aab"
> +SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.9.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

