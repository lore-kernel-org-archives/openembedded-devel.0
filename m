Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id DB3DA7F771
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 00:33:53 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id f5so8712273qkm.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s8OpZnfrWHHgI1ErpCihYjgZBk95qGAlMZX1AZJMm/w=;
	b=Vwg3QR7HAYsMNLUprO5Qb+5tHsrltjdds9v5e/scMlf+IYM+KLBHxDuJqEaExa8Vfj
	qbhtQdxnzhT4QvmwWFeI/FbCMBMi5Vs7DmxUza1QEXflvV2+y5t7jWZjDtxWU0LUNvKN
	PlRweUiK3OvmNe+P9sFkmrtbW3i9ZZLyhIKTF6bVYpJCfdTph7NqIpKs/XeT+8hyypRi
	u/AQnF3XyCPK3Q/RdO+rJu76sBREX2CbqLHudDdCRSqFIlUYeBOCnCnycO3v+6mBXWYw
	a6RNkDsKJ0cYkiExgp98tyJCdWbjjnJwVNnorxyEiNjBCyFcOesqaGYDQEGFnk+fUK2s
	jGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s8OpZnfrWHHgI1ErpCihYjgZBk95qGAlMZX1AZJMm/w=;
	b=rC/E6xSAVA5VzKiEKCEwvXTS7oISETzOAmckGe7T3le7pLxVXapOc02JSPG+wd2Udg
	6dH88mIaXRjV4+JqYu/MJvuSlQtPNo3qGGz1ppkGZzkSMcPzmuf6a2QweKYqOS3JADXj
	VfGzYQPq9LzOSJKMWJFJ/DsAA02aMCqArMGd+FGUOkIu+7HmW3iMec+HPfof1GYmJSKu
	qBqb8Cy0I7A2sh83xNiCAQuhPwsooGE3tGX9BLiyGQMWZrVikFkvJQ9AUdTIy6+lnodY
	gJFHPk03Y9R6zbvW+Xvk/AwuNx6Qhy1yAAIPTptz0AhZf9Kua+HGsfPXZGqwEOBStYQu
	o6cw==
X-Gm-Message-State: APjAAAU3FNCG/Cbb4mecRCZqgW/3Qq2rnjv58sn9zr+HgkzAIQ2RSSoW
	CO+LoPpjsRC+Rxc2WJi7y1OWRmaxjK4CFAZtFCBacliI
X-Google-Smtp-Source: APXvYqxXWFJWaJjEVv5RnSKqhOUWUc4yRXBDXbY5bJc9GCjNeJJFX547K/38adfdA6t6vEcxxE/gKADnXw57+fjS/G0=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr4274044qkg.71.1575074034242; 
	Fri, 29 Nov 2019 16:33:54 -0800 (PST)
MIME-Version: 1.0
References: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Nov 2019 16:33:27 -0800
Message-ID: <CAMKF1spgSzLNDKqZiVLfg3E2R3KKAT_JaEaoSg6ew0jq8iWZDg@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] python-simplejson: upgrade 3.16.0 -> 3.17.0
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
X-List-Received-Date: Sat, 30 Nov 2019 00:33:54 -0000
Content-Type: text/plain; charset="UTF-8"

there is a py2 variant as well. So please upgrade both in tandem.

On Wed, Nov 27, 2019 at 6:30 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-simplejson.inc             | 4 ++--
>  .../{python-simplejson_3.16.0.bb => python-simplejson_3.17.0.bb}      | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-simplejson_3.16.0.bb => python-simplejson_3.17.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
> index 5592eaf..1a8d390 100644
> --- a/meta-python/recipes-devtools/python/python-simplejson.inc
> +++ b/meta-python/recipes-devtools/python/python-simplejson.inc
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
>
> -SRC_URI[md5sum] = "744fa99aed207478f8fbf9dd9f04fad3"
> -SRC_URI[sha256sum] = "b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5"
> +SRC_URI[md5sum] = "8a5ed75c367b90fedc3d685742e2a1c7"
> +SRC_URI[sha256sum] = "2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81"
>
>  inherit pypi
>
> diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.16.0.bb b/meta-python/recipes-devtools/python/python-simplejson_3.17.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-simplejson_3.16.0.bb
> rename to meta-python/recipes-devtools/python/python-simplejson_3.17.0.bb
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

