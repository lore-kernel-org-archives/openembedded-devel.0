Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.7506.1587404652920539632
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 10:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WScG7sSv;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id s30so9281783qth.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMbls6Vmw0NjeJ6+M6zffyAMP1vjxnHdZ/gp4bXbbGE=;
        b=WScG7sSvc5nqEDofOAmKR2O+X+u7qpioa/P9PMUxOlE/0iVhrefzu6H/dWTeaBgulV
         O1/EoiGeb8wtMcsuKzAvUfgwDI9/ZCr49vn2y9/qcmEAjs3AxlJM7Q8j6V1KV5DCkAWT
         X5M3Q6+pSCCdM+uCCjd2uXMKYHnhGerBl9fGIV9H/WpFlNbYDr0mBd5LVb4gjTipF+aH
         Xff5kZk+3EKVHTE7v5Utbn8BFMqk8mM0SaEZgM2R8Iv7r/RYgF2dLUK+mstYD2YJ/qLD
         dyA0uVb7uhrCJp4ljih6RiG3nNvZExo+AxodaDa+pmiFL90mdn0UZ+psM+X6aOV5lNEO
         WNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMbls6Vmw0NjeJ6+M6zffyAMP1vjxnHdZ/gp4bXbbGE=;
        b=oD4I9Djqv882/8Kb933IrOl6JfN78D5ktUpKDiuy8u/TXicNEDTxHvdAHZLIX7yWkk
         ufraX+RKr1Pyn9PaujLla2dvrgsGifQpTSXK8RBXQs8bGy3ybWHgD/Nnx5wZ83Pbm3BH
         PDF0LDK2eKD8qwEdS4iaWHO2Tbjy5dMyjXpVoM8oEtudouxBh+8NpxL1636yRdojI6V7
         gEc/0fYYJ/AwJWeEvO9iZPJyU0RjA77G651Ny6cdM2WPxiWHMYAYrL0a0Bd1zVrCGSlh
         fdttSz3vKR/2xlSdcGo8/QK408sPTDqQoE8C4GhQvULbHyJ6PH6sCgYXbrEQLBNo4T6t
         Zvow==
X-Gm-Message-State: AGi0PuaOdXsej6N1I0ERZmFDjFTs0XaRpsjlhDMV5KlVZ3IYXbJtxilP
	leDbcPoLaajvAIL7fJh7MLRw4aZS6+0jF8yGTUw=
X-Google-Smtp-Source: APiQypLudfs7nh+T4cjlMbEyuKR+EWvYNNi/I1N+wx7O+qazkROY+wJkutU4L0M2SaAAstMKwzzBHGUWcQeqbnlXvHM=
X-Received: by 2002:ac8:668b:: with SMTP id d11mr7505007qtp.285.1587404651698;
 Mon, 20 Apr 2020 10:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200420170656.10895-1-andrea.adami@gmail.com>
In-Reply-To: <20200420170656.10895-1-andrea.adami@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Apr 2020 10:43:45 -0700
Message-ID: <CAMKF1sr+nAmaQzpN_eWvsS8_KdyfzHdF7AfgDdhsWRgmgO=3YA@mail.gmail.com>
Subject: Re: [oe] [meta-handheld][PATCH 1/4] zaurusd: fix build with kernels < 4.16 and newer libc headers
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 20, 2020 at 10:07 AM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> The Y2038 changes broke the build for older 32bit devices using
> older kernels.
>
> As seen on: https://sourceware.org/glibc/wiki/Y2038ProofnessDesign
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../zaurusd/zaurusd/add_64bit_time_t.patch    | 43 +++++++++++++++++++
>  recipes-bsp/zaurusd/zaurusd_git.bb            |  3 +-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
>
> diff --git a/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> new file mode 100644
> index 0000000..5f9587a
> --- /dev/null
> +++ b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> @@ -0,0 +1,43 @@
> +From d15b20fd9e8927db5dc4303f2e6c11cfa8d6fe95 Mon Sep 17 00:00:00 2001
> +From: Andrea Adami <andrea.adami@gmail.com>
> +Date: Mon, 20 Apr 2020 16:21:22 +0200
> +Subject: [PATCH] tskeys.c: add support for 64bit time_t
> +
> +Upgrade the recipe to cope with the 64-bit time changes introduced in 4.16
> +
> +Fix:
> +
> +| tskeys.c: In function 'press_key':
> +| tskeys.c:141:4: error: 'struct input_event' has no member named 'time'
> +|   141 |  ev.time.tv_sec = time(0);
> +|       |    ^
> +| tskeys.c:142:4: error: 'struct input_event' has no member named 'time'
> +|   142 |  ev.time.tv_usec = 0;
> +|       |    ^
> +
> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> +---
> + apps/tskeys/tskeys.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/apps/tskeys/tskeys.c b/apps/tskeys/tskeys.c
> +index 264dfb7..36e3bfd 100644
> +--- a/apps/tskeys/tskeys.c
> ++++ b/apps/tskeys/tskeys.c
> +@@ -138,8 +138,13 @@ void press_key(int fd, int key, int pressed)
> +       struct input_event ev;
> +       int r;
> +
> ++#if !defined(__USE_TIME_BITS64)
> +       ev.time.tv_sec = time(0);
> +       ev.time.tv_usec = 0;
> ++#else
> ++      ev.input_event_sec = time(0);
> ++      ev.input_event_usec = 0;
> ++#endif

does this work with musl ?

> +       ev.type = EV_KEY;
> +       ev.code = key;
> +       ev.value = pressed;
> +--
> +2.17.1
> +
> diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
> index d69805b..1f8e40b 100644
> --- a/recipes-bsp/zaurusd/zaurusd_git.bb
> +++ b/recipes-bsp/zaurusd/zaurusd_git.bb
> @@ -24,7 +24,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
>             file://01-check-toggle-portait \
>             file://use-ts-symlink-instead-of-hardcoding.diff \
>             file://0001-zaurusd-add-support-for-collie.patch \
> -           file://allow-newer-tslib.patch"
> +           file://allow-newer-tslib.patch \
> +           file://add_64bit_time_t.patch"
>
>
>  S = "${WORKDIR}/git"
> --
> 2.17.1
>
> 
