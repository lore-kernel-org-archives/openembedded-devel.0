Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BEAAA78258
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 12:03:20 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id v186so1365345wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 04:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mZkPKL6Aaf7gIzCVNq7/VIMscWxB0x0E6PLePJnbLQs=;
	b=GYu9RBN/Ajxfo+g2pr9EOCzSAv98TeS6mkcqcM7qa1+M2vnma2v5Iie4wimReKbsA2
	PUWRK+a8Khl6G57311WiBoVu9XqC12DS9JvN5fc3kXX+hBCvq+Z5LUcbQYrQNOnxoJOH
	UecAf1b9ESp3vWfZtfh69ah+U9kzBFLT3AdTBboB3B+5T36aA0XcBihuRJfUNJYfGtGz
	RMoNosSDDdQKuppMDMiyQPzXhWrZsFQUufUrviwza335edPXB63rz/dh1Mkc5mdCwnQk
	6RVoc6qTsA6fvoEiFQo+SJDL4DuSFJYRsKWMrt5ttIpEDzgdNo7wBFhAdvGpyEScH8iz
	7Nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mZkPKL6Aaf7gIzCVNq7/VIMscWxB0x0E6PLePJnbLQs=;
	b=aPiBgiqYrJpRo4IJ7G8jJSRJ7HHXh2gHyThm4cy8LK8Im9cB2GnW3+WU7JP8brl3Sd
	Z4Ox7/A6KQY0tdguLS6+8ij/jRoJootSSb/IVJrw2cHQkAhDKrN/PN6sNyQgZ7SoDVcn
	9zkpgegbKMiUlXhzjeZhcRkUe5RlaHctZVqmIvvVX7/VNaKskFk0My5K8mTMmVCJgwQk
	0XnwruwOSj04IyNkXajE2E/SEWgboWjfllICQ7oW/LTBQ5BC6sBTNW/4stu1vvoqeowX
	JIvrVOBqSp2oZYQ/KnVDxPiR0mqmFgyhEWB+8suWv4cwUYMOgAazrrqyGQt3yJpOSOjL
	zGEQ==
X-Gm-Message-State: AJaThX5zXxzNX9c0AChr9AShIuixkMsMASnkUplazWbPha7REFgrI1zS
	oY4Ekwnb9QtWFbugnYRu4r0LlkbFKYuShEf2Aaw=
X-Google-Smtp-Source: AGs4zMYXuSSgy3EQmOqs1eozVMKOFgePQHeVTbJOZ3szX6Cj4Ep+x9CKcu+PdhgLe+HwV9iTSTfFzT0/XOMJSGhBQ70=
X-Received: by 10.28.62.5 with SMTP id l5mr12055331wma.47.1511870601404; Tue,
	28 Nov 2017 04:03:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Tue, 28 Nov 2017 04:03:20 -0800 (PST)
In-Reply-To: <1511867006-5638-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1511867006-5638-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Nov 2017 13:03:20 +0100
Message-ID: <CA+chaQew8=2XXN6jgMXYM64VSvzuKJR520OqoeqNzCx-Y11-Kw@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] xrdp: new recipe
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
X-List-Received-Date: Tue, 28 Nov 2017 12:03:21 -0000
Content-Type: text/plain; charset="UTF-8"

Use SUMMARY instead of DESCRIPTION.

And you might want to add x11 to REQUIRED_DISTRO_FEATURES due to libx*
dependencies.

On Tue, Nov 28, 2017 at 12:03 PM, zhengrq <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Add a new recipe xrdp_0.9.4.bb.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
>
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> new file mode 100644
> index 0000000..62311ad
> --- /dev/null
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "An open source remote desktop protocol(rdp) server."
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
> +"
> +
> +DEPENDS = "openssl virtual/libx11 libxfixes libxrandr"
> +
> +SRC_URI = "git://github.com/neutrinolabs/xrdp.git"
> +
> +SRCREV = "c295dd61b882e8b56677cf12791f43634f9190b5"
> +
> +PV = "0.9.4+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

