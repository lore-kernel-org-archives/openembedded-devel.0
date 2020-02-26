Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 35C8061671
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:58:03 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id c16so3885255ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DsWsq0W2RkM6XIAkW/dSULcl3HsUapzmAQBBEp13ZD0=;
	b=Lm5PSDagSgTrhXbcuHQhR1OWAYeVAyYa8gaExD4YdzejeVjuivwncp2w2uAonyFKSo
	UcYTQJPl4aW0DKfvp9D92acF2voDIy4/U4sZ4tXd4KNyoz6G45O423VmdeT1oBOpklLZ
	9+n1NzdSCvBzLRjb7IXcQvzyugZpvM8jAJyqIc3/KfbeW+EbqjKJFiTCZ0r+AL4Otfsw
	kaiNq9rJuHcbCqM9SZSsIhDK4qjVWdxm7dEgUQxMiGtuBu/f3pTcxBqN6ib9tgWV/v71
	do/sVgzouPbYoO2JvkMTz5JNq6IH+8kAaEUznw5CMO2wa0/sF1mqhybp+41DaCaKGbIZ
	k5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DsWsq0W2RkM6XIAkW/dSULcl3HsUapzmAQBBEp13ZD0=;
	b=HUwrePWMgM7modNVvQSFl5eFUGsVLYwPyotdyyUo9i6ZaFZ4lSSV94MGMiSxTYt082
	VgAXvsLfSPT40Yvu4fASY4NmBrwO1Kxh5KRlr2ubxN0E035Mzwx6aKw2UvxCGcU2Tm1q
	7iLUoY6yRE+Mvcaq6XdThl1zmNMeDCNq9Isd9fO9BwwhovRmzs06UOpqZkM+vFy4pfY+
	DIuDc45duFkkwptCQi4KOEA+tgtF2h/XvCdMZTQGjA45SyDab3fQoIg5+W8OYIpCOsxd
	nYy3GrZhqAeKSXshQ6TxxM+DiJSepDh5wmivXZvQB/TrSbqZOoZYKGTlOeCuVhA/0i/w
	qdHA==
X-Gm-Message-State: APjAAAV8LyUKa9IMes6l+Iw6sUv3xCYbcRAvgG8BevIbdTzN6SZpSlgB
	Z8Ud7zxbzXii8QFzeFPcEcl/2D032VtJGKNYh4RTLNcc
X-Google-Smtp-Source: APXvYqwV5y6J/PxKelMSRovAWRW/aK5mOSDZiTBwZ8PBZ3DYJUOrGU7Ygv1Ks+mIKvoVjNaeGSqYwcveihFQly2D2aY=
X-Received: by 2002:a6b:b642:: with SMTP id g63mr4924463iof.122.1582732684249; 
	Wed, 26 Feb 2020 07:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20200225190739.4056-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200225190739.4056-1-Martin.Jansa@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 26 Feb 2020 07:57:52 -0800
Message-ID: <CANx9H-CxuACxvqwnpys5Cm5yj1hcHK-_fxF5aQ5Yy3sSMMEV2w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH 1/2] python-ldap: skip when meta-networking isn't included
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
X-List-Received-Date: Wed, 26 Feb 2020 15:58:03 -0000
Content-Type: text/plain; charset="UTF-8"

Merged. Thank you!

On Tue, Feb 25, 2020 at 11:07 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> * fixes:
>   ERROR: Nothing PROVIDES 'cyrus-sasl' (but
> meta-python2/recipes-devtools/python/python-ldap_3.2.0.bb DEPENDS on or
> otherwise requires it)
>   in world builds without meta-networking
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-devtools/python/python-ldap_3.2.0.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-devtools/python/python-ldap_3.2.0.bb
> b/recipes-devtools/python/python-ldap_3.2.0.bb
> index af8961e..8e43dee 100644
> --- a/recipes-devtools/python/python-ldap_3.2.0.bb
> +++ b/recipes-devtools/python/python-ldap_3.2.0.bb
> @@ -23,9 +23,15 @@ do_configure_prepend() {
>      sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:'
> setup.cfg
>  }
>
> +
>  RDEPENDS_${PN} = " \
>      ${PYTHON_PN}-pprint \
>      ${PYTHON_PN}-threading \
>      ${PYTHON_PN}-pyasn1 \
>      ${PYTHON_PN}-pyasn1-modules \
>  "
> +
> +python() {
> +    if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
> +        raise bb.parse.SkipRecipe('Requires networking-layer to be
> present to provide cyrus-sasl.')
> +}
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

