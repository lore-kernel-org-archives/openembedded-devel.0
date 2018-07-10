Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3E68A6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 04:21:52 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id t14-v6so13133092uao.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 21:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/0R4OI89Ncr0uUR25vtpzJmfdfeOynctC+FrkyCPdko=;
	b=fV/1c2/sejaj5d7f5tMrp9NOc1dB7cRtO/1Db8SHqIcYQ3Yc9zmb0XdDfcTyTf1+CQ
	+CRrGeB+Gb743YuPT9Zdnu5IKa/chSALZ9LIBZqUWKZ73z+6KqyNTmR6IAmYGDqffctM
	CA39PmO08xrJbkP5YENf7pAjHUi+OH4dMN0JdlpMzSdHmflZKomFbRKhM+qsvc7GYkVu
	zcuwpn3S7tGeyFU4oWTiJhQA9gCxMyZS9XPSdQriTgLWblzqVrAbcN5sc5e/MaG9p0v5
	6oAzw7rXCLwurFAjLcKhUfHyZHron8fSlCvPmbZi7kKEk3YCeoze0Gkwz11hipnLuTLB
	zlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/0R4OI89Ncr0uUR25vtpzJmfdfeOynctC+FrkyCPdko=;
	b=r5j30xpwJX//9bR3sWDRAMhxHYBs8QK0jE4fsJnzmBEMFR01TW+LAgCW5PUvvkqyLc
	qfuDbx6XZLbJqkKblzyuV/ECZLYPLSzkZDsnP25gUONbGRsnxeV/bUl1X5YQndcCry84
	rSYHmysEGfOJwqD7RJ2kQspvFcGHpuoAHPanKUwIK9BvXzxVIDuiiTeUND6MR79oTGhB
	X0SxfR9zW5z2IHIgbPIJ5nEB42QJYYqqv/GuqhbNRtsiE4umcT0ODk155rKOeSwMjUJw
	Df6CIBTKGXPeK12HCPYwjfnx7jYz/7dsZoJ+qvEmiPMxaQiNoK3CB/86jcAnMKS12B2K
	bKGQ==
X-Gm-Message-State: APt69E0wYzdI9+UhYCWHeg8bvfu8T5Ubi0Y8ngRhH/ppXJk390bBAeTk
	ZP/cu7+fTQ+li8fyIQzCAU1+QMxEoHqGHviOHX4=
X-Google-Smtp-Source: AAOMgpdz4yhyGb/2VMM70dDWat5UlFaknHGDgJkT9XTHCwpYzC+Il003sUhLqWtLuhhucHj+Pnnq6uSsvAiYc48vbF4=
X-Received: by 2002:a9f:33d8:: with SMTP id
	y24-v6mr3548973uab.164.1531196512925; 
	Mon, 09 Jul 2018 21:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2018 21:21:27 -0700
Message-ID: <CAMKF1spqybMSrd2EfTNcsFxkNO0+b3ex0J_Gqy9YuxdtBdQVSA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] phoronix-test-suite: upgrade 7.8.0 -> 8.0.1
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
X-List-Received-Date: Tue, 10 Jul 2018 04:21:52 -0000
Content-Type: text/plain; charset="UTF-8"

A similar patch is already queued up in master-next
On Mon, Jul 9, 2018 at 8:20 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../{phoronix-test-suite_7.8.0.bb => phoronix-test-suite_8.0.1.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_7.8.0.bb => phoronix-test-suite_8.0.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
> similarity index 90%
> rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
> rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
> index 1f90a71..402779e 100644
> --- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
> +++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  SECTION = "console/tests"
>
>  SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
> -SRC_URI[md5sum] = "850843bd9252823e7e24bc0849773000"
> -SRC_URI[sha256sum] = "cd6c869841f28e4ac1e8a5e4cda05fafce9a523a6b4f0f3a47805efd30494d88"
> +SRC_URI[md5sum] = "3dc3a0e490e909f188379a9e05fd4780"
> +SRC_URI[sha256sum] = "6306549109c7254baf31edb385265b19557b5692217d2dfcf96f6fb17de8e842"
>
>  S = "${WORKDIR}/phoronix-test-suite"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

