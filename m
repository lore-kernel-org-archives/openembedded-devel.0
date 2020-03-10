Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id 232D360984
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 05:50:53 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id p1so6927901ils.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2020 22:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OWq1h93IO8RB/FBMs39MIERyrl0crqMrwFYb1/OXGY4=;
	b=PDaqpe5AkCX9i8ymMQdWllxOge4r4Fj8HTTcP0BLHbh/uDsyUUFuIVroRz8KLeHF+a
	7wTPvjtjxF7/nPBzqRJjvVzTa9ACdmwRF+Scm4gprNcTS2/y769G6U0F9my7d2v3WXJg
	FVteCXdk1XKSjNwkqMMsPMOeLh12PNeaisK9SSQjwPqgpXcbP2msLKA5k4+cmkMvRoSP
	cVur2ImukMlcxLm0oonTAAOQ+8QD2ldKXTPZu/5C2sVr4gCmHMBQCjyc2IaOBjJ13Dgq
	ScG6bwg6QvSyxSApm+69CBXgFkbVvtiicceqb3yXK0MGeQ1FMDdn0QATEEaR466XZRly
	5/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OWq1h93IO8RB/FBMs39MIERyrl0crqMrwFYb1/OXGY4=;
	b=tTvzCCOhpA/vdD0h0iIr9giLbnAkNO4qe9UBDby26SU0+s1Xc1MXzfpi2A+E4+K8ho
	itdK7TQLzZ7DizPorYRYF0xzDFu14K3f7CMKh9/yK6tnC/NAaGyaPScOz6vnDEUEK71A
	iOXyYeKcYs57m1VDrNqIKgKui9LQR0/DcA/IwSMY+FkNd70zR0lfZb5eQTTiuL0TYZmp
	plT4pbOurFikX1XUpm1ZI/EqQY8zy8UUQ20D4qVS39CHaUcaKxJqekysGIklfdyLkDU6
	pE9x/1gRJ9Kx3z9ncMlxYLyZyMrP9P6EMboSKTOipzPKYZm//SNqGMM+/D6tOUMwlX8S
	uFoQ==
X-Gm-Message-State: ANhLgQ3Ro1R92vKQAYqFxnmHY7WSMjWCFARfy4chor73ULDIbbN2+5yI
	KE2wbB7XBehtdQj1XUMzhf1E8PYKC0x9f7C/jVU=
X-Google-Smtp-Source: ADFU+vudIe2PiyuPjmkuRv5V3UA0IYe14KZ4xoC6MCZQAcuyId4Q8ubFX7HSnjwtNhkFzm8TCacdi/u4BwS2cOzzDlM=
X-Received: by 2002:a92:5c81:: with SMTP id d1mr1616772ilg.122.1583819454916; 
	Mon, 09 Mar 2020 22:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200310024936.18941-1-scott.branden@broadcom.com>
In-Reply-To: <20200310024936.18941-1-scott.branden@broadcom.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 9 Mar 2020 22:50:44 -0700
Message-ID: <CANx9H-A_bpFV7c+u_-3p23a4kUmjiuQ+FUE5LqtKu2_rDW+BzQ@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Rajesh Ravi <rajesh.ravi@broadcom.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python3-pycryptodomex: add 3.9.4 recipe
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
X-List-Received-Date: Tue, 10 Mar 2020 05:50:54 -0000
Content-Type: text/plain; charset="UTF-8"

This probably should have an RCONFLICTS with python3-cryptodme (and maybe
even python3-crypto).

These three packages step all over each other with same functionality...

On Mon, Mar 9, 2020 at 7:50 PM Scott Branden via Openembedded-devel <
openembedded-devel@lists.openembedded.org> wrote:

> From: Rajesh Ravi <rajesh.ravi@broadcom.com>
>
> Add python3-pycryptodomex 3.9.4 recipe needed to build
> such components as optee 3.8.0.
>
> Signed-off-by: Rajesh Ravi <rajesh.ravi@broadcom.com>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../python/python3-pycryptodomex_3.9.4.bb     | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pycryptodomex_3.9.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pycryptodomex_3.9.4.bb b/meta-python/recipes-devtools/python/
> python3-pycryptodomex_3.9.4.bb
> new file mode 100644
> index 000000000..be6b10f3f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Cryptographic library for Python"
> +DESCRIPTION = "PyCryptodome is a self-contained Python package of
> low-level\
> + cryptographic primitives."
> +HOMEPAGE = "http://www.pycryptodome.org"
> +LICENSE = "PD & BSD-2-Clause"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
> +
> +SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
> +SRC_URI[sha256sum] =
> "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
> +
> +inherit pypi
> +inherit setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-math \
> +"
> +
> +RDEPENDS_${PN}-tests += " \
> +    ${PYTHON_PN}-unittest \
> +"
> +
> +PACKAGES =+ "${PN}-tests"
> +
> +FILES_${PN}-tests += " \
> +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
> +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

