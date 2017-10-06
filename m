Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C2B487806E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Oct 2017 14:05:40 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e69so16881464pfg.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Oct 2017 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c3DTZG6WWpUNhVnn4LeP1CrYV5SRB40ArgHx57TOffA=;
	b=qKlGr40NkiNa5fAw3sbAWWlV5hqaws5oukUwCmiMxWfkSfE9jK/2y2SzxYxX/NMuah
	4HKYo+CvpFVn/qGscAybbZuFWigUMvYxvmiGVVmhOoPxspS0+1Dpdcrj8TMKFyNx5xoX
	a6gljXq6oneYmsAHkFHRoUCoFVoZSVhOIGIyqb1GiiaEjqVqewwDvMwXzzw/oyo6AaTi
	bA13VAve4Cz5zMkfHq0QrwJpRv0MJxqb2WNDdTFtjxSuZ2jT44dGD9PY1qHuNABrfwuA
	72d0sXyLcGrNrvpjPJAb075Vhh3dl8VW7fdDNmBKvURoxfuXHDuTWW+gjz8imLXhVw54
	UPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c3DTZG6WWpUNhVnn4LeP1CrYV5SRB40ArgHx57TOffA=;
	b=ayKvFrUXLzJv1wVK3wMtEShNvuRLQ2al6zmK/WYnr1V74NvVgEBclCbJs4wxoAXiBV
	I4A3srcWl03pxX9+KXxMrrFul5zHiS9TlZrSRAzNuZUSBzFfEJeAA6aXitE8RoFdXHVT
	8LYVU54jTBdf2zKcyuEcxtZmFD3shsd0DnMgCGIwAg5Ex1AoTaQpbts6BmtoHqjdXv4k
	u2ckJC+d05F8N90mnmEvLLGoFVJxbnZLMFj6QJOpeo3HK93uRodSOiAneqXlZm+Uzd3T
	VMZgv97O6MYIBb4px2sbRWk7XK+rshkaq3S1nMkd6aXLdY27t1ZxZm3Xe8KxRWnsCV18
	6rfg==
X-Gm-Message-State: AMCzsaXuPK/UzRV8FWXzKD4TlCJtzInMW8qrezBogsEoWjL9UaSqQJwM
	INDgOXlec6UyoithbeI5/6mUk0B7HgKSD1sZ89I=
X-Google-Smtp-Source: AOwi7QBy8gCQvyfJcFijPB1RbAJgADaONnUipPdy5rq9ieoRSl2ul6W25KgmC28vMvo5nG2U2yONH+Aed02m1X3M5jo=
X-Received: by 10.84.240.137 with SMTP id z9mr2086800plk.114.1507298741744;
	Fri, 06 Oct 2017 07:05:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Fri, 6 Oct 2017 07:05:11 -0700 (PDT)
In-Reply-To: <1507289466-13238-1-git-send-email-pascal.bach@siemens.com>
References: <1507289466-13238-1-git-send-email-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Oct 2017 07:05:11 -0700
Message-ID: <CAMKF1srGvzWgLJA8muqkTWCA-ahxrKQVbN8JM7y237M8JTXsAg@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rocksdb: add version 5.8
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
X-List-Received-Date: Fri, 06 Oct 2017 14:05:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 6, 2017 at 4:31 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Version 5.8 does no longer includes the facebook patent grant and is
> licensed under the Apache-2.0 license.
>

I see leveldb as well as GPL-2.0 licence file in repo. Are they not used

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-oe/recipes-extended/rocksdb/rocksdb_git.bb | 26 +++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
>
> diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> new file mode 100644
> index 0000000..a4fbf34
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "RocksDB an embeddable, persistent key-value store"
> +DESCRIPTION = "RocksDB is library that provides an embeddable, persistent key-value store for fast storage."
> +HOMEPAGE = "http://rocksdb.org/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRCREV = "266ac245affd69555643b735d19d3715c4eff91a"
> +PV = "5.8+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/facebook/${BPN}.git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +PACKAGECONFIG ??= "bzip2 zlib lz4"
> +PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
> +PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
> +PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
> +PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
> +
> +EXTRA_OECMAKE = "\
> +    -DPORTABLE=ON \
> +"
> +
> +FILES_${PN}-dev += "${libdir}/cmake"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

