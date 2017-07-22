Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 027FB782CF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 09:59:47 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id z37so16189135ybh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mux02G8eL39yF0y82Nrx8p8ysj4sem+ZXRjQBxA6VGc=;
	b=dZPvumaIIXY1dwyaoslOD/M7AU12/S57juSPIQ/H9DGe6DIx/jJ6JLRy5QaNLt1EVg
	2OgXd47vbV3BAX9X5adtYgnXbBzJtWwq4PuXwWvDpWN3gLSh+jVE3E7gZK1VzuH5vthF
	LVgd39NLeyB5VCrVycFUbOu9tmIZkQEY3b+DoqpYAjjqRp8/Do5EnjFWn0hVm3ACEi0l
	mDce2pquMqghnxVn2yDvr2VQs3A62zga7CAoEUE7XrEE6WUa1ltZIP/zGD7N0viFbVOc
	IoF2NHJtQE4ab/m/5TCO08MFLGXH9Za/74fA4Uw+m6SMUevueutl5I7NHGfidp422CzW
	Y74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mux02G8eL39yF0y82Nrx8p8ysj4sem+ZXRjQBxA6VGc=;
	b=LDmFBnWDh4sK9rNX/j5jq4zvnTsoPwUVnx/VpWbmW5YJAzvABWYw6Aq0WDgmpig1lv
	erA3+OGYGVvril5KeYUWAV1iLESGZEIDRXdkisaPIVt//eO+fyqj6SMqJ3Bi/I8SrbpL
	od9jfvHGGnMviX6oWvQPMMi9+BlqUzdxUi/14+EuRheAninhWmuoFynEUGCUHFFjR2Hy
	zf/MBPDFEgK9F0qKAKqQIVVBfquXUlnYriIaCUgOIcST2mGkllQQFdwjb2SWPAR1Ypn0
	SH4JlZidnkiNe1Fdw/UMB9A7SG7G/8s1imDmgVy5zGFm5MQEekV1n/WgaVSWl516q/Bb
	oTEg==
X-Gm-Message-State: AIVw1116sBvx1cng8DmViPCa7hTBWGeWxkIsHvWEw03WCypf3kJbmcc8
	/IkhzujFc2/7ieNTaYrg2SbDIsCKrw==
X-Received: by 10.37.87.85 with SMTP id l82mr8284301ybb.190.1500717588953;
	Sat, 22 Jul 2017 02:59:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Sat, 22 Jul 2017 02:59:48 -0700 (PDT)
In-Reply-To: <eeb4d0f30cfb115f0be5a61c2dad4072b1ef5b18.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
	<eeb4d0f30cfb115f0be5a61c2dad4072b1ef5b18.1500621886.git.hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 22 Jul 2017 11:59:48 +0200
Message-ID: <CA+chaQcVO7iPDd1dPu4YDGF=puDnAuX7_y7uwCpAOr3hWrENaQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH V2 06/10] usermode: add recipe 1.111
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
X-List-Received-Date: Sat, 22 Jul 2017 09:59:48 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build with:
http://errors.yoctoproject.org/Errors/Details/148215/

On Fri, Jul 21, 2017 at 9:34 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ix-compile-failure-against-musl-C-library.patch | 27
> ++++++++++++++++++++++
>  .../recipes-support/usermode/usermode_1.111.bb     | 27
> ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-fix-
> compile-failure-against-musl-C-library.patch
>  create mode 100644 meta-gnome/recipes-support/usermode/usermode_1.111.bb
>
> diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-fix-
> compile-failure-against-musl-C-library.patch b/meta-gnome/recipes-support/
> usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
> new file mode 100644
> index 0000000..bf19f28
> --- /dev/null
> +++ b/meta-gnome/recipes-support/usermode/usermode/0001-fix-
> compile-failure-against-musl-C-library.patch
> @@ -0,0 +1,27 @@
> +From c77e3f0d4560797f7dc56549ae5ebcc035714a4d Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 20 Jul 2017 23:20:53 -0400
> +Subject: [PATCH] fix compile failure against musl C library
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + usermount.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/usermount.c b/usermount.c
> +index 3aafadd..4107027 100644
> +--- a/usermount.c
> ++++ b/usermount.c
> +@@ -46,6 +46,7 @@
> + #include <limits.h>
> + #include <locale.h>
> + #include <mntent.h>
> ++#include <paths.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> +--
> +2.8.1
> +
> diff --git a/meta-gnome/recipes-support/usermode/usermode_1.111.bb
> b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
> new file mode 100644
> index 0000000..0411a12
> --- /dev/null
> +++ b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "The usermode contains the userhelper program, which can be
> used to allow configured \
> +programs to be run with superuser privileges by ordinary users, and
> several \
> +graphical tools for users: \
> +* userinfo allows users to change their finger information. \
> +* usermount lets users mount, unmount, and format filesystems. \
> +* userpasswd allows users to change their passwords. \
> +"
> +HOMEPAGE = "https://pagure.io/usermode"
> +LICENSE = "GPLv2+"
> +DEPENDS = "libuser ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> 'libpam', '', d)} \
> +           gtk+ desktop-file-utils-native \
> +           startup-notification intltool-native \
> +           util-linux \
> +"
> +
> +SRC_URI = "https://releases.pagure.org/${BPN}/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "28ba510fbd8da9f4e86e57d6c31cff29"
> +SRC_URI[sha256sum] = "3dd0b9639b5bd396b7ea5fada6aaa6
> 94dbfdaa3ad06eb95a6eabcdfd02f875c6"
> +
> +SRC_URI_append_libc-musl = " file://0001-fix-compile-
> failure-against-musl-C-library.patch"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +inherit autotools gettext pkgconfig
> +
> +EXTRA_OEMAKE += "INSTALL='install -p'"
> +
> --
> 2.8.1
>
>

