Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 359997F360
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 12:48:43 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id m15so3386529qtq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ru8pGPmE9IAB5H5aU6+42c+YdHgmNw+HeGLuEo8MexA=;
	b=hUdxOfzL/DGJDs7Z6KsqjJ3I10b7fPTDZd5rSEVQsOOwDMBv8oFwekg3JcSj44d6Hh
	VkJboO7WVQgJC3nkcAiih4LEECDISQcDmgXASUztKeSPRSY81egbwL2plbjjw1cu5TpZ
	ho4Eo/Pv3mvvf0Rny2vaB8NXOWpWBzU6tim2rGXW/Z5o93hPY0wgDY9JjIvhQusg6cYo
	JrDSSIlX6oAsOQ29C017LLT/K3AppcCZ55uPFSvsUfZJsl+327FNnDi+47jXDcXxLe0H
	RUVH/VR58n7I+OevdjCmItVtwT85Ok1h1VTZN+vef0XLIFqAYaakUHv8P6pYB6ETJz8m
	9Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ru8pGPmE9IAB5H5aU6+42c+YdHgmNw+HeGLuEo8MexA=;
	b=BECgKuEdl4jyCvDuEOyPfizQNh2plSrJVqX0CoBqYf1YkaexWBcFfT17ABxq9knKKB
	ZqN5WWVaQkAts11kv9/lmSxa0QMFIhlKhFOJlWy7AGKtghEzEGDjXUj9nWQUc90G/jgK
	UIlXGRw1cnhKiW6p/prO7ykdHgxiHInsiDPq6RnIs6vDV4QW3cQ1NjAOHIz9mTvyaQQU
	tJjNKZS178z1/FEUNkcBTv2Npgkdr+B5EDDytaNlyMUo8wmAXAT8i6fshyJxOCRocghj
	CIqHwH2gadr7gDLCZHZg0/0VWOKYWZI2Ur+daqCg4h6lFNj8XzHfxp5FyDKoGYmknpqw
	MoJQ==
X-Gm-Message-State: APjAAAUxbAimbbDU5PP+V547U8PrR3auIZ6Zf7dE3X5nTLhq94cu1Hui
	8qeHtACwyakYmuH9M89Woe9zssnrAUmNIUXPnC0=
X-Google-Smtp-Source: APXvYqzqQG2DznN+sy+JodwHJYNbTx1+aqWI4hC9qEyMv5mBq6zS0YMhDZk5rwBdYrdrx/w3r+ajzzyBGdn51l2imSk=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr3626641qtr.378.1571316523649; 
	Thu, 17 Oct 2019 05:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191016155844.20847-1-alistair.francis@wdc.com>
In-Reply-To: <20191016155844.20847-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2019 05:48:16 -0700
Message-ID: <CAMKF1spRe3J0sAW0ScbAoivkFemfXAQy5VNtyNUda4d4mmY_PQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/5] python3-pako: Initial commit of version 0.2.3
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
X-List-Received-Date: Thu, 17 Oct 2019 12:48:43 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to package

https://errors.yoctoproject.org/Errors/Details/273941/

On Wed, Oct 16, 2019 at 9:03 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../recipes-devtools/python/python3-pako_0.2.3.bb        | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
> new file mode 100644
> index 000000000..24efa44e3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "The universal package manager library"
> +HOMEPAGE = "https://github.com/MycroftAI/pako"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
> +
> +SRC_URI[md5sum] = "8eb7077075091c50e4b8a9f939607277"
> +SRC_URI[sha256sum] = "6be55fd8c5a2a6f02974f37438c1c47a3d9e764ce81c9d0a1a8c9a1815a59778"
> +
> +inherit pypi setuptools3
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

