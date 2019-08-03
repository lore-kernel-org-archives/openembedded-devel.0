Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 451877D65D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2019 10:11:43 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id k8so74492787edr.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2019 03:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q9/plLoPEJf0rhKL67tTQIEH3Dyxf4/8zfWAXVIfIZk=;
	b=okOO+md1d6/4qgHoRKVIzd7h00DyhUOihEfrU4SRL+nwnp7+N+OPkMss+xUrsNM0x5
	J7YYt3dYXqNvFIbaJLFAiFRDlG448MB+W+RYCfzETT4C8Qi+aTW93xXb/fvlD+xVq9YX
	tWU8h1Uc6X0elotGmZPug0Mhv9t4eQvSztV6h2lvdYPmMZQ9LpWqYX5TcyENWnMBzknX
	envvK++DmMDcc0Gqrflkqnv8r7Nyx1kxo58c+SmZMqzSPEir+yXHyanc9862b/14R1cg
	zmlWLR+KpPPeaic/qHqMdb9yEqG91YZVStwvW3tbeCFGfFxZughOqcNOj8rP+jxBjBCR
	54tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q9/plLoPEJf0rhKL67tTQIEH3Dyxf4/8zfWAXVIfIZk=;
	b=GxhHzGuDLr0A4pDna6KVGPH2PBIGzWwshERkdR8k0jQ9jtu6bCFuA1exQj7OBWpjeT
	B1zhvG5gIAuo/lpu5b6z5F6BTIWLAimGXRX2Mp17PMxerOeCJA1AbfDbjyev5PugbXyu
	leYofXU+5+H0tNz01pK4c0yfGJ08U7F9uHgD2cQKnDDHXSqzIUCNK30uksQQ3VoptoZ/
	4C2i2DbRNEcUzgN2dZtbL7e5Q0qnYzKcY4qWBTo8VCJzIoxpWTHde614M4mnPQqtVXVe
	vF5diqtqR+bHSZYHoRqnN4jwvMkZAZwBGksBiqgU2NNyqHptzwouuBUetSxfvLrUtiWg
	oFPg==
X-Gm-Message-State: APjAAAWLmAZbcWKFg71184CvejVB+htdHtGyCkVxz+4l2dmWz09+Vr7i
	49pGYS41P3GwHiY8s5TAqukngnyFfvzhk3yrFyA=
X-Google-Smtp-Source: APXvYqwq50FOT4KszV7yMIW76jtIGtZSJqNnXuPn+mYNOIzisxycHE+YDo2H5duy8qTv1UdMKH48Kp85rkSFDMEJ4kc=
X-Received: by 2002:a17:906:6a87:: with SMTP id
	p7mr37734289ejr.277.1564827103805; 
	Sat, 03 Aug 2019 03:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190803011037.41864-1-raj.khem@gmail.com>
In-Reply-To: <20190803011037.41864-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 3 Aug 2019 12:11:32 +0200
Message-ID: <CA+chaQfYoTzL3EBN9HP4=8ZY7ooR2jZDWzquS7uQond4Tg6dTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH 1/2] libsub-exporter-progressive-perl: Replace DEPENDS_PN with DEPENDS
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
X-List-Received-Date: Sat, 03 Aug 2019 10:11:43 -0000
Content-Type: text/plain; charset="UTF-8"

Shouldn't this one be rather RDEPENDS_${PN}?

It was building without this build time dependency before and it's not
-native, so I guess it was rather typo in runtime dependency?

On Sat, Aug 3, 2019 at 3:11 AM Khem Raj <raj.khem@gmail.com> wrote:

> Fixes
> libsub-exporter-progressive-perl_0.001013.bb: QA Issue: recipe uses
> DEPENDS_${PN}, should use DEPENDS [pkgvarcheck]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libsub/libsub-exporter-progressive-perl_0.001013.bb         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-perl/recipes-perl/libsub/
> libsub-exporter-progressive-perl_0.001013.bb
> b/meta-perl/recipes-perl/libsub/
> libsub-exporter-progressive-perl_0.001013.bb
> index 64d19c0f1f..e484f4a7a0 100644
> --- a/meta-perl/recipes-perl/libsub/
> libsub-exporter-progressive-perl_0.001013.bb
> +++ b/meta-perl/recipes-perl/libsub/
> libsub-exporter-progressive-perl_0.001013.bb
> @@ -13,7 +13,7 @@ HOMEPAGE = "
> https://metacpan.org/pod/Sub-Exporter-Progressive/"
>  LICENSE = "Artistic-1.0 | GPL-1.0+"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
>
> -DEPENDS_${PN} = " perl-module-test-more"
> +DEPENDS += " perl-module-test-more"
>
>  SRC_URI =
> "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
>  SRC_URI[md5sum] = "72cf6acdd2a0a8b105821a4db98e4ebe"
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

