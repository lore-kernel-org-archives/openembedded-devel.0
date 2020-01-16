Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 54D417FA43
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 22:56:48 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z14so20907108qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 14:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H6BO3r0ULt9yEiclZlsWeUUa+k7QOU+v3mnwUEf1RJQ=;
	b=CLECBU8YGMNDw4Mjt+dvkbT1fpnujfDE6PoBJDs2nL5eTut2ngcXsYiwXmaB/MEpup
	Lb0j5Qv/hEFOpjl4wl9W/IFXo9WblUHbfi2ylS7qJvDthDlQSKWggNeMUH9UhRo2l0+a
	BlCIi81WqQm1/9kMVsClTjSaoIl+70xyIm4aiJ4bz+pFVV/sUFsDJhOdC13/XGRhq6b2
	JoIPYrYaop0KCnq8ymwIPTh/VaTBI0Q+DcKLAIGSDe476ERXIzXDLMQsLu2bl29vtgpI
	o3jGknd+nnktHjQEv7Lf3yR2fN1P2NiOQXoMSxWSSY+F8MwZbJ0Vyb4tCiJY3zD6WRrG
	rOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H6BO3r0ULt9yEiclZlsWeUUa+k7QOU+v3mnwUEf1RJQ=;
	b=tFRAZlv06tTI1xBv3AxwDl0nzWhld9hv6TDeAJly+EeMvvv01Zr0t37kuGjiNPSiCl
	owx7TR6SrgRM5W5Qi/XiQA5Vx4j7dMSMURcE0CqleVPF6WrUnjsTyZAGpKcthfpkWJGm
	+hyMjBxL13DTHSl71HvvYPAh82+Sx+S/6N8YA9RCcUfGzYhuSPlExJkKpTUWQZvXb3Vg
	w+l7gVxU5fFkcwnnD0LGOajlZlcuj17p0iM5O3fpqhuikOh5u/ar52ng7ynO6QkddYAg
	q0n8D6OAEH/+giradfU68eT5D8Vu7Ipc7MBhpzZivq9Iiic5sx+mCMQryqiBRBu4EwcX
	5pkg==
X-Gm-Message-State: APjAAAX8mIxYdf0shqzNM3c3Iw7+yYwtrcmfSzOHHZilECcnbrCoZdZ0
	cffaPpaHOaFbSZ8NXp/D315vzRECpY5RfJ853D4=
X-Google-Smtp-Source: APXvYqxd1EZ9z5NUS540i5WXKFqxk5k0mqb2cRW4cLCJWeQ05A5JreVn8xNIo9LZkUvxtqQ25Nbcp9BgjNLNK+yPSdU=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr35419790qkf.337.1579215408680; 
	Thu, 16 Jan 2020 14:56:48 -0800 (PST)
MIME-Version: 1.0
References: <874kwvkzt0.fsf@windriver.com>
In-Reply-To: <874kwvkzt0.fsf@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Jan 2020 14:56:22 -0800
Message-ID: <CAMKF1squ4ufcVB+HLF86j_n=G6rx3BH3LbR4WGMb+XMQad_LRA@mail.gmail.com>
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] openssh: applied upstream fix for "cert not yet valid" test
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
X-List-Received-Date: Thu, 16 Jan 2020 22:56:48 -0000
Content-Type: text/plain; charset="UTF-8"

wrong ml, this patch should go to openembedded-core ml

On Thu, Jan 16, 2020 at 10:43 AM Mingde (Matthew) Zeng
<matthew.zeng@windriver.com> wrote:
>
>
> applied upstream fix for openssh's "cert not yet valid" test
>
> Upstream Status: Backport:
>     https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381
>
> Signed-off-by: Mingde (Matthew) Zeng<matthew.zeng@windriver.com>
>
> ---
>  ...pplied-upstream-fix-for-openssh-test.patch | 60 +++++++++++++++++++
>  .../openssh/openssh_8.1p1.bb                  |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch b/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
> new file mode 100644
> index 0000000000..64cd2fe717
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
> @@ -0,0 +1,60 @@
> +From 0a68d6cfe255f8bcdd5f9db0d008a8f0a60b237a Mon Sep 17 00:00:00 2001
> +From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
> +Date: Wed, 15 Jan 2020 15:51:42 -0500
> +Subject: [PATCH] Manually applied upstream fix for openssh test
> +
> +Upstream Status: Backport:
> +    https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381
> +
> +Signed-off-by: Mingde (Matthew) Zeng<matthew.zeng@windriver.com>
> +---
> + regress/cert-hostkey.sh | 4 ++--
> + regress/cert-userkey.sh | 5 ++---
> + 2 files changed, 4 insertions(+), 5 deletions(-)
> +
> +diff --git a/regress/cert-hostkey.sh b/regress/cert-hostkey.sh
> +index 86ea6250..60e3ec02 100644
> +--- a/regress/cert-hostkey.sh
> ++++ b/regress/cert-hostkey.sh
> +@@ -1,4 +1,4 @@
> +-#     $OpenBSD: cert-hostkey.sh,v 1.18 2019/07/25 08:28:15 dtucker Exp $
> ++#     $OpenBSD: cert-hostkey.sh,v 1.23 2020/01/03 03:02:26 djm Exp $
> + #     Placed in the Public Domain.
> +
> + tid="certified host keys"
> +@@ -252,7 +252,7 @@ test_one() {
> + test_one "user-certificate"   failure "-n $HOSTS"
> + test_one "empty principals"   success "-h"
> + test_one "wrong principals"   failure "-h -n foo"
> +-test_one "cert not yet valid" failure "-h -V20200101:20300101"
> ++test_one "cert not yet valid" failure "-h -V20300101:20320101"
> + test_one "cert expired"               failure "-h -V19800101:19900101"
> + test_one "cert valid interval"        success "-h -V-1w:+2w"
> + test_one "cert has constraints"       failure "-h -Oforce-command=false"
> +diff --git a/regress/cert-userkey.sh b/regress/cert-userkey.sh
> +index 38c14a69..f0e30945 100644
> +--- a/regress/cert-userkey.sh
> ++++ b/regress/cert-userkey.sh
> +@@ -1,4 +1,4 @@
> +-#     $OpenBSD: cert-userkey.sh,v 1.21 2019/07/25 08:28:15 dtucker Exp $
> ++#     $OpenBSD: cert-userkey.sh,v 1.25 2020/01/03 03:02:26 djm Exp $
> + #     Placed in the Public Domain.
> +
> + tid="certified user keys"
> +@@ -338,7 +338,7 @@ test_one() {
> + test_one "correct principal"  success "-n ${USER}"
> + test_one "host-certificate"   failure "-n ${USER} -h"
> + test_one "wrong principals"   failure "-n foo"
> +-test_one "cert not yet valid" failure "-n ${USER} -V20200101:20300101"
> ++test_one "cert not yet valid" failure "-n ${USER} -V20300101:20320101"
> + test_one "cert expired"               failure "-n ${USER} -V19800101:19900101"
> + test_one "cert valid interval"        success "-n ${USER} -V-1w:+2w"
> + test_one "wrong source-address"       failure "-n ${USER} -Osource-address=10.0.0.0/8"
> +@@ -399,4 +399,3 @@ done
> +
> + rm -f $OBJ/authorized_keys_$USER $OBJ/user_ca_key* $OBJ/cert_user_key*
> + rm -f $OBJ/authorized_principals_$USER
> +-
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
> index f8be7ba178..8e7896cf4a 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
> @@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://add-test-support-for-busybox.patch \
>             file://openssh-8.1p1-seccomp-nanosleep.patch \
>             file://0001-seccomp-Allow-clock_gettime64-in-sandbox.patch \
> +           file://0001-Manually-applied-upstream-fix-for-openssh-test.patch \
>             "
>  SRC_URI[md5sum] = "513694343631a99841e815306806edf0"
>  SRC_URI[sha256sum] = "02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff"
> --
> 2.24.0
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

