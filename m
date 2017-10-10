Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 693CF71B86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 08:53:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m72so2978035wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 01:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+k0uOGtaIO5tp7EWNRcFv5jzGY3iFhtXJ1ch19G+rnw=;
	b=da1xjDiQHJvlSgpuDNNPCfdbrWUTNk93zMmEMY3ZyUAqaUdhLkmdBkwGsIbWO3NArh
	/YbUNphkv2jKjte/5xGA9Yq+huVswy7ZphlKlQCelcoM0W9HKXHFmI2C9iO2pi/uPGU0
	uglTI28KnCpvYAoMLVrLPJvfszNu8lER/yxFTPHekt3G14hpHjJI91ftL3inJXxShJnq
	qVaWVkoOO5lxTFltSA8nAaBZtxPvv+8Goe+b6ig7Vgzn/wxdPT8FRhv1uSzWzhAlLvGC
	VSFWDrLDfeSd993syjaUyy8uTxKksB/LJxqtP/MobizenfjecL9riVB0uEE6JN+WpL6R
	O40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+k0uOGtaIO5tp7EWNRcFv5jzGY3iFhtXJ1ch19G+rnw=;
	b=tsd/8KMKgNyzELVBsTbdRT76kbjR4/AUtkcme2YZVV9FGN3hEn1bTighPNPhubb+bY
	QCYpHun1/OF8BgnAkBpcdZczDTcKj04/5lDj/h93UQoXoen0gYKfWkFP9L8ggpOHD3OT
	9klYqNsteeU7lUakFLu0nUFQiZv+7hM8tY/zxWhmIh5drxf/sLn7UUdYm1okK/puCeTP
	mMqa84cGSck1WYrw4JQnptfvzLprg4prbi1qVZRAs5Qp9bcgshOiSmbF0RyZu0p0NJFC
	ypjuA7cp2VzP+4kmhfeG3dAS5xjAu49TBmKz5aNTnLuNnIO8n+GoiYdwsllP/uzzFCIz
	Ye4A==
X-Gm-Message-State: AMCzsaXFF7rP+k+QxsMRtsaqcGgHcW5t7v3mmcK0dxqVEgg18m61lmM9
	b7kFTF8B7hZglbtsZ87wB3/sxepLdyXHASZ74G0=
X-Google-Smtp-Source: AOwi7QDzdr5uiIVtmcRbvqI7Dr5uGo/SxNuDl4LSfp5eXOK9DU25q1MAmQjNmVJx/YN1cOvCj6t2W0Q0WTlc+AZZLrU=
X-Received: by 10.28.63.150 with SMTP id m144mr9862140wma.141.1507625632071;
	Tue, 10 Oct 2017 01:53:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 10 Oct 2017 01:53:51 -0700 (PDT)
In-Reply-To: <1507618762-30618-1-git-send-email-pascal.bach@siemens.com>
References: <1507618762-30618-1-git-send-email-pascal.bach@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Oct 2017 10:53:51 +0200
Message-ID: <CA+chaQdHXmH_Ct7WgVO-2HyrFGSd5w6nq=cF0z33amc+TWNGBQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] rocksdb: add version 5.8
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
X-List-Received-Date: Tue, 10 Oct 2017 08:53:51 -0000
Content-Type: text/plain; charset="UTF-8"

The v1 failed to build with:
http://errors.yoctoproject.org/Errors/Details/157120/

If the v2 only updated LICENSE, it will need fix for this as well.

On Tue, Oct 10, 2017 at 8:59 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> Version 5.8 does no longer includes the facebook patent grant and is
> licensed under the Apache-2.0 or GPL-2.0 license.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-oe/recipes-extended/rocksdb/rocksdb_git.bb | 28
> +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
>
> diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> new file mode 100644
> index 0000000..2e988bf
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "RocksDB an embeddable, persistent key-value store"
> +DESCRIPTION = "RocksDB is library that provides an embeddable, persistent
> key-value store for fast storage."
> +HOMEPAGE = "http://rocksdb.org/"
> +LICENSE = "(Apache-2.0 | GPL-2.0) & BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=
> 3b83ef96387f14655fc854ddc3c6bd57 \
> +                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://LICENSE.leveldb;md5=
> fb04ff57a14f308f2eed4a9b87d45837"
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
>

