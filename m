Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id B58EB6C45D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 16:31:09 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id w17so11374054qto.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xdgInEwBruC5DwJWAJBv9lo04Ic+Jz0Cwh7SWqU3RoU=;
	b=RzY/k+y6xpWYIYPHTE+FV/P2sF5tPHdaB9+xU/d9EGF+bYz3GrNHliU4cA7qOIEDAM
	leG/MtMGOGqtilFWrVroIfoQ/fvDWxHrAhZXttJ9lZXzryhOemyuezWqqVMlxEuE7C9J
	iCMlJTYuPvHRnJdsPRgBxPDsOCOTBHBw7tPPhuJUp6EEegFBiiHwW26sHSz/4KXTr67Q
	tgMjhbXSO5M36RarUClxBAHHMFZjkdIXqeUEAIV9mT6XpAQQPTpDhNze+1m+j/7Ynjb4
	YkYNuOBVIrnftJ+AwtPLEe6lCZWqxq1zjbDBvqJ3b2Kqb2yVrZ6zEO9H0y0I06uKuMCM
	fFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xdgInEwBruC5DwJWAJBv9lo04Ic+Jz0Cwh7SWqU3RoU=;
	b=phv4BkKlEA/SZbZdc3wxOh2SenSQ3fVwanOdFyXFbFMOpKUTf8H66MmPlW1PGx3NRm
	7pfhUeatzdmyckhsB4SxLadvEWtyirH7LXhwIR/suV9xTkWcWkoQCmQddnukHcXddt4I
	azql2wJ0DwSCu+JHrjWnEDESYxCeyFuydgtibz4rAZIgQ+6vOQC+DiV9KuFiYvSCPLfh
	grs2gSFGEiZSFd8gOmLaQax1k4Th4WgclcxuNQwZHSmQkpaipRbCgSB+cFY1ou1wAPOO
	vzd08Wv/tI0g17nhcHFDbEs+d0JCeyDS5tbq/ETQGZVka3H65Ars0qQ/SVJB0NIYljG7
	cgzg==
X-Gm-Message-State: APjAAAXcDduigh/3fBPvu4WkwoMbuU862TKUR20UP7d8DL37AaQ6R5HZ
	Rhe3GjSO5mQgaYqVVTtUI7x0uH9xjYhlRV1CfqqxKD92
X-Google-Smtp-Source: APXvYqzquE5pzgoR74L7oVjdTZHyTVkSl+fsImoLdMBo4IFWN+00JM8+b6fZJxMgPfjfO9rzYmvNMf4kYYObWnMPiU8=
X-Received: by 2002:a0c:d2da:: with SMTP id x26mr74070876qvh.51.1564245070241; 
	Sat, 27 Jul 2019 09:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190727124846.27068-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190727124846.27068-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Jul 2019 09:30:44 -0700
Message-ID: <CAMKF1soF68P-BfW+vEwQHEXVQ6MgA2Dr4XNwj-=c3tzU=720Lg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking]] chrony: update to 3.5
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
X-List-Received-Date: Sat, 27 Jul 2019 16:31:10 -0000
Content-Type: text/plain; charset="UTF-8"

Oleksandr

The patch headers are causing an additional `]' in the commit subject
please avoid adding double ]]

On Sat, Jul 27, 2019 at 5:49 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Also updated arm_eabi patch.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../chrony/chrony/arm_eabi.patch              | 33 ++++++++++---------
>  .../chrony/{chrony_3.4.bb => chrony_3.5.bb}   |  5 ++-
>  2 files changed, 20 insertions(+), 18 deletions(-)
>  rename meta-networking/recipes-support/chrony/{chrony_3.4.bb => chrony_3.5.bb} (97%)
>
> diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
> index 9f943cdce..187898a6e 100644
> --- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
> +++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
> @@ -1,7 +1,7 @@
> -From 9ca48a6fef1da1bb0dd67ab94256c7e240da1834 Mon Sep 17 00:00:00 2001
> +From f35e07aceb4a16121d83b47ee77990018bec98ea Mon Sep 17 00:00:00 2001
>  From: Joe Slater <jslater@windriver.com>
>  Date: Thu, 9 Mar 2017 10:58:06 -0800
> -Subject: [PATCH]     chrony: fix build failure for arma9
> +Subject: [PATCH] chrony: fix build failure for arma9
>
>      Eliminate references to syscalls not available
>      for ARM_EABI.  Also add a dependency on libseccomp
> @@ -18,16 +18,15 @@ Subject: [PATCH]     chrony: fix build failure for arma9
>      Refresh patch for new upstream version.
>
>      Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> -
>  ---
> - sys_linux.c | 19 +++++++++++++------
> - 1 file changed, 13 insertions(+), 6 deletions(-)
> + sys_linux.c | 20 ++++++++++++++------
> + 1 file changed, 14 insertions(+), 6 deletions(-)
>
>  diff --git a/sys_linux.c b/sys_linux.c
> -index f4b532d..d05fa24 100644
> +index 898dc7a..b268ad1 100644
>  --- a/sys_linux.c
>  +++ b/sys_linux.c
> -@@ -482,14 +482,14 @@ SYS_Linux_EnableSystemCallFilter(int level)
> +@@ -479,14 +479,14 @@ SYS_Linux_EnableSystemCallFilter(int level)
>     const int syscalls[] = {
>       /* Clock */
>       SCMP_SYS(adjtimex), SCMP_SYS(clock_gettime), SCMP_SYS(gettimeofday),
> @@ -38,24 +37,24 @@ index f4b532d..d05fa24 100644
>  -    SCMP_SYS(getrlimit), SCMP_SYS(rt_sigaction), SCMP_SYS(rt_sigreturn),
>  +    SCMP_SYS(rt_sigaction), SCMP_SYS(rt_sigreturn),
>       SCMP_SYS(rt_sigprocmask), SCMP_SYS(set_tid_address), SCMP_SYS(sigreturn),
> -     SCMP_SYS(wait4),
> +     SCMP_SYS(wait4), SCMP_SYS(waitpid),
>       /* Memory */
>  -    SCMP_SYS(brk), SCMP_SYS(madvise), SCMP_SYS(mmap), SCMP_SYS(mmap2),
>  +    SCMP_SYS(brk), SCMP_SYS(madvise), SCMP_SYS(mmap2),
>       SCMP_SYS(mprotect), SCMP_SYS(mremap), SCMP_SYS(munmap), SCMP_SYS(shmdt),
>       /* Filesystem */
> -     SCMP_SYS(access), SCMP_SYS(chmod), SCMP_SYS(chown), SCMP_SYS(chown32),
> -@@ -500,14 +500,21 @@ SYS_Linux_EnableSystemCallFilter(int level)
> +     SCMP_SYS(_llseek), SCMP_SYS(access), SCMP_SYS(chmod), SCMP_SYS(chown),
> +@@ -499,14 +499,22 @@ SYS_Linux_EnableSystemCallFilter(int level)
>       SCMP_SYS(bind), SCMP_SYS(connect), SCMP_SYS(getsockname), SCMP_SYS(getsockopt),
> -     SCMP_SYS(recvfrom), SCMP_SYS(recvmmsg), SCMP_SYS(recvmsg),
> -     SCMP_SYS(sendmmsg), SCMP_SYS(sendmsg), SCMP_SYS(sendto),
> +     SCMP_SYS(recv), SCMP_SYS(recvfrom), SCMP_SYS(recvmmsg), SCMP_SYS(recvmsg),
> +     SCMP_SYS(send), SCMP_SYS(sendmmsg), SCMP_SYS(sendmsg), SCMP_SYS(sendto),
>  -    /* TODO: check socketcall arguments */
>  -    SCMP_SYS(socketcall),
>       /* General I/O */
>       SCMP_SYS(_newselect), SCMP_SYS(close), SCMP_SYS(open), SCMP_SYS(openat), SCMP_SYS(pipe),
> --    SCMP_SYS(poll), SCMP_SYS(read), SCMP_SYS(futex), SCMP_SYS(select),
> -+    SCMP_SYS(poll), SCMP_SYS(read), SCMP_SYS(futex),
> -     SCMP_SYS(set_robust_list), SCMP_SYS(write),
> +     SCMP_SYS(pipe2), SCMP_SYS(poll), SCMP_SYS(ppoll), SCMP_SYS(pselect6), SCMP_SYS(read),
> +-    SCMP_SYS(futex), SCMP_SYS(select), SCMP_SYS(set_robust_list), SCMP_SYS(write),
> ++    SCMP_SYS(futex), SCMP_SYS(set_robust_list), SCMP_SYS(write),
>       /* Miscellaneous */
>       SCMP_SYS(getrandom), SCMP_SYS(sysinfo), SCMP_SYS(uname),
>  +    /* not always available */
> @@ -67,6 +66,10 @@ index f4b532d..d05fa24 100644
>  +    /* TODO: check socketcall arguments */
>  +    SCMP_SYS(socketcall),
>  +#endif
> ++
>     };
>
>     const int socket_domains[] = {
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-support/chrony/chrony_3.4.bb b/meta-networking/recipes-support/chrony/chrony_3.5.bb
> similarity index 97%
> rename from meta-networking/recipes-support/chrony/chrony_3.4.bb
> rename to meta-networking/recipes-support/chrony/chrony_3.5.bb
> index f6898c0b7..7c6356d26 100644
> --- a/meta-networking/recipes-support/chrony/chrony_3.4.bb
> +++ b/meta-networking/recipes-support/chrony/chrony_3.5.bb
> @@ -39,9 +39,8 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
>  SRC_URI_append_libc-musl = " \
>      file://0001-Fix-compilation-with-musl.patch \
>  "
> -
> -SRC_URI[md5sum] = "7170e750469c198fc6784047d6f71144"
> -SRC_URI[sha256sum] = "af77e47c2610a7e55c8af5b89a8aeff52d9a867dd5983d848b52d374bc0e6b9f"
> +SRC_URI[md5sum] = "5f66338bc940a9b51eede8f391e7bed3"
> +SRC_URI[sha256sum] = "4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5"
>
>  DEPENDS = "pps-tools"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

