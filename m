Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4565971A30
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Oct 2016 15:38:36 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 10so3813498ual.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Oct 2016 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=XbRLR567ndXKsgwrrB9Qtqp0USGfkMYlFiuq1+v4bfA=;
	b=LXjHIRqcFevOeZm4dSUAbDX0cu+pYs7m5u2nal5P60Ep1NDgr6u/RNbyV2JNxy9Dic
	iz/+SgrSlgARJWozYHQvBYyT4FHMDD/9ez8lweDornn/BGJPvgCeKX6dkrRytjWj4JSh
	V9Br1b8H12RiSOf5K5zcfWEvseNm0jlFoqwdS9SwoZrmiGo1j+N91jbaxM3hxuhbA+L2
	WtvXR1f8VWkpZyMZTFTkne/Dz1z0wS3xeyJY5rYqciraXGL4YBnuJEy25/5Mpcj+LtO3
	+qGUKBj2iYSb/wzJ0/n0lohs0Vy1/uFC34NjmGy5mfe0a7kiZtZyqTuypGAmS1ky1QdI
	HMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=XbRLR567ndXKsgwrrB9Qtqp0USGfkMYlFiuq1+v4bfA=;
	b=UQIB7GiA14RyuEPsAazwbPnlcJ/VxNAqZVx0mvEL5k5vgGHuWybo3DxqP+MNIt27tX
	te0A6tNAu1G+AnQIVXHmROrwrv+Wf12nhFg0T4dGCkg3VB6xPeafyRCrY9MAB1Koccab
	oEAemWD9FOV4zn5ntdYgIgMzwwVFSs5iP1pKixBiFtbCa4UxWaTglDvXMo1b3YYmtdLj
	P8QVxzIRYElwcsfpHgaioxDchWpyGYJY53Po9L4NyPDW8yrf7sJNycE7dcYhsfQX8yZo
	bJO5y5uifLYB98EbQ8T65C+n5cn0yYvKlpPSjF+Dvc1gj0ADFtez7MaAkRVTD0HTHibx
	nb0g==
X-Gm-Message-State: AA6/9RmKNQgMFO954J6rqg8EGXb+Ktug57oXy5Wtkfr0yRHhDj8nbwcdGzzdwp1l+OGl+1vgXNoCIRjgpKoo7Q==
X-Received: by 10.159.38.227 with SMTP id 90mr6341027uay.31.1475681917793;
	Wed, 05 Oct 2016 08:38:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 5 Oct 2016 08:38:07 -0700 (PDT)
In-Reply-To: <1475660078-12664-1-git-send-email-mike.looijmans@topic.nl>
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
	<57E69552.9040209@topic.nl>
	<CAMKF1so4gZ9zYqS17E-xRq0U-bu27aiv6v_EiR2zc3OqCgDSYg@mail.gmail.com>
	<CA+chaQcftFerFC0S9_+XwsZqZ6EAMtdfOjGj5yjoy2mut9wO0Q@mail.gmail.com>
	<1475660078-12664-1-git-send-email-mike.looijmans@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2016 08:38:07 -0700
Message-ID: <CAMKF1sqTt+xuBTo4JyBDMUaHoygpuVUgcjQWyGfM9DAobaioyQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] phytool: Add recipe
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
X-List-Received-Date: Wed, 05 Oct 2016 15:38:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 5, 2016 at 2:34 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> A nice tool to directly read, write and interpret ethernet PHY data.
> Very useful when debugging PHY or MDIO problems, which ethtool does
> not do.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Fix LICENSE filename and checksum
>     Honor LDFLAGS value (patch accepted upstream)
>
>  meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
>
> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
> new file mode 100644
> index 0000000..d451aa9
> --- /dev/null
> +++ b/meta-networking/recipes-support/phytool/phytool.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "PHY interface tool for Linux"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
> +
> +PV = "1.0.1"

perhaps its better to include SRCPV in PV above since the SRCREV
below is really 1.0.1+some more commits. moreover we get srcrev
accounted for task hashes

> +SRCREV = "3149bfdb4f513e2f0da0a7d0bc5d0873578696f2"
> +SRC_URI = "git://github.com/wkz/phytool.git"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +       install -d ${D}${prefix}/bin
> +       oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

