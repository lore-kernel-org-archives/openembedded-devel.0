Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id E744F778D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 22:20:05 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id u207so29969371ywc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 15:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Br16tjyF7HP2upYmqwsS7dw88EIBNx1O96X9A0hVZ8=;
	b=supX3uhi/FsA39n/r9C8HnwlkZwN5MwF0xL3abjR3abmL5lUtyakXSdXILKMkLE/x5
	36nAWpgktUS7hf+5DfbVxqrCdtSFWSmerCayHjAF/QF8BTckv/Z595IrDFsCqmb+iluC
	+Mqsa7k1pPTA+WnIjqxIANeOTsJFhgL2PReIzguzNgGTVy0ST4UDOKis16RhNRszXTN6
	b2qeq37Vl7q2bOWK+uthH6cFxRx30tAerAzlhRjDiFaVP6iXgVTysPJZhVqcmxfrpT51
	fwtdL2G3GqufgHyt3XSjUq4lxM3PU+4+nwhDX+Vkz+/Z8PGRmKV2rYgHl3sOvMxm/86u
	PpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Br16tjyF7HP2upYmqwsS7dw88EIBNx1O96X9A0hVZ8=;
	b=PEoBx6eaG2ytDRakFP3g/QqL3dH2F6hCga5kMUrIa12PpLNIlczci2iyQPCW3FANUY
	tAYSpZvX4z2/MdkxBUIeapN4EWB9RuezAuLBkxJ7CGbZt7zygJAdp69AWuLjCXv5J5pC
	mrgbr/uTymLflkU6/CA3n8vb9wDFh5spCZSD2wyq8Hs5efVH3XnpPNQ1Xt28q3zowwe3
	gq6ZCW6jrsrKQBPH5NLSHUmp7T+dSxTOC3bjPjItGQKXLWcDdLqLCvtlTqzpSktdBYqo
	0xVIgflx2Zppz9DflSwtS+B9rkgShJL+NYBDzgsgktWL4d2LXKiKrYtLNhlADLn1b/VD
	FXqQ==
X-Gm-Message-State: AHYfb5hnkMmRaC1aZ2DyB0buhcd9e/nTH5lIk95m7DmKTlmKXyhgB6ls
	LJwJ8PzaofW1uCNMcx97qs9uzLx4EQ==
X-Received: by 10.129.152.70 with SMTP id p67mr5252989ywg.202.1502230807042;
	Tue, 08 Aug 2017 15:20:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.172.196 with HTTP; Tue, 8 Aug 2017 15:20:06 -0700 (PDT)
In-Reply-To: <20170808221157.173965-1-jslater@windriver.com>
References: <20170808221157.173965-1-jslater@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Aug 2017 00:20:06 +0200
Message-ID: <CA+chaQeobqEXLjjaRyyxt74hpA+5bW-nWo3AkSmdA5LD4jupRA@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] php: move to version 7.1.8 from 7.1.0
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
X-List-Received-Date: Tue, 08 Aug 2017 22:20:06 -0000
Content-Type: text/plain; charset="UTF-8"

Khem already sent upgrade to 7.1.7 with additional fix, can you please
rebase this change on top of his and resend?

On Wed, Aug 9, 2017 at 12:11 AM, Joe Slater <jslater@windriver.com> wrote:

> Fixes many CVEs.  At least CVE-2017- 11362,7272, 8923, 9119, 11146,
> 11145, 11142, 11144, 11628.  Most of these were fixed by 7.1.7.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../{php-7.1.0 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
>  meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.8.bb}         | 6
> +++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/php/{php-7.1.0 =>
> php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
>  rename meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.8.bb} (64%)
>
> diff --git a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> b/meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_
> RUN-to-AC_TRY_LINK.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-
> to-AC_TRY_LINK.patch
> rename to meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-
> to-AC_TRY_LINK.patch
> diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb
> b/meta-oe/recipes-devtools/php/php_7.1.8.bb
> similarity index 64%
> rename from meta-oe/recipes-devtools/php/php_7.1.0.bb
> rename to meta-oe/recipes-devtools/php/php_7.1.8.bb
> index 210d91f..c0b2541 100644
> --- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.1.8.bb
> @@ -1,10 +1,10 @@
>  require php.inc
>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c1e"
>
>  SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
> -SRC_URI[md5sum] = "54e364b60a88db77adb96aacb10f10a4"
> -SRC_URI[sha256sum] = "68bcfd7deed5b3474d81dec9f74d12
> 2058327e2bed0ac25bbc9ec70995228e61"
> +SRC_URI[md5sum] = "d22451dc20bbdf4b8bb656dc787c2a36"
> +SRC_URI[sha256sum] = "7064a00a9450565190890c7a4be04e
> 646e0be73b2e0f8c46ae34419f343ca2f8"
>
>  PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config
> \
>                          --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config
> \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

