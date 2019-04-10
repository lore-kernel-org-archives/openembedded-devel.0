Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id D46C37D656
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 01:04:50 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id c1so231237qkk.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 18:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zml4QIu9TcZKIKXs7Auy/oN+J37lse8V3awGJctn+jk=;
	b=MIahiCj0WDIofT5KjCe2MmebSrDi4jQ2vciUjsE+v452Dj6KlTS52ZKEIkbGYSgMZE
	6xJhd0rAFD9kqNGJeqE+rUgNqFG0xUBwbbntEAwpGda9PGLm3MKoNisXYD2+hPrr5Pw/
	d1iR275nyFFSJblBDHuirU/4Swvq/PjBxbgID7u72n0dZyL2I21IccnNkxbKn3yHGLdT
	4Y0guvNjdZzLhhp1dPZOT98Z8CxEexQ+xOY17WtPpp3HTBLu3ZCYP8aW8oO5nh5MAs+U
	lhmEfkX0WXa3piu7OenZ80OZ8BFAwrPsOHAONPU+vjP48+8YaPZjRrnMPZi45WugSJYG
	opdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zml4QIu9TcZKIKXs7Auy/oN+J37lse8V3awGJctn+jk=;
	b=lpXm9bGStiDwUQnEebeBahL+G4EFrUSnvFeQqJFrtXbs+10HpgH7Xfi5+oZYpNGAb0
	0fJ/4PgmdLSwgXsiSK6yS1d8d4J6rpJ5CjB9oWhmNGESbSUaw4woV5enu+FDr4wX0/El
	TOh/X0uaZZyicsqqypJzlaxVlvl/qvCoUyy96WBMEuJphZEC6m+N2cJA/12RqNNTWgyD
	xJK/poiLEap82ifhADHlwvX6SvPW/i8l3g3ooV+y1d9cbds27/x9nZBm+0ixIN7iw1J9
	yKSMCpsyvZjIwQTjo5F/oaj0HYIjcpghLvwZjnXpV+sirgKV/haucf+CKnMZHgbxFu3X
	1RqQ==
X-Gm-Message-State: APjAAAX5oyy14NNH+NKrxvWbyEFshkmgLk6bbGKs2D0w0Dn3Klr/E9ze
	i1n6XohjCjFJwppMBzeujege8a3WmVZaNF27yIk=
X-Google-Smtp-Source: APXvYqzPFtKF12SsXyCQqwzkmE7uzVcWkiduBIyebFm5Qf0OQB9fuu0Fyh2rTnF3plW2FQbv1s02Qz/BALafSGW0rMQ=
X-Received: by 2002:a37:b587:: with SMTP id
	e129mr31285835qkf.145.1554858291570; 
	Tue, 09 Apr 2019 18:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190407143536.2030-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190407143536.2030-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Apr 2019 18:04:30 -0700
Message-ID: <CAMKF1so56MYY=2mUkX0HYGvrwH-44O2GpBmvPobEY9YYJ5-tSg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] chrony: update to 3.4
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
X-List-Received-Date: Wed, 10 Apr 2019 01:04:51 -0000
Content-Type: text/plain; charset="UTF-8"

Fails on musl with

| /mnt/a/yoe/build/tmp/work/riscv64-yoe-linux-musl/chrony/3.4-r0/recipe-sysroot-native/usr/bin/riscv64-yoe-linux-musl/../../libexec/riscv64-yoe-linux-musl/gcc/riscv64-yoe-linux-musl/9.0.1/ld:
hash_intmd5.o: in function `HSH_Hash':
| /usr/src/debug/chrony/3.4-r0/chrony-3.4/hash_intmd5.c:55: undefined
reference to `MIN'
| collect2: error: ld returned 1 exit status
| make: *** [Makefile:61: chronyd] Error 1
| ERROR: oe_runmake failed
| WARNING: /mnt/a/yoe/build/tmp/work/riscv64-yoe-linux-musl/chrony/3.4-r0/temp/run.do_compile.26723:1
exit 1 from 'exit 1'

On Sun, Apr 7, 2019 at 7:35 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-support/chrony/{chrony_3.3.bb => chrony_3.4.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/chrony/{chrony_3.3.bb => chrony_3.4.bb} (97%)
>
> diff --git a/meta-networking/recipes-support/chrony/chrony_3.3.bb b/meta-networking/recipes-support/chrony/chrony_3.4.bb
> similarity index 97%
> rename from meta-networking/recipes-support/chrony/chrony_3.3.bb
> rename to meta-networking/recipes-support/chrony/chrony_3.4.bb
> index 2586370fa..fb7135953 100644
> --- a/meta-networking/recipes-support/chrony/chrony_3.3.bb
> +++ b/meta-networking/recipes-support/chrony/chrony_3.4.bb
> @@ -35,8 +35,8 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
>      file://chronyd \
>      file://arm_eabi.patch \
>  "
> -SRC_URI[md5sum] = "81ab62cf5d60b4b3fa8cd2c1b267ffd9"
> -SRC_URI[sha256sum] = "0d1fb2d5875032f2d5a86f3770374c87ee4c941916f64171e81f7684f2a73128"
> +SRC_URI[md5sum] = "7170e750469c198fc6784047d6f71144"
> +SRC_URI[sha256sum] = "af77e47c2610a7e55c8af5b89a8aeff52d9a867dd5983d848b52d374bc0e6b9f"
>
>  DEPENDS = "pps-tools"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

