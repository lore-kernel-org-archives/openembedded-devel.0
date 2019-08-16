Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 655437F25B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 14:36:58 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s14so4936054qkm.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PY7hEfZLJABOPfny0qCLKQATkt5Xaqu+QZZDO4cNdac=;
	b=OyzigbfydRdzRiFBWn+3fYj4AsDnW/jksPENmDen6Ko4MidF59oM6P/gcqyjxo0e9g
	ATNHyPE71lfSaIIzD6BDMVJLO9N+RrVmt/Yms5P2oDD9DRsMuGXPlFh19SxNh4JcJLr0
	s8i8MlVkOPij+aK+YQ106bJeZ7xx6eqbKUUtc3SSNuD47nEH2YV6JDoCt7hbQZHsSkce
	E36VpG3oTNfmUqThgj3LHc0JrdLX3Bqa7mUf+gP7kH0prpkl5kFdqk4xnVnVcSTW3LyN
	EaqBNO2OSwTPUMNwWvaK4QALzq2buZNAo1XTADVKJewAm7X26GdhjtLIjka46YV4gijj
	P9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PY7hEfZLJABOPfny0qCLKQATkt5Xaqu+QZZDO4cNdac=;
	b=kurO1qfpsDpPVT+9Jqh2grYZj+rZD1SWbU7O7dY8vcc3dtASfNt3xEh44duIXYi0du
	AeaY/N7c3GBbbnArzjNoGfttLO3SWWBhBmStQsGcXXcxp60jPXyfBU+DjufH6IHlANeM
	mPNb9jwTl5ANypGs6RqnILGoWRyLOZxLqH4F2qzWNZZZLJIwTiZ9gigQiLFOZGbju9x3
	N0ofxdGvzo/JhrJTNoaOX91Ca5bhh63XHC6z57BbyUe8UnISWB5OlDERC9rOJ+DLfca4
	AXojojvIolbzs15TQFmZQpjrFuTLtReRPKjl4HTKTHo+A6sgbpFO6ektDM0/MkDphMZI
	DVmA==
X-Gm-Message-State: APjAAAWsEmqsJXYijWVxdOP9tjw1tir96uZE7FbDulscsxyDrg0DzG+q
	UjbfVtayWNDRksTUxjzytpA/XhVBD6Ue/nsscfs=
X-Google-Smtp-Source: APXvYqygO/KWkxW21x18zmxCp7pIUED3ORegbl5lKN2tc/+zPt0HS7S30+rSVETVQK7KX0AFU1A/wsGHXqXpmYYrvBk=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr9329067qke.212.1565966218808; 
	Fri, 16 Aug 2019 07:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 07:36:32 -0700
Message-ID: <CAMKF1so8LyF_JLc6kGku=VWPTMTss7q9ET=brj4vWfQyD+8MUg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/7] freeradius: add runtime dependency on perl
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
X-List-Received-Date: Fri, 16 Aug 2019 14:36:58 -0000
Content-Type: text/plain; charset="UTF-8"

Martin thanks for doing these patches, the builds have been showing
these erorrs for few
days now. I was also wondering if we should also take opportunity move
the dependent
files to their own packages in some cases. but this set looks fine

On Fri, Aug 16, 2019 at 3:40 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * fixes:
>   ERROR: QA Issue: /usr/bin/radcrypt contained in package freeradius-utils requires /usr/bin/perl, but no providers found in RDEPENDS_freeradius-utils? [file-rdeps]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-connectivity/freeradius/freeradius_3.0.17.bb        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
> index 5ab9a3fb44..e0b04c1101 100644
> --- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
> +++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
> @@ -224,4 +224,4 @@ FILES_${PN}-unixodbc = "${libdir}/rlm_sql_unixodbc.so*"
>  FILES_${PN} =+ "${libdir}/rlm_*.so* ${libdir}/proto_*so*"
>
>  RDEPENDS_${PN} += "perl"
> -RDEPENDS_${PN}-utils = "${PN}"
> +RDEPENDS_${PN}-utils = "${PN} perl"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

