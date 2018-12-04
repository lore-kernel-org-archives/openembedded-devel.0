Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id CCB266B96C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 22:59:51 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id w204so10746653qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 14:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=elgGnjMtcCt+3tWcK0apbmXXXdHbKklfVRhVaSRj7R0=;
	b=HiN2dtabS6tV4ApySPV52KT1km4gYPc4m6d/7YYKQormJjCqUTISNkgMFaq3syULBj
	jp/TsN5c80UMiDC70oE+xxdSzslTNq7B8hbL5Q6Y/SAl2gAPgVQb2WE5VZzrB4wJGGvf
	OUynCBM3lsZG7jJY3zvgxXKDCNgo6Z2GbEJnQntl52q24+qBF19Li8vu3lFoKeYZOhAO
	eSJRIKH9Aa5Rf0MDPqmyo8EPSbH6HNEIQz5/1GYXXrhnu3OumkH83x6RUs9745IA1Y0h
	gRAZIfOuZWiAtfS/6zfY3hTmAdwnRP37EQc1uB0t/xzQaRoyR8OglwPZxAqkEqdzlZtu
	5G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=elgGnjMtcCt+3tWcK0apbmXXXdHbKklfVRhVaSRj7R0=;
	b=foE+XRAE3FQlo7cGKSKPwXJMb7pLoTE2o90SvsM2A9SXSj6bxXSUn4kPGRWfU037uu
	UfSgzLsHIdqFnYP+KEPmlLkDP4E+oqNbnRWOmGID3prChx/31dM8ADdg8fnROYzbepcb
	IDA60Kun9I3DOHs4lkKyghJnAI2hL0FkCu7HedCJz5e6PGqptO3RTqxEz/SoAnuqRg5v
	ngdHYgxnH04Y/r/E7w7dWYqXVzHWAMJIxBn/G2whfdj2JNu59B2fnWHBCXLj4DirWJjt
	QnwahR9JoUi0zPwOVNWT6XMoXVYjsW+B1wgA/j6j6PXA3+AanXgfhamXa9mBdC5sL/2Q
	K2MA==
X-Gm-Message-State: AA+aEWaH/qRYFvR/IZcpSZ5aZsq/DQwSM5QYWEbA+tGo18aiskU8fAIA
	bPi7/J0nED3M1GuvefzDhepiXWyAgH/5PKYcYbOEZ5/6n68=
X-Google-Smtp-Source: AFSGD/UBf3SKH9J7tx3k4Sgxq17CkGpv6S4AIw4+UIZai0blIVdeiw24pDtBptBPRbWWHN+gUGDKMqqxVWrj5x3UsYQ=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr20078244qkf.223.1543964392388;
	Tue, 04 Dec 2018 14:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20181204141512.25927-1-eduardas.m@fods.com>
In-Reply-To: <20181204141512.25927-1-eduardas.m@fods.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Dec 2018 14:59:26 -0800
Message-ID: <CAMKF1sphTtnuYGNFsWAPoeitakGJNxkt+ZzHGd6J8wOgG+DBJA@mail.gmail.com>
To: eduardas.m@fods.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH] mksh: add version 56
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
X-List-Received-Date: Tue, 04 Dec 2018 22:59:52 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build with musl - http://errors.yoctoproject.org/Errors/Details/203419/
On Tue, Dec 4, 2018 at 6:16 AM Eduardas Meile <eduardas.m@fods.com> wrote:
>
> The MirBSD Korn Shell is a permissively licensed shell currently used
> by Android.
>
> Signed-off-by: Eduardas Meile <eduardas.m@fods.com>
> ---
>  meta-oe/recipes-shells/mksh/mksh_56.bb | 34 ++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-shells/mksh/mksh_56.bb
>
> diff --git a/meta-oe/recipes-shells/mksh/mksh_56.bb b/meta-oe/recipes-shells/mksh/mksh_56.bb
> new file mode 100644
> index 000000000..2ddcc6607
> --- /dev/null
> +++ b/meta-oe/recipes-shells/mksh/mksh_56.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "The MirBSD Korn Shell - an enhanced version of the public domain ksh"
> +HOMEPAGE = "http://www.mirbsd.org/mksh.htm"
> +SECTION = "base/shell"
> +
> +LICENSE = "MirOS & ISC"
> +LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=25;md5=7204fec4d12912f2a13fe8745bc356f9 \
> +                    file://strlcpy.c;beginline=1;endline=17;md5=d953f28f0c43ee29e238ec9bc15df2a0 \
> +                   "
> +
> +SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R56c.tgz"
> +
> +SRC_URI[md5sum] = "4799a9ac6d55871d79ba66713d928663"
> +SRC_URI[sha256sum] = "dd86ebc421215a7b44095dc13b056921ba81e61b9f6f4cdab08ca135d02afb77"
> +
> +inherit autotools update-alternatives
> +
> +S = "${WORKDIR}/${PN}"
> +
> +ALTERNATIVE_${PN} = "sh"
> +ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
> +ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
> +ALTERNATIVE_PRIORITY = "100"
> +
> +do_compile() {
> +    chmod +x ${S}/Build.sh
> +    ${S}/Build.sh
> +}
> +
> +do_install() {
> +    install -d ${D}${base_bindir}
> +    install -m 0755 ${S}/mksh ${D}${base_bindir}/mksh
> +}
> +
> +RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh', '', d)}"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

