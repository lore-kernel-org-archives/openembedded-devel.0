Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 43A7574B7E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 May 2018 19:35:24 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g20-v6so9399465pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2018 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1loPFmq0OCwFybRXt6//GeswZuKlzAaIEcOm0PDqHmg=;
	b=WtTYtepG6mNUjCf4vdebf7thFUU9HubG6HfylKBPYvpNO+qoB8Sq4z6ZQas1NsNfO6
	mrcMTOxUTnAM2WYMl8KYMj1KH0QWzX6CMTHKcrdPJyv43+g69p8G7fLiJ0GhS7UKYUmJ
	5pLYjExqv9i6Ud+T56Zk1n81hqWfQeSdQwL66ZAnpVDc0UP/jR/IUSw5U4etwNw9b+bJ
	SH1i/yyYf0oD87kzzw3dd6t2CRywz5z5LA9229ApmMCnbsxX8txN45fnu/cg9UYCkGdB
	qhfx6NVO128b9l0/4XNFhEoET53/QQEVtwu60bUWhzHYWsk1cwW/jhgxVqbGrvUcb3/A
	YxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1loPFmq0OCwFybRXt6//GeswZuKlzAaIEcOm0PDqHmg=;
	b=oLJIuo3+PzFxEoQInJQBZldfjRgElhnBVSH2mRlKvyc4l8ESuiqKoSzkVkLXExHYA3
	MoT08+NZz8CyPm3Ipigx2PpOGnrUJC+udp8tCHN2Xooyzj4ylimPQkRJU0UGHB2fGfMX
	drjonM43ZqistI/w13rSluJ8x0QWm8j+1Hcc7kvgVjiQ5II7CCPD2S65jgFcTNsEpCK3
	JwT0fkRLOOGiSxy/Oku99SddcpTLMyYugo0LsBniS7PT+Rl9mcpQpbf5HS0QISYNZA7c
	XGRKRQpDESYwlKeHq5QjLHxO6Zw1IwS1qMOUq6yRmIONgnNwMOVARjf8rpkKwVTDle91
	M29Q==
X-Gm-Message-State: ALQs6tATjJw6dPEfBoVGTV5a6faR4tx0xjjC3q4a88mvcUzB4JxVJPl5
	pnj7UfwwqkUwbpOrG7FxqzHnRsaxq7qDyPzeNkQ=
X-Google-Smtp-Source: AB8JxZrDJ1ZzVw9AAKb7OZ4e+KNL+5UYVzjaqODTq7k7xoyayfXs0Cc7OXbhl/jHwAK5yGvK2rpVT4JEEk28HdMn7NI=
X-Received: by 2002:a17:902:10c:: with SMTP id
	12-v6mr29225339plb.252.1525462525202; 
	Fri, 04 May 2018 12:35:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.159.145 with HTTP; Fri, 4 May 2018 12:34:54 -0700 (PDT)
In-Reply-To: <20180504183725.22134-1-mac@mcrowe.com>
References: <20180503094308.7549-1-mac@mcrowe.com>
	<20180504183725.22134-1-mac@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2018 12:34:54 -0700
Message-ID: <CAMKF1srY-2rLP=QX6iZUCC1Lb8a6aOrOk-WDXn8273Kis4_uYQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCHv2] jdepend: Retrieve source from Git rather than tarball
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
X-List-Received-Date: Fri, 04 May 2018 19:35:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 4, 2018 at 11:37 AM, Mike Crowe <mac@mcrowe.com> wrote:
> When Bitbake downloads jdepend-2.9.1.zip itself and I download
> https://github.com/clarkware/jdepend/blob/master/dist/jdepend-2.9.1.zip ,
> the calculated hashes don't match the ones included in the recipe.
>
> The hashes were last changed in commit
> dd5c43fca8289b8795a9214aee616775e1493109 on 1st March, but GitHub claims
> that the file being downloaded was published on 20th January, so I can't
> explain why they are wrong.
>
> It seems that we can't really rely on these tarballs to remain unchanged,
> so let's download the Git hash that corresponds to v2.9.1 instead. This
> should always remain valid.
>

LGTM.

> Cc: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  recipes-core/jdepend/jdepend_2.9.1.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> I'll let whoever wants to merge this decide whether to take v1 with
> the updated hashes or v2 using the Git repository.
>
> diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend=
/jdepend_2.9.1.bb
> index 5f09a8b..dfbf493 100644
> --- a/recipes-core/jdepend/jdepend_2.9.1.bb
> +++ b/recipes-core/jdepend/jdepend_2.9.1.bb
> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df5777d32a7709d=
558c2877d4a6616230"
>
>  HOMEPAGE =3D "https://github.com/clarkware/jdepend"
>
> -SRC_URI =3D "https://github.com/clarkware/jdepend/archive/${PV}.zip;down=
loadfilename=3D${BP}.zip"
> +SRC_URI =3D "git://github.com/clarkware/jdepend"
> +SRCREV =3D "57980590313a5dbde236a3eb2c8958e9e53e6a10"
> +S =3D "${WORKDIR}/git"
>
>  inherit java-library
>
> @@ -18,7 +20,4 @@ do_compile() {
>    fastjar cf ${JARFILENAME} -C build .
>  }
>
> -SRC_URI[md5sum] =3D "9b91efe1d770e023893f89f4dde8434e"
> -SRC_URI[sha256sum] =3D "536b5082d64e4f4dddd514ce30178f36c7a31b34d969275f=
278f72e522e7f7c9"
> -
>  BBCLASSEXTEND =3D "native"
> --
> 2.11.0
>
>

