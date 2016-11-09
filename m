Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 293EC71987
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 17:06:44 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f82so255015698wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2016 09:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3+DJf7A6VTKeDhwLRcPF7NzGmq+Du2uo15xBVHh2eH4=;
	b=WgcF/puOBobLsJCAcl289wC+cLcWVEeiTMF32BC9iXzvYd3X638ATHkUet13xZDTL2
	R3Tk5Deby8XNKhzpTn+XgJA4uVlhZF40cRAiPq17kwvnIOgqQFnbo/MthnbkT9HlfwWc
	60waucpFBxpoYun3PCQv8xdEQ7RLswzN3Y+FcVEI+rbx5gLeXph1dtsuKu8YPYULzX/B
	5JJt4oKuR9BkRT447iu5t5CebX4/rdqFHCTKBLWEsBZqlQUvoBhh/YIFUm6mxU6TZGX8
	V61onOhl0rkvFAuS5FK+IyznbYYvStrnSPcE7BZA5XFQ/tPlgpbxSLGe/jrQS/au4DH9
	hIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3+DJf7A6VTKeDhwLRcPF7NzGmq+Du2uo15xBVHh2eH4=;
	b=BKci3v/0RV3S6egrB+XaT1bAqXpD72Sqyl/bgUnuoYvPY7khGDlt3TMaPmVQMHo07V
	wvLVRDSG5DTyT0T4zxfmuFg5eUpAWJIniGSBuN4eETVjiOJ4AhrP87MhQsaMFASRzBfC
	F9X1uL6h5TcVIaDlj6Td3LpID69OIfKJ0e7bYFpRDCbdp5xxp5INq/Mz67lymA1orVaM
	Ht/V/2/GOcyrl18ip1bP7XsYpP4Lu7zORnYKtDlsn5osdJew7ld68YyDYqbm8Fq1ucMf
	Cf5erdZPZT862TCDkaN4NL+Dn0QXRTz5hJEtuohJ+LXXXw1INq7HOJgVJBqTfDj1+T0B
	V4Wg==
X-Gm-Message-State: ABUngvdhmhDaWhczoghuGzu9EpUZWS5jD05JnBrh72PAbswgtX3nLT+LWKfBwl69RfC3xjfA3IjWxIsPPkaAiQ==
X-Received: by 10.28.88.73 with SMTP id m70mr23454529wmb.19.1478711205609;
	Wed, 09 Nov 2016 09:06:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.141.135 with HTTP; Wed, 9 Nov 2016 09:06:44 -0800 (PST)
In-Reply-To: <1478165103-29946-1-git-send-email-gizero@gmail.com>
References: <1478165103-29946-1-git-send-email-gizero@gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 9 Nov 2016 18:06:44 +0100
Message-ID: <CAC+thW06CKozbiS7eDjaAvgyzJjZ2PwnPU_yv88pTRjSO76kkg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] libiio: add recipe
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
X-List-Received-Date: Wed, 09 Nov 2016 17:06:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 3, 2016 at 10:25 AM, Andrea Galbusera <gizero@gmail.com> wrote:

> libiio is a C library for interfacing with IIO devices. It abstracts
> the low-level details of the hardware, and provides a simple yet complete
> programming interface.
>
> This recipe provides the following packages:
> * libiio: main package with C library
> * libiio-iiod: user space daemon providing network backend to iio devices
> * libiio-tests: user space test applications using libiio
> * libiio-python: python bindings
>
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>
> Changes in V2:
> * use normal git checkout instead of Github archives to avoid issues with
> checksum changing from time to time.
> * while at it, use the latest commit, set PV and rename recipe accordingly.
> * review DEPENDS to enable using new features/optional libraries.
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 24
> ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libiio/libiio_git.bb
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb
> b/meta-oe/recipes-support/libiio/libiio_git.bb
> new file mode 100644
> index 0000000..28a1073
> --- /dev/null
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Library for interfacing with IIO devices"
> +HOMEPAGE = "https://wiki.analog.com/resources/tools-software/
> linux-software/libiio"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a7
> 2c"
> +
> +SRCREV = "e0fc3845506ccb19ab02e4b1d81cddeeee0805ab"
> +PV = "0.7+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/analogdevicesinc/libiio.git"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "flex-native bison-native avahi libaio libusb1 libxml2"
> +
> +inherit cmake pythonnative
> +
> +PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
> +
> +RDEPENDS_${PN}-python = "${PN} python-ctypes python-stringold"
> +
> +FILES_${PN}-iiod = "${sbindir}/iiod"
> +FILES_${PN}-tests = "${bindir}"
> +FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
> --
> 1.9.1
>
>
If not in any testing queue yet, please hold this, since a new upstream
version was released a few days ago and I can shortly send a v3 patch for
it. Let me know if I have to do flag something on patchwork too.

