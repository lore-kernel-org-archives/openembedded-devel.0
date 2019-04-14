Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id AD8B97DA62
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 18:16:04 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id s15so16772586qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X3SYqYzkTmqOAgrRjCgR0GGDvqlnjUN+5gX6NbQasKI=;
	b=Lis94NeWaOWCjpD/MTYSjNAcALWLLoWPMJ9mJucpKpaGmRuN3r1ubps+KBvujxhOvJ
	pboNItU4P61hgf+EmLnZnxUJBtXslRoIMmtjepRtjqntg+uwBmh2coWtA1fdRE0cKedt
	AEyJpucr/on0bnz0+jd3BHcgrgnrmTp5hpndSUxx1+iYKrcYnZD6c6jSj3qMAuSRjcKN
	cAv72IaRb8rPEkFHekNO/tCUKnxt4Z8olUgdD94YACHTIj82GSdN6IK6LTkOxe/3DYf/
	I9FZ2cegilMAd9NPMdN138/K2Ykq3mk4ROtMy5hzhU/xMB2TPpLgGHTppjMlPzCId1GO
	6voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X3SYqYzkTmqOAgrRjCgR0GGDvqlnjUN+5gX6NbQasKI=;
	b=dEu6t4kCwe8YX0KuILOvJ3rak7+mn7ic/FueLi4+j6sp7h6gdR58vShUrDBA3H8LJf
	+ztbCHU4OMpdbjpBPbNvb8r1C3CfpoiB8KXP5IyazpS71JF9ZLQKbOq9yN391awCANWA
	rCAFyHBGhe4dvBRc2DoluxwUwqa+MbzQwTlvXKf2ucW558F1L4yPCMICBGozAXGMRas3
	lUr+CnhT0DLZrXwH1bs5H1Qj3yezjB9cOuFUy7lOkgTVecqhTzMd4QAxk3vh87/9dGjQ
	S6Hj6GKii/gr/aXsHoRh7TWRjvsqEEvrBwn9+EKmOEnq9AxU6z/sfTIGeXT0Y/NG2mdT
	o24w==
X-Gm-Message-State: APjAAAVvgQ8aelgL8a9FSUwN7nMmFZ0Y3V4yZviktqy+20X7Cv0Omnfq
	5azgn/oyjEAHyW7MK8XpKOIugw4pQJpPAr/DybUeQA==
X-Google-Smtp-Source: APXvYqw8/7sv4OREJ1srhwGIMmC8Jk9UlQAuO+pE+/nDXOqSAG87e5hhggAnTKssARAJPPBpkxKXYKvbMXMiPQSdJUE=
X-Received: by 2002:ac8:1846:: with SMTP id n6mr55134721qtk.262.1555265765454; 
	Sun, 14 Apr 2019 11:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
	<20190414161725.21617-4-robert.joslyn@redrectangle.org>
In-Reply-To: <20190414161725.21617-4-robert.joslyn@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Apr 2019 11:15:54 -0700
Message-ID: <CAMKF1sp2+DGg32W415-om0Y10zwJQEL54YARNBkWBskckYaRnw@mail.gmail.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/5] gpm: Remove duplicate definition of _GNU_SOURCE
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
X-List-Received-Date: Sun, 14 Apr 2019 18:16:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 14, 2019 at 11:09 AM Robert Joslyn <
robert.joslyn@redrectangle.org> wrote:

> The Makefile already sets -D_GNU_SOURCE in CPPFLAGS, no need to patch it
> in again.


Have you build tested it with musl ?

>
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta-oe/recipes-support/gpm/gpm/processcreds.patch | 12 ------------
>  meta-oe/recipes-support/gpm/gpm_git.bb             |  1 -
>  2 files changed, 13 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/gpm/gpm/processcreds.patch
>
> diff --git a/meta-oe/recipes-support/gpm/gpm/processcreds.patch
> b/meta-oe/recipes-support/gpm/gpm/processcreds.patch
> deleted file mode 100644
> index d647eca0a..000000000
> --- a/meta-oe/recipes-support/gpm/gpm/processcreds.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Index: gpm-1.99.7/src/daemon/processconn.c
> -===================================================================
> ---- gpm-1.99.7.orig/src/daemon/processconn.c   2010-09-29
> 17:36:18.571782951 +0400
> -+++ gpm-1.99.7/src/daemon/processconn.c        2010-09-29
> 17:42:44.659991758 +0400
> -@@ -20,6 +20,7 @@
> -  *
> -  ********/
> -
> -+#define _GNU_SOURCE
> - #include <sys/socket.h>         /* accept */
> - #include <stdlib.h>             /* malloc */
> - #include <unistd.h>             /* close */
> diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb
> b/meta-oe/recipes-support/gpm/gpm_git.bb
> index 012dceb23..b64f05c57 100644
> --- a/meta-oe/recipes-support/gpm/gpm_git.bb
> +++ b/meta-oe/recipes-support/gpm/gpm_git.bb
> @@ -13,7 +13,6 @@ DEPENDS = "ncurses bison-native"
>
>  SRC_URI = "git://github.com/telmich/gpm;protocol=git \
>             file://init \
> -           file://processcreds.patch \
>             file://gpm.service.in \
>             file://0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch
> \
>             "
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

