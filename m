Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB0E7FC38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 10:20:08 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id l14so12740967qvu.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 02:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QpGVHo1NC9fM8Lg+T6gwUf1Rb6f0VFWkgPYffVGqKU0=;
	b=tnMEkD2QEgGuCrvm6xbEGj+g+ZHh296PAAORYi9K258vnD1E3SuZ/JmVvJMm44jgW2
	GTi1i9UfopTHrlAzApKlYzMRool0lYBXNF3ra8mSa+MFTaeSM/6edY7ZdpBEOEFGrcai
	IFGaMA3QLxhYmMK7UIbq30Zhl3Fqt/9fN4KD2qcQz0byCIqzn+OPSmMKTm/U53kmxY+G
	UR2JhGGVdoWVOtywSLnnVG/6w2g3fGa3O8WCG3rOEvWM4W2wfkIsooZThIyTqiNOk5u9
	YSvmWMURpvNNprPDf1aOlUXisMd0vkGZG+mvHdd/1TD09FDo18p8Oe7PpXZ+mXwExQoz
	rgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QpGVHo1NC9fM8Lg+T6gwUf1Rb6f0VFWkgPYffVGqKU0=;
	b=Yddf9GaMpBMwTN6jkqiEZTCoEwbyZtTny+a1sT8FEOdcr2T+dfEPkINj3wZHBK7OFw
	vnve62XmsFKWQR5oJEX6ESGVSfpPVNqwvmrRgp1wIihTO7pAZC7xR0T4LcHoFcEobQCa
	kM6emSKAEqWbVxxvYSzYpQQdmhaOVbN/fnU0sZiF7vzg2ItPpcx4agOxgKoAh4Bb9CmP
	3DgO9ZI3lCXZVUe886btCFiENxo871Jj90S/peE12mQG7ySdQv5Gfro2kaA8vCHHvEAt
	Ze5mqpWdPDpbXcy62knhsHhSOjoFHEcsoOJ6huQgC/jLAE2qpudDtocQY799OQdaVfgB
	mr+A==
X-Gm-Message-State: APjAAAUe/iTxRHw8kc6q5yWigMf+BVP1kUHdiHpe0yn7IVSOJMvPK0yV
	KzqSrFU2MOYFTJ+FvheOb+1siAiC8zk4q////wU=
X-Google-Smtp-Source: APXvYqyHnEkctBI+cvd9hLmeKdttZT4/UfCBxamSwCrINjkam+BXpejeR0nyQ1HoX9Yo4yS0H3ArJOz0hHoSiNJNgHU=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr15581936qvo.55.1579429209232; 
	Sun, 19 Jan 2020 02:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20200118111513.110709-1-alex.kiernan@gmail.com>
In-Reply-To: <20200118111513.110709-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Jan 2020 02:19:42 -0800
Message-ID: <CAMKF1spuyKJFuHMAb-EVFjLPE_cbqN9jd0TKD9yJffz8tG1O_A@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] fatcat: Add recipe
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
X-List-Received-Date: Sun, 19 Jan 2020 10:20:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 18, 2020 at 3:15 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> fatcat is a tool designed to manipulate FAT filesystems, in order to
> explore, extract, repair, recover and forensic them. It currently
> supports FAT12, FAT16 and FAT32.
>

Fails musl build
https://jenkins.ccp.xcal.tv/jenkins/view/YP/job/Yocto-world-musl/903/console

it needs to link with libargp on musl so its best to check a argp
function in libc and then check in libargp as backup see
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch

also check rng-tools recipes in core

> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  .../recipes-utils/fatcat/fatcat_1.1.0.bb         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
>
> diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
> new file mode 100644
> index 000000000000..f78d5d594a21
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "FAT filesystems explore, extract, repair, and forensic tool"
> +DESCRIPTION = "This tool is designed to manipulate FAT filesystems, in order to \
> +explore, extract, repair, recover and forensic them. It currently supports \
> +FAT12, FAT16 and FAT32."
> +HOMEPAGE = "https://github.com/Gregwar/fatcat"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=57fbbfebd0dd1d6ff21b8cecb552a03f"
> +
> +SRC_URI = "git://github.com/Gregwar/fatcat.git"
> +
> +SRCREV = "b923172d97c578297964c062e3a92799e2a9eca4"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

