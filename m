Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id E5E0A71AD1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:26:26 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id s9so1444354ybe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DmF4mDoNjRfNK5wUPH1Q1ycVN0uTi78LJ7wJTfQ4D0I=;
	b=YtHckbZ8+XjRJeL4EFCyLmjScSnFA0qXBtzAf8AfemZbtkOu/ZO6yzZp4I6HwlbZ4z
	aYijMGRCbNmelPyS+HSsGjtWLoZ8UaLaSC4AO4nMdAbZ1F7x/X0/E2iKGh46MdZT99sz
	pTP5hqMwkI4YrkYXi1fN4VfElSJZgUWU+qY+8qQ0L4GFOsBmD+4igXjrPa2y27hdbmyv
	OrFnczowdOTwr9cVy9jUQfuNtaKSPvBRQb+wO46WHgdgBNxTr2CfbdBYcZaIegbr2lv8
	Sr/42UgyBlpdHKShiKosF2zfSVT7JwMsaraHlOF8suBcHrjhi/dbDTleGqo6wi9+UD8T
	zVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DmF4mDoNjRfNK5wUPH1Q1ycVN0uTi78LJ7wJTfQ4D0I=;
	b=p7UtLiXROxeL+sHsS8yR+CtnojJgBS9ZIzlkf34R/uJh+z/scAI8hcCSLP1VHJyj4L
	s7fVSjLZcT379CLiBua4Jah+B6oy1t22Ae6rkoh35P4DPIPaUKRCd5vHbdWiZARPidoO
	mT/RG2Sl6Nqby+9fYKfhTQkupo4q3LSVk+bobtoySo8J69pdEkLn7p34pExDbMf5/val
	vPjColTwtyyTMIcxmzgVIu90yzF+ncdSASQxKYgCHu5LMn+EgwzFnwmvGTnmTMiZH8ce
	JjMvJWOIUBm24AW3plTQpUxp2eyyoF49HwY7pvn1NuGFblzO4i8jMFzy9XuSDVHOcc/i
	l8IA==
X-Gm-Message-State: AKS2vOxFZMjA0u2/5slYWQdNO63nBum/8Fdc5PGmVhOudFkr6y3gzQGr
	azWpes8N8VFk+yxQHq0ipuqErTOS8Q==
X-Received: by 10.37.228.70 with SMTP id b67mr569514ybh.28.1498490788202; Mon,
	26 Jun 2017 08:26:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Mon, 26 Jun 2017 08:26:27 -0700 (PDT)
In-Reply-To: <20170626151117.6221-7-ross.burton@intel.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
	<20170626151117.6221-7-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Jun 2017 17:26:27 +0200
Message-ID: <CA+chaQfwLN87QvhhwCBaw-NtgvtcOFub-rSCcoxjAD=QKkQRMg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 7/8] meson: use tarball instead of git checkout
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
X-List-Received-Date: Mon, 26 Jun 2017 15:26:28 -0000
Content-Type: text/plain; charset="UTF-8"

I still don't trust github archives/releases, can we skip this one?

On Mon, Jun 26, 2017 at 5:11 PM, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/recipes-devtools/meson/meson_0.40.1.bb | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> index ab54b8c79..f33256a10 100644
> --- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> +++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> @@ -4,13 +4,9 @@ SUMMARY = "A high performance build system"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI = " \
> -    git://github.com/mesonbuild/meson.git \
> -"
> -
> -SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
> -
> -S = "${WORKDIR}/git"
> +SRC_URI = "https://github.com/mesonbuild/meson/releases/
> download/${PV}/${BP}.tar.gz"
> +SRC_URI[md5sum] = "8475b19d5f5f3bd5c40f4bb1f31b93f3"
> +SRC_URI[sha256sum] = "890ce46e713ea0d061f8203c99fa7d
> 38645354a62e4c207c38ade18db852cbf5"
>
>  inherit setuptools3
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

