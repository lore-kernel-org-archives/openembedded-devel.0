Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id C47587ECA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2019 20:12:22 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 201so60832qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2019 13:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t9yNGgbdfsSshiuz4hd+tn8BYHbbQlT0PYA4bHxhKsk=;
	b=OwMMcQKtUlzkDOejEt4YUd5yydj/XbDQ0mm/2EL+g3OxVHXsoADGiKXYwNRHfDfR5K
	5yRjOznPJgotbCMRgORIKmSL87QUN2PucGP3weFpWFxILsneaeWiNuCzIgJBbwUa9+fW
	LBvnEYZc0KGJ9sNPQGSxa+jm/KOneEuZEvwBWCPsAKVQGsyPVY45+iW8H7vorS8jWjMK
	J58GqOHYl3sOzJEosqziilzZ9DyPNGEim6LPpuYT1J6aINXqa9DReemhdREJAAXiWeSA
	FD0bqRknsXkdUZ2S8cQrYxs1IRs08JsaEKtltnNcppnUfvjaQMh4/zaWgWiNXg0R6LaM
	C2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t9yNGgbdfsSshiuz4hd+tn8BYHbbQlT0PYA4bHxhKsk=;
	b=aPAkBjujWOOCoiHpl1u638vMOMPxtT7FsyzxuwDez7yrjF6d8NYaM1vCG5G44njA/s
	wQW6mpISe+V8UZhwb0WFDik+aAlKLF5/kYxJpGuuerDDvklEhznpcUUuwy9GWVcGnFvG
	Y9jmQkUdzoIdZNRBrwDTq12cVP8xzoLdVClYWttr1cwOYgDVo+xJGWXUTbUv+YNmUL9y
	mDtdwKiFc9JFzEQzllSriXHgESsWEtOn93kO6Udd5PNWb5H/9Ln24eu5slSv2F6pJl+E
	TQDcAsNH1rX8Ke7opLyS3YuQK6s+9CbTN9ayp8oBJ2r6VWJl933Ghv7QoanF8DMiGvlk
	lfEA==
X-Gm-Message-State: APjAAAUmxrs98X+HNQJH5Ipc7FvZG2W9VAu+6Im2ZUyjQRhZcVHEZ/IY
	lQAFKwTJkJ4G9dXnZ8MM/RUfIdiu7woTaff1kW0fErL0orA=
X-Google-Smtp-Source: APXvYqwlFPq5KPq96t/77oDFYU4aHPQbEzqNqZUPwgaSzmIjZKE6qdp00zaemsn+40ZdzgvNHf7jhr6O+AhYKFR4TPU=
X-Received: by 2002:a37:7083:: with SMTP id l125mr1014319qkc.71.1565813543131; 
	Wed, 14 Aug 2019 13:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190813081921.8178-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190813081921.8178-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Aug 2019 13:11:56 -0700
Message-ID: <CAMKF1srqGAbpKLnNW1Q9UwWmD9sCjq=-5JDr5CZg62S96pr5Vg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems] [PATCH] xfsprogs: upgrade 5.1.0 -> 5.2.0
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
X-List-Received-Date: Wed, 14 Aug 2019 20:12:22 -0000
Content-Type: text/plain; charset="UTF-8"

I am seeing this xfsdump failure

https://errors.yoctoproject.org/Errors/Details/262092/

are these related ?

On Tue, Aug 13, 2019 at 1:20 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-utils/xfsprogs/{xfsprogs_5.1.0.bb => xfsprogs_5.2.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.1.0.bb => xfsprogs_5.2.0.bb} (94%)
>
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb
> similarity index 94%
> rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb
> rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb
> index 0130fd2..10d1b70 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb
> @@ -12,8 +12,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
>             file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
>             file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
>             "
> -SRC_URI[md5sum] = "7199b7aaf088d82fc8a1660ffeb63626"
> -SRC_URI[sha256sum] = "ca8b4e73dfc5b6227bb6d4e73d019035a1975b83ea41e218cdff15058a9f6c45"
> +SRC_URI[md5sum] = "e38032818aa3b1ef224a69b6184fc12a"
> +SRC_URI[sha256sum] = "e41cdaa43d92b38c8a12ce9cb612ab911ba0e019c2e0762c494a8a601f533fd6"
>
>  inherit autotools-brokensep
>
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

