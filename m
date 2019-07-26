Return-Path: <windel.bouwman@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 968247F13D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 07:49:49 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id z3so103006969iog.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Axkpw9b3ZPyb+ShkqllMyxVIo9lj3spMMYViQd7VoR4=;
	b=jWCpR7f1Tq255iRhnjs9ccym04x6+kxkzpSqIO6KFtT/EwfPZVEdZ+CijIsC/sR41A
	Jxvcu1Jcn3zaRKTtrJBUUv/CC0Kk0MxD5oywTfObsZjXk9t1Qz6YyOfL9V4vwfzJA3Fc
	UU6RNS++deqwdo2p67X6IJRWYDR14FGN/YR+QcMYroMX9b3dHJuPEhiKkxgFpQqs/kfG
	h2boQksAM7nS8XG+L9O3a3Qaslg4p53dQ8nyI2L7mMW+IZPrih+kzsrCLEursAVd6lhs
	YwsPgJwDOn+i0INGP0wDhbF3F6n9mEVkVi+X3MOH6hE5T92/+74AzKtDYagBV89Bfh2+
	IcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Axkpw9b3ZPyb+ShkqllMyxVIo9lj3spMMYViQd7VoR4=;
	b=VQmPEYOkcqgyFJDiZHq2olD4yy5Q4K1RyFcWJO08kmfYnmMZJfQBqrNuq43kyLWPiw
	42YcCJswdmbeIEKnrhmNk2r9i8n56xm8T7ml6C8TV98Qdxy1hH5dA1XWOoX5qJUiR0E9
	VSQ78oa5gcAv95uxwg8hTk/qTmZF8odg7VW4qicIYOrks3xV9MFG29cNa12gWaoPSTWJ
	knkv6Py2r1maan6RmvcZuQrjFNKWtsrrY78cU8f8QMCJec2ZUaBd6ItSndlGfaSiYk1k
	5kUnbJPfxxCFfvZTH7VjDBHb0hQWY30Q5aVkSpjHue410XptY/eL/uy6XF1UqUNruG6k
	ibzw==
X-Gm-Message-State: APjAAAUYb+25iD7YNfRObGQbGtsninp3P5Qcglnp3xmCi8W5Sj324SNP
	2JCiCrLARJ8pPVZgF1hcifbin9bVHkAUr04vNwgCjQ==
X-Google-Smtp-Source: APXvYqz/mtQb7q14RyarOd56+YLtyqAT0EX4V2by/1XVPhS/apn63db/q8taakswgFme0/+JeyQEw3s7p5sP9oslrxA=
X-Received: by 2002:a5e:c24b:: with SMTP id w11mr76549403iop.111.1564127390231;
	Fri, 26 Jul 2019 00:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190712065617.30992-1-windel.bouwman@gmail.com>
In-Reply-To: <20190712065617.30992-1-windel.bouwman@gmail.com>
From: Windel Bouwman <windel.bouwman@gmail.com>
Date: Fri, 26 Jul 2019 09:49:39 +0200
Message-ID: <CAHMaQtBtf_BGSwzjDY9r8AX+=OoaqqJYd3zoznX_7kzgCsh0-w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python] Add coloredlogs python package.
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
X-List-Received-Date: Fri, 26 Jul 2019 07:49:49 -0000
Content-Type: text/plain; charset="UTF-8"

Are there any issues with this recipe? Can this recipe be included in the
meta-python layer?

On Fri, Jul 12, 2019 at 8:56 AM Windel Bouwman <windel.bouwman@gmail.com>
wrote:

> Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
> ---
>  .../python/python-coloredlogs.inc             | 24 +++++++++++++++++++
>  .../python/python-coloredlogs_10.0.bb         |  2 ++
>  .../python/python3-coloredlogs_10.0.bb        |  2 ++
>  3 files changed, 28 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python-coloredlogs.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python-coloredlogs_10.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-coloredlogs_10.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-coloredlogs.inc
> b/meta-python/recipes-devtools/python/python-coloredlogs.inc
> new file mode 100644
> index 000000000..4a35806db
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-coloredlogs.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Colored terminal output for Python's logging module"
> +HOMEPAGE = "https://coloredlogs.readthedocs.io"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
> +
> +SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
> +SRC_URI[sha256sum] =
> "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
> +
> +inherit pypi
> +
> +do_compile_prepend() {
> +    sed -ie "s/find_pth_directory(),/'',/g" setup.py
> +}
> +
> +do_install_append() {
> +    rm -rf ${D}${prefix}/share
> +}
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-humanfriendly \
> +"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/
> python-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/
> python-coloredlogs_10.0.bb
> new file mode 100644
> index 000000000..0fc1b258c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-coloredlogs.inc
> diff --git a/meta-python/recipes-devtools/python/
> python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/
> python3-coloredlogs_10.0.bb
> new file mode 100644
> index 000000000..387239966
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-coloredlogs.inc
> --
> 2.17.1
>
>

