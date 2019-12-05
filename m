Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id D4C717F89C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 17:02:19 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x1so3892992qkl.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 09:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kJCCJDteMUstGUhzfUrf6Gb7tFFDLAZUwRr6AMaNqdQ=;
	b=aKeZAaF++0EOdYWGAe2KBXDlbLPFs8wB/1d6zBjCPHrI6J1CL7dkjSzOcwSxNzDOL7
	wKi+pKI/55g+H9SVWCe/uaxNKZ4Jv92DWOPVDD3+ByyTf2E8yxicelQ+t+omJKziAL61
	vAvTyVz8nbY25uPUO03EDsXBi5O4gCpSETnp78skYR+c7pH2bGzEJe+lllFYVkN+Yhc/
	QHA8ihRSMUwPhtRxZ7YiqF6qb83vtwz3siPEzMRe1fP6JC01afxF7kSAjbaDKiu0TbIV
	E8axqsLuEiFIFQr2Ka7+HF8XkCfx9BvKVNfWtJKI8+lbYU6sbrI4sSIXM4SCnjAwkcw1
	b6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kJCCJDteMUstGUhzfUrf6Gb7tFFDLAZUwRr6AMaNqdQ=;
	b=a4Hvk0UDfcPi1ru7MRnHgud4fu49vpks1W5jbmJR3gTjCqUWSfAxj9d8uACx0HXu94
	jGTo5NmNyABcfgDqTqCOJ3oP1sMQz2fRrbOPIAlmmG1C1VK73ZZGOYVXIFNlRs1P/LEp
	gnqF7CqQWoBrW/7FgG6uivkF2gQKHdAED7AKyJUkuS802MPn97Z+XZpYxh6qNF78su7u
	BDggOeXhBwFdHPxh8jN3Jpayv3cX5EjYXl4ejV+EneCksW2hjXHWVRZxLt502FESHnsK
	OFDoff0+YtYulUwHkyQZT8/33nfz7TPscjNcbReUsUgBpVxiql9N+wJCAfOxtbSP+ySi
	YxRw==
X-Gm-Message-State: APjAAAWAbMnlhQ0kVqqXCtcZYeUSeaxrJIj4upBLFJ8X/GyT0T/ICsjJ
	OSpelQQgyS1K4rJLz/7UhDWk+1xClMgPgYcLQVY=
X-Google-Smtp-Source: APXvYqymC+8kPcPR532Uy5sApevEv++OOxuf9nczHu9DX6Cf6E41JuVTNzpxHX/hpW2n0ABkEG/IKy/p1YOEh878ULg=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr9653629qke.9.1575565340394; 
	Thu, 05 Dec 2019 09:02:20 -0800 (PST)
MIME-Version: 1.0
References: <1575555909-31614-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1575555909-31614-1-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2019 09:01:51 -0800
Message-ID: <CAMKF1sq5Rjv=VO+FkZ9he8V8QxZ6Mgr1sgm4c=NqVXBmfNKaqw@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsprogs: 5.2.1 -> 5.3.0
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
X-List-Received-Date: Thu, 05 Dec 2019 17:02:20 -0000
Content-Type: text/plain; charset="UTF-8"

It seems to cause xfsdump failure


https://errors.yoctoproject.org/Errors/Details/290437/

On Thu, Dec 5, 2019 at 12:08 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> spdx information is added in GPL-2.0
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../recipes-utils/xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.3.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.3.0.bb} (91%)
>
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.3.0.bb
> similarity index 91%
> rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
> rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.3.0.bb
> index 5ab1d02..9a4b6b8 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.3.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://oss.sgi.com/projects/xfs"
>  SECTION = "base"
>  LICENSE = "GPLv2 & LGPLv2.1"
>  LICENSE_libhandle = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038 \
> +LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
>                      file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
>  DEPENDS = "util-linux util-linux-native"
>  SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
> @@ -13,8 +13,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
>             file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
>             file://0001-support-usrmerge.patch \
>             "
> -SRC_URI[md5sum] = "5ca3f79e76e3fb984a03d1b42a2e60ba"
> -SRC_URI[sha256sum] = "7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae"
> +SRC_URI[md5sum] = "ff4a505a9ff6e952399337cf3d2cc883"
> +SRC_URI[sha256sum] = "b29a64d04ad81f1f121d4683deae0bbb928abd1c891fe766b2c4bcdf61ab09c1"
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

