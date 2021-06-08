Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.6091.1623111987645502901
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 17:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tTye+yIo;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id u14so7008953qvq.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 17:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sSq+pxFSXuYOVixS0oeqztc4LEQBNkBht8l6VBIt/v0=;
        b=tTye+yIozeTGwtgUnudxLlqovLTmBz6cvNi64I8sQhYUe4N8kW6RnY/bqSM1KDqANQ
         Gp+IT1DjyAHry2Rrqt/Ijhjqyfn9/FucTKKp4tv+awl/kzQz/Alk1jG5aB3CR8t85QNf
         +ilYxa4xio2x0mJ63IZDk17savXdUkfqehnL110QTYkGmcgIY10kySEJchvOM1rrBfWd
         oU9ndzS+agcZbyechKhLWyetoPu+Y4vy7ooOwQuM6zKKh7xHoL6qtq5Eub3lgpKPOW+3
         nBho47PEHrZeoBaRBE/WwJKluo4ojVt6WUX1nKDR2+K0AdKWxfrLs0eAosDUTMGH1B97
         0t7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSq+pxFSXuYOVixS0oeqztc4LEQBNkBht8l6VBIt/v0=;
        b=UREKWqSYC4NiG11MzMQrnyL8Z7gzHru37fqpQ9Vy2C2zZxFRtvNMQFh+HHhnFBpfgn
         /VzOd+rFDLLna0PA3HanmWUgFlsQDE914oI8YIKtHXFnvFyfYYlsSBZmY0X0c4sDb/zt
         1AcdU7BIJvixa9WAWby9BDP4nK7pZeUjQD4hgxWFCynmsozK1kq6wkWyMjY8Lp0FL2Kn
         GxDXwNczHSnnsgMgvDPFImgDRk9zu5FjwdCik9kqpAmfdfuAHjax9D7RVH/OxHd1GhzR
         y6B17F1AAQyWbfR7sPViFScJTf8UXEYmZhpbLP6DYrlmqpf1bVQrcD3YJNEqXmqOow3O
         uZvQ==
X-Gm-Message-State: AOAM533pSu/ZaZyyWiVDJ6h1IJtoaLcmf9d1rzJjtu1NdnXeWqOs86FX
	x6XJn037HcLnzMlE8rNU7mHA3s+bQyZ44OSQc90=
X-Google-Smtp-Source: ABdhPJz4viRZCAVqkab6UhorFpMyh6jI111Egr7fS+2B8bD6ugk5l2RJo3U153aoxLkGURXFURYRJgn1M8FretBsL7w=
X-Received: by 2002:a0c:80c1:: with SMTP id 59mr20973339qvb.31.1623111986654;
 Mon, 07 Jun 2021 17:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210607160804.264567-1-ross.burton@arm.com>
In-Reply-To: <20210607160804.264567-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 7 Jun 2021 17:26:00 -0700
Message-ID: <CAMKF1spO5mLw2+cxuNcBt8cvjWeTDo3jC229URaC8vAQ8KGkmg@mail.gmail.com>
Subject: Re: [oe] [PATCH] zsync: add recipe
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 9:08 AM Ross Burton <ross@burtonini.com> wrote:
>
> zsync is a tool that is similar to rsync but optimised for transfering
> single large files, where you have a previous version of the file locally.
>
> These qualities make it an excellent choice for transfering built images
> between hosts.
>

musl unearths a problem

https://errors.yoctoproject.org/Errors/Details/586153/

you have to include  <sys/types.h> to get off_t

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../zsync/zsync/out-of-tree.patch             | 37 +++++++++++++++++++
>  meta-oe/recipes-extended/zsync/zsync_0.6.2.bb | 13 +++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/zsync/zsync/out-of-tree.patch
>  create mode 100644 meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
>
> diff --git a/meta-oe/recipes-extended/zsync/zsync/out-of-tree.patch b/meta-oe/recipes-extended/zsync/zsync/out-of-tree.patch
> new file mode 100644
> index 0000000000..b96777f0c3
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zsync/zsync/out-of-tree.patch
> @@ -0,0 +1,37 @@
> +Fix out-of-tree builds and rebuilds by passing the right -I to find the common
> +header, and disabling maintainer-mode.
> +
> +Upstream-Status: Pending [upstream is dead]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/configure.ac b/configure.ac
> +index 87b0be1..4b7c9a2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -9,7 +9,6 @@ AC_CONFIG_MACRO_DIR([autotools])
> + AC_CANONICAL_HOST
> +
> + AM_INIT_AUTOMAKE([dist-bzip2 no-dist-gzip foreign check-news -Woverride -Wobsolete -Wportability -Wsyntax -Wunsupported])
> +-AM_MAINTAINER_MODE
> +
> + dnl --- Check for programs
> + AC_PROG_CC
> +diff --git a/librcksum/Makefile.am b/librcksum/Makefile.am
> +index f4fce72..47754eb 100644
> +--- a/librcksum/Makefile.am
> ++++ b/librcksum/Makefile.am
> +@@ -1,4 +1,4 @@
> +-
> ++AM_CPPFLAGS = "-I$(top_srcdir)"
> +
> + noinst_LIBRARIES = librcksum.a
> +
> +diff --git a/libzsync/Makefile.am b/libzsync/Makefile.am
> +index 0a6ae85..33a5951 100644
> +--- a/libzsync/Makefile.am
> ++++ b/libzsync/Makefile.am
> +@@ -1,3 +1,4 @@
> ++AM_CPPFLAGS = "-I$(top_srcdir)"
> +
> + noinst_LIBRARIES = libzsync.a
> +
> diff --git a/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
> new file mode 100644
> index 0000000000..c61e26309d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "File transfer tool optimised for large files"
> +HOMEPAGE = "http://zsync.moria.org.uk/"
> +
> +LICENSE = "Artistic-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=71c0ac4d86266533509aa0825b8d323c"
> +
> +SRC_URI = "http://zsync.moria.org.uk/download/${BP}.tar.bz2 \
> +           file://out-of-tree.patch"
> +SRC_URI[sha256sum] = "0b9d53433387aa4f04634a6c63a5efa8203070f2298af72a705f9be3dda65af2"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> 
>
