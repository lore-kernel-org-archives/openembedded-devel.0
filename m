Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E07A97F435
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 13:40:04 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y26so7633499qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NCwi36bWjk8T8o02vDy5A+LwsMfmV+KVEDx3sz0CPuc=;
	b=h+lKukFc/ZF/zUp+4sZ+SU4UgN5hE8m17a5HGqD3YG1tbSBplDIMBWbXZaBlDxT7kf
	fWUHpSRoLWDLrYe13gcggLHaBj0KkUvA+UrvAGlug6u++4yXZnbTatFyqqvwNgRgVXN8
	qUGibZk3Q9kZOgy2P4AzDbcw50SApzSaaFddQblGe2BdTJDbUv3Qp3+aZsJrrPpBnSy6
	yINHNeUMZDeEvP0mk9bsuSMOSh4SD8h7AaVgn7gCHh3iQTHrXHTX7HWcVBLY99InocdS
	Mm9hodzQLCRmzbTaq+qrrqJX43eTaa05FTEL78dSqe67feCgUo70lp6eaA1hsIOuU5iU
	Me3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NCwi36bWjk8T8o02vDy5A+LwsMfmV+KVEDx3sz0CPuc=;
	b=LVqHztGHnPLkCa1oylxq+ppSnnck6p6B0JMAav8+zLz3OJlzTxFWB1SkL+MRMXZWN7
	aiEihE/hVRmNQ0SpWM4ArEe4bq35lKRh471XpZG/4nTJR9UmnD9z7aVSkTKW2TNxDX9/
	XIA/gKG0Cgg+BjiwS0PAjOMt2EPNQk0HhDR5nNOEEbXWlt31gqKbUDOkuTg01+aLbjCw
	0AaLaP+ooxpnmwOV4oFysD5dI0+Lfs+FmTfwTGY/vcTxm69K0YaxDBVCEhU6PU34/2wf
	q2V8oXWFMSbfWvp1sdtA7BBKHreEvPgm2eyeew0vrUoYPg14z2RgLXxgBoBUJES9zwhf
	ykFQ==
X-Gm-Message-State: APjAAAUaxMWaoQ3gKe4Flb9DOaMggOcr8ySOf7xJ0SEV1KPAlKCybNOW
	EVLUr2HlQVb5bjjIoYdyeLNwqcngtOSrz6LL8Sw=
X-Google-Smtp-Source: APXvYqzRmN9jUjIdmQkFZ8GzuXCo+Xq9/8t1iN946MhNOBEtO/4olbD89Hr+T0JNxwv6Qhi39UmHOFAjDL1EANSWDjM=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr15241605qti.88.1567172405475; 
	Fri, 30 Aug 2019 06:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
	<1567160770-34654-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1567160770-34654-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Aug 2019 06:39:38 -0700
Message-ID: <CAMKF1spPyms_du7cvJNy6LUN7oT03ijX92QqaEmSB4APCBihpA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V4] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Fri, 30 Aug 2019 13:40:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 3:26 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
> add it to packages RDEPENDS to fix [file-rdeps] QA issue
>
> Set PREFERRED_RPROVIDER_libdevmapper = "lvm2" in layer.conf to explicit
> RDEPENDS on libdevmapper in cryptsetup
>

I merged v3 so please send a new rev reverting parts of v3 as well as
this change

> Suggested-by : peter.kjellerstedt@axis.com
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/conf/layer.conf                               | 2 ++
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 55051de..2aedc39 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -33,6 +33,8 @@ LAYERSERIES_COMPAT_openembedded-layer = "thud warrior"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> +PREFERRED_RPROVIDER_libdevmapper = "lvm2"
> +
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>    mplayer-common \
>    fbset-modes \
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> index 6ebf1e2..0773671 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> @@ -16,6 +16,10 @@ DEPENDS = " \
>      util-linux \
>  "
>
> +RDEPENDS_${PN} = " \
> +    libdevmapper \
> +"
> +
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>  SRC_URI[md5sum] = "f7818082056e5bc0be12e4c7fc20345a"
>  SRC_URI[sha256sum] = "9d8f8cac2836a1623c075b5cba96032271dc81a28b2aa27fbd8331e831416bb1"
> --
> 2.7.4
>

