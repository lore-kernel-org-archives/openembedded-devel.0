Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.7053.1612853160856760877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 22:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FStHFj7i;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id n28so5270474qtv.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Feb 2021 22:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nVQVJwCgmp1R1TbFkq6KS6q+UTt0ylCAumkciqBtSOQ=;
        b=FStHFj7ivfej5Wl9F2mQLKBIFZAOfCaIsUS5kdaKIxdCAAPbu4fmq19aDBa2C32z3N
         FrOGDyvE2Y7CLSCyPmvRqdOJ5RzBIRTDYFSFnZH0SAxeQEC2JBkuP4OIcrgpS6RTPF9U
         j846nfIub0eHc0efo77G3u+y5d6UT30sPg/wIAiSwraLtuormkimE0lzarCidLYIWJwb
         fpgFmjG6y6STOnQgv8hLnfgK0OvOz+tKuZOFxkpfaH1StxSMG+/SrmqNE8PWeAAmwTnd
         R6WztFhcgb/l00/py7vL0xHv8qwBqLN3S81FcOWXBlMNY37QxCW8myNJ8L67QF23CjRR
         0wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nVQVJwCgmp1R1TbFkq6KS6q+UTt0ylCAumkciqBtSOQ=;
        b=oVTTAx0MFBAuE7ou+fOVIluviVVveCbEIspeukiFe2oFx4TQlSYVF22y2dqba/AVA5
         litc5QbbMQp6RciyYpU6pXNFGnABVDT8bWj3GSRukKJg5qspkhA6fVFjDp/q9xwPu9md
         2p46fKk+FIM0PXiBB9aJY9fy7a6tpW+V46sHl9hPDs2HPNkUrkq3m6bTiDmTRKw2frqn
         uQmjLUXfiH1FTkIlNjOZcB6zJlLF7ePi8/qG1RGrqZFMLawrxZ4FrybecYEPgf0ma9H6
         nTEeaaqfR+Ncno3gcprUuVgeFdSjqraiHtm9y84xKW9Dz3f3VHKmBWu2eB2JhRFhD5eN
         n66g==
X-Gm-Message-State: AOAM531tqmC8qZPFNgktrKCO4gS8WJAz3jlOK59birWgEqqczz1QVdtQ
	3MA5CmbGDfLv2HNPixx8LG5y10mJlO+p3udIS7GiiAxXxzS6dw==
X-Google-Smtp-Source: ABdhPJy19ls4LXX41HYr/IE9qdfPLH8gmlcjKBHDSalfygh0tXyAeUL9tw+WmiKKr7H9tLbNExe2SS4kb1OWEoN/Pe0=
X-Received: by 2002:a05:622a:44d:: with SMTP id o13mr12334594qtx.378.1612853159893;
 Mon, 08 Feb 2021 22:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20210209060717.69440-1-hongxu.jia@windriver.com>
In-Reply-To: <20210209060717.69440-1-hongxu.jia@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 8 Feb 2021 22:45:33 -0800
Message-ID: <CAMKF1soca2eHtfmMNkQ2LXBjaEVoN67zMXv=pn7WoXZ4jfsfzA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] ndpi: fix autoconf-2.71 compatibility
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

D_FORTIFY_SOURCE=2 can not be used with out a -O<level> so right fix
is to pass some opt level to compiler.

On Mon, Feb 8, 2021 at 10:07 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> While compiling with gcc option -D_FORTIFY_SOURCE=2 (by setting
> DEBUG_BUILD = '1' in local.conf), the do_configure failed:
> ...
> |configure: error: C preprocessor "i686-wrs-linux-gcc -E --sysroot=tmp-glibc/
> work/core2-32-wrs-linux/ndpi/3.4-r0/recipe-sysroot  -m32 -march=core2
> -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2
> -Wformat -Wformat-security -Werror=format-security" fails sanity check
> ...
>
> Drop AC_LANG_WERROR to workaround the failure
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0001-configure-drop-AC_LANG_WERROR.patch  | 29 +++++++++++++++++++
>  .../recipes-support/ntopng/ndpi_3.4.bb        |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch
>
> diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch b/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch
> new file mode 100644
> index 000000000..b2a337ae6
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch
> @@ -0,0 +1,29 @@
> +From f3061fbc10aab9d0edec6964449af97658a993fc Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 Feb 2021 19:25:52 -0800
> +Subject: [PATCH] configure: drop AC_LANG_WERROR
> +
> +To workaround configure failure with gcc option `-D_FORTIFY_SOURCE=2'
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + configure.seed | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/configure.seed b/configure.seed
> +index 9d1185f1..f87889ed 100644
> +--- a/configure.seed
> ++++ b/configure.seed
> +@@ -34,7 +34,6 @@ dnl>  AC_PROG_CC
> +   AC_PROG_CXX
> +   AC_PROG_CC_STDC
> + fi
> +-AC_LANG_WERROR
> + AX_PTHREAD
> +
> + NDPI_VERSION_SHORT="@NDPI_VERSION_SHORT@"
> +--
> +2.29.2
> +
> diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
> index 1e4153779..256e2ca54 100644
> --- a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
> +++ b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
>  SRCREV = "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
>  SRC_URI = "git://github.com/ntop/nDPI.git;branch=3.4-stable \
>             file://0001-autogen.sh-not-generate-configure.patch \
> +           file://0001-configure-drop-AC_LANG_WERROR.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 2.29.2
>
