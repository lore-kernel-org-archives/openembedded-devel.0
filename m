Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2F037F876
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 11:38:47 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k1so18013148iom.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 03:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XysMVd9YUbT0QVz+gKCIViOS6Nhjnk4sdJP9i9yE3G8=;
	b=hgMPF2hKhOMzrWWzxFwQfxGOnBzMWt+mxJxczEuHLNNv0VM1A0CSKxiSnTprZxwzmY
	+xBRSOCDkl9J09XiyEJmv/GliSVqmfxh5OTX5DD5N/RFW3KGlXTTfiQCkLmFw9AmzNdm
	yrPKnugP2HLIdPnqiH3VP2oHcJjEgcZ1NW/kY6EXQm/M5ZLSdlLBH4HD6YkFOkU6usTr
	8mLfNC7zoUcYebraZjtIUw2eU+/pRbrBLTFTFOClC/d67uedav6/Y2wH4KKovWhAuDxs
	f/gYMTZG7lXmc5iLdapYWCFxullt5qOMVI6aHQOCm67WnIXwmMPHf+PY6S26a4WrEDqq
	hhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XysMVd9YUbT0QVz+gKCIViOS6Nhjnk4sdJP9i9yE3G8=;
	b=OvskwNxrSwfNKCI9XjLN1RNtpRukC+70+jyxxe8Kx853BlZQiH+cAiRUZJqTMGovlb
	TPQApPsOEazRszrbxMLUXJQ5vav9AjEVHfvwD1lRHlBz1za3fu8y3+rsn6R/gyA9KlWo
	1KlPR7SsLOcFHpeFLAtoVJtqYWCsyd28BESUT0ghk6uhDJwMzGxPv38gFpGMDtA6+j5E
	33U3eC8aLVj8LFrG3sEBf4VnrP/o2VagxBCdqQjJzV3TG6zjrS0Kok5FdHVUWsCu7I70
	iKfTvUo8rc43aWYbpNNYyw0jpwHs/GqXmOk0liqRGhNiQYSvq7X5gYNco+Qtq6vw9tnj
	fXdQ==
X-Gm-Message-State: APjAAAW5xczdmh5iWJf2fuIkwPOZglLalkTBZySRWKbyhRyrYuBk0Rsf
	1M9n8bDRzVmOxz1u53HZsJAwVmbqQhizSt/zG3Q=
X-Google-Smtp-Source: APXvYqxuKOBYR+F8L3LUUl/ywsw2+SXZruNaV0NFbX2JrZHMwCXrOjF1ZuD+dgHqo46ooMknaYHc3s2ba/htoPBq8E8=
X-Received: by 2002:a5d:8146:: with SMTP id f6mr23721048ioo.108.1572867528797; 
	Mon, 04 Nov 2019 03:38:48 -0800 (PST)
MIME-Version: 1.0
References: <1572876614-6152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572876614-6152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 4 Nov 2019 12:38:37 +0100
Message-ID: <CALbNGRT49DwpLZ2BA2x1pBY+ynGQ9rn=hDZeExAY0G8Hkei65Q@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mm-common: upgrade 0.9.12 -> 1.0.0
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
X-List-Received-Date: Mon, 04 Nov 2019 11:38:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 4, 2019 at 11:31 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
Have send similar + meson-build + summary

Andreas
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb | 9 ---------
>  meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb  | 9 +++++++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
>  create mode 100644 meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
>
> diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
> deleted file mode 100644
> index 4f91f31..0000000
> --- a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -inherit gnomebase
> -
> -SRC_URI[archive.md5sum] = "be1c61587db989c7677375a729b94672"
> -SRC_URI[archive.sha256sum] = "ceffdcce1e5b52742884c233ec604bf6fded12eea9da077ce7a62c02c87e7c0b"
> -
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
> new file mode 100644
> index 0000000..3dccbd8
> --- /dev/null
> +++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
> @@ -0,0 +1,9 @@
> +inherit gnomebase
> +
> +SRC_URI[archive.md5sum] = "9087b8612d75cbc1fad0c99e15c2a718"
> +SRC_URI[archive.sha256sum] = "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
> +BBCLASSEXTEND = "native"
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

