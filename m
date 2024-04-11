Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091FEC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 21:06:19 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.31798.1712869572136210268
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 14:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZYwUFBq;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2a2474f2595so169584a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712869571; x=1713474371; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qDtaQgoJFlV+EXFZdZy6tzeRL6BWFAP031lU7JkqoKM=;
        b=FZYwUFBqJ7sjA9J9i8mJOk0utBuIwaFgNFaPsUAJQUVP/2sHQK2cqw6yV60sQCVWSx
         iAofNXrXu/GdT2iNleQJE7+pYCdzIduCuKuPaKpe5yd3mKsp6IXFvHk4qtMoPnseTk7/
         EgchaqJbM/qW4+gs1nse50/AbHEATdeOix/h2w/HkiIAe7h5xZ1XQro5zOUGBxlYerPA
         bXU8lXBq83j1MloJocxXNjBF4xuKhF//ibh5cGrqVEfMm6QF+ghqF4M7kEYIyqHTWiYc
         urHCWv5i4qmIrSgkv4GdRY2nbZGxq+sCOBDdgVZU5kJOxvlEGR5SJkUUhRQnQdojDo3s
         D3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712869571; x=1713474371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDtaQgoJFlV+EXFZdZy6tzeRL6BWFAP031lU7JkqoKM=;
        b=HxajCUQqqukRL4DyJsnVkDaWfdemSqG9liGMT04fM4ZTPpOhBuzg637QT32GH0hFs2
         KUUPQfxR3UwAOjGQCBbeg7AMdnwvEeQmRi4sLXmwgC4fDWQjdMyk+OPt8rP8TPUHXgjZ
         RxZY8aC9A3GSygG72Y1N661vlDbpf0vn+aVcsmlVLdTFSoVGLuPZpUQquSJrBwGgOUBr
         7cvqMv+JwnsBfNtchwpmFEH91JbOcTXpI15FPxS9nYboAn+VnM0xpQPpIbFNmiqIKmoD
         yUc3X2Vy8o9I+iBe9jsKpMmT8c+tqUt94rJKet9V3JJNME3fii7/en2Gi1zOK/4oBOE7
         21tg==
X-Gm-Message-State: AOJu0Yym//XeOcaozm25JPER65t4dVSeDH3XGyesO5snp27aX7gcI7q1
	MzcwBoayro9M8+Pt6uBh9QqxRg+aHHJBrBE6VCkdPJbzQn3UEKFcF4i1mrG/U6dn77XiruFwkQf
	46yCd0ktxlKkS4oMFYbE/ubNdsl5QuoXqh1Q=
X-Google-Smtp-Source: AGHT+IGs9dFLXXm9hFhpyYoXn1Ks1oIDmD5QHp5mZTgBoerZRXWLxaWwNiLP3lqbXi1s+yFzH1DLCQIc7QQ5PrrJfBw=
X-Received: by 2002:a17:90a:d605:b0:2a5:460d:72f1 with SMTP id
 w5-20020a17090ad60500b002a5460d72f1mr747313pju.1.1712869571476; Thu, 11 Apr
 2024 14:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240410223025.318718-1-beniaminsandu@gmail.com>
In-Reply-To: <20240410223025.318718-1-beniaminsandu@gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Thu, 11 Apr 2024 22:06:00 +0100
Message-ID: <CABQJdOHE=fuk9k2jDj6uciqsTfZbQGD=uATD_yFwTsmnwzS0bg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libtorrent-rasterbar: add initial recipe for 2.0.10
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 21:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109927

I see the revert for
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=0597c931ffbadf2a2242d8ed9cccb8567953d489
is staged on master-next. Wouldn't this bring us to the previous
situation where the CVE is addressed to the wrong library? I thought
we should map it to the new recipe instead?

On Wed, 10 Apr 2024 at 23:30, Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  .../libtorrent-rasterbar_2.0.10.bb            | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
>
> diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
> new file mode 100644
> index 000000000..084e3c408
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "libtorrent is a feature complete C++ bittorrent implementation \
> +       focusing on efficiency and scalability."
> +HOMEPAGE = "https://libtorrent.org/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d8b6cb42d66e6b3c47a909c3ce678a7b"
> +
> +DEPENDS = "boost openssl"
> +
> +SRC_URI = "git://github.com/arvidn/libtorrent.git;branch=master;protocol=https \
> +       git://github.com/arvidn/try_signal.git;branch=master;protocol=https;destsuffix=git/deps/try_signal;name=try_signal"
> +
> +SRCREV = "74bc93a37a5e31c78f0aa02037a68fb9ac5deb41"
> +SRCREV_try_signal = "105cce59972f925a33aa6b1c3109e4cd3caf583d"
> +SRCREV_FORMAT .= "_try_signal"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig python3targetconfig
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
> +
> +PACKAGECONFIG ??= "python3"
> +PACKAGECONFIG[python3] = "-Dpython-bindings=ON,-Dpython-bindings=OFF,python3-distutils-extra-native"
> +
> +# Strip host paths from autogenerated files
> +do_install:append() {
> +       sed -i 's+${STAGING_LIBDIR}+${libdir}+g' ${D}${libdir}/pkgconfig/${BPN}.pc
> +}
> +
> +PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${BPN}', '', d)}"
> +FILES:python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/*"
> --
> 2.34.1
>

