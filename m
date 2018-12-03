Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2156BDD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 10:47:18 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id i20so11143889otl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 02:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pPY3EoNk4+QcwvHKhdQsCv1JYai2oYFC6CbVP18LUPk=;
	b=CdMm3nyLSk4DtPlMDbOonq9shZm5rRxkAROIT0t2xfeB9zFp7k9M/IdT8Zx3szvjON
	67NEWmAlgvM1h91yLOeeEGiDT+XbnB50WEn+65apMvShj1v1aEQ9pHspBvdUBPru3igb
	H3XsWf3l99vrtIEgRJhFWKL12VhobH/UoVJIjox+1VsWvl+u967i5I6M8Lv60VbgxGEX
	cxECzVBqr4u+nmjj9mb5M1G9zjhr9yQWdyLuw3MtgeBhsqBxhYBKzItt1qQo0j4GQLn6
	tdoP7Toiw/HrYrHKWbH8mXq+uetg7GnPn0QGrifBOJwV8KcHnctPZ9T/7+c5xC0Ik9y6
	D2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pPY3EoNk4+QcwvHKhdQsCv1JYai2oYFC6CbVP18LUPk=;
	b=LvbJ5fUgs54sEI5MmznAUuhvGQV4BZR+nH18hrtChOOS0zlJk8nmnU3/vfyTc2ckUu
	t187NYxnwBRv9ds24ycycM8sUdbjxe+KQgyJzFhtnb5paLGuB4euW/GM97JrYXf+mSOP
	C3SBWUio4vEgxnxsCjup3aqbkZkRhtv7HYlgMl2TJ94FDI5vzkDCQ9VV5j8gxJy1PSwy
	Gwe3M7GmAEFjJAtJQVlYhrNcibZDDKfYCAoq9FBboryDr3NP2y+cnYtJ92wvfD0EKYBm
	epSbyjzBtY08++eVv9f6isc+8G6R61HeKDQK7Dm6rehtC88H5JkyfZzGPKXBzpU51fdE
	XFxg==
X-Gm-Message-State: AA+aEWbWu/rJYpkiQMStOYouTc9ylwmRBBIMD1UMk8olCanWrWEpvtFP
	whEtREyPdmzidQPAWH87W9MUBFP+KDQOLqJXbFk=
X-Google-Smtp-Source: AFSGD/UoNZCVoPxTXciDBVbablKAY75UkSgTHTaEwrp45J3UO9sBpa8w8aGqP7ilVWTZsyL8I0HDGi2uJn8cNT4LPgA=
X-Received: by 2002:a9d:640d:: with SMTP id h13mr10116837otl.153.1543834039100;
	Mon, 03 Dec 2018 02:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20181202191346.15104-1-raj.khem@gmail.com>
	<20181202191346.15104-3-raj.khem@gmail.com>
In-Reply-To: <20181202191346.15104-3-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Dec 2018 11:47:07 +0100
Message-ID: <CANNYZj9g4mW=tk0fTYzK7rHes5GDVVgXtm2wNeE0eLoOOC3X7w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] packagegroup-meta-oe.bb: Exclude from world builds
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
X-List-Received-Date: Mon, 03 Dec 2018 10:47:18 -0000
Content-Type: text/plain; charset="UTF-8"

My patches fix this issue though, no need to exclude if you take them.

Alex
On Sun, 2 Dec 2018 at 20:14, Khem Raj <raj.khem@gmail.com> wrote:
>
> It does not parse, since it has many unmet rdepends
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 08b4bbfc48..2d24653b1d 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -1,5 +1,7 @@
>  SUMMARY = "Meta-oe ptest packagegroups"
>
> +EXCLUDE_FROM_WORLD = "1"
> +
>  inherit packagegroup
>
>  PROVIDES = "${PACKAGES}"
> --
> 2.19.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

