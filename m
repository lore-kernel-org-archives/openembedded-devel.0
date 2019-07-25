Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3807E5F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 13:45:27 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id p197so34547752lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WFaWPD0NemZXy+IZcuG9JZF4U8UHnf4YnVfzH3NM8OU=;
	b=orKPAR0tvtfNq+wIwWa8tnk2rzeGDqp/pN/d4yWrTrg0mkjwqAFU5KUV0YvijIhaRd
	+XOFuE/HsyTWhEhq8B4DqINo/xjbTt6M3U9oS5Xdagql9ATDqm9CAkMcdnPfKXaTSp2x
	HAi4Uu2N3ailZvuUKfS+S+SPTafk06zgk0ZdbQkvnJcsg6fRscND//DhSxf6fy3fJ7hr
	jtx75iUOKFLdlEfddRC7AinAxqerkC5Oh7g820/w2o6GNLL90KulA3AU7JP+qIIVBvGb
	/7zjt6Uh4y37xJRRCj1OtMee4nxEvz7JieK0RuwZnCJyJK1sMLlctovVCacS3L0jSenM
	PJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WFaWPD0NemZXy+IZcuG9JZF4U8UHnf4YnVfzH3NM8OU=;
	b=XjQFVNtOrZkkz6puAM8d/DPQvePZDxLze+Wqqqz3RetHHMXFNiIsehCBFwA1QpZdRj
	KHoE7EKOMjgHmKeoXgCf3XCfNzV7cRoNuiUex/wo0/BT2ck3bSqLZJJa6lh0LYnf50FK
	9cCxTXc10bPT2L5BmQqnj8e6kRGkgH0Xjx5ZyuvQ0Xy5LCX/gD5fa52Z4uDJiydkKwqF
	sGGOPOtnPp7VN7JLsC4BzureSf3cWx/55okRx5tU/Uk4y+FefQAC/G1pFkUQphFlfAIS
	2m8cr8kwIdRV7P2AxFLjTGm2uzKX2qpUA9Ou+Ru/wWPVCFKFuNlaPxqjeWE0efQXH1Fw
	i0sg==
X-Gm-Message-State: APjAAAX0/U5tCKeKPWigtSSYc2PKuh0lHSqmidd/ha2Q5daFoxZBm02t
	1lVUUdAjtNiccWMQnSPJtZt54H0A4IfJe1MOe0U=
X-Google-Smtp-Source: APXvYqwfG4sbaBBaLmVHH20SgAxGoNXdxMz+f7ay+xZoVs+qFTGRswbzSdTbgn6ODsC/0XWh86wHoSCQLUnMuB99QWU=
X-Received: by 2002:a19:491d:: with SMTP id w29mr41760693lfa.149.1564062327614;
	Thu, 25 Jul 2019 06:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 09:45:16 -0400
Message-ID: <CADkTA4N3zMSfjBe=eOvvbrArfXEenwpYZcJGgwqt2Mhrr-1tGw@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libseccomp: import from meta-security
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
X-List-Received-Date: Thu, 25 Jul 2019 13:45:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 25, 2019 at 3:06 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>

Can you share some details as to why this should be pulled from
meta-security into a different repo ?

It seems to fit the mandate of meta-security quite nicely ;)

Is there some sort of dependency issue, or other technical problem
that is causing a problem ?

Bruce

>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  .../recipes-security/libseccomp/files/run-ptest    |  4 +++
>  .../libseccomp/libseccomp_2.4.1.bb                 | 41 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta-oe/recipes-security/libseccomp/files/run-ptest
>  create mode 100644 meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>
> diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptest b/meta-oe/recipes-security/libseccomp/files/run-ptest
> new file mode 100644
> index 0000000..54b4a63
> --- /dev/null
> +++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +cd tests
> +./regression -a
> diff --git a/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> new file mode 100644
> index 0000000..dba1be5
> --- /dev/null
> +++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "interface to seccomp filtering mechanism"
> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
> +SECTION = "security"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
> +
> +SRCREV = "fb43972ea1aab24f2a70193fb7445c2674f594e3"
> +
> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.4 \
> +           file://run-ptest \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig ptest
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python"
> +
> +do_compile_ptest() {
> +    oe_runmake -C tests check-build
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    install -d ${D}${PTEST_PATH}/tools
> +    for file in $(find tests/* -executable -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    for file in $(find tests/*.tests -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    for file in $(find tools/* -executable -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> +    done
> +}
> +
> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
> +
> +RDEPENDS_${PN}-ptest = "bash"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

