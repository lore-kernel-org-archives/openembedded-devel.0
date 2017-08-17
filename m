Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13A5F71BF9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 18:48:25 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y192so11159519pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PojVVKKi/XGkNcrUkVNYi07GWA9b+vZGoI70k+SOX2Y=;
	b=pQiMP2E0RH0buA/u4lDRYJ82/MRh1VOym8Z1aVbI3EmWqEOU9IVkgHCPFzhq3w4o7O
	GpGDGUXq1rCbbzQ0gAoO7Gp6KmoN/Yh9Nr3tmKSE37ngcB024V65Fiz8l0m/0SbxmeqR
	1tWOJvdyEZILWS3oYKtEkcJYA0XcSxwoY7qG7cR0NNfJReJvT0MSwAjL2wN7VQ3qIL6c
	SUdV3NoN5pNHsUKZhN7LRdqD22tqxJMCQNxMDEVrKbhn2FarWG46t5bFM2lOtgBv3dkA
	HADKeu7hK+S89WsKofLKa71l8Uvtbj9c9tcusO+RUI5C1W45BSCp3Ne5TxBqYH+O90WG
	8i0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PojVVKKi/XGkNcrUkVNYi07GWA9b+vZGoI70k+SOX2Y=;
	b=jTbSSMqCtbA0ofumXfXXINuXsTZAslki7H9lCEGyqFCIhNPIU3W8I6FbsFCcQA2F2T
	h3pDZBvxvQMZ8H0hOAnaA2xI/MgYEKKDpmJbXzZ8boOjXk2ErSOE1v9XUUxU5/qRtF0j
	2yI0D7zeB2amBb984Q/ZALWeSbjC+qMhlshM5trk0FCjiMXlnZLsUn1VT10YTSQaUEkL
	frUjYlff7yWet9TlU2pKG+pbH0A89tqKFamPz4gladLdSN5F+SUHAb0Mnerqt0r7/0qy
	aDO7umxX+ScSH/hsNr4oWsTWr5PD5GiMuIGB/s0ABr7D4l8KjaCdv8uY8fCOUZG5bEbU
	Bnog==
X-Gm-Message-State: AHYfb5gNeeZca3DzpEbFr60p0ecg38HF+pdc9Iwfnsk/LtZeA+FDmpRz
	7xpR3VUyH9yl5+ePvoeWs1RJky8nPQ==
X-Received: by 10.84.216.75 with SMTP id f11mr5149228plj.444.1502995707331;
	Thu, 17 Aug 2017 11:48:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Thu, 17 Aug 2017 11:47:56 -0700 (PDT)
In-Reply-To: <20170817184445.10108-4-Martin.Jansa@gmail.com>
References: <20170817184445.10108-1-Martin.Jansa@gmail.com>
	<20170817184445.10108-4-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2017 11:47:56 -0700
Message-ID: <CAMKF1sq4dfkVGynh3wZ3aGhQpD9ca1OnM_tVTi+7+q5bhd0Fsg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/4] qtbase: use openssl10
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
X-List-Received-Date: Thu, 17 Aug 2017 18:48:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 17, 2017 at 11:44 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * fails to build with openssl-1.1
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 2115557..0afb232 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -123,7 +123,7 @@ PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
>  PACKAGECONFIG[gbm] = "-gbm,-no-gbm,virtual/mesa"
>  PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
>  PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
> -PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl,libssl"
> +PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl10,libssl"

seems good. Push whole series into master or master-next please

>  PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
>  PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
>  PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
> --
> 2.14.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

