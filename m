Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F290719AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 12:10:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so23495004wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 04:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DVpNnoGOoi5tGas9viyKet+pIe7K5NjFiBkzOneAUT4=;
	b=ALIDooKcorU9pZiU3AZ/YK8L5Ks6gH8DxulrHdvfQ0pOqYH+Q/Qv6Stvna8HQfK2du
	j1CTf6QLaMlSQirZSNei0HH0PLSnNA8cZrm6f73Yvyt34ttmQNd0cgSpgFaMxqKH26BN
	zhKvlG6GxwFDLIpXqegtqSdOiO+6aj53JoNvVvxCtXmzlGfD8y57NydRfweecFbXRZMr
	QzCIksJ3CzKtz0RWgJZp+n486wAs0Hl7z5wvQBB0glQxNpJcFHa7UpnXn0mQoxle9cDB
	1Jx3oxqHUr8TwRyJgklcPWnu9Z1VUpaes6ufj14jqCFrLc2HNFhd+1spfpyg6IqlMsJs
	PBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DVpNnoGOoi5tGas9viyKet+pIe7K5NjFiBkzOneAUT4=;
	b=rhc/OF4v69sPno009XV9iBDyyTcpXnOltYqoHv0uu9hONxr3Hmh2PztjC+DB9VM/2C
	ypE5q6C4JK6LukVDPoWp3PU860ipQRw9bx8CTVtNKEY71CGZQ6E7pSKm6txIqKMA+3w5
	a3qFPeu9e5L33Qbv9U/sKmHZyD1RX+2XMGSNOAjcpRi6Ux0vrAahLOOG+gninTtHu/Vc
	7cG1V/OXW7Z4IO+XyK7tfVgxsRIrkzeYlA6ML3udWXT9ygK5xfsDgu6ABlKX47J3Su9E
	ahR5RKZDHah334gmq6sjJ7tPJfytQgCjAEaV9I1NBSwYwCN3qagFmwHj+kd8eZwC8lmJ
	0F2w==
X-Gm-Message-State: AIkVDXJv3m0jnLfKqamWH/agLIO06mg7Dxg7RunyzgQll9SKlDm2X27hcM8Yzcwd5SXVHdPEkML815cUTTx0kQ==
X-Received: by 10.28.19.196 with SMTP id 187mr35024111wmt.81.1482927045150;
	Wed, 28 Dec 2016 04:10:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 28 Dec 2016 04:10:44 -0800 (PST)
In-Reply-To: <1482926435-13846-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1482926435-13846-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 28 Dec 2016 13:10:44 +0100
Message-ID: <CA+chaQcgfRj827K4kSZog6-jDsMu3EX9dGCWT-QCaJihEp23aw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] devmem2: fix broken SRC_URI
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
X-List-Received-Date: Wed, 28 Dec 2016 12:10:45 -0000
Content-Type: text/plain; charset=UTF-8

If it's a mirror, then why would there be different LIC_FILES_CHKSUM and
SRC_URI checksums?

On Wed, Dec 28, 2016 at 1:00 PM, Oleksandr Kravchuk <
oleksandr.kravchuk@pelagicore.com> wrote:

> Original SRC_URI for devmem2 source code is accessible. Use the mirror
> provided by free-electrons instead.
>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> b/meta-oe/recipes-support/devmem2/devmem2.bb
> index e48cc92..ba9d4cb 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "Simple program to read/write from/to any location in memory"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=
> dd68f2b0a5184b3db3dc25c99e0bd0cd"
> +LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=
> a9eb9f3890384519f435aedf986297cf"
>  PR = "r7"
>
> -SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
> +SRC_URI = "http://free-electrons.com/pub/mirror/devmem2.c \
>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
>  S = "${WORKDIR}"
>
> @@ -18,5 +18,5 @@ do_install() {
>      install devmem2 ${D}${bindir}
>  }
>
> -SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
> -SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d652
> 1e58ac482c4e29d6c9ebca8768f699c191"
> +SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
> +SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388
> edfec2175829ea1576a7a0c8606ebbe639"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

