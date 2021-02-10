Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.836.1612927503151245747
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 19:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AqWo8QDv;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 19so393348qkc.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 19:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XGKqJK6tsTmTYuoAKaCVqNIk2VSKBpOgjH/d/iWC9tM=;
        b=AqWo8QDvBNO2891FqLDlpOX+MeYpI6Md+IwWazlI41oVTejcKJZpeN/ovSBhkJ0YqB
         f9hwzJZi+ndlXV4bQnXfYSZOS0GTy1NT/oB2h2c690KkODi7kBJwVp/JB5UIzEZomuxZ
         wd28jW+hWrDQwuO0PPCqGbFuhyCYZUo2E33B8ZKG/R57Lj0k8IEdP39YXNrDXDQnSRF0
         R0qqoswzJ7WBa92CruUaETwXJGl9bpJIzX6bC6KG3DzXhQF1tZyibWkq1MVZlLKKUsSy
         R5XZJXGritgknjrnyIbPW+DaBeXLAz4q6FZt6jE0yNb1dOQ2OKkx0sQOpyikDC6hp4x0
         r2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XGKqJK6tsTmTYuoAKaCVqNIk2VSKBpOgjH/d/iWC9tM=;
        b=asdqYMhP8ksD19w4QiRZvGYrBx30zk12guuETA5+reTt6hcFlWBQwRVYg2Xxabat+/
         yMaHpsE4cEWtrI83rSroH1lnpTpYvkqBY8asZhvkgWJVUTswLOoLFmLiwqFBbTLz4nVO
         3YDE4L0zO+TsvzNyDwqCb1x8HzS/tUbv7ajr/xHjw0gCc7+nPjhrdFMzUdpLpo83Dnyz
         uQi/y1+pJQvxWr6S5tMsRciLgSkJXNAM6uKwBpU58uETvvbVM9o+JOqdvlTVOlJupFBW
         d+9yhhUpneB6S71ADFsqDY6eMeNFIub+IRi4GenVIJ1FPFqcOAYmowsxmiSSy+LFwZJH
         1LdA==
X-Gm-Message-State: AOAM532blqKZmmVPNSeL9KHSmrq6XdI9eDSB0kUrE3IfBdPobsxN//mn
	Ci8jPtUBh5Ea9eJruDqBaGAtDQFOIYZqV4Qsnzo=
X-Google-Smtp-Source: ABdhPJxbUQDvyxwKlsHEbkHa3Z31WRAnHe87Cv9XznuJ0qLoiV4IU0QyyIkD++VGPqRbB5oQjai4cwkHU52R6iwfpMg=
X-Received: by 2002:a05:620a:2211:: with SMTP id m17mr1530384qkh.9.1612927502187;
 Tue, 09 Feb 2021 19:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20210210025425.43148-1-rfried.dev@gmail.com>
In-Reply-To: <20210210025425.43148-1-rfried.dev@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Feb 2021 19:24:36 -0800
Message-ID: <CAMKF1srz5RfURaqEfQSjqob5z-gZn45jMCHcRCjHvDL1g8J5SA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] fluentbit: fix systemd input plugin
To: Ramon Fried <rfried.dev@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 6:52 PM Ramon Fried <rfried.dev@gmail.com> wrote:
>
> Because of missing dependency of systemd, Cmake configure
> step didn't find systemd and skipped the systemd input plugin.
> Added necessary dependency if systemd is available.
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>  meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
> index bc4cd0cf9..47ed36a29 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
> @@ -22,6 +22,7 @@ SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781
>
>  S = "${WORKDIR}/fluent-bit-${PV}"
>  DEPENDS = "zlib bison-native flex-native"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"

perhaps use
DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"

>  DEPENDS_append_libc-musl = " fts "
>
>  INSANE_SKIP_${PN}-dev += "dev-elf"
> --
> 2.17.1
>
>
> 
>
