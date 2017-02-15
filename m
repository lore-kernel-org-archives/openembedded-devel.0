Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2B6772DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 13:43:50 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c4so5780287wrd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 05:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=IbK/L2rrsjl8N7VwJTgXxYHlNBnWNAeHbI+QOo5xgFQ=;
	b=of7Vy2pCKElNo00jghvTRwr9ur75hm192bMb5vvS+my7Zd8rWBvX38B8H2XvuOQmn+
	DovlgNrrMqG5n8FksTu7u3duqcQgUM1CKRdbU4iCLgROZHID2tw/IyJWbOdWqeD7fwZ5
	G0MeGMEJMhWXj+GBMqCBetmQ4pyTY3c6ZibrOhOGMoiJ19UMwwCiHMfHzyVEGy2UeD7x
	7P9mEfQF0M7Cg71lHaeScLQdwiWnWYIqI4iCVEFtzBKVF6xVSrGqIXREuI2lqjSJrP4g
	XUSuqmbPcW7Daf26oFydQ31qEKKhTPMSML/uSQqn6B7b1sORnbUMeFMlWf8Bc4P6aDle
	yPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=IbK/L2rrsjl8N7VwJTgXxYHlNBnWNAeHbI+QOo5xgFQ=;
	b=VOLyvzjmT61cr1c4PnL/azmHD7LnOhVsOwTqxv21KaPelkpnC+0MBJK3Xx3KDyuCfT
	Yvj68FQst9i9JrPeLFqzBQmLE0k908hQXHEq8bGqwxqE3rirMYDsDiMnYLdL1IbpxBz9
	8VoV6E3U9ccllJNSmhGvf3C6H0CX1k6398+fVCWUc3M8/hTbs4LR/xk0APmxZA/e+PYg
	EQnvhyzjfslgBfQz4Um7HlnO5oE/N2dt82yrjAH/fa4u16gjQ6qKZ0SR+RVnnWs/hry6
	41KwK9SHbw+r6MrJliTssls58sT+2l/kPu2GXqtJkGVbt5SkBLYuFl95G+Ji6JHbgNSR
	XH7g==
X-Gm-Message-State: AMke39lLfcIXE9B/Dde/bEATMeFN9PZrDosFJjLkbqz7EYzCN3ZanuH7Z00/uuH6qDrt7eMH01AysYS+iUJrkg==
X-Received: by 10.223.136.109 with SMTP id e42mr30510261wre.14.1487166230250; 
	Wed, 15 Feb 2017 05:43:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 15 Feb 2017 05:43:49 -0800 (PST)
In-Reply-To: <1487166114-3845-1-git-send-email-linus.svensson@axis.com>
References: <1487166114-3845-1-git-send-email-linus.svensson@axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Feb 2017 14:43:49 +0100
Message-ID: <CA+chaQeGCbp-LDyJjpqsLV+LpQVc9p7dd_T8m9a+KXEN+vRxhQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/2] meson: Add recipe for the meson build system
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
X-List-Received-Date: Wed, 15 Feb 2017 13:43:51 -0000
Content-Type: text/plain; charset=UTF-8

> SRC_URI = "https://github.com/mesonbuild/meson/releases/
download/${PV}/${BP}.tar.gz"

I'm still not persuaded that the github tarballs aren't regenerated from
time to time.

Can you please use git fetcher instead of tarball?

On Wed, Feb 15, 2017 at 2:41 PM, <linus.svensson@axis.com> wrote:

> From: Linus Svensson <linussn@axis.com>
>
> Meson is a build system designed to be fast and as user firendly as
> possible. Find out more about meson at mesonbuild.com.
>
> This patch is based on a prototype patch by
> Ross Burton <ross.burton@intel.com>.
>
> Signed-off-by: Linus Svensson <linussn@axis.com>
> ---
>  meta-oe/recipes-devtools/meson/meson_0.36.0.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/meson/meson_0.36.0.bb
>
> diff --git a/meta-oe/recipes-devtools/meson/meson_0.36.0.bb
> b/meta-oe/recipes-devtools/meson/meson_0.36.0.bb
> new file mode 100644
> index 0000000..1ec7e3e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/meson/meson_0.36.0.bb
> @@ -0,0 +1,15 @@
> +HOMEPAGE = "http://mesonbuild.com"
> +SUMMARY = "A high performance build system"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI = "https://github.com/mesonbuild/meson/releases/
> download/${PV}/${BP}.tar.gz"
> +SRC_URI[md5sum] = "dfdd190c5f10a67bb40e6cf93944dd43"
> +SRC_URI[sha256sum] = "dc087ec40dacb5e256e6ee6467f2d0
> 04faf4ef284d3c1ce5e89faa1e16540950"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} = "ninja python3-core python3-modules"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

