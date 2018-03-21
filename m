Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF93B71B69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:57:03 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id u46so5905372wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=thiTwZV1xweZDeUrIOvfMvYAxh4a0g17rw399sgAnH0=;
	b=N0jjdZB2zl81tVPI4iPWjAC/Y/4u1kz4aAdIa+F7PrDjSIfomnjXZ++QgloSXWrXGr
	dYqJPa5D2kAO/XfFKIiBEFhWqpxTZeAFagfXQqS2xjhuyoNk0bUAPUZB1o+0IUUYUuE5
	w1UTb1PPxOXBGKY7FlZAMoTxghFtIdrVlqe03mzypqLI9Sw9evfyRtu9T2jvUbRShRqr
	TUrC3RWEFVSYaD8k7KwNk+2o/HyYs5ra9Smm5wdSOTs3RfwZAo7Vmb/YWn9MWHrfZpbF
	04FiT85FMouvH2rdbmEyG+PzvUJKUYHWyKDKpS5lPI6s7skOooRY8ouzDJaMI3J9SvZd
	G+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=thiTwZV1xweZDeUrIOvfMvYAxh4a0g17rw399sgAnH0=;
	b=FSTSBBhZjNjCs6PzZ6suD4Iw91yLeGTqRwg/iGZZjrucsQ6ZxFS2BuDUeChEFTcOB3
	NWiCySsuiU90fhro0QTLc8SLU/IjQbttcWCq3tnSQxmelB3TKZV8LBUUgjEtxFtEI35M
	7dcygRFBS646TgQbDCEvDiYLX4tuD9v6RKqS/8/pQ0/SGkExkv+v5iKIYZ1m0f++S6Bv
	Ok6CyF3ZWXf4Oje+A7dKarNLkzqsTQlQL2+PgTFvxufLnTwXyVACSaJFPcEsmPq5lGlU
	zkJmEIAUoY2c/CcLoKUO7DQ35s+0vE1dAIIVVP44JcInMpuGrXLe5fzOIpDb+cFPtSRQ
	jv1A==
X-Gm-Message-State: AElRT7Fcg2ACtmjZUEOgacqMbrYQ9eKlV09gMWmh09sXqEbO7vPD1F1v
	vLpZ/Azo+jdDEiWjHzTsqD1viAKNqN5N/bQzLXEnEw==
X-Google-Smtp-Source: AG47ELs1keZUaCyiSCWC9wuxcBYYWkMPG5UbC4BJv2W5SncWiptqtPW8/nKavLVTzDrWVzMthN23cckqIKuEWR5u0dw=
X-Received: by 10.223.146.230 with SMTP id 93mr16288800wrn.241.1521651424287; 
	Wed, 21 Mar 2018 09:57:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Wed, 21 Mar 2018 09:57:03 -0700 (PDT)
In-Reply-To: <20180321165202.1777-1-Martin.Jansa@gmail.com>
References: <20180321165202.1777-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Mar 2018 17:57:03 +0100
Message-ID: <CA+chaQdJFduUSaZ=YqBczO9vkUcJpWjM42JUR=sfv2shcouS5g@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/4] krb5: refresh patches
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
X-List-Received-Date: Wed, 21 Mar 2018 16:57:04 -0000
Content-Type: text/plain; charset="UTF-8"

v2 on its way, I forgot to include update to krb5_1.16.bb

On Wed, Mar 21, 2018 at 5:51 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> WARNING: krb5-1.16-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2018-March/148675.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> Details:
> Applying patch
> 0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
> patching file aclocal.m4
> Hunk #1 succeeded at 1679 with fuzz 1 (offset 29 lines).
>
> Now at patch
> 0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...-Add-parameter-to-disable-keyutils-detection.patch | 19
> +++++++++----------
>  .../krb5/krb5/crosscompile_nm.patch                   | 19
> ++++++++++++-------
>  .../krb5/debian-suppress-usr-lib-in-krb5-config.patch | 11 ++++++-----
>  3 files changed, 27 insertions(+), 22 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-
> aclocal-Add-parameter-to-disable-keyutils-detection.patch
> b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-
> disable-keyutils-detection.patch
> index f0c310c5e8..fe8282eba1 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5/0001-
> aclocal-Add-parameter-to-disable-keyutils-detection.patch
> +++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-
> aclocal-Add-parameter-to-disable-keyutils-detection.patch
> @@ -1,18 +1,19 @@
> -From ecb62f3467f493cc0d679323f05367eebbf0fb67 Mon Sep 17 00:00:00 2001
> +From 16aaa5ee8b42cf6f628f6ab75fedc738e4d167ca Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Tue, 1 Oct 2013 22:22:57 +0200
>  Subject: [PATCH] aclocal: Add parameter to disable keyutils detection
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
>  ---
> - aclocal.m4 | 4 ++++
> + src/aclocal.m4 | 4 ++++
>   1 file changed, 4 insertions(+)
>
> -diff --git a/aclocal.m4 b/aclocal.m4
> -index 210c473..83b1f02 100644
> ---- a/aclocal.m4
> -+++ b/aclocal.m4
> -@@ -1650,11 +1650,15 @@ fi
> +diff --git a/src/aclocal.m4 b/src/aclocal.m4
> +index d6d1279..80ce604 100644
> +--- a/src/aclocal.m4
> ++++ b/src/aclocal.m4
> +@@ -1679,12 +1679,16 @@ fi
>   dnl
>   dnl If libkeyutils exists (on Linux) include it and use keyring ccache
>   AC_DEFUN(KRB5_AC_KEYRING_CCACHE,[
> @@ -28,6 +29,4 @@ index 210c473..83b1f02 100644
>  +fi
>   ])dnl
>   dnl
> ---
> -1.8.3.2
> -
> + dnl If libkeyutils supports persistent keyrings, use them
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
> b/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
> index d3e6937515..ddca7090aa 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
> +++ b/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
> @@ -1,19 +1,24 @@
> +From cbce5720435778296c71811101ac732a833525d6 Mon Sep 17 00:00:00 2001
> +From: Amy Fong <amy.fong@windriver.com>
> +Date: Sun, 28 Sep 2014 05:35:37 -0400
> +Subject: [PATCH] krb5: update to version 1.12.2
> +
>  Modifies export-check.pl to use look for $ENV{'NM'} before
>  defaulting to using 'nm'
>
>  Upstream-Status: Pending
>
>  Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ----
>
> - export-check.pl |    7 ++++++-
> +---
> + src/util/export-check.pl | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> -Index: src/util/export-check.pl
> -===================================================================
> ---- src.orig/util/export-check.pl
> -+++ src/util/export-check.pl
> -@@ -38,7 +38,12 @@
> +diff --git a/src/util/export-check.pl b/src/util/export-check.pl
> +index eaec7d6..21a2300 100755
> +--- a/src/util/export-check.pl
> ++++ b/src/util/export-check.pl
> +@@ -38,7 +38,12 @@ if ($#ARGV != 1) {
>   my($exfile, $libfile) = @ARGV;
>
>   @missing = ();
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/debian-
> suppress-usr-lib-in-krb5-config.patch b/meta-oe/recipes-
> connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch
> index f0182ee5db..de21ae0945 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5/debian-
> suppress-usr-lib-in-krb5-config.patch
> +++ b/meta-oe/recipes-connectivity/krb5/krb5/debian-
> suppress-usr-lib-in-krb5-config.patch
> @@ -1,3 +1,6 @@
> +From 044be28e4de2cf6f47c719d1f8fbbfe46d1eac20 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Sun, 28 Sep 2014 05:35:37 -0400
>  Subject: [PATCH] debian: suppress /usr/lib in krb5-config
>
>  Upstream-Status: Pending
> @@ -7,9 +10,10 @@ Handel multi-arch suppressions
>  The patch is from debian.
>
>  Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +
>  ---
> - src/build-tools/krb5-config.in |   14 +++++++++-----
> - 1 files changed, 9 insertions(+), 5 deletions(-)
> + src/build-tools/krb5-config.in | 14 +++++++++-----
> + 1 file changed, 9 insertions(+), 5 deletions(-)
>
>  diff --git a/src/build-tools/krb5-config.in b/src/build-tools/
> krb5-config.in
>  index f6184da..637bad7 100755
> @@ -43,6 +47,3 @@ index f6184da..637bad7 100755
>       # Ugly gross hack for our build tree
>       lib_flags=`echo $CC_LINK | sed -e 's/\$(CC)//' \
>             -e 's/\$(PURE)//' \
> ---
> -1.7.1
> -
> --
> 2.15.1
>
>

