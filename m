Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 40D2D914F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 06:17:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e12so1666822qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 22:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mP/h9+QTDBAxa8FzvEcsH5mdT/OMJpnpQ597a5sthn4=;
	b=dT123grKFpiXl2C2rcWcu9kc9ox0yIoGGP6EusixoMz8o8HpxvXxhAOhMfJqW9HUf3
	Og0wsN0HCghPqUsmw8AcPJdPl8OA9awV7fYtR7LRG24NIlvOni9YCIZv+kMK754PcjGU
	vmiZ5Xxp72kk9dOQq8zckGEbV96hqUo4ql0kAZXhB1P08KxXECpnwLNeDhIFYo5QsSYj
	nTA00+T8X2+f3I8FcThDDEd6N5Xiq8gxBzliImyXJXJYHdTUYMP0FL5vs1bo+K+K/OO/
	6efq85gvb5Uq4jyf+zB/V999fti0nq9LBpc30MYmkKrbtWmL7UKPLCJaByC6LA2hYk/0
	+2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mP/h9+QTDBAxa8FzvEcsH5mdT/OMJpnpQ597a5sthn4=;
	b=fyhnLWu1rQ+IctBCuqDaAQRjxRygnCYtv1ygzVFuIz+Hhoc2pP/06dn6ZgOoFqOjFQ
	f8FzPGbsDf3CHAU5yt+TcBvI3oHHd74X2/BVUej4Snf8hbs2WAocCkmQHnEubeDnIvXZ
	42VdH+VvXhE3lp8+q+TbjGTZj4q2AYXJRwuij0DDvceyubZOi8YP4hgdEePzGXG3bwiF
	ksa4BVULI7xil/56TR03Q+XMmclOm/gbL4KuJxduWoj8w5TY+K0GH8aH0+FEYfLywcD0
	Mah1h/8dLpdZKmgI7czYsQ5ethKfQw+6Lo+EzHY8+uej+gIrJMBwClsVyJqLydHDb2Hl
	UgAw==
X-Gm-Message-State: APjAAAVo05QIOh6w3fw6yj7+Br1Y5SYr9F5ODIo3p+S/1cE0FdgNq7E2
	We7fkMoLTsQwFHIl9xWmkcmffqK8b8lGJ7fPup8=
X-Google-Smtp-Source: APXvYqyglCD2ix9bgfo/DIgxs2QHAcpn5+tdQIzQbqwqaOpaUKQok9Ia/kizFEDtFUrOqs1Jv2Em3mKclAJsndJEFDM=
X-Received: by 2002:ac8:4657:: with SMTP id f23mr14733889qto.378.1579760245838;
	Wed, 22 Jan 2020 22:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20200123052357.25350-1-ticotimo@gmail.com>
In-Reply-To: <20200123052357.25350-1-ticotimo@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2020 22:17:00 -0800
Message-ID: <CAMKF1spw16Wmyd1_zUYeb81+yr6jdccq=5Ui43VKD7WKYX9LPQ@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-waitress: add missing target RDEPENDS
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
X-List-Received-Date: Thu, 23 Jan 2020 06:17:25 -0000
Content-Type: text/plain; charset="UTF-8"

subject says meta-python but from looks of it looks like it belongs to
meta-python2

On Wed, Jan 22, 2020 at 9:24 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> * Missing run-time dependencies:
>     ${PYTHON_PN}-datetime
>     ${PYTHON_PN}-io
>     ${PYTHON_PN}-logging
>     ${PYTHON_PN}-re
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  recipes-devtools/python/python-waitress_1.4.1.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/recipes-devtools/python/python-waitress_1.4.1.bb b/recipes-devtools/python/python-waitress_1.4.1.bb
> index 7ab4aaa0..3e144b5c 100644
> --- a/recipes-devtools/python/python-waitress_1.4.1.bb
> +++ b/recipes-devtools/python/python-waitress_1.4.1.bb
> @@ -10,3 +10,10 @@ SRC_URI[md5sum] = "e6b9f0406cb4e6fedcc3add96411786d"
>  SRC_URI[sha256sum] = "f4118cbce75985fd60aeb4f0d781aba8dc7ae28c18e50753e913d7a7dee76b62"
>
>  inherit setuptools pypi
> +
> +RDEPENDS_${PN}_append_class-target = "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-re \
> +    "
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

