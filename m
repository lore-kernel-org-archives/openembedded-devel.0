Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 580377823B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:13:13 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id s127so1996340ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 01:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YPopnRq/E3q66Fm2A96CNaco6jCVCDHJ75UlnYR1ff4=;
	b=pXvtl84YUhPSLFR0eGhrFeBwIaIWVD3o6pOYMFOP3GQPirxVQYU2s0K/Bshn/rBUx+
	A44r+gbxawk4hLpl8u3U8sHYyOkgiUbluh/N4PRcF1EYwlKNdGlhvE5devvDnV3149dj
	6Jk2GLY/ND2nCcees8PLrheNZOpvbHgOYB193YN1MNizEf8MeKZZdtqThdPhN64mqMYi
	FRFidTnivkPfXLB9HKXGWBxzA+4o/LccpRxegepOg4xay/gint2KnEeo3Z8bTX1DuZVX
	blt3TSIofrInN9JyPhLErXIIRw/Yz959JRsA/fg77jZyzqKs50BdtmTCu+mr3SyKgk5B
	m+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YPopnRq/E3q66Fm2A96CNaco6jCVCDHJ75UlnYR1ff4=;
	b=LtZ6N8P7cFYTrusw5rrWiTadtmD68QTmy/SWbTUviLiqas2bbZcRfGVV/bOGLoNtPj
	N4sdBQyg0bRHnAhHKp/lge0xFnDF6w95bybkCjz3HRen+zyrgj8MlmAkIiUa52A0O5EH
	fziO/B4U3C3hbBo1LCEZPI9a+oGBkpdktDNPRmJwkmk6trCbs9Sj1FUVHCkXc1hI81Ab
	KuFp055XDhgdBmqciW/F/mo5aTzX7iRSEs4fYY9JdDpvczpXL/wUaRKk03nEJAhdOmbW
	ZAlVaYGehxNQICdaEyAcbVHGscdVd3C8gu4bn2A1P2Fpa6mL5+RSoCYJDMhs1kZTzG8F
	aurQ==
X-Gm-Message-State: AKS2vOxqC26VLc+ExYitS9pTnhfcaTfjQVLVF3jVhFFhGir/UDXb/Hqb
	HMx25cgyGC2CgXmBPq7W/eUJekEuzw==
X-Received: by 10.129.55.14 with SMTP id e14mr7373581ywa.33.1497600794916;
	Fri, 16 Jun 2017 01:13:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 16 Jun 2017 01:13:14 -0700 (PDT)
In-Reply-To: <20170616030445.19533-1-liezhi.yang@windriver.com>
References: <20170616030445.19533-1-liezhi.yang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Jun 2017 09:13:14 +0100
Message-ID: <CA+chaQckrnWx9sMqP+f0HTziGgWBB-8qMFtrYdSLBxEFiD4=fA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] fuse: fix SRC_URI
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
X-List-Received-Date: Fri, 16 Jun 2017 08:13:15 -0000
Content-Type: text/plain; charset="UTF-8"

It's already in master for last 2 days:
http://git.openembedded.org/meta-openembedded/commit/?id=d3dd8bc3721f3958eb7ddeb026f7221d48daa986

On Fri, Jun 16, 2017 at 4:04 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> ${P} -> ${BP}, otherwise it would fail when multilib.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
> b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
> index e66f3cd..87292fe 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
> @@ -10,7 +10,7 @@ LICENSE = "GPLv2 & LGPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LIB;md5=4fbd65380cdd255951079008b36451
> 6c"
>
> -SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${P}
> /${P}.tar.gz \
> +SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${
> BP}/${BP}.tar.gz \
>             file://gold-unversioned-symbol.patch \
>             file://aarch64.patch \
>             file://0001-fuse-fix-the-return-value-of-help-option.patch \
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

