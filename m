Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8340E780C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 04:15:06 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j3so444782pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 21:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=exdzC5bEhIAAY7tTtErRQdiese1Kc6zCZ2BQpf9w2Pc=;
	b=oU7aGPg2evohCb4+JWj5zc8z2bO2fkhHQQzXAeQeT5kJswJu+eL0Dq2GkfOMS0iusw
	daFaasuTbUwlgtAm5La6Wcw7w/62n2PWe2XdHxUpQIlKhu03XvwuZZ4k3M05Ze0R715R
	XUQRiogfUFG6RFcbVXwxlZd/WTHaQJlyw74kZZ3r196zEE55EpivCmoJ+/kbm1uoAFWF
	LZRhYJ/PcPokWy25x+ZZBpvKexavgEzdDBiX/7QjPMT2Rnpe61+cRLWIPf+4mwpjXlTb
	2l+A9R8uEZStfKsVKLmrfO0Ud4CulB0twEu7y3ykiiaOTagC0ZQ1IIDSYn2F2eB6W9T6
	MnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=exdzC5bEhIAAY7tTtErRQdiese1Kc6zCZ2BQpf9w2Pc=;
	b=liyjiQA4Cx+kzrnbiAUo8wyZjuOOCwbZDucbI9Atknf6Ns6H3Iy8e7HODye06NgOh8
	PAzV9h4PSWuxJqm5SPo7O6sHKFsaAD4Co/AANUEGQUf2eMQPiD05w3J0mZeCv5LhThY/
	stZKZieqMstdiU1lJljqLujoDc8WfjN2CytqK9jQ2aux7r2zScCtKJRSDTqPUweg5TLa
	dEcUBwvaYpZoTz32zym5JYVUt1ixnglbZ9QWodT6eUcY4kDpS0lseuO/pn/AKs0fiM4A
	F4bggMtqPQ2atwTKHtmbqGRpOqb3CbD2xXrvgReIGzU5WzHAlJsIPv7LoFbem+L0C4kA
	pYCQ==
X-Gm-Message-State: AMCzsaUVdO8gWTyE1/OD+u2bThsMmG3+OKTprcYDucHsHSLEyU9xJrnb
	TSPRj3Xl2kbhZW40YkbZ0n41Oh+EGwwFcg3MCws=
X-Google-Smtp-Source: AOwi7QDoAdTbd+yEnnKlmtE4cE3tak01c3jgISliEAgspl6GmT1l0GNJn6HvYdNOi+JS7ekOMWffTIb6w16RM70RSKo=
X-Received: by 10.99.124.75 with SMTP id l11mr9702887pgn.439.1508213707517;
	Mon, 16 Oct 2017 21:15:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 16 Oct 2017 21:14:37 -0700 (PDT)
In-Reply-To: <20171012125625.3061-1-limon.anibal@gmail.com>
References: <20171012125625.3061-1-limon.anibal@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Oct 2017 21:14:37 -0700
Message-ID: <CAMKF1spjJE4+ep_7L6_FDqQ6QxQS4esVp8Dm91ooJvAhO4wQww@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCHv2] meta-oe/recipes-test: Add stress-ng recipe
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
X-List-Received-Date: Tue, 17 Oct 2017 04:15:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 5:56 AM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail=
.com> wrote:
> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>
> A tool to generate load and stress a system, currently this recipe
> is on a couple of layers [1] and is not updated, a good reason to
> have in meta-oe.
>
> [1] https://layers.openembedded.org/layerindex/branch/master/recipes/?q=
=3Dstress-ng
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb | 18 +++++++++++++++=
+++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
>
> diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb b/meta-o=
e/recipes-test/stress-ng/stress-ng_0.08.17.bb
> new file mode 100644
> index 000000000..86f577006
> --- /dev/null
> +++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "A tool to load and stress a computer system"
> +HOMEPAGE =3D "http://kernel.ubuntu.com/~cking/stress-ng/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +DEPENDS =3D "zlib libaio"
> +
> +SRC_URI =3D "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.g=
z"
> +
> +SRC_URI[md5sum] =3D "e0f6497a8c06f5d652bc2ad88d449c12"
> +SRC_URI[sha256sum] =3D "37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc2=
231c1058b1a5dd18"
> +
> +CFLAGS +=3D "-Wall -Wextra -DVERSION=3D'"$(VERSION)"'"
> +
> +do_install_append() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
> +}

Fails to build with musl

| stress-malloc.c: In function 'stress_malloc':
| stress-malloc.c:104:9: warning: implicit declaration of function
'mallopt' [-Wimplicit-function-declaration]
|    (void)mallopt(M_MMAP_THRESHOLD, (int)malloc_threshold);
|          ^~~~~~~
| stress-malloc.c:104:17: error: 'M_MMAP_THRESHOLD' undeclared (first
use in this function)
|    (void)mallopt(M_MMAP_THRESHOLD, (int)malloc_threshold);
|                  ^~~~~~~~~~~~~~~~
| stress-malloc.c:104:17: note: each undeclared identifier is reported
only once for each function it appears in
| make: *** [Makefile:681: stress-malloc.o] Error 1
| make: *** Waiting for unfinished jobs....

