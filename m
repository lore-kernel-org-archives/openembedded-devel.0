Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7805377E87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 00:13:04 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k67so28341022wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/DUqY00Ij9dl49sQzWFSVQi61yWM+qMpkF8H3jhrbkg=;
	b=lW8uv9r5jHoBP0AiSIE70m2Drt8+AU0Wy2d+yLIJgZYvqcXAZXWtqGM3ZMaYJQP6lZ
	8zFAh519K+rUMCigDJsr1KBHSVGyeprCcDfG4NvlB/twhnZekNc+SLVM6hBIokqEa767
	+cd3WEE4n7vd9XXusT4O7dwr88kep6djGrtVQs6VepqQyaQHn2CJk9Na2nEegij4wBsd
	k0KHk1RuRrRj+JT1oDa6MY4wqblGTGisPebPnT09mCbyYtq7DLXim/9H3cHMNhKD8L+j
	FSc+UrCs58FScO9DoxbWdUF2cRH3tZKTjj/hRRqZp3Ar/uMbCbjuSiaf7iuatm4Sclg5
	n4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/DUqY00Ij9dl49sQzWFSVQi61yWM+qMpkF8H3jhrbkg=;
	b=kvXO/9Jr6WjvYNKUu30NwBz3otSQzn1q5oi9bx7hLFTUPTv+eP8QNaFlK98vy52Ljw
	opZXrJyEeqc+PJLS1mJ3NZx1AkrIMM3ggSXeO/6EXKk+2b5ogYONE1Px9v6XVFcqvPNg
	lvVYARRR+hgax2c7HeDaQjLIceWKQYUa5vjGHSGWI0uVdXyQ0EcGl/qv6Zim4+pxg7vf
	cSRBBKfcWb1uFHYPqhoe+7VeZIxWiPCa+hrX9e+IG5ibSE4W+U72qbrntsV/pIY2GV8C
	CldHBqcz+M5gzyjoNwVndlJIGm0aOi6aj/il7hWT8XGezULr5CKpABN0tlqHn+DbNpqK
	N5XQ==
X-Gm-Message-State: AIVw113d/c4c0ccp4V+wuH7MxQmoS4XSNvq70TZbUFd5N1F107C/VHpC
	HwExM/1f66/0XQoEb9NvLy6T/y8kHw==
X-Received: by 10.28.175.212 with SMTP id y203mr9475985wme.2.1499731985045;
	Mon, 10 Jul 2017 17:13:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.170 with HTTP; Mon, 10 Jul 2017 17:13:04 -0700 (PDT)
In-Reply-To: <20170706093039.30435-1-johannes.pointner@br-automation.com>
References: <20170706093039.30435-1-johannes.pointner@br-automation.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 10 Jul 2017 17:13:04 -0700
Message-ID: <CAJ86T=XdFKzseQKej3w7rPamzfUmH0391r-hFX=aTquDjtnOew@mail.gmail.com>
To: Johannes Pointner <johannes.pointner@br-automation.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libtinyxml2: upgrade to 5.0.1
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
X-List-Received-Date: Tue, 11 Jul 2017 00:13:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 6, 2017 at 2:30 AM, Johannes Pointner
<johannes.pointner@br-automation.com> wrote:
> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> ---
>  .../{libtinyxml2_4.0.1.bb => libtinyxml2_5.0.1.bb}          | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_4.0.1.bb => libtinyxml2_5.0.1.bb} (63%)
>
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
> similarity index 63%
> rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
> rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
> index 3a6659815..edf836814 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
> @@ -6,10 +6,21 @@ LIC_FILES_CHKSUM = "file://tinyxml2.cpp;endline=22;md5=c19221dbd8a66ad3090462af4
>
>  SRC_URI = "git://github.com/leethomason/tinyxml2.git"
>
> -SRCREV = "74d44acb176f8510abf28ee0a70961eb26631988"
> +SRCREV = "37bc3aca429f0164adf68c23444540b4a24b5778"
>
>  S = "${WORKDIR}/git"
>
>  inherit cmake
>
> +FILES_${PN} = " \
> +    ${libdir}/lib*${SOLIBS} \
> +    ${includedir}/* \
> +    "
> +
> +FILES_${PN}-dev = " \
> +    ${libdir}/lib*${SOLIBSDEV} \
> +    ${libdir}/cmake/* \
> +    ${libdir}/pkgconfig/* \
> +    "
> +

These packaging changes look very odd. Can you explain why they're needed?

If the default packaging rules are not sufficient, the preferred
approach is to add additional patterns just to catch any unpackaged
files, not to completely replace the default rules.

>  BBCLASSEXTEND = "native"
> --
> 2.13.2
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

