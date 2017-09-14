Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7502C783D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 10:53:37 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id q29so3559196uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BuMPT64BJT2eVtAsJ2TxN8AM3UwQQphGzoj2ng3cF+w=;
	b=qpuS1ROczTE6w6IvYgnnST6HJMPNsaJbXyFaPLab6dkadS+669TwsbJtJwQz0edAEg
	E9KMXPVGxQPlKEtdkg2SSdosQ4ECFix7SXswoWgLTtPGzfjIxqYYUdowmAUyoIcpI9A8
	wXjkX9a/w7//6hd6R6r38+suSJ0L+dBFtwbe0hm2fAIBbwLE4g/jNO/n7YGuyHIzca9W
	G2kHFfSQzS/UVROtUN1TOgx4ABFqoSLbxE0kFsX3c2eAR5HCOeUxVkdbHSaLUZYZr4ji
	QVfdfuzHJUxr2wZAA1kl9h8YmRQooyBxbsmeWs2smlO+aElgapjXs0GGrsbZwFw7DB5W
	Unlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BuMPT64BJT2eVtAsJ2TxN8AM3UwQQphGzoj2ng3cF+w=;
	b=QCKatbXYbCemThchSYRQefP5LJDNsEe+XXmZJD74CR2aH7l1oZKWuDkxG8am1wbDCV
	s0GVfrL+tUoGfK3ZQ6FLPcBiGni2HsKJSylBz+SmMh/0hANfIGpVl2ferd33wyNU3KuI
	TiZZDH1ls7xSUCJbQ4cGD0SrfvX7w7MkJYvhk5Vu6JPVtsk8ai+9M1VMilI1W1SOSID4
	wgqnhwG5nVi0Akcktbm0Znppny0gRfxkLTbtgD8DxvpCytdxMdviA97oqhbsdiv6JGc0
	MYVhVeNBCmwvrQv22Hy7YH6EwivRDJ/E2Mg5c0HCNw8hP+1j2TVK86MLvhqb5p38nP12
	IVcg==
X-Gm-Message-State: AHPjjUgZN9DDtM9G5KsgjmeuOEYELNjvbaygKwwYc0mTIPdmB0lVGwmr
	LIUMGBvrNYSDzSnzCsIGJX/YxWNgKC3aQTY8kRCh/Q==
X-Google-Smtp-Source: ADKCNb6Xb0lyGSYVXXD57cwZFJL7YFA4R+1giSLLacsF7/0F2Re2IBwit8d4XmgdDZ93NV0gMu95cOpOavfhUjlzIAc=
X-Received: by 10.159.51.236 with SMTP id y44mr15991833uab.2.1505386418550;
	Thu, 14 Sep 2017 03:53:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Thu, 14 Sep 2017 03:53:38 -0700 (PDT)
In-Reply-To: <20170914081341.25163-1-brgl@bgdev.pl>
References: <20170914081341.25163-1-brgl@bgdev.pl>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2017 12:53:38 +0200
Message-ID: <CA+chaQc7n8tEJb2q2k1YQg2exQ5ho_GfJq89g3jvz4+sEc-xUg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] ceres-solver: add new recipe
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
X-List-Received-Date: Thu, 14 Sep 2017 10:53:37 -0000
Content-Type: text/plain; charset="UTF-8"

Why do you prefer useless empty package to be installed together with the
${PN}-dev?

RDEPENDS_${PN}-dev = ""

was IMHO better.

On Thu, Sep 14, 2017 at 10:13 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
>
> Ceres Solver is an open source C++ library for modeling and solving
> large, complicated optimization problems.
>
> It's often used in 3D computer vision applications.
>
> Signed-off-by: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
> ---
> v1 -> v2:
> - now fetching the source from git, not github archives
> - only add a specific directory (cmake files) to FILES_${PN}-dev
> - don't create the ${PN} package as the project is not building
>   a shared library
>
> v2 -> v3:
> - instead of not creating the ceres-solver package, just allow it to
>   be empty
>
>  .../ceres-solver/ceres-solver_1.13.bb                | 20
> ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ceres-solver/
> ceres-solver_1.13.bb
>
> diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
> b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
> new file mode 100644
> index 0000000..e883c70
> --- /dev/null
> +++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Ceres Solver is an open source C++ library for modeling
> and solving large, complicated optimization problems."
> +AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
> +HOMEPAGE = "http://ceres-solver.org/"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
> +
> +SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
> +SRCREV = "19333b0f55c8462381038e70d42af43b52941128"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libeigen glog"
> +
> +inherit cmake
> +
> +# Only a static library and headers are created
> +ALLOW_EMPTY_${PN} = "1"
> +
> +FILES_${PN}-dev += "${libdir}/cmake/*"
> --
> 2.7.4
>
>

