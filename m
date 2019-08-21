Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB317E542
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 14:19:54 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id y26so3227319qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 07:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bOVWOKiyIZ9ofpy23Hp0Zm9WZyqe2ZfsoqMf7xCiTlU=;
	b=cSZStrinpK3jjl03hu+XKs/4jgnWi9CXrOC9vW0vPxxc3uZ1XrWCKvzoYEzmkFGb0P
	43XqQrBXll3wAlhNXRBPU2ICKGuwDvDcaHth7d5/cqDpVa6Fu2M7YSiLHhs5c2Xg4SSB
	nOZDWYzb8chba454Uks+qbvUGY3hXDBYjgZ+BAWrKKh9ceQMBDB7li7N2h14ow5hAFQJ
	fJh/uaqFlRzBVq5LpaCdOcNnzpEKzu/uhce8aGS9tH+t8U+ba2C3ZUq2SnKN/oBntFxj
	0jeA8fQ/I1eJ91NcHJ/wk8n4VC0Y6Vk9XdJBZwTMEH3+L53eqni2o7euiRpY+fZCrU+k
	p/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bOVWOKiyIZ9ofpy23Hp0Zm9WZyqe2ZfsoqMf7xCiTlU=;
	b=iMXZ+gX5JxSHCdb+o1+xKmq5qqDLeLk2Rzhyp+mh0uj+4gpsqyUeXGcq6W6k+hVWmM
	XTOiPD3EIQPvfDMngqJojDsmn3/bnv5JRSC1bHv4J674r1LMyjq8vyPmK45/LE+s00Zv
	dkXlKxRL+Ybswa8X6zoeYK3Vnqjzb5iMaDnlf+DxET6oZZhYoXsZrf6V5a8dzF1gDYsn
	9aN9CwZSpaA+ec6lNV1uXhXu/JVYccxwmbFcm7yNeHLO1Ufo26d8zGnuCr3PR9X88Dkb
	EA0FxkHedKP/ic2i88J6otNxK8h2179u1Dws6Vz9MEaPhTOnitQxW4ulBIhsb4lcqars
	xi3w==
X-Gm-Message-State: APjAAAUskCM3c5p5eIeO93VmLCLnuQhPNhFIkgpSdspi1qEBkPZh5dB3
	tsXN4v7PHSDvbXaA+L3KEwONd7raEgs+C8homnw=
X-Google-Smtp-Source: APXvYqxT8u1lkiq/QYjLOWWZ4ajCHsFc6ebUWIlGv96zOhwUmO4kXlUVLHfQOY2vepq6ZG1QUETLcqjo2iA7Ul9DSvY=
X-Received: by 2002:ac8:6997:: with SMTP id o23mr31507475qtq.53.1566397194700; 
	Wed, 21 Aug 2019 07:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190821041655.29741-1-anuj.mittal@intel.com>
In-Reply-To: <20190821041655.29741-1-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Aug 2019 07:19:44 -0700
Message-ID: <CAMKF1soxLZTRZ42HiMGkTpoN827YN+UTs3THpr8EX+_Kw8jgJg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ade: add recipe
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
X-List-Received-Date: Wed, 21 Aug 2019 14:19:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2019 at 9:24 PM Anuj Mittal <anuj.mittal@intel.com> wrote:

> ADE Framework is a graph construction, manipulation, and processing
> framework.  ADE Framework is suitable for organizing data flow
> processing and execution.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta-oe/recipes-support/opencv/ade_0.1.1f.bb | 21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/ade_0.1.1f.bb
>
> diff --git a/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
> b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
> new file mode 100644
> index 000000000..51e274d3f
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "A graph construction, manipulation, and processing framewor=
k"
> +DESCRIPTION =3D "ADE Framework is a graph construction, manipulation, \
> +and processing framework. ADE Framework is suitable for \
> +organizing data flow processing and execution."
> +HOMEPAGE =3D "https://github.com/opencv/ade"
> +
> +SRC_URI =3D "git://github.com/opencv/ade.git;protocol=3Dgit \


Drop protocol=3Dgit it=E2=80=99s default

>
> +           "
> +
> +SRCREV =3D "58b2595a1a95cc807be8bf6222f266a9a1f393a9"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +
> +inherit cmake
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE +=3D " -DCMAKE_BUILD_TYPE=3DRelease"
> +
> +FILES_${PN}-dev +=3D "${datadir}/ade/*.cmake"
>

Use BPN instead of hard coding recipe name

--=20
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

