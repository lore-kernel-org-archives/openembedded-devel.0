Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id CD6157F5D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:42:50 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id c16so3845072uan.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1I0HxfPa1G8ls5o3iqCBjFDxHNsg87d3fnk5vMM3N1o=;
	b=B71fTbUbcb8TnZ4XfhQe3KLo30kMuPms/RVC/ylTslpa5Ho+MRqpKqRvpNdtnBIesT
	qdm02wGC633gKfixj9bQS/o+9Ju2CmYrB5BC52uvF5rnTvw1JdrwQLc2uvWcN7POxztI
	RMbraYPDsYRvjEduhQY44lMfXF8JnRDkcyLtN8l7sBMDzM2shOUGYOpBVqUEAMHO5Qnj
	A4JR9JFf3rQrZiEQJoUtRjXkOVyjHi5dl9vgDDh+TPgInKKBbQrmfOA/K0+Y041ZbeJ5
	+DsPI0tgjnkddEoDcUUH0IXtPs+q9NkXdYA5QzMxAhUYVtVkU5oOD23Fm9uUepZnsKil
	/bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1I0HxfPa1G8ls5o3iqCBjFDxHNsg87d3fnk5vMM3N1o=;
	b=MBAw2AR1/URdsM4W725aRh8bcA/oYsfipILmECvsp3VaoqVDRO2H8iFdeqdj8BlMx5
	89Y3xUJNdh8oiYyZjfab74lFBWCH6W8XGPQ4Xt8c6KGkxxV//GAiy0f+iQU2kuTGGzrP
	Sq/KWN7AIkBIETdqlazZGtywCsMEdBbqqphsLbbqdJUbony2WEN6FF6nmOxt07yUx9yA
	QypKP9nbgN9PaNMi6j5CV5Zws5J0BZVacPDEnNOenLFNRufy7VyRJrkYDAd31jqTgC/1
	ul5pl3nWw8eZPrdJ5PsEyzSn3Pgp/7Rx9edk6P3t4JWJfXNVKYHZHqbiFzrfwD1u5e4q
	C0sQ==
X-Gm-Message-State: APjAAAWckoWUV1zQH+Hl+Of88+iCpSGCjXlhSR3pGWL5OSOM5GDtU8JO
	QSdIqfhJHtychUB9janlSbzglWU/LbLGRDo1U3k=
X-Google-Smtp-Source: APXvYqxYI7ofAPiIG8oizdvkJ0AQTpnWZDfpB40HXtGXC7BZ6TwjUoAIs11yTboq7QCKNoCXy6vFtMo5LfoBXCNuVKQ=
X-Received: by 2002:ab0:2258:: with SMTP id z24mr10705346uan.100.1572360171387;
	Tue, 29 Oct 2019 07:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191029094526.26093-1-yann@blade-group.com>
In-Reply-To: <20191029094526.26093-1-yann@blade-group.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Oct 2019 15:42:39 +0100
Message-ID: <CANNYZj-CRwEA5n464osntyqaTH2cYgw0RXtnyu=gdP4iyCjNYQ@mail.gmail.com>
To: yann.dirson@blade-group.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yann Dirson <yann@blade-group.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] mesa: fix meson configure fix when 'dri' is excluded from PACKAGECONFIG
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
X-List-Received-Date: Tue, 29 Oct 2019 14:42:51 -0000
Content-Type: text/plain; charset="UTF-8"

This should be going to the oe-core mailing list.

Alex

On Tue, 29 Oct 2019 at 10:47, <yann.dirson@blade-group.com> wrote:

> From: Yann Dirson <yann@blade-group.com>
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  .../mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> index 3458c19199..346b217585 100644
> ---
> a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> +++
> b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> @@ -23,7 +23,7 @@ index 0e50bb26c0a..de065c290d6 100644
>   with_dri_swrast = dri_drivers.contains('swrast')
>
>  -with_dri = dri_drivers.length() != 0 and dri_drivers != ['']
> -+with_dri = get_option('dri') or (_drivers.length() != 0 and _drivers !=
> [''])
> ++with_dri = get_option('dri') or (dri_drivers.length() != 0 and
> dri_drivers != [''])
>
>   gallium_drivers = get_option('gallium-drivers')
>   if gallium_drivers.contains('auto')
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

