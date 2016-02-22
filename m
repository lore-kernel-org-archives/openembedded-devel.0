Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD53771C7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 19:23:20 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id b67so119326987qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 11:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=E2nPxp0hrbpv5UGNwlNDCokY9HdtMdoMOLssRvB/cWg=;
	b=erT79/gkRzrXKPTDln3saVVJ3fRQt7JtcO0nSo0rtNMCRIPb98Ocq1uW6Fw9AGNpu9
	2xvqA6MwtLKLsCXVzT7PXaCfDqN9MOkrkAWGy9S08MjQYlr3o3vsE0Ce90Jxr3yuU4XK
	uC+hVdkE5VQ2kPF4yrzBDlFIA137aeHsaiI1HtekMvLKGZoJLu/+U4494dOwY9qRJSJ1
	uNJZBNL8ll3CIB3yQs6pJZh2BHuFPW3+G5qmlVfKQSO1H0E6+DYxx6uRITBZ8TGCf43Y
	JfKY2pLkhbiipX3+RApZ2T25ddQPGam6kdSq+d9irGCJWnRGg0RxyE6oMwQ6561Q2rx/
	FufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E2nPxp0hrbpv5UGNwlNDCokY9HdtMdoMOLssRvB/cWg=;
	b=lBVjbZhmjlSptLXvu/46ciIL3xB4N/FMJI/Yd1oW9djBAnYYf8f+wlWCEjEmn1LY2k
	xRdWvOwu7KuwnGj608CV9pUR+C5VL/RopTQ10rKWmS7qsRRFws/Av7Vcjpvd8ibbKqsR
	oOK4VD0T1iEgtzgahBwFcJri2kYPoe1s1og/iPkd3hh/n01qtD9CCvCciGlWKE4mbhtr
	NJxs5bnUAaRSbt3pEkzpsZVbrdLrypQH/TaD8ay3ld8VJc2kluuK2zIXIijrlBD5wueT
	3xq1FfZ6Mq3arYZ+ywoOL8jIYRxIn6VPclaRWYn0wT/OpR/+ze77GMCCRflYg9g8HUMO
	sSuw==
X-Gm-Message-State: AG10YOTnbQ4G6T+a0fui0TJyXC8uxj+BRbPujE37nW64e6y7J3i3t78CyenHhiE/ppNx/SAo0odM3+xS5uKtqQ==
X-Received: by 10.140.108.181 with SMTP id j50mr35884124qgf.104.1456169000377; 
	Mon, 22 Feb 2016 11:23:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 22 Feb 2016 11:22:51 -0800 (PST)
In-Reply-To: <1456148105-9644-2-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
	<1456148105-9644-2-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Feb 2016 11:22:51 -0800
Message-ID: <CAMKF1sqPpQPoyMvJTPNBXzmTMeWHOoaon_9vnQXZa6HniTDydA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-python][PATCH 02/11] python-flufl-enum: update to 4.1
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
X-List-Received-Date: Mon, 22 Feb 2016 19:23:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 22, 2016 at 5:34 AM, Derek Straka <derek@asterius.io> wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
> rename to meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
> index fe25fd7..ef10848 100644
> --- a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
> @@ -4,10 +4,10 @@ specific, concise semantics in an easy to read and write syntax. flufl.enum has
>  features needed to make enumerations useful, but without a lot of extra baggage to weigh them down. "
>
>  LICENSE = "LGPLv3"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1fa25baed15d3be23c902636379438e8"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=250adb4c74c359b7049abcd9d6b115e7"
>

you need to explain what changes with this

> -SRC_URI[md5sum] = "b3ad23761a78232bc78499ced7cb85d9"
> -SRC_URI[sha256sum] = "4af7e7cf2dcc7517251570c7ef9ad194e30ee4b6f860eba500c03954ae95f9d8"
> +SRC_URI[md5sum] = "461779384c07ed2b5f554a5d51a000c4"
> +SRC_URI[sha256sum] = "94da1413ba085473652f81565847913ea1543d1739972ecbd6afe57d7b1b68b4"
>
>  PYPI_PACKAGE = "flufl.enum"
>  inherit pypi setuptools
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

