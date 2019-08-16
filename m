Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 715887F323
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:19:46 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id j6so6882567ioa.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4mBd7qP5vgd51wDUY4pG+LdyJIQfRM98tOZXOR/4mjk=;
	b=kaVCRBF9uXHiOsuUdDPf11C7FeLdzEfee8L7AB9NPxwyUGbc37s8SoZUtMngLWeAWF
	g1sa8VKkGCNVMxE0gACv3QD3OUUfPKItcvTRM8crh/BpiDyG3DPk1A3GqV+szCslui7m
	qrrRezBrjrrtztmgxuuL0zjmi6CVlbwmChj1oeOscViHK/ti6RXFiEy5Ujn6NaeDLTsC
	/TItNMHOQO7/3R5WPqEPrtBX1da5yytdV0S/Y7hjqURgKB5k25lCqYvVbuNu51T4jJzA
	Mv2by2Xcr7zk1ZeuHrhj2Z60jh0Y5TiD3HuL3AqZX5ept6nQhDKyOYXZCAXJmm8LJVXG
	Z9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4mBd7qP5vgd51wDUY4pG+LdyJIQfRM98tOZXOR/4mjk=;
	b=sYyPSonhXoTflwWI4l9KhWqoWtZ2EK8nsnZdhNYlzSv2QV0whpP8UDNTHz4hPS1p2P
	ZfpJtHxVWKet/ip2W+IgN+C+muWHtleFY7BbmCIV6QunEwo4wIz+n3RoRZx6qwZuSA7O
	xX6qy+dp8gUoEBpwdu0YMUACmsr5/gYVFsnjMWKxobsrko936KcWKW+njW61ObIHXWcF
	3JZ5y/GSm1T+TO7n8IgVfLU7VgvYC39QFa3NAZLxAmNhMDtYyhH/PLjmL7XMiW3nJHqR
	24pssOaxrpmaVotIugPgv8PLcwOk8Fy44v0R1XFly1SnwA+h66cmaGYSYf6fXJydeu+q
	QYUA==
X-Gm-Message-State: APjAAAVRHW9r+TytNwfWaZr7wNc4g6aTwWMIMThecCHORFsFhUWLNuad
	o5ONBclY/o0NOcifEJsJ+0VMBWoquZ/IeFmxPKk=
X-Google-Smtp-Source: APXvYqx2Zp2E6hMPY7he/BcLvsoPholme/eBl/EO0hc7yL/ogoiUiiq0YLcj5KoFJR6Po5Q5VYXNzrwK0NW604blc94=
X-Received: by 2002:a6b:8f0d:: with SMTP id r13mr9179079iod.121.1565968787352; 
	Fri, 16 Aug 2019 08:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <1561479240-36337-1-git-send-email-hongxu.jia@windriver.com>
	<1561479240-36337-2-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1561479240-36337-2-git-send-email-hongxu.jia@windriver.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 16 Aug 2019 17:19:34 +0200
Message-ID: <CAB2nKc8Eiqwy4HoVH9AhkdBLp1fGjPSFndtWrm+wjTq1Ma5JaQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/4] mongodb: add to PNBLACKLIST
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
X-List-Received-Date: Fri, 16 Aug 2019 15:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

In order to get mongodb back, I'm trying to bump version from current
r4.0.6 to r4.2.0 which support python3.

How do you guys refresh current OE patches over new releases?
I'm thinking something like:
 - apply patches on git r4.0.6 commit
 - pull 4.2.0
 - cherry-pick patch commits
 - use format-patch to get refreshed patches
Is there any easier way?

Some python3 recipes will need to be integrated as well ...

Regards,
Vincent

Le mar. 25 juin 2019 =C3=A0 18:14, Hongxu Jia <hongxu.jia@windriver.com> a
=C3=A9crit :

> Since commit [44f303b scons: inherit python3native] applied in oe-core,
> but mongodb v4.0 requires python2 to build
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> index 0f90003..7634e5d 100644
> --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> @@ -75,3 +75,5 @@ scons_do_install() {
>          ${STAGING_BINDIR_NATIVE}/scons install ${EXTRA_OESCONS}|| \
>          die "scons install execution failed."
>  }
> +
> +PNBLACKLIST[mongodb] =3D "Since bbclass scons convert to python3, build
> mongodb failed"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

