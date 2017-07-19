Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 52110781F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:04:18 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id a12so2328341ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 09:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rzwvp+5ZLTk3yklVy7i7Eg1uu546Ja52vWh5T2KZFHo=;
	b=hSXHoQoE31DY8ek0VHfzLhF0dqKrHFfgjD/Z1S4ZLj2sWi5p5IpUbW0scd9J57DJlb
	/auSE0kj6Yb7JrbKqgegStdTPtLXkhTBkg0zJpOd5aTNTbV1w3I8afTQCH8f+3OZ9R5F
	4DOM3LdrFdKHHGLRU0X6fyh/6HK+tsn5W1LrXpEUhvWnWNso892RGD6y51lt+s4znau6
	9CaoGOzKfYnkmhexLqVq4NVFMgsbvXpVeNabI6YvX8YBwSA4lUhf1K+ONaE1GzjnDPaj
	5WAYCXZ9FFpaxvstO54x8f5rX5D7qIBMh2gJTqrOnA/8x3cIdBgyyrhxZhIeThaZXUc4
	XzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rzwvp+5ZLTk3yklVy7i7Eg1uu546Ja52vWh5T2KZFHo=;
	b=X7sgQjIsb22Pn0FCITplBz07ogvA8sE0LpX8TM13HJepd/Pqp6mwoYoj+wzG3sXAYj
	mhdfSzY6YgonlLzhVMMFI1iylAR59vqGwKpVYxQbacGXh+YwhagHsDR2ozOFnA7vMSbj
	1X1kZdG3cY5W2+Wg2UwCL1rJWPCCQbmkKvQ4v3zgzyrR56qfNtCeKI/evRzzoDRkvAyM
	MurqMYUyIOkmT6WDH/2Sbk1tQkejZAmv8jhNCpL9+ZvErywf/qQMmjhuxYSRuFuG2Vq6
	5fjIM+yjyNBaKXAB4A40SBBEpg0Aw1ydvjTIa3BeCi3vkLEO3J+InYqpmN8D3dtHRh9R
	2VYQ==
X-Gm-Message-State: AIVw1110Hzm2XpLI7FMQIxV+Gys/+hEDcWgmvueqYVebuTw44P7VAAiJ
	W6D/vScez3kpdFEVMDSA1i7zmBDO/w==
X-Received: by 10.13.207.67 with SMTP id r64mr587894ywd.244.1500480259410;
	Wed, 19 Jul 2017 09:04:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Wed, 19 Jul 2017 09:04:18 -0700 (PDT)
In-Reply-To: <20170719154132.20556-1-raj.khem@gmail.com>
References: <20170719154132.20556-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Jul 2017 18:04:18 +0200
Message-ID: <CA+chaQdm4oR+rtxOzh89Vod5_42kP7ZZ5mp-pKM7gXXMTx_-sQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/4] ippool: Fix build errors found with hardening flags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jul 2017 16:04:18 -0000
Content-Type: text/plain; charset="UTF-8"

I've dropped this from master-next to check if the build failures we were
discussing were caused by this. Did you change anything in here (is it v2
or just resend)?

On Wed, Jul 19, 2017 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...timer-Check-for-return-value-of-write-API.patch | 28
> ++++++++++++++++++++++
>  .../recipes-daemons/ippool/ippool_1.3.bb           | 22 ++++++++---------
>  2 files changed, 39 insertions(+), 11 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0001-
> usl_timer-Check-for-return-value-of-write-API.patch
>
> diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-
> usl_timer-Check-for-return-value-of-write-API.patch
> b/meta-networking/recipes-daemons/ippool/ippool/0001-
> usl_timer-Check-for-return-value-of-write-API.patch
> new file mode 100644
> index 000000000..6fb7cc5c4
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ippool/ippool/0001-
> usl_timer-Check-for-return-value-of-write-API.patch
> @@ -0,0 +1,28 @@
> +From 5d7f20c045b3c74dad2c53d65e30bd4840250082 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 27 Jun 2017 15:17:19 -0700
> +Subject: [PATCH] usl_timer: Check for return value of write() API
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + usl/usl_timer.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/usl/usl_timer.c b/usl/usl_timer.c
> +index fda752b..d8414a6 100644
> +--- a/usl/usl_timer.c
> ++++ b/usl/usl_timer.c
> +@@ -94,7 +94,9 @@ void usl_timer_tick(void)
> +
> +       if (!usl_tick_pending) {
> +               usl_tick_pending = 1;
> +-              write(usl_tick_pipe[1], &msg, sizeof(msg));
> ++              if (write(usl_tick_pipe[1], &msg, sizeof(msg)) !=
> sizeof(msg)) {
> ++                      fprintf(stderr, "write to fd %i failed: %s\n",
> usl_tick_pipe[1], strerror(errno));
> ++              }
> +       }
> + }
> +
> +--
> +2.13.2
> +
> diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
> b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
> index 969f434cc..e1c9215ca 100644
> --- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
> +++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
> @@ -11,16 +11,16 @@ HOMEPAGE = "http://www.openl2tp.org/"
>  SECTION = "console/network"
>  LICENSE = "GPLv2+"
>
> -SRC_URI = "\
> -        https://sourceforge.net/projects/openl2tp/files/${BPN}
> /${PV}/${BPN}-${PV}.tar.gz \
> -        file://ippool_usl_timer.patch \
> -        file://ippool_parallel_make_and_pic.patch \
> -        file://ippool_init.d.patch \
> -        file://always_syslog.patch \
> -        file://makefile-add-ldflags.patch \
> -        file://runtest.sh \
> -        file://ippool.service \
> -        "
> +SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}
> /${PV}/${BPN}-${PV}.tar.gz \
> +           file://runtest.sh \
> +           file://ippool.service \
> +           file://ippool_usl_timer.patch \
> +           file://ippool_parallel_make_and_pic.patch \
> +           file://ippool_init.d.patch \
> +           file://always_syslog.patch \
> +           file://makefile-add-ldflags.patch \
> +           file://0001-usl_timer-Check-for-return-value-of-write-API.patch
> \
> +           "
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
>  SRC_URI[md5sum] = "e2401e65db26a3764585b97212888fae"
> @@ -50,7 +50,7 @@ do_compile_prepend() {
>
>      # ignore the OPT_CFLAGS?= in Makefile,
>      # it should be in CFLAGS from env
> -    export OPT_CFLAGS=
> +    export OPT_CFLAGS="${SELECTED_OPTIMIZATION}"
>  }
>
>
> --
> 2.13.3
>
>

