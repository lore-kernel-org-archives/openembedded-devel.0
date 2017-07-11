Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 81E50719D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:28:45 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id a12so7001623ywh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EdPp8QDqpvrS7eLSKOWkujTRqUA724Tqcm5NdRhYHbM=;
	b=nawAOYuuJcb7ADQIo1tBGIcqJMA0Q/LYUQcOBG9LGiP1nxvzgmE4C7xbefxCflxTPp
	FvsBgiQ1rnBTfp53PNOEbHrghrg7vDfpTIlzCRFcGPcthYykYCeZUG6nt39QM8Mw3oJA
	kpva7UNoUR67eIiioo1lbZapiQkH3kG0O77l8Lf4r+6+sHgf6R4yCCh9P+nREWTC6JvI
	xjOvF35s5EB5t71lC4CSah6KO4u0nf+756JiAV7rhJt6ODHOmclZEaagwp7eOmfjCrY8
	BVtlCYA47T2e0KyimhvVKksBJIc/v5clrnZ8RS3SxE8cYfGW9f+6pmjwUi7l9ToPVbkF
	OigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EdPp8QDqpvrS7eLSKOWkujTRqUA724Tqcm5NdRhYHbM=;
	b=CtTQUEJja+IAyPIZ0yTddDXiGjXLnii2E/gqp1EiLI+PoX0gyWNwqzS3hdtFUQRNI8
	z+xFIinnlU/HGdVdlCe27vF876rmHnMcl5oBQOuIPcZ/vn2XXhCM18B32SFjrcJi+Oz1
	6ACIBb+0VHbAYyNlG++ti83OH6nQq/rrf2kCTkRxZciAiBpNAcRX/wmh+0bEVcaqHIOk
	HpeRQR0tg0mMhx8hfZXC/9KiMtHB0R8Kro3j0xa9rmOLRTfP428c5G59KncPzdjWu2LG
	aMrHHN+nxcgfEsssJEPgT9HFemRJz209/Pgm92E4J6P8K2YtXQYSar8HkgedhKtBoqEf
	Ie2g==
X-Gm-Message-State: AIVw112rLRVzVrmPyMTfYKzAYAWiRtQ1DSaPZlJVaEwSMb/rxtVh619Q
	nM/xZtXFqW6EmXs/p0hcoayQP/tZnA==
X-Received: by 10.129.49.83 with SMTP id x80mr4680019ywx.0.1499776126522; Tue,
	11 Jul 2017 05:28:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Tue, 11 Jul 2017 05:28:45 -0700 (PDT)
In-Reply-To: <20170709162934.21355-1-krzk@kernel.org>
References: <20170709162934.21355-1-krzk@kernel.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jul 2017 14:28:45 +0200
Message-ID: <CA+chaQfYB8ONFeTgGsq_kBsLOjAUcfY5y_roReYdL1gMo7B_6Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 11 Jul 2017 12:28:45 -0000
Content-Type: text/plain; charset="UTF-8"

Please use 4 spaces for indentation and the service file doesn't exist
causing build to fail as in:
http://errors.yoctoproject.org/Errors/Details/147258/

On Sun, Jul 9, 2017 at 6:29 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> udevil is a command line Linux program which mounts and unmounts
> removable devices without a password.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../0001-udevil-0.4.3-fix-compile-with-gcc6.patch  | 12 ++++++++++
>  .../recipes-utils/udevil/udevil_0.4.4.bb           | 28
> ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/udevil/files/0001-
> udevil-0.4.3-fix-compile-with-gcc6.patch
>  create mode 100644 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
>
> diff --git a/meta-filesystems/recipes-utils/udevil/files/0001-
> udevil-0.4.3-fix-compile-with-gcc6.patch b/meta-filesystems/recipes-
> utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
> new file mode 100644
> index 000000000000..355e93a37b3b
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/udevil/files/0001-
> udevil-0.4.3-fix-compile-with-gcc6.patch
> @@ -0,0 +1,12 @@
> +Fix compilation with GCC6
> +
> +--- a/src/device-info.c        2013-12-09 14:59:27.000000000 +0100
> ++++ b/src/device-info.c        2017-03-13 07:06:25.506666680 +0100
> +@@ -3,6 +3,7 @@
> +  * contains code excerpts from udisks v1.0.4
> + **************************************************************************
> */
> +
> ++#include <sys/stat.h>
> + #include "device-info.h"
> +
> + static char *
> diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> new file mode 100644
> index 000000000000..4ad4a09ed717
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "A command line Linux program which mounts and unmounts
> removable devices"
> +HOMEPAGE = "http://ignorantguru.github.io/udevil/"
> +
> +DEPENDS = "glib-2.0 \
> +           glib-2.0-native \
> +           intltool-native \
> +           udev \
> +"
> +RDEPENDS_${PN} = "glib-2.0 \
> +                  udev \
> +"
> +
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +inherit autotools pkgconfig systemd
> +
> +SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${
> PV}/udevil-${PV}.tar.xz \
> +           file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
> +"
> +
> +SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
> +SRC_URI[sha256sum] = "ce8c51fd4d589cda7be56e75b42188
> deeb258c66fc911a9b3a70a3945c157739"
> +
> +SYSTEMD_SERVICE_${PN} = "devmon@.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +FILES_${PN} += " ${libdir}/systemd/system/devmon@.service"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

