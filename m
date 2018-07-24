Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A4AF660197
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 15:37:27 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id m13-v6so4546680qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WnbvdhwFOhDkVxbuj5GoglFBj3sgbLf9FE7CpxP2nUA=;
	b=N05We8v4y0QALJ20KRb+/mk3ISm1QhEZsUMCFTYBZSAu6huEa++x8wcmIGRfU11VEh
	NrsXZkI+UKedkRPfYdKyb04fE1LoQJqMlHTWTDoRtcym/vxrI9TafBSSZdM7GyUIr9nB
	aJBIsIQwQBjT3UhvyVg7q74f675j5CfCaVQml65yXIxMdAlfv2z7opGJZVqV2FoB8eaX
	2zpgkXy1jragcfCTn4J8dkdrMSi24Zhmj1JY7/6meu4qjeno9/opkCCAxWR8/NbMmxMj
	nPedgKXvoIR+14HC5YTt8uVV5afuO8+sgmqL5P0JkKH/Wmd0SANf1/eqOYRUh6kf+8nd
	dQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WnbvdhwFOhDkVxbuj5GoglFBj3sgbLf9FE7CpxP2nUA=;
	b=ow1NVFrjYDfgT26l2PAU219892PQ5vBZVzX3D79p/2+52U4v1KsQNjUcdW8oUv9L//
	ZXKV+ToniN7/salGZTGv72wqDOWoRUZ7eN4GIx7dLyFbW7QyR2DNR7dNYQCTmIFQnAgp
	bpqaj3kO1+6s9wMr3ba7cqpxpRHX4oaHtB6NaGiMlPSmrfg9o0XayMH8EmLDnpFq4eH+
	zyTxd8MvZJuDmoqDYrqbrSxAK0wie/xUcmAoXGrp0MUpFte7RhpwV/RSMl+uHoAiZ7JF
	QD7GO4OEIYpWSdqyX3ME5Zlj4WN+CfCrJIx3gyJmhi+1D6OOrUjT4AaG/rxfQoO3wHt5
	Rjig==
X-Gm-Message-State: AOUpUlF24aNGxCy7LSQCwNCTnd3sHRbdMDyUpu0hbxT582JGAmEN7JhJ
	bf8L6+iCPIsfVSb1OjiJL6VQdG2H8n1yNsaY80Q=
X-Google-Smtp-Source: AAOMgpcYGkyZqi+AqzP1IP+yPdPo0I8hvDqUmbNelu0SPAFQkSsFfL8395a3lg6Bk387gjd+lOaLmK/X1v+KNRGH28k=
X-Received: by 2002:ac8:91d:: with SMTP id
	t29-v6mr16851664qth.188.1532446648265; 
	Tue, 24 Jul 2018 08:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180724054254.36340-1-mingli.yu@windriver.com>
In-Reply-To: <20180724054254.36340-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jul 2018 08:37:02 -0700
Message-ID: <CAMKF1sqkDnUAqc28ZkPtxNJM9U1_xPFTG9VFF=z_xjcb=YzA9Q@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iperf3: Upgrade to 3.6
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
X-List-Received-Date: Tue, 24 Jul 2018 15:37:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 23, 2018 at 10:43 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Licence-Update:
>   - Copyright years are updated to 2018
>   - Remove the part about src/tcp_window_size.{c,h}
>     as iperf3 uses get/setsockopt() with SO_SNDBUF
>     and SO_RCVBUF directly now
> * Update the path parameter for --with-openssl as
>   ${RECIPE_SYSROOT}/usr to fix the below do_configure
>   error
>   | checking for openssl/ssl.h in /poky-build/tmp/work/i586-poky-linux/iperf3/3.6-r0/recipe-sysroot... no
>   | checking whether compiling and linking against OpenSSL works... no
>   | configure: error: in `/poky-build/tmp/work/i586-poky-linux/iperf3/3.6-r0/build':
>   | configure: error: --with-openssl was given, but test for OpenSSL failed
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../iperf3/{iperf3_3.2.bb => iperf3_3.6.bb}                 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.2.bb => iperf3_3.6.bb} (83%)
>
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb
> similarity index 83%
> rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
> rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb
> index 2ed08110f..a575d465e 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb
> @@ -9,7 +9,7 @@ SECTION = "console/network"
>  BUGTRACKER = "https://github.com/esnet/iperf/issues"
>  AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d098223e44bdd19585315ee75cd9d2d7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a9a036136b748453e839c0eb8906ef2e"
>
>  DEPENDS = "openssl"
>
> @@ -18,7 +18,7 @@ SRC_URI = "git://github.com/esnet/iperf.git \
>             file://0002-Remove-pg-from-profile_CFLAGS.patch \
>             "
>
> -SRCREV = "88d907f7fb58bfab5d086c5da60c922e1c582c92"
> +SRCREV = "88f3ad87f38762081a6d7127890ff5c3a052b06a"
>
>  S = "${WORKDIR}/git"
>
> @@ -28,6 +28,6 @@ PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sc
>
>  CFLAGS += "-D_GNU_SOURCE"
>
> -EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}"
> +EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}/usr"
>

Hardcoding /usr may not be best here. Can you figure out a bitbake
variable to use here ?

>  BBCLASSEXTEND = "native"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

