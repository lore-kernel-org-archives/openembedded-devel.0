Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id DDEB778C2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 17:28:14 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z8-v6so2346240qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pt/oKE6a82ARtc4FZNddgFmDJQRVwIPvFnwDolnsTnw=;
	b=PYk16zz623mpbznbjxJ1K7vGEm5iXGYSbGi4pL32bDuvYdVUnRrz5jZ5VPRN9L/xE9
	0u803muH2bxBFa/iqYT+e1KFw9onpiW/xAaWgUksELLHOUyA6/rZjD90XVTkX4TPlP8u
	pAznAhF1o6E4dChGz8P6DG73pqJ2PwLJUwghi0xhzhv2uBchr2EJZDpIRhzcrZ8H8NYX
	NATkstcldTB1fbOWnMftHFHo34X7Sq2dxQBV1oATPukr4LlTZgh8fmRkO+33tQy1OrA9
	FUpkkNg//8rOMEWmSvB8y44vp2cGfVvkkpA5sFmiMoKb6pHxnn0XJfPZWWSMK4HH4KKz
	MojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pt/oKE6a82ARtc4FZNddgFmDJQRVwIPvFnwDolnsTnw=;
	b=htYN4fqAM5tSeffciJNVfvuwBYRk0KgfrMharZtKYVHo32K22sxeY45u3902OAJTjl
	o/SErQa/YCgxn+QSdF8Ijgy53HqW0M44wWKVJ21pcokW4cYk1zExPColqqdpA0cbR5JV
	IEvQdFTatH5Nn9QwcR32nf9p7wIjDLPrW/xGWNSoY8qKSWHyyNdxPECFmN2W8znxveEi
	zCMNLrr8OJHaM4MQ99ji8Jrc8vCdUcpYlv6kc81RIjTS9qX7qZ8cg1Lrqa4C/MQPCwZE
	8ggKWB/IY4JVaNZbnGCGKPblQy4uKsK/5j5fnGYsXAmnu1znVul58WJuXa6ZsTkJN+Mt
	E2jQ==
X-Gm-Message-State: AOUpUlHPsQb8A+N9P6OYlr0e3qI3ixCGVtzlVobkjUyTB5OPEthAYPb8
	jnGsarlxv9mQ9Vt218IDG7XXjq1gCmC44bCT2Wk=
X-Google-Smtp-Source: AAOMgpcO5q47epvNlBd+gFKgtPInVkqnUZrsELQXbVcFjVWEER8vTpCx8yKVGfrxE/V8Qc7p3g73SI5q+us07m5Q1HE=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr2898980qta.128.1532626095593; 
	Thu, 26 Jul 2018 10:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
	<20180723093326.12122-3-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180723093326.12122-3-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2018 10:27:49 -0700
Message-ID: <CAMKF1sq4n-XzWgZdBTSzMpmjxGvEqQRpBqJtTeEZibvgSsP7Mg@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH] python-greenlet: 0.4.13->0.4.14
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
X-List-Received-Date: Thu, 26 Jul 2018 17:28:15 -0000
Content-Type: text/plain; charset="UTF-8"

fails to fetch, can you try this with bitbake -ccleanall
python-greenlet ; bitbake python-greenlet

WARNING: python3-greenlet-0.4.13-r0 do_fetch: Renaming
/mnt/a/oe/downloads/greenlet-0.4.13.tar.gz to
/mnt/a/oe/downloads/greenlet-0.4.13.tar.gz_bad-checksum_6e0b9dd5385f81d478451ec8ed1d62b3
ERROR: python3-greenlet-0.4.13-r0 do_fetch: Checksum failure fetching
https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-0.4.13.tar.gz
ERROR: python3-greenlet-0.4.13-r0 do_fetch: Fetcher failure for URL:
'https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-0.4.13.tar.gz'.
Checksum mismatch!
File: '/mnt/a/oe/downloads/greenlet-0.4.13.tar.gz' has md5 checksum
6e0b9dd5385f81d478451ec8ed1d62b3 when a87b6028c3b742b210bf5973939db595
was expected
File: '/mnt/a/oe/downloads/greenlet-0.4.13.tar.gz' has sha256 checksum
0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4 when
f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af was
expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within
the recipe:
SRC_URI[md5sum] = "6e0b9dd5385f81d478451ec8ed1d62b3"
SRC_URI[sha256sum] =
"0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.

ERROR: python3-greenlet-0.4.13-r0 do_fetch: Function failed: base_do_fetch
On Mon, Jul 23, 2018 at 2:34 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-greenlet from 0.4.13 to 0.4.14.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-greenlet.inc               | 4 ++--
>  .../python/{python-greenlet_0.4.13.bb => python-greenlet_0.4.14.bb}   | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-greenlet_0.4.13.bb => python-greenlet_0.4.14.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
> index 7a42240..fcd81f6 100644
> --- a/meta-python/recipes-devtools/python/python-greenlet.inc
> +++ b/meta-python/recipes-devtools/python/python-greenlet.inc
> @@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
>                      file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
>
> -SRC_URI[md5sum] = "6e0b9dd5385f81d478451ec8ed1d62b3"
> -SRC_URI[sha256sum] = "0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4"
> +SRC_URI[md5sum] = "a87b6028c3b742b210bf5973939db595"
> +SRC_URI[sha256sum] = "f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb
> rename to meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
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

