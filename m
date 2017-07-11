Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7985877DB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 19:33:26 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id r103so2890576wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bhJAeHsvQ1JGd+09fIMjN4NSfmT4f9NnhfWl7ZAzKYE=;
	b=dCIUvJYJ1gwBloGWi+fFG7KWLTYTg0j599SfltdHP56CCSd1hvGc6gxVqw49c4vLdS
	fO1Ji780g1op3U5PavcaTymaLjRwvROthKqK+7HK+FJK10ilPM2aU0j1nvDdQjFMV/Jw
	iheo2J8XskYvdB01ho2rSCCrjtp2sYnQ7P5Q2EqoHfRGtGY0CP5oeWDQ0iTVsygpxQvF
	4qbM6XEGB0XW7HJQoRnVaJxIiI68z3XVigHj6do6goBgBexA/rNLD56sSoUI+6hrjVwr
	Ny6GVpooCOP79CdWQ5yJoXfomIk+jk9rQWLIQNFKSGzaixwB3GbRmX5va0Sw5V0bNxf1
	Xi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bhJAeHsvQ1JGd+09fIMjN4NSfmT4f9NnhfWl7ZAzKYE=;
	b=Kef8rVKoPcHYemPMSyTZogNgX4bnzxa7rOqvyIlfpLcEglzwKIrR389VUi1EET+U2/
	UFXu6F53ggUxpPjPIGOoZphUBjml2ltwoY2INU/vfbWD4kVB7ZdkBh/av5crt1e7M62S
	G9KEctXtz9sikq1McMuzM5ec2UJ9w6RvjsqisJNxKyjioOmQddcZxlALp6WYuQXtwkYe
	7tXlmw3/WBx/TiND2CywS5L8A/Ullhu8h9oLQJK4TsGMhcknEYzV0wgaGkRnYPFdQyEu
	10GB9HaGnBx2ky6sYNfGPD7IHp2fvR7JJm/kmLnHYQJlPbnmL18f5RzRFjmFrjncvK8M
	NrWg==
X-Gm-Message-State: AIVw112Rku8LeeqNXFrxAPPqyPY6GHg8BjhBhhBDBTdSPL41OftouXzR
	Wn2CZWzM7+o6qHl88T/3HLKpIEraNg==
X-Received: by 10.28.136.143 with SMTP id k137mr5865wmd.62.1499801607649; Tue,
	11 Jul 2017 12:33:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.170 with HTTP; Tue, 11 Jul 2017 12:33:27 -0700 (PDT)
In-Reply-To: <20170709162934.21355-1-krzk@kernel.org>
References: <20170709162934.21355-1-krzk@kernel.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 11 Jul 2017 12:33:27 -0700
Message-ID: <CAJ86T=XFYb5NJD2VxsVra1KbR0eT9RhkPMefu8eNLWU3N9XhiA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] recipes-utils: Add recipe for udevil
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
X-List-Received-Date: Tue, 11 Jul 2017 19:33:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 9, 2017 at 9:29 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> udevil is a command line Linux program which mounts and unmounts
> removable devices without a password.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../0001-udevil-0.4.3-fix-compile-with-gcc6.patch  | 12 ++++++++++
>  .../recipes-utils/udevil/udevil_0.4.4.bb           | 28 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
>  create mode 100644 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
>
> diff --git a/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
> new file mode 100644
> index 000000000000..355e93a37b3b
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
> @@ -0,0 +1,12 @@
> +Fix compilation with GCC6
> +
> +--- a/src/device-info.c        2013-12-09 14:59:27.000000000 +0100
> ++++ b/src/device-info.c        2017-03-13 07:06:25.506666680 +0100
> +@@ -3,6 +3,7 @@
> +  * contains code excerpts from udisks v1.0.4
> + ************************************************************************** */
> +
> ++#include <sys/stat.h>
> + #include "device-info.h"
> +
> + static char *
> diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> new file mode 100644
> index 000000000000..4ad4a09ed717
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "A command line Linux program which mounts and unmounts removable devices"
> +HOMEPAGE = "http://ignorantguru.github.io/udevil/"
> +
> +DEPENDS = "glib-2.0 \
> +           glib-2.0-native \
> +           intltool-native \
> +           udev \
> +"
> +RDEPENDS_${PN} = "glib-2.0 \
> +                  udev \

Runtime dependencies on libraries are detected automatically so
explicitly setting RDEPENDS like this shouldn't be required.

> +"
> +
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +inherit autotools pkgconfig systemd
> +
> +SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${PV}/udevil-${PV}.tar.xz \
> +           file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
> +"
> +
> +SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
> +SRC_URI[sha256sum] = "ce8c51fd4d589cda7be56e75b42188deeb258c66fc911a9b3a70a3945c157739"
> +
> +SYSTEMD_SERVICE_${PN} = "devmon@.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +FILES_${PN} += " ${libdir}/systemd/system/devmon@.service"

Setting SYSTEMD_SERVICE_${PN} should be enough to ensure that the
service file gets packaged correctly, so explicitly adding it to
FILES_${PN} like this shouldn't be required.

> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

