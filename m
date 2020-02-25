Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 377746103A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 09:45:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r11so13882814wrq.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 01:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tijbv0dt4DVGjlOhl4Jr5OumDonb6YPkGN5J15SC/6Y=;
	b=KVT+9w6QX4l9REDOrZc5VAkLl7KLhcsSHa6FhahiHU29eIi6+JuA8I4m6szGaU6IuP
	ydopXumtVCu5tVXJYGwQt0YNQ5O/ZEFaXr8JKmc13NERVrCNu3WpwTxeIW6uomOCLuTN
	waB884ywWIdu7SGVpi0wEMNoF1Ts7BsG8NNstOq+mQEcAGF4hiT6lmQAANNfa2lqRQ8X
	Fo0CCAP+hII8bEK5LsEGm/IvrYeWCCswWstG3Jfa1eehdp9SPaUVko8IRYHFQz3lKUVP
	hXb46JTNycktSF/vjbGVqpoW6tYWldf20OcKRHTPPyDbu5Y/NO9WM1gYQVGuGX3GlZJJ
	Or5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tijbv0dt4DVGjlOhl4Jr5OumDonb6YPkGN5J15SC/6Y=;
	b=IMFj+1J2Be2vGVvOxlDIvrQKiWRe5BX35Xm2VxZUi04Nx4KENNneugbzJ6AKR8Li2w
	J1acdnRx+VSvUjE8bXxBEKFFY4wJ8J4dh1qWzCT1yH19384ijpTwYyUreu7CNjkXuwnT
	HRB3e84ZWlA3EULoGap7cHxV8tIK+ueZuc/yFNLiujwlnjwpIkgIBUTElq3vv+3GUS1i
	7ofk9cLLQAlkxVtRnD/hRzUgzVrivi+5yPf1VVQ9g10VjJM/RJv+QDas6fcOeqJeGaFf
	F5yoOAb3V4mkASxixZiw0P3E8Rr7vC+dYHO9S9BHrsoGuX185iphoozGT1u6xDdwphiV
	aRfg==
X-Gm-Message-State: APjAAAXxXh6nlMgMIFSirPVY2OYUfg8zCyvhSu+HBTt3AG229UL1As/o
	h/RG/1ZJ5SgxggNXCHhL7MFQJ7q2vWsZxc0gPJ7Rx5Ls
X-Google-Smtp-Source: APXvYqyFUz6PXR8d3X1n25WPSv1IizKSVu0rAJB+TwxXwSp/J9I9RogDhNuY6l5QU1rSDbn9uYH73yGc4DjWXM274KI=
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr14811001wrs.386.1582623955776;
	Tue, 25 Feb 2020 01:45:55 -0800 (PST)
MIME-Version: 1.0
References: <20190911145254.15693-1-pkj@axis.com>
In-Reply-To: <20190911145254.15693-1-pkj@axis.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Tue, 25 Feb 2020 10:45:45 +0100
Message-ID: <CAHtQpK6CBwCwivMSk4j0-ofr2eD82a6PkNPYt1aepDcBFVK7ng@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lvm2/libdevmapper: Make it build for native
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
X-List-Received-Date: Tue, 25 Feb 2020 09:45:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hello all,

I've just faced the problem with building lvm2 of the [zeus] and it
looks like this patch causes issues with similar symptoms that has
been reported for bash CVE [1].

This patch also touches the configure part, and in case if `-c
cleanall` is used - the build succeeds.

Failed build log looks like following:
ERROR: lvm2-2.03.02-r0 do_patch: Command Error: 'quilt --quiltrc
/development/projects/build-output/work/corei7-64-poky-linux/lvm2/2.03.02-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch 0001-configure-Fix-setting-of-CLDFLAGS-default.patch
patching file configure
Hunk #1 FAILED at 3077.
Hunk #2 FAILED at 3098.
Hunk #3 FAILED at 3111.
3 out of 3 hunks FAILED -- rejects in file configure
patching file configure.ac
Hunk #2 succeeded at 50 (offset -1 lines).
Hunk #3 succeeded at 63 (offset -1 lines).
Patch 0001-configure-Fix-setting-of-CLDFLAGS-default.patch does not
apply (enforce with -f)
ERROR: Logfile of failure stored in:
/development/projects/build-output/work/corei7-64-poky-linux/lvm2/2.03.02-r0/temp/log.do_patch.10047
ERROR: Task (/development/projects/yocto-build-appliance/meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb:do_patch)
failed with exit code '1'

Since there was no decision (yet) taken on the bash one - can we
combine those two together to find a common solution for both cases?

On Wed, Sep 11, 2019 at 4:53 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Backport a patch from upstream master that corrects the passing of
> link flags through configure.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  ...gure-Fix-setting-of-CLDFLAGS-default.patch | 78 +++++++++++++++++++
>  meta-oe/recipes-support/lvm2/lvm2.inc         |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
>
> diff --git a/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch b/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
> new file mode 100644
> index 000000000..07cb88ffb
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
> @@ -0,0 +1,78 @@
> +From 4a3e707402032788e09282e0f54fdf82c8a0f8fc Mon Sep 17 00:00:00 2001
> +From: Marian Csontos <mcsontos@redhat.com>
> +Date: Mon, 19 Aug 2019 14:54:43 +0200
> +Subject: [PATCH] configure: Fix setting of CLDFLAGS default
> +
> +---
> + configure    | 6 +++---
> + configure.ac | 6 +++---
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=lvm2.git;a=commit;h=4a3e707402032788e09282e0f54fdf82c8a0f8fc]
> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +
> +diff --git a/configure b/configure
> +index ff3a59b6b..4c8476502 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3077,7 +3077,7 @@ if test -z "$CFLAGS"; then :
> + fi
> + case "$host_os" in
> +       linux*)
> +-              CLDFLAGS="${CLDFLAGS:"$LDFLAGS"} -Wl,--version-script,.export.sym"
> ++              CLDFLAGS="${CLDFLAGS-"$LDFLAGS"} -Wl,--version-script,.export.sym"
> +               # equivalent to -rdynamic
> +               ELDFLAGS="-Wl,--export-dynamic"
> +               # FIXME Generate list and use --dynamic-list=.dlopen.sym
> +@@ -3098,7 +3098,7 @@ case "$host_os" in
> +               ;;
> +       darwin*)
> +               CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
> +-              CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
> ++              CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
> +               ELDFLAGS=
> +               CLDWHOLEARCHIVE="-all_load"
> +               CLDNOWHOLEARCHIVE=
> +@@ -3111,7 +3111,7 @@ case "$host_os" in
> +               BLKDEACTIVATE=no
> +               ;;
> +       *)
> +-              CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
> ++              CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
> +               ;;
> + esac
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5da694631..830edb8da 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -30,7 +30,7 @@ AC_CANONICAL_TARGET([])
> + AS_IF([test -z "$CFLAGS"], [COPTIMISE_FLAG="-O2"])
> + case "$host_os" in
> +       linux*)
> +-              CLDFLAGS="${CLDFLAGS:"$LDFLAGS"} -Wl,--version-script,.export.sym"
> ++              CLDFLAGS="${CLDFLAGS-"$LDFLAGS"} -Wl,--version-script,.export.sym"
> +               # equivalent to -rdynamic
> +               ELDFLAGS="-Wl,--export-dynamic"
> +               # FIXME Generate list and use --dynamic-list=.dlopen.sym
> +@@ -51,7 +51,7 @@ case "$host_os" in
> +               ;;
> +       darwin*)
> +               CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
> +-              CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
> ++              CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
> +               ELDFLAGS=
> +               CLDWHOLEARCHIVE="-all_load"
> +               CLDNOWHOLEARCHIVE=
> +@@ -64,7 +64,7 @@ case "$host_os" in
> +               BLKDEACTIVATE=no
> +               ;;
> +       *)
> +-              CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
> ++              CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
> +               ;;
> + esac
> +
> +--
> +2.21.0
> +
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index f358663b0..6c95bfd02 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -15,6 +15,7 @@ SRC_URI = "https://sourceware.org/pub/lvm2/LVM2.${PV}.tgz \
>             file://0001-Avoid-bashisms-in-init-scripts.patch \
>             file://0005-do-not-build-manual.patch \
>             file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
> +           file://0001-configure-Fix-setting-of-CLDFLAGS-default.patch \
>             "
>  SRC_URI[md5sum] = "5fc07da5461a3794a751dcfc355827d5"
>  SRC_URI[sha256sum] = "550ba750239fd75b7e52c9877565cabffef506bbf6d7f6f17b9700dee56c720f"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

[1]: http://lists.openembedded.org/pipermail/openembedded-core/2020-February/292991.html

--
Regards,
Andrey.

