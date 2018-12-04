Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 868236D226
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 17:59:46 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id l11so19123451qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 09:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=stC3cMyGeu4zRF3QUDCIJ6AzpG54AXJRI5XTL2eXLbY=;
	b=EWLkxYK2ci0HCuo2KFrwsvq5gDNtk0iV0b8rz/WcO7RtbcSlXVfaIABSjj2rPv9GD7
	LlkGrlBEtl5LqMXNvHPMjfK8TKh5RAep/qYk9q1r5OyPAd4IMFWlvxxrdQwcTLnUmRDU
	v5tJ42G6PyGGLkVVN8i1nMXmmGlQsQiI/tf1tTRB2gSEWwNuN4Kt98oL285kPRg1z86q
	Hsh5SNq+86fOJ6kMxq+cwk32okYUcKozisOb3zoXCk5T6AMfjyzKLzK6lNAMzVMJpfEI
	F29LHrGsMa8pSNoE3fJBYxZNgezfTNZkGLbFV/k30X76SNrvjoeU3N/QT4BXlmY8F+Mb
	wJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=stC3cMyGeu4zRF3QUDCIJ6AzpG54AXJRI5XTL2eXLbY=;
	b=tysx2uCxvrCkMozMzjHM41tR/nj26BfBAEypQHe4iYcE0bjQiR4GeWkl05lixWu3kV
	+4lRD96G/kTEFqLO6Kl9z0yhK0zl2JY/wwUOccRISdXtQlanYaPBg3NtLlPBbKOpnjLU
	01OIH/Zo1kW66C9QLmsEhm5rYZWSDMnEAqadX9+VpZ9LxIxEM5+TOKZuwO78a4YRgyOF
	xcblMxbycjcS7SmDthyybspcCc3RtTe5a3UUvXO7pZUuGcdWW3XhHMxr2DDs4HQvOX2t
	EDtjGA8oCI++FiGrO7/UlMzn9ldQNE0CWvcAjGrb1r5HsNN8R5ph4vZ35UTvHXovAr0e
	2qRw==
X-Gm-Message-State: AA+aEWbpAhaTUO6BaHNUH895e+22qv6Dk20zoXL6/7wvEoaeCjBvenz/
	g/vUwqv/H4mAa73ol2IWr/7CEl3xBWxCVYi13wM=
X-Google-Smtp-Source: AFSGD/VzRwMMoj4RwBjXiXD33JxLj9Fd1l8myaZaiYlLHFmuIHsdB6FdC0C489WQ6SlXDW3mUUpM9F7gth3uDwBo/v8=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr20191550qvd.224.1543946387191;
	Tue, 04 Dec 2018 09:59:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543840903.git.psaavedra@igalia.com>
	<20587d4b524b590f8bb3c067cf680d82333e35ca.1543840903.git.psaavedra@igalia.com>
In-Reply-To: <20587d4b524b590f8bb3c067cf680d82333e35ca.1543840903.git.psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Dec 2018 09:59:21 -0800
Message-ID: <CAMKF1srUpaYgrowqGVOdjzm+Ryyf93VB1HKCMSNM5rBX80FJew@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH v4 1/7] pyzy: add pyzy recipe
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
X-List-Received-Date: Tue, 04 Dec 2018 17:59:46 -0000
Content-Type: text/plain; charset="UTF-8"

this fails too - http://errors.yoctoproject.org/Errors/Details/203335/
On Mon, Dec 3, 2018 at 4:46 AM Pablo Saavedra <psaavedra@igalia.com> wrote:
>
> The chinese pinyin and bopomofo conversion library
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  meta-oe/recipes-support/pyzy/pyzy_git.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pyzy/pyzy_git.bb
>
> diff --git a/meta-oe/recipes-support/pyzy/pyzy_git.bb b/meta-oe/recipes-support/pyzy/pyzy_git.bb
> new file mode 100644
> index 000000000..2a1df6187
> --- /dev/null
> +++ b/meta-oe/recipes-support/pyzy/pyzy_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "The Chinese PinYin and Bopomofo conversion library"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
> +SECTION = "inputmethods"
> +
> +SRCREV = "6d9c3cdff364e0da75e1c26222240f26370ebf73"
> +SRC_URI = "git://github.com/pyzy/pyzy.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "glib-2.0 util-linux sqlite3"
> +
> +EXTRA_OECONF += " \
> +    --disable-opencc \
> +    --disable-db-open-phrase \
> +    --disable-db-android \
> +"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

