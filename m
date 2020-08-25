Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.1398.1598380471706408313
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 11:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iHiMIKDW;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id e5so9732132qth.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 11:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gwXutSHpYQ0anRuwrCVk1ddJIDiuygxdaRxscXeHbHI=;
        b=iHiMIKDWUah7yj/1+hUx7nwbpHixMvyZtoKnxbwNtiT1U6VAS/hhFQXI7UAV2Gw2sM
         TQ3xwf9ozgBHu3ASF8cCu48MWMDfqFznPZYVZkJcAMPwXPB/wUOVdZqLHlH9AvovocNy
         5BgedqoToXb+6qnG7EHxRDdTbmkOZ2zRnL6+yWJ6Ah8vzpc4ICdwZD2D66tf8UV+ad9e
         TMOITX5ZsFe2T84KLaU4uFwe2/AUZd+s4Jw/TPBefGWGxzLohcwiFn4T1pcI0qGScLar
         Hlc+CKOJpH/RoUpND7aM0k5qP6P0s0l3W3Gji918s5nA6pFPmFDcaUaOkre1X8EVJDlD
         n9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gwXutSHpYQ0anRuwrCVk1ddJIDiuygxdaRxscXeHbHI=;
        b=IbpI5OmuXiIdT6PpLU+TC8zrVADZTx2cEylIbwAE1xYlYZV4tWkVFK7ondsTN9LsKR
         qLDXw3hrjs7mMIC2JgseK3C5j7OtdRZA6NtiqIl7ydv2xBXUQniJ7MZRNOXaehp5yqtI
         JSIH5xD1BGy7cTFGsy7sYWD//Jg4BkaHfyFMAena9WP9zbiYtpQfTRTsWEe1rwS55XFm
         ZOtNy95q9fAOvlbJLYwT9OYWQqAK3RQZgc35gpg7rMGqybwjPsAVdjXxZKKTSwH8WhnE
         q4tAffv3KtIPQTCLKBbMBsngePEobPPhukHf9rxH6RIW0FAvNGapDyOz5liQHN7hfG+D
         j2sA==
X-Gm-Message-State: AOAM531u32LAKqj3gzK4qu+o7o4bX+ycz7jVqJEdRP881ozAkNNW31DY
	ACSTUVp8GbDUAcKigW/c5CJpK9jANT8hVE7JTNg=
X-Google-Smtp-Source: ABdhPJxyaTPm42Db3UnxMh1Zxrdfs2ZLQmkN8DfrijVC1GhZwIejVL+eDPXz6S+S8oekIW7TT7AKR6PoXqDoR6CGOS8=
X-Received: by 2002:ac8:4d0c:: with SMTP id w12mr10421247qtv.194.1598380470735;
 Tue, 25 Aug 2020 11:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200825040803.837645-1-arthur.she@linaro.org>
In-Reply-To: <20200825040803.837645-1-arthur.she@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 25 Aug 2020 11:34:04 -0700
Message-ID: <CAMKF1sp9NYtca+=CE3RpYDTg4cSOYEhjg0kRecnbmVvM3n_QQQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: fix Makefile macro error
To: Arthur She <arthur.she@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 24, 2020 at 9:08 PM Arthur She <arthur.she@linaro.org> wrote:
>
> This error caused the curl library not to be linked.
>
> Signed-off-by: Arthur She <arthur.she@linaro.org>
> ---
>  .../0003-Fix-Makefile-macro-error.patch       | 26 +++++++++++++++++++
>  .../xmlrpc-c/xmlrpc-c_1.54.02.bb              |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> new file mode 100644
> index 000000000..e0be24bf7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> @@ -0,0 +1,26 @@
> +From bb4057f06dd4a0b7823c1952b14cee7882664f1b Mon Sep 17 00:00:00 2001
> +From: Arthur She <arthur.she@linaro.org>
> +Date: Mon, 24 Aug 2020 20:50:58 -0700
> +Subject: [PATCH] Fix Makefile macro error
> +
> +The libcurl will not be liked due to this error.
> +---
> + src/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 1cdf8b0..acd04dd 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
> +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
> +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
> +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
> +-  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
> ++  TRANSPORT_LIBDEP += $(shell $(CURL_CONFIG) --libs)

do we then point CURL_CONFIG to PKGCONFIG or pkgconfig ?
I think it would be better to do so as well while here.

> +   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
> + endif
> + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> index c1f0b78ca..eec945824 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
>  SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
>             file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
>             file://0002-fix-formatting-issues.patch \
> +           file://0003-Fix-Makefile-macro-error.patch \
>             "
>
>  #Release 1.54.02
> --
> 2.25.1
>
> 
