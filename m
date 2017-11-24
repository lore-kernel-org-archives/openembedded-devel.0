Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D79317199A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 08:26:15 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id w203so8022592ybe.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 00:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gBn1AAxj0M5m72muciIu8TpLs27YiPao9sqq+3cORCY=;
	b=gCYgtPVHQ49jpjJhE3I4xAYrswQKD6EV+FsoazU1srith7eBoosmZYC0XzAZNmwbOo
	EtbJqcmGh0Wb9S+MRwe7O+BW8imIDnMH7ttZGJihznVjX+80xykOGYu7sLFXKLI85Elp
	JEEDqPs1RjMagCHO93bnxKu1NSB8B7YZ0cJS4qNWrpzX6FcH52TLaCd6NoakEmhCrUcY
	EAmc2f/b+7Gnf+6pqTtDSTwxR9rqgeE+psUYDzPBsjSDdVeV6iX8YgY3VIwzF0vXvBeQ
	rnzgJTDJmzIuT4MbXCFQ4GksfKwGAx5lId6j8r7/VPZ5k/qXCekEI6YRGe8UKV/d96ev
	1HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gBn1AAxj0M5m72muciIu8TpLs27YiPao9sqq+3cORCY=;
	b=oFfAQ7fSe4e2xqEc9H6S3JBCgghfjzEliNop/XmIOcRwjQsk42qrdn5QfVv+8V5iA3
	7Z3NS8opvoO4L/e6oVAjXo0z5USd1PjJhJtG+EPh1N4LVTDP/6BgF/eAUlju3adKBz8b
	YrAKkmZRiNHT2o76ktUGTVUdofDK44MY7ANjwcdY7C6mOoxkHDd1RD9KWtFaVKmlAMtc
	KFgCv6Bho+qGe7iR7IZu+K5yn94klxNe6B5BB7VIgCG7rYVuhYDkiFLttt49aT6/hfXk
	JsetzqzOM+D1pDI4LHxJ1+7leyFBJKcZVmKNI6XsVPHbTqWoapA5pslqVF/2oNUSRmwb
	n43Q==
X-Gm-Message-State: AJaThX7ZHrSVC1dmkUXitm+ps47FYCqAEEuQLR5FRwe0+ilK1v5cOlC2
	3Utkgu0U5QKyur9Azh9KiJ90V8ycCVnfkRP87vU=
X-Google-Smtp-Source: AGs4zMY5JDsz1T5uAna9iyms+bRSX6zWVuTF/+Wh+BOPHPkGOQh4wj7nCQpD2L09lqz0eR8or8/pCs0o2XGJKzftU98=
X-Received: by 10.37.5.207 with SMTP id 198mr17753027ybf.336.1511511976648;
	Fri, 24 Nov 2017 00:26:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.98.21 with HTTP; Fri, 24 Nov 2017 00:26:16 -0800 (PST)
In-Reply-To: <1511511021-50020-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1511511021-50020-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 24 Nov 2017 09:26:16 +0100
Message-ID: <CALbNGRQZzzwRJgGUR=Cx_KY=SahwuRiYGFHv2Zeq4-PpT2BF=g@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xrdp: new recipe
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
X-List-Received-Date: Fri, 24 Nov 2017 08:26:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 24, 2017 at 9:10 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Add a new recipe xrdp_0.9.4.bb.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
>
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> new file mode 100644
> index 0000000..5700936
> --- /dev/null
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "An open source remote desktop protocol(rdp) server."
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
> +"
> +
> +DEPENDS = "openssl virtual/libx11 libxfixes libxrandr"
> +
>
Please use git - github tends to rebuild tarballs which changes checksums.

> +SRC_URI = "https://github.com/neutrinolabs/xrdp/releases/
> download/v${PV}/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "44598489561125182f6e2e0c33ac8e19"
> +SRC_URI[sha256sum] = "059e362db550b58a108117e6538363
> d90f07edd0a54810affae977a6b0bb6ea7"
> --
> 2.7.4
>
Andreas

