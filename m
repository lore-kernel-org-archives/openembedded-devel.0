Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id DE0256130D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:58:26 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id f10so2791207ils.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j7CPWd4BjsBYPJJWRF6Aq7VCCJpIMKZEVvf/aw/XZ5s=;
	b=GWu97VQon4O7I52efS1Ugu/+QPeuRiptU13Q7WG1oi5JeX7JqweujAatOur0zhFxGd
	5qMLnH5kvlA55aERKtd+Da1NnHwIRe02+rgDz43mUB5AzHYA4ovE7xDVPDdZUJ+AwKKu
	YQ3mCQZ6aI4TUG6NxnZVUtsTKhxpawS4uF0TfKXh9lpRadlginzn24nOzRKHpgehfmmx
	DovibyJJ/BxLhorUAOZ2L157MRNSbEI0MGoEi97Ia/599oEF+lfmCQ6rCDGWJ4cAqg2I
	zZyawXGfXQNjdSDN1BsThOm1cAJqXI/gvgy9cmbPe2rGaaD0TO5JvMN8PH+aessyVYZ8
	nQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j7CPWd4BjsBYPJJWRF6Aq7VCCJpIMKZEVvf/aw/XZ5s=;
	b=HeRGUai3rrhJl7ZA5xrlwrTMS4FNd0t4FzdbkMLWDasX+ibWS0WRU3jPWy5asSzaeC
	YCHKdd4qL6ipqSrf5S8GFz0tnSgkLbtrR7EAmNVn5z61nqCZchJGnjboKNkCDIrGvEx9
	Jx38fwTjwSgm/kFTvc2ItZptLJijcR5oOqpIECA4S7TI+wRawlCAx3nkC4Uc1zkCm3Bx
	YoeeOOFw0CHflG7rAIkTLohiYSpsIz/R0xg3SzjeuyLinU8TWLRm+hlOmGlQObgsmQT0
	ALw/J8NcuR4Tfp+lOoXEGC9QRcpns5CyErhTLWTTSZbkFVYs9Y9vedWI2vosq7cEFGIt
	HVZQ==
X-Gm-Message-State: APjAAAXXPb9lYiswMZtwvN1zrux5/MYzMlVbURnhrcKafKwnT3miZisT
	Lhy81OeFJ2N4q6wypcrPR/pItIfEuoa/BthKokc=
X-Google-Smtp-Source: APXvYqxysoej7vtkTVA6+ktFpFfSUH15rt/z7/wdsyQMQO+kRoS9lF5wZkZXSHU8TfrFi06/UpAlXjW2A90EU6Wl9G8=
X-Received: by 2002:a92:290a:: with SMTP id l10mr5850600ilg.151.1582732707905; 
	Wed, 26 Feb 2020 07:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20200225190739.4056-1-Martin.Jansa@gmail.com>
	<20200225190739.4056-2-Martin.Jansa@gmail.com>
In-Reply-To: <20200225190739.4056-2-Martin.Jansa@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 26 Feb 2020 07:58:16 -0800
Message-ID: <CANx9H-B22RK1=BYsOctFsnB1vPsoz3Wcyh=KN471fKDf24Zfhw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH 2/2] python-networkmanager: skip when meta-networking isn't included
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
X-List-Received-Date: Wed, 26 Feb 2020 15:58:27 -0000
Content-Type: text/plain; charset="UTF-8"

Merged. Thank you!

On Tue, Feb 25, 2020 at 11:07 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> * fixes
>   ERROR: Nothing RPROVIDES 'networkmanager' (but
> meta-python2/recipes-connectivity/python-networkmanager/
> python-networkmanager_2.1.bb RDEPENDS on or otherwise requires it)
>   in world builds without meta-networking
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../python-networkmanager/python-networkmanager_2.1.bb       | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-connectivity/python-networkmanager/
> python-networkmanager_2.1.bb b/recipes-connectivity/python-networkmanager/
> python-networkmanager_2.1.bb
> index 3aa41f1..53e2f9d 100644
> --- a/recipes-connectivity/python-networkmanager/
> python-networkmanager_2.1.bb
> +++ b/recipes-connectivity/python-networkmanager/
> python-networkmanager_2.1.bb
> @@ -11,3 +11,8 @@ PYPI_PACKAGE = "python-networkmanager"
>  inherit pypi setuptools
>
>  RDEPENDS_${PN} = "networkmanager python-dbus python-six"
> +
> +python() {
> +    if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
> +        raise bb.parse.SkipRecipe('Requires networking-layer to be
> present to provide networkmanager.')
> +}
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

