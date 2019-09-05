Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id 687457F2D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 14:04:24 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id b136so5156414iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2019 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=6N2Ed+iycZtUjc00CHDac4oUuE7AWPNQO/b6SZ3pdpg=;
	b=t2qGcflHTPltTy2k42mim5WXjSZM/Il9n0NQVlg8tbwzPMf1R4YFWmbmbr1jNGCSUg
	1ZatDb4B3bZo3w8AlOHYHuehmh1CeWt23dkF7Lvc04iDdWFIUbbBCEXT3Jo0oWu5YqDg
	+21k8wR5mq1zi3zIECErHsgDCwR3vIuor3OZxwsHuAriADUeJj0AZ3ZYJfp7BicDk1Wo
	MN0iMunAbrZBaTxvNusdxCLEt1R5g1UCADC0C1v+0dCu+WRHLXuW1cFaNC0Psc3RYBEc
	qbbTb69U0/TrZo2vZAVQRc999zNolTP2NoYjUjQbC1/5uYJgTAxiWZUF7WiWRkpR0+uQ
	rB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=6N2Ed+iycZtUjc00CHDac4oUuE7AWPNQO/b6SZ3pdpg=;
	b=gfNAk9euQoK60hWdTCoeOnS+AMKwFy/6lRIbP5YBsETRrZd7rlBLG0UzfuL//11t5T
	aspWFPE+UOTkPe4W23xlnnhj0HXoGQHb1hm7tCO8fc6GhzlJB60jJfZPegREB1Pljkrx
	IOkhc+0ErReC2iPjwsGwDT6OkRvVcJTvaliUQQ0I5KCIJPzOyiQ2oa3KOs/J/fklOVBP
	dxFT+cUx6VE2dSorue89XXIylCTDhfR7gdRk/d1+u0cJm+6Jq1LTiXLiQ9cSB1rYyMWd
	TsexObSHo1WI7Yw1jlMIFA5L+d2OLIulsGGFkLOjlZ4cUI7nJu34G7J2VvIToSd+Ae1H
	2vmg==
X-Gm-Message-State: APjAAAV5+aRsC/5zpeb+YOHbGCybd8Vo6sOxOdvj9rXFnMyZBiqr16ua
	Me6mvvW+adOlQmFhYBvOeCX4lGPf4OTVKS0D3cK4Pb4q
X-Google-Smtp-Source: APXvYqwDqVFlUrlBYqLh38qHiYc6cN3u4STzhZfPpI/DdKvodkJdG/HaZvWNG4Ehnj/wYsbVh238/ARMe5G37G9GoTU=
X-Received: by 2002:a5d:8913:: with SMTP id b19mr1136656ion.83.1567692264239; 
	Thu, 05 Sep 2019 07:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190826033016.15205-1-maxime.roussinbelanger@gmail.com>
In-Reply-To: <20190826033016.15205-1-maxime.roussinbelanger@gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Thu, 5 Sep 2019 10:03:58 -0400
Message-ID: <CAE=T-s6+VLHRXHT6xmL5yWHyeJ87ALstHtdJA_iucHA1pzg1Rg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][thud][PATCH v3] libedit: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 05 Sep 2019 14:04:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Sun, Aug 25, 2019 at 11:30 PM Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:

> To keep support of meta-clang support on thud branch.
> It depends on libedit native
>
> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail=
.com>
> ---
> Changes in v2:
>         - Add missing meta-oe in subject
> Changes in v3:
>         - Add missing signoff
>
> meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
> b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
> index 8cc0e959e0..60f4f5a22b 100644
> --- a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
> +++ b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
> @@ -19,3 +19,5 @@ SRC_URI[md5sum] =3D "97679319742f45d6cdcd6075511b14ac"
>  SRC_URI[sha256sum] =3D
> "c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116"
>
>  S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.20.1
>
>

