Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 58CD77DE3D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 18:19:38 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id n8so11075043qvg.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 10:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EajAt3gz6rEKFKr3veSZgrgJNO7PNeHUV6PGJJi899Y=;
	b=jTLVWdywk2iB3gzezgtTfEAt/s1GCok3y7p53j9tRbQfKASxTnNU7yXM8kH2cPQTR5
	UMAlQ981lGb8qrHOpxQdEFas9ZvYu2KNOQde+NvbeBZt40VYKGxXBIKETF0w/JuaxJNA
	BSe7pJqrwEt5/MkT4vQ0G/dUMf/7MuaO0yNF/8SKbek/pXEkCx9zxvzeIYg2Nc7A5xUp
	5HA6XBYKPkxJbfhTG39q76E3K1/3MpZVWJNXRt8J0/J3L1MgbUrlSwmj7rEZdfUYXrXu
	mO0alfJvUNTO3VYzoPbIVqwRDr20ULk55qoSA7Zy4uf8lKBfF7RxIBUDfwV/PGT9Bob6
	YwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EajAt3gz6rEKFKr3veSZgrgJNO7PNeHUV6PGJJi899Y=;
	b=dBX12hRPVgYc40LEFHtsjc+jw3MlNyWeMhWlTwGpCtJCEBmWTscXpOQeW2N9wPtmBT
	C0l+fkmqGTSXehj5aV3X7ho4rtczaMvLXHj5fHaVALYw7ybLNPTM8ahqNwk2GBGlZztT
	3+4U7Pa+Zn/WwxXiYqQ8gCptab0poOv4CysS2B98ZGqQ1OQmXLR0jJDvAdeka7pZk4SE
	bV3IG6NPABh/VgIgPh5NV+oIcxceAZ5aP0VBbI8jtRppit//ry1++HD2SijZzrYK+pnR
	pTIEBKuGnmmOUicS6N83TWP3BHUUqEcFHbAW9lmGF7F7pGl0F+X9wv8OPTaFqYvh3G5Y
	yKyQ==
X-Gm-Message-State: APjAAAUDVv8+QSwnZU27KsxH8lTDRPgIEuZbO66357H9/0aQRqvrKFC1
	Z9YXOr1HJidXA5GFCvkM/Gscg9V1Dxl9iEmpXz29y40XSoY=
X-Google-Smtp-Source: APXvYqx3rm+fA2D78Y3nmyQv1c3rhmpPlnXYlp7S0ivugzUwkZeYjgQGC9xFayxZJy0gE52+AIbSDO4kqJ7HdmCMVGk=
X-Received: by 2002:a0c:ada3:: with SMTP id w32mr43268051qvc.99.1577557178760; 
	Sat, 28 Dec 2019 10:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20191227171243.10525-1-peter.kolbus@garmin.com>
	<20191227171243.10525-2-peter.kolbus@garmin.com>
In-Reply-To: <20191227171243.10525-2-peter.kolbus@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Dec 2019 10:19:12 -0800
Message-ID: <CAMKF1spvKvo6GgboQ-7SooANuW_UkKveA9JdX0PNGXPcE=mONQ@mail.gmail.com>
To: Peter Kolbus <peter.kolbus@garmin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/4] python3-soupsieve: add recipe
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
X-List-Received-Date: Sat, 28 Dec 2019 18:19:38 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/300495/

On Fri, Dec 27, 2019 at 9:13 AM Peter Kolbus <peter.kolbus@garmin.com> wrote:
>
> Soupsieve is a CSS selector library used by python(3)-beautifulsoup4
> since 4.7.0.
>
> Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
> ---
>  .../recipes-devtools/python/python-soupsieve.inc     | 12 ++++++++++++
>  .../python/python3-soupsieve_1.9.4.bb                |  2 ++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-soupsieve.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-soupsieve.inc b/meta-python/recipes-devtools/python/python-soupsieve.inc
> new file mode 100644
> index 000000000..058aa8525
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-soupsieve.inc
> @@ -0,0 +1,12 @@
> +SUMMARY = "CSS selector library for python-beautifulsoup4"
> +HOMEPAGE = "https://github.com/facelessuser/soupsieve"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7f538584cc3407bf76042def7168548a"
> +
> +SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
> +SRC_URI[sha256sum] = "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
> +
> +inherit pypi
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
> new file mode 100644
> index 000000000..1b9663691
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-soupsieve.inc
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

