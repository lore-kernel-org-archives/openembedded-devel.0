Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 57A8D601D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:45:57 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id r18-v6so5805858ual.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z4gvfI4FcnpySoES9Nthl8wBB0mnxP/bbjRs8GO+n4g=;
	b=REBQpXnBY+Z7t/6JIIw28mjsLoFnGNLXGI9SdKzu18yVlPR8MbfbPVWk3lvm9XYztu
	1Prk17wl95Ke4Ofx3XrTsNwvdHnjQhNpczx8gPy8u1QuvwxIyTBTnwOyUaEKhk3ahuNd
	zc/HbEEx4ErVsybmBg2fPQqSwq2dbo1tazn9qO9+Mns4y20/FtW14h7KK3tr3QC1ooIA
	0P2QtrGqYGL+A3VS5donH3ZRKsZxpj7FanP3lzNWXHsibs/s27jiLR95SDRTGqlQwBd8
	cJE34A1MS8oJFnGrR6oxD5KF9z4dP4drXUS3GzD286HbGZuY3UI9qt3pCrZRz371Cta7
	Tjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z4gvfI4FcnpySoES9Nthl8wBB0mnxP/bbjRs8GO+n4g=;
	b=Kg4kdcu0rAIfFibLCJpRM5lfcB9ArHNkZZWUEkbMcSY5g9IxMi2Gh9Y8egxiJ4cWSc
	6tUA/3vAFkbPC8qw5o6ip3CKMNsR+z6Gq/rKYF+1r6tk35Yp0slsoPG1LwBDSmdt5KRD
	QouaeDimoxQMGtiizg0e2X9C/EHRUlGPHVedu7i7YPQaRCUzZSuc6nsRTA7iALHN3tF+
	RS2eYh2KObjO7+xIMTMseJiv30qES+KX2Ga9S5ntNykpi7KOubPoyvA1W/To6C001vq4
	XVyG8AbjnUNmVElCZN6UtudW31VHPytFv2/we6LZFWVqbxD9Wg8pTZTlPq2J7Bcg9FV9
	qLag==
X-Gm-Message-State: APt69E1r1QFK0L4aiF9xbjLfX7+hgAhi41J29KeBh9n8zDyY0BcN7rW4
	4aFlzC1JC82Z5ritE8GELJ8N3O5SuDFDYvRJo3I=
X-Google-Smtp-Source: AAOMgpeTDUTkRr+DhwOMMrqvPwReYqLCv/VOISbRkXDZzJ2a4DzYeWpNQ9nG9sGD6Qiizdr3cOPlwMEhL74llKP5oas=
X-Received: by 2002:a9f:3613:: with SMTP id
	r19-v6mr9547218uad.49.1530279958125; 
	Fri, 29 Jun 2018 06:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180629101758.28179-1-alexandru.vasiu@ni.com>
In-Reply-To: <20180629101758.28179-1-alexandru.vasiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2018 06:45:17 -0700
Message-ID: <CAMKF1sq6Q1p0fpzVzA0U3b-t6N3ieSDme6B5-ZaK0tLBazz8PQ@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to 0.0.6
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
X-List-Received-Date: Fri, 29 Jun 2018 13:45:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 29, 2018 at 3:26 AM Alexandru Vasiu <alexandru.vasiu@ni.com> wrote:
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta-python/recipes-devtools/python/python-pyiface.inc      | 6 +++---
>  .../{python-pyiface_0.0.5.bb => python-pyiface_0.0.6.bb}    | 0
>  .../{python3-pyiface_0.0.5.bb => python3-pyiface_0.0.6.bb}  | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pyiface_0.0.5.bb => python-pyiface_0.0.6.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.5.bb => python3-pyiface_0.0.6.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
> index 620b244c6..8e464a83f 100644
> --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> @@ -3,9 +3,9 @@ SECTION = "devel/python"
>  HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
>  LICENSE = "GPLv3+"
>
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
>
what changed here ?

> -SRC_URI[md5sum] = "06c3c71fe51df740dae6a88a13afb5e0"
> -SRC_URI[sha256sum] = "4bb79100cbcf7344a1ccaddc578cd6455da47d8eac6eb1bf903ec32e043af924"
> +SRC_URI[md5sum] = "2379d8d4506e6c4d83cf3d4824abce8b"
> +SRC_URI[sha256sum] = "774ea47bb1387e493f6d5d0937b68fa28202c948eccddbd6e4cf2d708dcd86f2"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb
> rename to meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

