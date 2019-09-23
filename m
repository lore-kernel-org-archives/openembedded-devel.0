Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id B41F47DFBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 15:30:49 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w14so13198406qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UMNqHuavqNMOKhRPR1YHQEe5SJcBShwWZONEpNEDbsM=;
	b=jxj7feBbhqbnuFGZV3tapcoW7n9YZWb453gjY+cyGpD0JCeOwzQuFedQ84VYbMk6+M
	NDPx/XCAMcCjPhVb5f8sE9fSuDDSYp3T+IAQ1frUIhxE2/3L7r3bumGkLrFb/pRJoR+t
	iPZVdBLlxDSod6bCg9L32w1wdFsYe9BX1S/RV9iFuJGqkj+8l9rUZHUN1DGVmwsdIfDu
	xWK4QFX7ydQ9H8itKavO9UXFD7sjWfBH+lPEHOE7qRx+kVA7/5puleAM7u+mZ4TjHauW
	1RBN6AUvsmp3uhA6hqmnun0UkHhIPYsuiyBGF+TwgQsezIHGcDraEb5gFaNfbmU7isGR
	30XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UMNqHuavqNMOKhRPR1YHQEe5SJcBShwWZONEpNEDbsM=;
	b=I9Ya2e4G1gjSZEVjaGO1+93TLVuue09DU6bYE3skH7/9jQsBSXMxvOnKcUnxIMgmYd
	Yyibah630qA+HwaljlzES5jghdCsdRckb6NXX4TZrRLibShCMKweQPnc1uYDjy+gBceT
	4+9a5e8AtsAPIGsNBKAcaNRV0/Yyg8Dj4tE8ND2MLgUt5r+rHfXAnhumquQ1SK7WK9qy
	Cx8zNUeP6FJ7twojJZ2fy4Uhpx/jfO3KpgUHPrZ7XGmOmxK9D90fVYtNanEFX25VkR2j
	hf0iwqQdvLH6uzhjdRFenvAO2dbuKMFBQ9M005063tC9EPy7dGnpAJ8NEmna2Pu8ZXjH
	HpSQ==
X-Gm-Message-State: APjAAAUS+95Fg+lQNpVBKxNY1/K6YlVLGGVDGsCsIOeSJ5/hwnTCLR2o
	TfjCizC3CTF3m4BbWmfvf8xm/8AmIy6zmedUkPw=
X-Google-Smtp-Source: APXvYqxhfza5U9FJFTmSpGT+MYyKHBOAUhDJNiGN+yuN3wF9TMYSDqoDku4bWPKlptgm9iLihL2bxz3kbff0u+5/ILk=
X-Received: by 2002:ac8:e09:: with SMTP id a9mr551040qti.88.1569252650185;
	Mon, 23 Sep 2019 08:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190923100058.30454-1-brgl@bgdev.pl>
	<20190923100058.30454-3-brgl@bgdev.pl>
In-Reply-To: <20190923100058.30454-3-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2019 08:30:24 -0700
Message-ID: <CAMKF1sotZ49VJ2_Esrmpx3E_foSxtMzM71qP9_B39u3FeuDefA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python3-dtschema: new package
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
X-List-Received-Date: Mon, 23 Sep 2019 15:30:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 3:01 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
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
>  .../python/python3-dt-schema_git.bb                | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-dt-schema_git.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
> new file mode 100644
> index 000000000..d2b4ae1f3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Tooling for devicetree validation using YAML and jsonschema"
> +AUTHOR = "Rob Herring"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://setup.py;beginline=2;endline=3;md5=c795d4924c5f739424fa8d9b569c6659"
> +
> +inherit setuptools3
> +
> +SRC_URI = "git://github.com/robherring/dt-schema.git"
> +SRCREV = "5009e47c1c76e48871f5988e08dad61f3c91196b"

its missing PV

> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} = "python3-jsonschema python3-ruamel-yaml"
> --
> 2.23.0
>

