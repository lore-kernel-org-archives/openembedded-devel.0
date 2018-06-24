Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 01BB3751C6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 00:31:55 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id x4-v6so5923339vkx.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2018 17:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CY/bPaO6lLNKcyXqpKWUaoc9be7ZabZ380lTsbbezJg=;
	b=cxtVKzNDFjPULgktC2RVOUgz0cAw3UokHJraDaZ3clM9x1Pv/bJ3n+wg+HxQ/U1wK4
	mWWt734aBMzFkBQDsYj37Q7YCYjUIUgqFiyVlIvkBTtBQOQ3k+vzL6MRKpAznxomZ3aP
	vm3+fq1Uq0bNbbKJfD8Owsh4Jv5kiI56YLJCIJrDHLopEZn78QTnlB8RDWOvHpUiupLk
	vzSKUNyGxa8j2T6Yaxq8Noi8hjtRnhi17K2Ha4jHVZLbSWQeKCrcCwY8JWebfO+FAOry
	3LmpEkXoefrEoTopu5+9c6egg0veiUcXakSJDUIuM9CX2NZApIP+ErGZudeVu9K8Lgp8
	eJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CY/bPaO6lLNKcyXqpKWUaoc9be7ZabZ380lTsbbezJg=;
	b=tw+vonXZRbOttDG3zPoxM0BbmUloHXzsp9fzy+kTPbyp2mTjvnjpDdq0Ywn88PIWDY
	k1moaoH1TCy3slFTHa7AANkoVsqYU7qnfSZnrEyCBnUPdlwI0/60ShKeuwO4Q5pafnHY
	lAh97X9/7JrGyy40QhBm0V69f1hk0kSSMHZvMHh5tDRZCrq7qbQqjPV1hK2S8Ov8sdz1
	iCEYnT3YrRkp4okL+/aSyUT2tBDHg8GDwjwNiKi5OvTuqX4UdDaFBEl9Yu2gW3w3vSLA
	TeowWHhVA1G8OwF0tuTGSau9XACQ1mxV1Xw0arMYWjZvamGV8jXIcTaaLbhfwrZvbj8Y
	0UEQ==
X-Gm-Message-State: APt69E3WpwuifFrUzGWMjAn4kYO5gO48I/JDjuq9N3q4x2ZdXVOLFTPb
	31kZcADo9nxT7DdHDtzQz9NRGbIVsl43tQmJuVQ=
X-Google-Smtp-Source: ADUXVKJMBNkptBxw8MsuvHbXGiGV7uNGLB4nE9jV1D43fuHF6fi9vrliB9hOeb6b8fITqo3u6GHXMLueWggDYtrRDjs=
X-Received: by 2002:a1f:1e10:: with SMTP id
	e16-v6mr4380956vke.176.1529800316475; 
	Sat, 23 Jun 2018 17:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180623235626.228940-1-joe.slater@windriver.com>
In-Reply-To: <20180623235626.228940-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Jun 2018 17:31:15 -0700
Message-ID: <CAMKF1sqObyS4hW4hLGA=TynF+A5TSYZZvRshtMg4wDzfvdz9ng@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 1/1] metacity: allow for warnings during compilation
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
X-List-Received-Date: Sun, 24 Jun 2018 00:31:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 23, 2018 at 4:56 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Add a PACKAGECONFIG option which lets us permit warnings during
> compilation until warnings from new compiler versions are
> dealt with.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
> index ce97a80..948c2f1 100644
> --- a/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
> @@ -23,6 +23,11 @@ SRCREV = "c0d4b2fc0fcd6f2d3c37da935923f9e9ed5eb99f"
>
>  EXTRA_OECONF += "--disable-xinerama"
>
> +PACKAGECONFIG ?= ""
> +

since we defaulted to gcc8 in oe-core, perhaps its better to turn it on
by default.

> +# enable as neccessary until new warnings are dealt with
> +PACKAGECONFIG[noWerror] = "--disable-Werror,,,"
> +
>  do_configure_prepend() {
>      cd ${S}
>      aclocal --install || exit 1
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

