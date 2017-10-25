Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3C62071B1D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 17:38:35 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id d28so497584pfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hS0PCPZ9kZoOnJ74bTfInJMeNe5RiqGmhqC/3wSKm4g=;
	b=aLaCWceRbZZfua33YfBravVGxIbX0aR4d/kLQbsHcPdMV/VoOEmQBHUmk9gfhlD7Od
	ir+TbBcYGJ8CidUfj5dj7foC6HPp1AE2I6rXegYazQtG0Wml93g/lnBy7cea3HaPTk40
	Hq3MVmLXKOK2kUjF4WQnvMXvtmAagNR0cKt0gF/qKltYSneBWFNSsjsTMs2HaIh6Kav4
	bv8Jloh4wPg+7VG6CQszaptO4j8Lcy62XoGjQWyWYKwaCrWkA2Xblg8xoGjhIVI+m2rc
	/a7cXoGrk5+v65+NTU5kmTV8XzaFAtGDFqAA/gaiZLO+kl1NsihEH2EHwwOncy4lqfYs
	+KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hS0PCPZ9kZoOnJ74bTfInJMeNe5RiqGmhqC/3wSKm4g=;
	b=aglffCVeHoYICX5qWYSyaMm1UdEMyO55ONB5ja2FkVyuyQQiFR9kgKDOxOIomIiTZs
	+hlLx9cRujTyy+iNdtX4j7uY1WYCQh7bq0swP97RlSqQ9vz71g2HHqgi97/rh28bEYCZ
	4Ej7EZaziqfa2cAckioRiYXCmaxKPC1kcwSzaTTJFsiO2oZIGaMfg+nWTlgsGNZjBFs5
	NhVB9O3ZNPlx/7E8+XhxrgaSAOEXamQX+QiiZL4zrMW+dGPtcwLqnJ7JuHO15/s2NDsa
	G6gXON0CPFjd9A6BfckCkSevIi8Ik5ML4qBzY5wtMfjzaYlxzcc116oRPejT94NfGmpo
	Ae5g==
X-Gm-Message-State: AMCzsaVaSjhfpT5kh0p3gEHSt7Xeh+a+XN9aX/6BRF0Ov1V5MOfpiUs7
	LAcssfGeVZNDQxdsMPYfby17WX1al1+6sLojI5c=
X-Google-Smtp-Source: ABhQp+RvSpP7atiCheoMC/2W5L6NYMkIhZ68aJQdMBo/Dek23MZj8fbvwxwtqBe/zh21yGdrU0lBkXHWlUTBmppzxEo=
X-Received: by 10.99.183.67 with SMTP id w3mr2641826pgt.329.1508953117414;
	Wed, 25 Oct 2017 10:38:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 25 Oct 2017 10:38:07 -0700 (PDT)
In-Reply-To: <1508945861-2293-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1508945861-2293-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Oct 2017 10:38:07 -0700
Message-ID: <CAMKF1spS0aVv4x4LZxz6xhaxjDu6Lut8U4+FNdMbOWxY9psjxw@mail.gmail.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] linpack_1.0.bb: Add linpack benchmark
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
X-List-Received-Date: Wed, 25 Oct 2017 17:38:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 25, 2017 at 8:37 AM, Manjukumar Matha
<manjukumar.harthikote-matha@xilinx.com> wrote:
> The LINPACK Benchmarks are a measure of a system's floating point
> computing power. Introduced by Jack Dongarra, they measure how fast a
> computer solves a dense n by n system of linear equations Ax = b, which
> is a common task in engineering.
>
> https://en.wikipedia.org/wiki/LINPACK_benchmarks
>

same comments as other patch here too

> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta-oe/recipes-benchmark/linpack/linpack_1.0.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
>
> diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> new file mode 100644
> index 0000000..83a4a80
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point computing power"
> +LICENSE = "PD"
> +LIC_FILES_CHKSUM ="file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> +
> +SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c"
> +SRC_URI[md5sum] = "1c5d0b6a31264685d2e651c920e3cdf4"
> +SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
> +
> +S = "${WORKDIR}"
> +
> +do_compile () {
> +       ${CC} ${CFLAGS} ${LDFLAGS} -O -o linpack linpacknew.c -lm
> +}
> +
> +do_install () {
> +       install -Dm 0755 linpack ${D}${bindir}/linpack
> +}
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

