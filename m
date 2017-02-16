Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id B714D65D00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:54:48 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id x12so3098873uax.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=8sHzsThIL0J/4U0MVf0wmb+g7a/zj9NzP6LZQCA9QDU=;
	b=OYqGhRVKrqUufm0bwTmcV2P2zV3buIOL+6Dtp24jFWOkKHewGbadng3Hx3i15i5oEP
	EkgfzRAx0J7bgdfYk/XyxsA1zRZDJtGuf4eGLIZ4qAh9eEsg39iJcXVj1EzIebCxs8BC
	+VyV202CVU6YiJWI2Ot6Qme20mY48wORVucDwrROIOgdVvA4bXHnl6FFU6Pbt7uX58zl
	vhzvtR/HlqK+BVsCjQKHk7pdJ9jSXv7n0a+NLBQjGmkPXhqrKG9PbejYW4YsLdgo7gIg
	kHQ1OTV+qGlwfhKudwUB7+PnESd/E8SwZx9J+9HCqQm89qvvFcICmNHEflWtzKgfAH2W
	XmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=8sHzsThIL0J/4U0MVf0wmb+g7a/zj9NzP6LZQCA9QDU=;
	b=OmBmCwgt2rBZ/jSUZ+k99Jz+Ibf7P9uvZjDn5Kbz6sJiF9O00VOBE0XhTf2QSCcGU3
	g0UBZD774Lsae1bAKJxXL3cc6it5dfw2GtoE+h2FMemf8TozzwcwdgdFns4fOQzB8BfZ
	M5YlrT2pbZLbccjAD6WHbV3LANVYY1sajyYr5iWgUOSO9ueJCin8PYUvFSrFwRoU1VIU
	GJRpAmPZPg8ZhUpK0C8vTiLKwSLODdlBb9AdgYzVOADbyu2nuTajy5VCmXcoQMp/6Glq
	ScAFa4MPpIEgrVL0gEGmR65jr+W+ssEwlJBiF7osnKBibSuscjsy0lBHf+h6Ffn9yVX/
	6P5g==
X-Gm-Message-State: AMke39mHTL2RNte504mrJZSnyL7ri5m9d0GZaKRu04hIncB1RBOeASKcWmmCXtU3AFfXlqlqEF3rDUpSfhJXAQ==
X-Received: by 10.176.83.153 with SMTP id k25mr17223994uaa.141.1487213688628; 
	Wed, 15 Feb 2017 18:54:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Wed, 15 Feb 2017 18:54:18 -0800 (PST)
In-Reply-To: <1487209321-200180-1-git-send-email-wenzong.fan@windriver.com>
References: <1487209321-200180-1-git-send-email-wenzong.fan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Feb 2017 18:54:18 -0800
Message-ID: <CAMKF1srP4fx93ndPMNSEc1r+9C4+mnsNk18srTyOhCajQg1XqQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-python] python-networkx: add package
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
X-List-Received-Date: Thu, 16 Feb 2017 02:54:49 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 15, 2017 at 5:42 PM,  <wenzong.fan@windriver.com> wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Python package for creating and manipulating graphs and networks.
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-networkx_1.11.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-networkx_1.11.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-networkx_1.11.bb b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
> new file mode 100644
> index 0000000..5bc062f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
> @@ -0,0 +1,8 @@
> +DESCRIPTION = "Python package for creating and manipulating graphs and networks"
> +LICENSE = "BSD"

would be nice if we could say BSD with clause

> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=925586ea588eb990de840dc71ea3752f"
> +
> +SRC_URI[md5sum] = "6ef584a879e9163013e9a762e1cf7cd1"
> +SRC_URI[sha256sum] = "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
> +
> +inherit pypi setuptools
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

