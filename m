Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.7043.1628993270173112765
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Aug 2021 19:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ge3pZSdX;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id v1so7432800qva.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Aug 2021 19:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O/v6tJkh1pWedDpuXL6yVt3Kvmd+TCdBpkMUP6q/Gh8=;
        b=Ge3pZSdXx+oPn57kG3L10tHpejY4cMHOdmh+ARYAfv5blqzS/VvPwZlFVqDpNz5ERs
         2NY/SYEGCgAqj4EUce9AIzQmsGvexrt96iEq3Q2B3gfWz8Ni+yY7wkFfY7t1IbXBwBs/
         MDRhfcsPWb6peKh51DJT4w0tpUxMAa/V79aWF59UJ4AbN0AKH05PxmnUNheqTfZIYJIN
         b+78g5w9Le1x/gPf9TX2PzfPM69uigcTTjpd03ydnof0SE5/Gm3EW5bF/Bn5CPOVQyXG
         IElL02QC6GAiZMavScij4koCKafdGdIg8G3h+SuZJGeuS/2UW4IpTc9PWHsZTMp4mYqR
         9epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O/v6tJkh1pWedDpuXL6yVt3Kvmd+TCdBpkMUP6q/Gh8=;
        b=beSLR7TlvC7inqOWGfEKZgCN1X9PQ/ApgikveTQtxP9VCTxcrxdiWvgstReJjDLn/z
         OTjvSsxMgwsBmNrPe8epbgZw9ThmI+khWD6u6EQfN1RPB/JSVtt2u2X2RG89ctQ1WQbp
         IUWwhEI7SQfP9Hb9ejVRAHjKiAJc8rkTwlE+P0TylhJwlaFaQXUUfdbvBiQbRiuIkNBD
         CuUsV7ACwia3B5mbEnXlrgZrDUsxAeIp6VluyOXVaYZXKCRjGI6+WmAU25OmAJ1aMUOO
         hXz9pst72z+c/3yEiGLAHrlKtlLel9UB0EkHsgoB+APXZjJI7HiUKhixVB2oUrL3xEkM
         sJKA==
X-Gm-Message-State: AOAM530y8XlHlOIThKIVIox2pc+0FAeVr/DjTv2yvPuRl+trs6phEekO
	ISYF/EsQ4Xdkn+Q4vMApQLAZJP+i6BrauNdFaFU=
X-Google-Smtp-Source: ABdhPJwN0AZj/+kBYUaKMlb92oxiOCv8zoPoErHFuOVViwTtAjUqCbWckpNsfWmc49ZCVRNcImcfryu/xUOM5NvvHhE=
X-Received: by 2002:ad4:5f0d:: with SMTP id fo13mr10099063qvb.31.1628993269237;
 Sat, 14 Aug 2021 19:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210813161749.24182-1-sakib.sajal@windriver.com>
In-Reply-To: <20210813161749.24182-1-sakib.sajal@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 14 Aug 2021 19:07:23 -0700
Message-ID: <CAMKF1soXTyDigHxU8GTm=yijZWH+nHLbUb2-BGj9xRiDyAG2iw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lmdb: use libprefix in Makefile to install libraries
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

sadly it does not pass patching stage see
https://errors.yoctoproject.org/Errors/Details/601024/

On Fri, Aug 13, 2021 at 9:18 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> Makefile used libdir which had hardcoded "$(exec_prefix)/lib"
> directory to install libraries. This is a problem for MULTILIB
> builds as libraries are installed in "lib64" directory.
> Hence use libprefix which contains the correct path for installing
> libraries.
>
> Upstream-Status: oe-specific
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...file-use-libprefix-instead-of-libdir.patch | 33 +++++++++++++++++++
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb       |  5 +--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch
>
> diff --git a/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch b/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch
> new file mode 100644
> index 000000000..2e32d9c37
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch
> @@ -0,0 +1,33 @@
> +From 8d1d18f8ae4c3cd7ecdc79545f89459d1c9e4bfd Mon Sep 17 00:00:00 2001
> +From: Sakib Sajal <sakib.sajal@windriver.com>
> +Date: Fri, 13 Aug 2021 15:59:15 +0000
> +Subject: [PATCH] Makefile: use libprefix instead of libdir
> +
> +libdir expands to "$(exec_prefix)/lib" where "lib" is hardcoded.
> +This is a problem for builds that enable MULTILIB since libraries
> +are to be installed in "lib64" directory. Hence allow the directory
> +to be configurable.
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + libraries/liblmdb/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libraries/liblmdb/Makefile b/libraries/liblmdb/Makefile
> +index f254511..1ec74e6 100644
> +--- a/libraries/liblmdb/Makefile
> ++++ b/libraries/liblmdb/Makefile
> +@@ -46,11 +46,11 @@ all:       $(ILIBS) $(PROGS)
> +
> + install: $(ILIBS) $(IPROGS) $(IHDRS)
> +       mkdir -p $(DESTDIR)$(bindir)
> +-      mkdir -p $(DESTDIR)$(libdir)
> ++      mkdir -p $(DESTDIR)$(libprefix)
> +       mkdir -p $(DESTDIR)$(includedir)
> +       mkdir -p $(DESTDIR)$(mandir)/man1
> +       for f in $(IPROGS); do cp $$f $(DESTDIR)$(bindir); done
> +-      for f in $(ILIBS); do cp $$f $(DESTDIR)$(libdir); done
> ++      for f in $(ILIBS); do cp $$f $(DESTDIR)$(libprefix); done
> +       for f in $(IHDRS); do cp $$f $(DESTDIR)$(includedir); done
> +       for f in $(IDOCS); do cp $$f $(DESTDIR)$(mandir)/man1; done
> +
> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> index 0746da141..3c6ffe04e 100644
> --- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> @@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
>
>  SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1 \
>             file://run-ptest \
> -"
> +           file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
> +           "
>
>  SRCREV = "LMDB_${PV}"
>
> @@ -26,7 +27,7 @@ do_compile() {
>
>  do_install() {
>      oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
> -    cd ${D}/${libdir}
> +    cd ${D}${libdir}
>      ln -s liblmdb.so.${PV} liblmdb.so
>      rm liblmdb.a
>  }
> --
> 2.32.0
>
>
> 
>
