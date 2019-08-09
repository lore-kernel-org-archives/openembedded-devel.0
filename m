Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 413377F340
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 15:21:10 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z16so2094325qka.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2019 08:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zdJcUHlv4vwu9oQANo+BxLpISo1U7/StMaUvu23A7TI=;
	b=NyrTL1GFhnTS5i9fRwHsBA9bh+RlRuTxXbk30SzCYiDNUWNq70j1GQ8FwOYAATsJpr
	zFNa0Cx6fROGwv/ZX0S+qHOSDCFFfclg5IpHr4Pxm2QIEc5fR1YfX+vmO9tvK5Aj8UaJ
	MGcwYZ3DRmKLz7mchpejoOKOoZqSrTUbEWeksMAngzQG7SuClcO3gGUDQTEo111oJW+X
	cGHMnP+db/f88seFDkronp3DaojVBVynAvW6r8hiDkMrhwhB0/6WtDnBvQHsut5i2N+M
	eF2F88Hrnbyr2Sm7nDD1eR/w8fHjEKaa7MMqEuEjTOd9SPKBZsZlBJnmni0+aanigMEh
	Q3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zdJcUHlv4vwu9oQANo+BxLpISo1U7/StMaUvu23A7TI=;
	b=uXNGdB7PNBNnGDx3piLZGR7kHI5fm1Oig9qW+JmeM5mU8fzpY8woSSZAe5JJCyu5QV
	d4yZgorhfR5uiUCIL6vbcINkhLMlqoJ6Yf9lykaOdu2D3Qg4VpXD88iaGfjbt0iGLv/Z
	yBCtZ50gpIYklkjpCbQP5e6ktHvVRgCfzLZUmFkggIA26I4msqfTEa3RqNBaTpLKiTd4
	5/6aCoXpgw7Y7r33MdQAmYWLOXU67BT9l8GNGaMjAt/8fkn3mK7uBBXqLFKdoufDzpcN
	WJKgAfSWwMjYfAAs5ruAg5yIZ+NqMiOVKHJe9+U8WYjA6TGBflicGSM9cw1J7N8xlvEJ
	z8hw==
X-Gm-Message-State: APjAAAXGKrRDTVriR0ALgRZ2NCMGu32f8Y0vgPPsjouc6BaQHE9mpM4j
	LOoaEsXIQS0rBYyDdcUtaF9gdkR2QfC0SQ6Tjfc=
X-Google-Smtp-Source: APXvYqw/hfjlL8VnhsD0QY4zDCLaIKfx8hs+mNEoYYe+5YzhjembhmGARMuMa6M372LAGUmKF1FagOxye7reszf9La8=
X-Received: by 2002:a37:ef1a:: with SMTP id j26mr9125640qkk.474.1565364070928; 
	Fri, 09 Aug 2019 08:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190809092013.32650-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190809092013.32650-1-rasmus.villemoes@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2019 08:20:44 -0700
Message-ID: <CAMKF1sqASJcH0avUKEMG03suVr0-x1WHnyQCtLjJPcDMU_iHLg@mail.gmail.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
X-Mailman-Approved-At: Mon, 19 Aug 2019 08:55:33 +0000
Cc: Maksim Sisov <msisov@igalia.com>,
	Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Jakob Dyhr Thomsen <jakob.dyhr@prevas.dk>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Jonas Suhr Christensen <Jonas.Christensen@prevas.dk>
Subject: Re: [meta-browser][PATCH 1/2] chromium: don't pass is_official_build=true when doing a component-build
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
X-List-Received-Date: Fri, 09 Aug 2019 15:21:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 9, 2019 at 2:20 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> When setting the PACKAGECONFIG component-build, the build breaks
> immediately due to this from the toplevel BUILD.gn:
>
> if (is_official_build) {
>   # An official (maximally optimized!) component (optimized for build times)
>   # build doesn't make sense and usually doesn't work.
>   assert(!is_component_build)
> }
>
> So we must make is_official_build the negative of component-build.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  recipes-browser/chromium/chromium-gn.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium-gn.inc b/recipes-browser/chromium/chromium-gn.inc
> index d5258c0..d9735ab 100644
> --- a/recipes-browser/chromium/chromium-gn.inc
> +++ b/recipes-browser/chromium/chromium-gn.inc
> @@ -138,7 +138,8 @@ GN_ARGS += 'host_pkg_config="pkg-config-native"'
>  # (debug, release, official) but for historical reasons there are two
>  # separate flags.
>  # See also: https://groups.google.com/a/chromium.org/d/msg/chromium-dev/hkcb6AOX5gE/PPT1ukWoBwAJ
> -GN_ARGS += "is_debug=false is_official_build=true"
> +GN_ARGS += "is_debug=false"
> +GN_ARGS += "is_official_build=${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'false', 'true', d)}"
>

this looks good.

>  # Starting with M61, Chromium defaults to building with its own copy of libc++
>  # instead of the system's libstdc++. Explicitly disable this behavior.
> --
> 2.20.1
>

