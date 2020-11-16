Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web09.37410.1605544252945644020
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2020 08:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iipCG9vi;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id w8so5745571ilg.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2020 08:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fGJzIsjM+SJcyGTMcG9X/viR8X+LPgpPUaRWRy1Qp2E=;
        b=iipCG9visGKTUo2TozqDzIMFrfo94IeDg/TFZ9gSU5M2XxH4u1EXShguXLHSciUZtz
         +xm0RX6A1+JijQbMVsqcPrRJPaa3I0hgKIUstPyCTUzNAGfR+cbuXc2EXg3jvhJDt9wO
         AqMdetCCFhQWXEFT/bE7jNsUF4Rv/23B+QqDaR1c04RGDW45kzg4yCh/2NmlQXdVGqBn
         vravLPEWDUUnFwokv5C7EKvxmc5gF33ZuywslEHr0ubPgA0Q6aV17SNe2cGxHAyMObRH
         dHTOMcs20dvQwHSn9QdjkIDaIWKqTmMUDzXsRyB62WCaRapdyO7p/se1iwz9wCexBTax
         WwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fGJzIsjM+SJcyGTMcG9X/viR8X+LPgpPUaRWRy1Qp2E=;
        b=q3McqrkIv3N2MmqSvWsUhpY2sGVJ0WrrEsL4KjqBBjsQ2AcgUlh2XyzT4MGJolBzYL
         CwBeeBagSDjd61Mouye1cKBoGkd59+zISCHzaBobfe7rYyQw/klOgnKmDs3vQWX99M5w
         PseCAlyF3G+zJkj8dxuEWxkJwghpampLfnZApC/G98YwUoW69PIeMuDqV1PIfxQfoU42
         ke/0IM4DDwbpo7N7GUWt5XpdUiYiTmMHhEQW2VVWKquYeS+SeAkpR+2vRpEgNm73mevh
         60zaCzaxut+mz2AFTut/4dstUf7AeuWAiNl/s2bYi2Ost14Pq0lX1EddDWjFQ6UztK+F
         4Kgg==
X-Gm-Message-State: AOAM530MVWUpVLUs0Tkvynw0O1VfraNtzXKhBpuQUI0E23a4A2/r5X8i
	YRxwhXaaY06ICrwE3mYyca7B6xPmPG2KF1X5LmU=
X-Google-Smtp-Source: ABdhPJxbtVzHfcuVO0yzRS8fD80IeykoDIa/acBKNiwzu+M0S3mkaMPpK9w12Us2iyUImYsk8zJ6a6QYeQcOEoZSmOk=
X-Received: by 2002:a92:d78b:: with SMTP id d11mr6808025iln.40.1605544252022;
 Mon, 16 Nov 2020 08:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20201115212721.2891211-1-raj.khem@gmail.com>
In-Reply-To: <20201115212721.2891211-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Mon, 16 Nov 2020 08:18:37 -0800
Message-ID: <CAKmqyKOTJ5D22u7MT7hJ1+2xSC=8CaTSViPso2YcdziG57L_oA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] opensaf: Fix build on 32bit arches with 64bit time_t e.g. RISCV-32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 15, 2020 at 1:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

> ---
>  ...rrect-printf-format-for-__fsblkcnt_t.patch | 36 +++++++++++++++++++
>  .../opensaf/opensaf_5.20.08.bb                |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
>
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
> new file mode 100644
> index 0000000000..0e113f533f
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
> @@ -0,0 +1,36 @@
> +From 90f81c1fb3e560cfc99ee7ab9a48a1736e3929cd Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 15 Nov 2020 13:22:31 -0800
> +Subject: [PATCH] Use correct printf format for __fsblkcnt_t
> +
> +This depends on time_t size and on some 32bit architectures e.g. riscv32
> +this would be a 64bit value
> +
> +Fixes
> +os_defs.c:920:40: error: format '%ld' expects argument of type 'long int', but argument 3 has type '__fsblkcnt_t' {aka 'long long unsigned int'} [-Werror=format=]
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

Can you make sure this is sent upstream?

Alistair

> +---
> + src/base/os_defs.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/base/os_defs.c b/src/base/os_defs.c
> +index 83458c2..655c190 100644
> +--- a/src/base/os_defs.c
> ++++ b/src/base/os_defs.c
> +@@ -917,7 +917,11 @@ uint32_t ncs_os_posix_shm(NCS_OS_POSIX_SHM_REQ_INFO *req)
> +                           ((statsvfs.f_bfree - 1) * statsvfs.f_frsize)) {
> +                               syslog(
> +                                   LOG_ERR,
> ++#if __TIMESIZE == 64 && __WORDSIZE == 32
> ++                                  "Insufficient shared memory (%lld) to write the data of size: %" PRId64
> ++#else
> +                                   "Insufficient shared memory (%ld) to write the data of size: %" PRId64
> ++#endif
> +                                   "\n",
> +                                   (statsvfs.f_bfree * statsvfs.f_frsize),
> +                                   req->info.write.i_write_size);
> +--
> +2.29.2
> +
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
> index 7c7051eff3..5516fc43ae 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
> @@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
>             file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
>             file://0001-immom_python-convert-to-python3.patch \
>             file://0001-Fix-build-with-fno-common.patch \
> +           file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
>             "
>  SRC_URI[md5sum] = "02cfe732d194339237da6adce8e54384"
>  SRC_URI[sha256sum] = "84268b90dc48a6675e5a77e2b20390a04bb59deb48a829102a9dbc4b9ac27483"
> --
> 2.29.2
>
>
> 
>
