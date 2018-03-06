Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D336C78A56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 09:16:38 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o76so20121862wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 01:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kasNjTHoh0VkbB+QMtVCKyYUrzWaLuIwrVjSjXveE+0=;
	b=DIuyMsjKUZqy16sTMiSPo+uRtfut1MSbD1YuLkUeahVZNbbnvOrzA4Uo0NHm6VDAtk
	hWrfUHsHTMR89zdDgXHQRQRtP4NXQbwG52QuzwR1rjb70KTV0Coql1hX6xzAFw7Ld6L0
	GqSegj/2VwUWxlE/cKn6OWcFlOgnnnlucWhBxCPTy0Vl9paofhyfndh6FO4RBmQAcaoO
	T5CXWIJ8i46gTcaPVm7NcQRWIp/P05UrDO19/4RKVQ2OxpiAnTFAyDacuikCWqd7Z75T
	ONJrVuH00f/42SpGrABo9i3WsYq7/FVvMMYyTCHe3vXmbbQ7Dp6FMSHb8+cBaltaWfcv
	VWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kasNjTHoh0VkbB+QMtVCKyYUrzWaLuIwrVjSjXveE+0=;
	b=SVN10MBnOcR71sa5o2laDlYdtmgkfWA/rvJADSj4MjROZAuc/Jxsv+/Km9UaYYz+5G
	e2bF4U6HcKG3iA2L7MPP73WVlIeBK8jsKca3oXrOy5XDYQk/xDgzZdR0QiJUmg5Lyz9+
	scT6NkBRO0XS6O9o50fopyyN+lBrZDszDMEHiKzWjP/3cTXY4WTZzYYXTaaTROoi47rH
	md9Gq9YSZKFAKqmYyv8RRdd1TuC4GM2avgPHABBPBLfhGsjqaasVDpeME9EeWaOkbE47
	+yXu56eYGl9xVGiWlA78JmHfQ9qNtxC7a+BZh2ANei+zGgZjxAQ+NJeMqjOL8cWckyFq
	lXtg==
X-Gm-Message-State: APf1xPATF0r2J5POacppQoC4XWVxHaDMPQZqdvBUSMnhfp+cvPxyZUiW
	mm9oUvVEB/iGOvFXvexmWY/u3gVeybTV52wBAms=
X-Google-Smtp-Source: AG47ELupIohffkFhPs8kngLeCCblPMafLQaf2gTEmUq5Vp0FDRqUP9SgDcWuxfkLVJTm2sUjb7OhuEGxSA8PP4yuKw8=
X-Received: by 10.223.179.17 with SMTP id j17mr14803642wrd.223.1520327799390; 
	Tue, 06 Mar 2018 01:16:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Tue, 6 Mar 2018 01:16:38 -0800 (PST)
In-Reply-To: <1520301312-29879-2-git-send-email-akuster808@gmail.com>
References: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
	<1520301312-29879-2-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Mar 2018 10:16:38 +0100
Message-ID: <CA+chaQdRsH54+GBVbW_FmaVoBz0Ry=CORNi5-uzy-gnBDHN3gg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/4] xorgxrdp: require x11 and pam in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Mar 2018 09:16:39 -0000
Content-Type: text/plain; charset="UTF-8"

Duplicates:
https://patchwork.openembedded.org/patch/147412/
+
https://patchwork.openembedded.org/patch/148545/

But ok.

BTW: The first one is "State Master Next, archived", but it isn't in:
http://git.openembedded.org/openembedded-core/log/?h=master-next
something might be a bit off with your scripts.

Regards,

On Tue, Mar 6, 2018 at 2:55 AM, Armin Kuster <akuster808@gmail.com> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> index 0c779b5..e86ebb5 100644
> --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> @@ -4,10 +4,12 @@ LICENSE = "X11"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \
>  "
>
> -inherit autotools pkgconfig
> +inherit distro_features_check autotools pkgconfig
>
>  DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
>
> +REQUIRED_DISTRO_FEATURES = "x11 pam"
> +
>  SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
>             "
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

