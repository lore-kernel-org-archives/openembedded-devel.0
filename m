Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id DC03B601F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:13:54 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id k67so167528173wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 23:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o/kzNQRGWZXeTaTce6MJWOta6oiahsrIgwx8mlyaZQ0=;
	b=fgNoHBfJVSPGwvt+OiRFSGOS1JXZSX/HBVmIMUgWJ37yOLG6ATJkEENqz+OSwU+DSN
	hVY0YVl4swv6Nh4a5RD7c5Jl7O34ISElgCpeng311/0V6yykMt/SepM1Ohb058p2HBhn
	30uaWFKnecx1pKF6wQP7UY3JEN8zZRFa4fKAQnywtNuOHN/PX8ZudgtoWubwUTE2+elg
	b0ba04d93WhWF+wRmhEQsPL3NwsFc8cYSkvxE1uKiEanwN7sviLSi7jF790dpqxtiepz
	Hj6LGdbA6k114MwO7Omxr8SNME+HFLUwbxFt17Uu2VMojwTg5742MWQZliWjk7cy68BP
	m0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o/kzNQRGWZXeTaTce6MJWOta6oiahsrIgwx8mlyaZQ0=;
	b=jjc4bXfUUfOszzxx6iLPp5kRobzCZiEU4TsKTqcpTlmSXel0KXWuUCez6vORe3HGhS
	FDvu/Ao2BVCVxCaKveBc3XVB3XcvnXMPczMQJJ3K+kFVZcKjHgqTSIDBT4lV+DgXZV6o
	QcyUj9VdSyshcre3peGZNfuMPURWLbbARU5mfSXAp74POefZKpIwCbqYHYEUGb1P9K5P
	VngHAD2MAOUrIQz8Y/+UW0dVF5QuUf5lKnJ1gVvjAx3xLbrme+1g/dZVI2jgCMNgvi6B
	Ay1LUMq6PPxy34gnajNmNYpqnCpHvWpTCHboupZjMF1nDt00U/d2BuFrUGuuhHsyEken
	C+Gw==
X-Gm-Message-State: AIVw1116hTztM+6UtXb5ZOEFPBrO8C6uJTNTMTiIuq7Uegf4i4UTckyZ
	rZn6eeSnGSQv+XpzVkBWUiGhxJpc0cMG6BA=
X-Received: by 10.223.128.209 with SMTP id 75mr8280614wrl.99.1499753635359;
	Mon, 10 Jul 2017 23:13:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.58.136 with HTTP; Mon, 10 Jul 2017 23:13:34 -0700 (PDT)
In-Reply-To: <20170706093039.30435-1-johannes.pointner@br-automation.com>
References: <20170706093039.30435-1-johannes.pointner@br-automation.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 11 Jul 2017 08:13:34 +0200
Message-ID: <CAD4b0_LYeFonQzv7bqTZxO=vq0fwcHtEw49ZDL_vDuki-UXH4w@mail.gmail.com>
To: Johannes Pointner <johannes.pointner@br-automation.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 11 Jul 2017 06:13:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 6, 2017 at 11:30 AM, Johannes Pointner
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

pretty sure whatever is in ${includedir} it should be a part of -dev package.

> +    "
> +
> +FILES_${PN}-dev = " \
> +    ${libdir}/lib*${SOLIBSDEV} \
> +    ${libdir}/cmake/* \
> +    ${libdir}/pkgconfig/* \
> +    "
> +
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



-- 
Maciej Borzecki
RnDity

