Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 52FB27D690
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:13:14 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id h21so6282758ljk.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 13:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7N3aZhWUavqdVwVfLGbKCDepuwmYCcf/1oBhZz2b7nQ=;
	b=Das05gQbm6/3+yFINoVbhPwmVV6paIxlA92Ikw1jW703mRI2qyUYuaDMA8K5Kxm5ej
	8YdoH2ZTKiCDCZBeOnNiLuL4Xztt6FvnhUoj5PrndLrN//P3gu9Sy5fcUX/t+Jdf4NPa
	jqQLJyqVub+BJ50twTJWX4Y10wUVZRW6ce2PRj+uBWForjk8MUmt56tB9mmZuhgBw+9c
	DJ/3m97vh5sjmX3yHuNygbmpUpTm9T/IT9jfPqIXy9We/b6MraJZRzLzHsdQcYadLBCt
	LkByG0hHE/PICihM3ciaecffJ4YumWx1pYrng/6b7L+M56K67fk6QnZmSJNFLzKH/5bS
	+LXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7N3aZhWUavqdVwVfLGbKCDepuwmYCcf/1oBhZz2b7nQ=;
	b=tduHV2vRTQP7A7aPOCJdvVMJoX3NsgcQWQm7L6fcm0SUywS031Mq42mGLM2XtSbu5P
	gchm6rwbAKj9ZGvoaNaYBgI2LlR1JCTJdQ2z8yOvH7bDOM2LWRve5OvhZyGw+UV/EU5N
	L0FZ0bKlIWbgCymiRZijx5Jf3zIghrWr4VuzgQ/ipksRmEKSg+SAJwIWAy/9zEHgt+nT
	UF9nOe/icz/Zs7vQlK4Dki9MeeYJpypMMWdh19dKHuexHNCIqHHjNrDQb/WdyQK48Xos
	k3uN+Dr6BM1nz3C846yeZg1gmWnM2mj/Os+teY1SazZoe4qSF3QmZ8DgdotjT7xmxjUs
	I+Rg==
X-Gm-Message-State: APjAAAVlxOKh2Ankpa5UaCmOWPTXYafh55r30M2huWlFSrw4UifoVzCO
	ObCKA+oI8SfKszSuR1gYm5F1hgLqQYCqBWE1Ta8=
X-Google-Smtp-Source: APXvYqxNZZV9hoqpQsAUb3YkvdtcaH0ag5OiQdWKkCxF/0Fpu6LnSWtvE7mLixqV4lBGHQfkjDlOB5JfQRhQpnZ3XYk=
X-Received: by 2002:a2e:87d2:: with SMTP id v18mr8601323ljj.4.1554495194839;
	Fri, 05 Apr 2019 13:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190405173706.1707-1-alistair.francis@wdc.com>
	<20190405175032.GA1614@jama>
In-Reply-To: <20190405175032.GA1614@jama>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Apr 2019 13:11:46 -0700
Message-ID: <CAKmqyKNZoskVFU5r_aocEGUeSf7JPthBL=d8uwjPgJR=6YZPjA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3 2/6] libfann: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 20:13:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 5, 2019 at 10:50 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Fri, Apr 05, 2019 at 05:38:14PM +0000, Alistair Francis wrote:
> > Use the current master branch instead of the last release in 2013.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta-oe/recipes-support/libfann/libfann_git.bb | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/libfann/libfann_git.bb
> >
> > diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/recipes-support/libfann/libfann_git.bb
> > new file mode 100644
> > index 000000000..943bdc8c9
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libfann/libfann_git.bb
> > @@ -0,0 +1,15 @@
> > +SUMMARY = "Fast Artificial Neural Network (FANN) Library"
> > +DESCRIPTION = "Fast Artificial Neural Network (FANN) Library is a free open source neural network library, which implements multilayer artificial neural networks in C with support for both fully connected and sparsely connected networks."
> > +HOMEPAGE = "https://github.com/libfann/fann"
> > +SECTION = "libs/devel"
> > +
> > +LICENSE = "LGPLv2.1"
> > +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f14599a2f089f6ff8c97e2baa4e3d575"
> > +
> > +inherit cmake
> > +
>
> Also set some usable PV (instead of the default git).

Fixed in v4 of this patch.

Alistair

>
> > +SRCREV = "7ec1fc7e5bd734f1d3c89b095e630e83c86b9be1"
> > +SRC_URI = "git://github.com/libfann/fann.git;branch=master \
> > +          "
> > +
> > +S = "${WORKDIR}/git"
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

