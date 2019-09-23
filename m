Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id A73A47E465
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 16:25:30 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 201so15989347qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4ihnhJ9D0IUjHrcxJIZoUUF+d9X5UEQqTIZW8WDVPH4=;
	b=TYw7doTX6Uo7LMDQRV578L51I4RpcTf3FTFeN04IhvH67hmX0bMy6wMxwNSQP12olO
	Itqr2ZyNR870J/Bm0/jbxkAEvn32IHn4hudbcAm24u8m2+5AODM4aeWbgBLtb+tSJ2Jn
	ixqDoazOm5R/PGTWNidATQc3hfbKHxaIvIY/W9uSX0f+BhxyjlsY0SAk40vYzKVnjyXn
	ysaFHubaHeMSvy20rKt9YwWD0kzf0CJ82qEQrjaaPdl2Y2VcjDkP/lBJacU8a6bEPyly
	YmT4OvFjWOqhXbbeA03RQ5OQ5RA3IiFWsZKYq2Zg/3ypBDzYuoRquz0UReQTEVUDPpqL
	INWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4ihnhJ9D0IUjHrcxJIZoUUF+d9X5UEQqTIZW8WDVPH4=;
	b=XQPkoXpYL1BVjDWQYKl9msoQ8u4PRCMO46LxEhiFmltoUBPY08f6R4257HLDOmtMfm
	wnBtus1QpCBeRn+sQdDzd/96mULUlPa5xd27CZ4UOw1N2xlr5Pn1pfTPaizo9VwfSlZo
	mCuh96hLpdevyxG5BriJWxFwoC4zC5y6EfF7EJpIJ+ticxJQA9RSp9Uvb0PsgN3ez6QG
	rrWxcMNAWbF0Gng1OI7ohcKs8i114TVcXiZwJyMQ2CrCOpzFb7RVAh3/LC8OgoSjFqiS
	bgaiqWJq4uXHIJm8Jsm9DeQAPvstBMucqMZdlQ0+QQTaGyyKhGZiIHPGGjmmikzY5Vrt
	iDdw==
X-Gm-Message-State: APjAAAVu0Lis8mLOPKKa1MUbwIr/ok0kBNEZJd7sDpT8VlU4hCgzoYP4
	OgfGzi389BfmGgHf6BDQkBI+tM/ncrAyVCrzn0I=
X-Google-Smtp-Source: APXvYqz1guO63gqX1OUvtMsc5XJb3U3mTYE3/cBjrRKTbZEfBnG7BJ8guagJuka2DJkYuIoYvEzlo7ET3TjhSt4Ue5A=
X-Received: by 2002:a05:620a:653:: with SMTP id
	a19mr644655qka.337.1569255931228; 
	Mon, 23 Sep 2019 09:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155811.25526-1-brgl@bgdev.pl>
In-Reply-To: <20190923155811.25526-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2019 09:25:20 -0700
Message-ID: <CAMKF1srDtyMHk9bCNDDg6GEeHJ-Gf_kWopJ2ZoTqK3Y4CADtkg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH v2] python3-dtschema: new package
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
X-List-Received-Date: Mon, 23 Sep 2019 16:25:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 8:58 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This adds a recipe for dtschema package developed by Rob Herring for
> easy validation of YAML device-tree files in the linux kernel.
>
> The version is current git as the only release so far - v0.1 - is old
> and doesn't work with kernel's dt_binding_check make target.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v1 -> v2:
> - added PV
>
> Note: I'm already seeing patch 1/2 from v1 of this series in master-next
> so I'm only resending this one.
>
>  .../python/python3-dt-schema_git.bb               | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-dt-schema_git.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
> b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
> new file mode 100644
> index 000000000..831b8fb8d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Tooling for devicetree validation using YAML and jsonschema"
> +AUTHOR = "Rob Herring"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM =
> "file://setup.py;beginline=2;endline=3;md5=c795d4924c5f739424fa8d9b569c6659"
> +
> +inherit setuptools3
> +
> +SRC_URI = "git://github.com/robherring/dt-schema.git"
> +SRCREV = "5009e47c1c76e48871f5988e08dad61f3c91196b"
> +PV = "0.1+git${SRCREV}"


It should be SRCPV

>
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} = "python3-jsonschema python3-ruamel-yaml"
> --
> 2.23.0
>
>

