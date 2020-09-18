Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.12586.1600435077471025520
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 06:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X89xr5nw;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id d20so5982143qka.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uLWmPO9y65mp4aIGnBAnKUm9wG2tvgnxHxbZbhJp8U8=;
        b=X89xr5nwZ2cO6tHVTFBIEUluMpFVDt5y83AWhgdLGFZ6CR7qO0H9rykHp1ZBU0VLQ0
         rgOkMQ2Dj7JNe4MquWxZDP36KHHX+2I4cJijsB1TQrJ5wzvxLXbK1u53HZ4pKcqWDPKI
         cI8y7Q0TEQ23nHMGltmdOpLA13mZXiFC21wGH3V5ib1C4BVZ4+QiTaSdjQ5RIUBxn++f
         iCW1nVPR5wHRNJ35XAAHLSKq+/7NYcYIbnFtp6Wgz2KqQBcNUdEeIfx0dKOhRXHBOybQ
         EsWJbdiHHHI5JzC1azmthNobT+yxr8toieu+FD9OFcoEyuAPJUHMay9wUf7B5fzzVGDQ
         GDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uLWmPO9y65mp4aIGnBAnKUm9wG2tvgnxHxbZbhJp8U8=;
        b=sxsDm79My7fPHKoOxpJms3L3L+fuexB6BywcjYDnsI5IO4iHjmfwspE7Q2AylRCDL3
         ICIIfJX7UlJ09H58/WBjijDFF6mu1s/EVXnuO8J7XsiPpjStNhET0MmHbFMfX/MevOKC
         Xl0WSzC2/Mdvj4ySxfOpTzoJC8VvwNnrluaZlW2GENHSW8k0lAvlxFki2uHbaWDQt8fs
         oHzvz3IWrKE8w4EoN8kAO5VCtRvb33+D5OZ+3Y+FTiedUlWlynncN5DPyCwwTZbEgloB
         W+YgIxk7vLeNZoqCzpfuds2D7KzkrEaADGKPcMuYWf49lPYGQAet7HgWndbinATnPe0r
         kjMw==
X-Gm-Message-State: AOAM530NBDdZLUWUxPV2eob5JA9Cqhe2F+HZ0PW0QKKC2btr0Q6MGEpa
	2NBUW24V7J6E4+IkLVwh336dEFjHwgqNZ7hJa9U=
X-Google-Smtp-Source: ABdhPJzlHRkVG8PUZGxrN36tyVWDV8WXlNw932Th0SOGQOAr/wgkcNfg0RpOf5Hw+RsPybiQ7BdakPcwD4JgZvTLHSo=
X-Received: by 2002:a37:9046:: with SMTP id s67mr33062433qkd.212.1600435076602;
 Fri, 18 Sep 2020 06:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200918080126.34608-1-hongxu.jia@windriver.com>
In-Reply-To: <20200918080126.34608-1-hongxu.jia@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 18 Sep 2020 06:17:29 -0700
Message-ID: <CAMKF1srbs8OQ5udXzXBW-sj4DmcjNsSJrj3vgKkE9qi_nfyosQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-argcomplete: add recipe 1.12.0
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

please add it to rdeps in packagegroup-meta-python.bb
as well

On Fri, Sep 18, 2020 at 1:02 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Tab complete all the things!
>
> Argcomplete provides easy, extensible command line tab completion of
> arguments for your Python script.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../python/python3-argcomplete_1.12.0.bb       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
> new file mode 100644
> index 000000000..dd749dd9e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Argcomplete provides easy, extensible command line tab completion of arguments for your Python script."
> +HOMEPAGE = "https://github.com/kislyuk/argcomplete"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
> +
> +SRC_URI[md5sum] = "47e2a3db821f57165be8f3d3ec1e5259"
> +SRC_URI[sha256sum] = "2fbe5ed09fd2c1d727d4199feca96569a5b50d44c71b16da9c742201f7cc295c"
> +
> +PYPI_PACKAGE = "argcomplete"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-core \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> --
> 2.18.2
>
