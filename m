Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.1055.1592370645677744616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 22:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RvU+k9aD;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id b4so887000qkn.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2020 22:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NJYflZy2OB8LSmmRoT4dYhCI7gipbT7u4MvYGY5KJ28=;
        b=RvU+k9aDJrjNzKord4L/9cs5TTE5YE9ZxnrMRtHfNFY5lsW7jKyRbH22XE7p8DOznM
         P2UbMr/mLpkBdZeg3BoMXoasfWSxU8NX83SXyXc2q6True/xANoEVbaRz4Z8XvhdZXTk
         V8xjHvcJm/izaPtLAr0wwMFFK2BmTIycXdsOHbWGWAgCQsTffPXgid7g8T3pBdDFF7my
         4UeHzJPZiBf5QGvRf0o4m2gcezIbAoX7jD/7sU6u9/ymBrP/JqzzWavL1c+BHFK8Mcec
         J1K//jiph6k0G9fg1aPST2qkW2U5cx+9v8BkjN32CQi0pt9hUdexLLVAufzDcscbIeWg
         pCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NJYflZy2OB8LSmmRoT4dYhCI7gipbT7u4MvYGY5KJ28=;
        b=B0yGUIKOM3C2/9jje7CcjpQVkaVWrbkEKfUxmoSeCwHnT+gDNfuGeI2iNbCvlYrkzi
         dKY/6YrSeJVH5mHbJ95Knbr+LJi5CVp3EEL6E8WSiNivOS05OiLVcjP9x5FiRcHO4or1
         OxpBPSXdKy3zCgAYSK+1gESxA2/bGovcB4T6vE9sGesd4U6AlFrc04QZKfHZJc/S7IRp
         NH+aRiLXEqsE9uZfFeHLgl39J+iRmC6AOs0LVAk5fc7nVia8ZlDnS7N1qa6dBSe0ai4I
         5AhdiZmrR6BtXDVhfunFOWO2lAjcuSPz5JmRTsUAxzZw2Mn7t39wAXxsoyM7l+plw4Hv
         DwRw==
X-Gm-Message-State: AOAM533QxAO8Wa/SVp2woJyGmPl3YE4+Ptsh394dJNFBjw/xRjvIbipL
	zDmGe37cccz6TjTkbtHQBkbPIDnTxwwvIuFRQBA=
X-Google-Smtp-Source: ABdhPJwIwmwttGsUdNYLQdHqOtV7XIoggDfFkNi40zfAFvtqCTmQwAjEgbe7Wlzbu0ef5AfWoSDVOOFSufn+DKRjBWk=
X-Received: by 2002:a37:9c55:: with SMTP id f82mr23707328qke.225.1592370644719;
 Tue, 16 Jun 2020 22:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200617004648.43633-1-rrowe@xevo.com>
In-Reply-To: <20200617004648.43633-1-rrowe@xevo.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Jun 2020 22:10:15 -0700
Message-ID: <CAMKF1soPb=zLQyL7Ep0oUU-hi=aqDtaFcrXMpHo080KGDaeDAg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] add python3-dynamic-dispatch
To: Ryan Rowe <rrowe@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, jbroadus@xevo.com, 
	Martin Kelly <mkelly@xevo.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 16, 2020 at 5:47 PM Ryan Rowe <rrowe@xevo.com> wrote:
>
> Signed-off-by: Ryan Rowe <rrowe@xevo.com>
> ---
>  .../python/python3-dynamic-dispatch_1.0.2.bb  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
> new file mode 100644
> index 000000000..be39a3775
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "dynamic dispatch decorator for classes and functions"
> +HOMEPAGE = "https://github.com/XevoInc/dynamic_dispatch"
> +SECTION = "devel/python"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "0e29d2afa806b9b87dadfbed6a0afd6d"
> +SRC_URI[sha256sum] = "ec7025b2890e7a882ceef95ff82fd154265136af930cab42533070b557d2a15d"
> +
> +DEPENDS += "python3-setuptools-scm-native"
> +RDEPENDS_${PN} += "\
> +  python3-typing
> +  python3-typeguard
> +"

same problem here you need multiline separators

> +
> +BBCLASSEXTEND = "native nativesdk"
> \ No newline at end of file
> --
> 2.17.2 (Apple Git-113)
>
> 
