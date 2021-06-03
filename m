Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.1738.1622764020146134693
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 16:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QtUld+p0;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id i12so5725650qtr.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 16:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bZeg/nWdq8rTQZqicN0MtbPOM4tUoSRdaIhNPGTIlHQ=;
        b=QtUld+p0dZlFAf20ByK/o/4NpO7ZwF9VONhau4heCkafOomv4EGgw0N1Ll6fiQL0rl
         3+J3gRvgLI9r7iM4soJFYDLK86wPf2cgJqvbRAe7Aq+CmQtqtnXyv0TSpmIus2CAcUtG
         ayCr50O1VLzlna8jM2FamWzOAaUmu0gMZI/d7fc/q4e7REiFMZCkFikPbd8MeOMsDopk
         uzXldJJnE94rM+HIX4lY2LqPyxqwIQ44uQEqnnzM71sOWmU6LBAVfzUEMZWcM0N364Jt
         u2+NkH00KabZww0lZJQVDRG/Df61V3qNJOWPDsaHkCDtn+TGw08x5zWvitcpB6ichaNq
         smVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bZeg/nWdq8rTQZqicN0MtbPOM4tUoSRdaIhNPGTIlHQ=;
        b=Gn1FN2zO2d7brmRJWXdz3/r+sNxT9D5EQ9pyo1Et5RCvY+bSzSODu+3RYXOZj+F8CN
         F4H67texPlvgsvWlKOiyHpXry6wwb/3wN2rCMhxUevY20Ih1Yn+tStR+zUKCSR4CzzFU
         0F+QjjxQMleRZsay3tQfL/1OmAzjw2FH1yBtxQIN8rSYddwgwlmH1Q/fvPe2b7h3xFuD
         M0xkS5cgmt4dPdIPFKLKo64SKHBC0KdLNo84zMUjJ+u3MOIMdIZnYAQegTMOyeantFzp
         31tHCuwpdfUgMsB0azo8cQwT5LHTRfZQXEEODYJXO30Q4V4XtEMI2efSkkHeSrGXmYAT
         O0kg==
X-Gm-Message-State: AOAM532219awfDRTL1I+ba5asJprq4iWwcT+C3m8GMfj15Kwx1KgWW8Z
	LEm0Q3pPQSwQ/9nLmYqwvF1OF5ILFHLP+e8gcik=
X-Google-Smtp-Source: ABdhPJwDYowTXuFBMkCFOtqAjN/p9tM7GD/1aAvZQeLEVc6dSY9hVRgTzmZZfuMJAU47O4FZczH3PCLTvkxp+74CW5Y=
X-Received: by 2002:ac8:5d93:: with SMTP id d19mr2028853qtx.289.1622764019289;
 Thu, 03 Jun 2021 16:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <1622746732-4446-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1622746732-4446-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Jun 2021 16:46:33 -0700
Message-ID: <CAMKF1sptZgYTqHXBs7rTF5wUx9fDmPfZZnE4Q-RCL3PSP2bH9g@mail.gmail.com>
Subject: Re: [PATCH] [oe] [meta-oe] [PATCH] iperf3: upgrade 3.9 -> 3.10
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing some patch fuzz errors

ERROR: iperf3-3.10-r0 do_patch: Fuzz detected:

Applying patch 0001-configure.ac-check-for-CPP-prog.patch
patching file configure.ac
Hunk #1 succeeded at 47 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify iperf3
    devtool finish --force-patch-refresh iperf3 <layer_path>

Don't forget to review changes done by devtool!

ERROR: iperf3-3.10-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]


Please fix them and resend

On Thu, Jun 3, 2021 at 2:59 AM zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:
>
> -License-Update: Copyright year updated to 2021.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  .../iperf3/{iperf3_3.9.bb => iperf3_3.10.bb}                  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.9.bb => iperf3_3.10.bb} (89%)
>
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.10.bb
> similarity index 89%
> rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
> rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.10.bb
> index be75837beb..6fe87353dd 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.10.bb
> @@ -9,14 +9,14 @@ SECTION = "console/network"
>  BUGTRACKER = "https://github.com/esnet/iperf/issues"
>  AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b7fb682e9941a49f1214dcd7441410d7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4991c26fb646b69589d1eff3e958b06a"
>
>  SRC_URI = "git://github.com/esnet/iperf.git \
>             file://0002-Remove-pg-from-profile_CFLAGS.patch \
>             file://0001-configure.ac-check-for-CPP-prog.patch \
>             "
>
> -SRCREV = "1f8fb13297f3e3e40169ebcd12e171167e394473"
> +SRCREV = "c159c741243441be84f91d3130cbeef1e1d579e8"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> 
>
