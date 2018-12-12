Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id A394E6076F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 12:49:32 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c14so17615319wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 04:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wVTs38Fin3JmMA4KzWXjhxXltthP5bOkOy2wqXfVz3g=;
	b=nv8RuU0JDTYMEb5XhAYgUYtXO7ss7VLQhYGhyXmWu4qKxeUky4EdAW/L9DU+tbuE+6
	aFXvHZXqqMSwHAomD0eQVI8jx7U7QhDaE9x51GsFJC4nffna+3KgrW4qv6vm6mvrYUo0
	WYo5UQr5T05Rd5sbKTnxpgoCIxVeVpXszq5IMojJ0BuHYTIzFS0YVtqGrJT5rWn0kpDB
	bFggGfNgOEe5Pbt5q97WLzCDqlA6pfXuRH6cko+KkpCKQwO+eBEPYWJGSdMOTqlGWrfY
	yCZS+zSfAm6vhH6VdySEki2CXmUPry1w7slTYQlo+tAEkd3Ifa0nDWSnvyPiu+0RgDIZ
	BrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wVTs38Fin3JmMA4KzWXjhxXltthP5bOkOy2wqXfVz3g=;
	b=czzC4Ckh0U9U9Qd5Y7JbOtR2KS23qIC9gHMhwpKPjeW/vMoANHm97p73xjZ798Vct7
	pu8bBrvhk+x7WJyM9gDJUKxTvNGAfAhKsZY8T81WbYPZXOmMIgB1g83GKVauJYeJsi85
	pJXpk36c0qWBq67EIJX3BGLTsg8Dy6ifz/y7pQXDbDR/Pc+lcWUbcDkIjUHdX5hk7W9a
	57RqvGe7m+9o/2m76iiVCLcQ70PhQTdB/AOGaTENivFCrANBEUv06m8wcbumB1XI/Htm
	QCitV3pZopbplY+17E4PWOGfKDXcw/8G2Y6gdd8um3D0IBsVrYut9PSBsdAtxXhHgPqB
	qe4Q==
X-Gm-Message-State: AA+aEWY1yM37GEgID0A8NffWjeTCrJP4NKY6LGs7DlYDmCfvh0PLCu0n
	1PF+rtEE3olDJw5UtgRaeK/J7onXVjJJTfvD+GQ=
X-Google-Smtp-Source: AFSGD/V4Vvnuu/ofybGJVI+kfO4/YBkvR9fN8jTWGcEuQuT0+L+9WZEaUqua0zAkcJFG1LQveovehEviayhw+Ewr4co=
X-Received: by 2002:a05:6000:110f:: with SMTP id
	z15mr16519440wrw.136.1544618971778; 
	Wed, 12 Dec 2018 04:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20181212123756.6539-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20181212123756.6539-1-costamagnagianfranco@yahoo.it>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Dec 2018 13:49:24 +0100
Message-ID: <CA+chaQdrxbMXHmttTBnOYqU5M=tY4NkkGQLqFMEzdiaQwQFZyQ@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: costamagnagianfranco@yahoo.it,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpprest: inherit pkg-config to find brotli library
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
X-List-Received-Date: Wed, 12 Dec 2018 12:49:32 -0000
Content-Type: text/plain; charset="UTF-8"

Why does it need target pkgconfig to find brotli?

Doesn't it need pkgconfig-native (through pkgconfig inherit) instead?

On Wed, Dec 12, 2018 at 1:44 PM Gianfranco Costamagna <
costamagna.gianfranco@gmail.com> wrote:

> ---
>  meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
> b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
> index c94038f8f..49da6d35c 100644
> --- a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
> @@ -3,7 +3,7 @@ SECTION = "libs/network"
>  HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
> -DEPENDS = "openssl websocketpp zlib boost brotli"
> +DEPENDS = "openssl websocketpp zlib boost brotli pkgconfig"
>
>  EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

