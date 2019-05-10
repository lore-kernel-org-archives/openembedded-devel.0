Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9E77E090
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:08:13 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id f1so4104065lfl.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uSko99xPvmIT4ANNs/KYYepG5FvFCUQECJsmaTNEkqQ=;
	b=kNbNXInAsYFzu4A1nJIW1XOTivA6lguc/fax4e2KwyiSNwd0310bEx5/tpTRAUGzcg
	FgAOQifOIUhxHvIhhLAlXTVQy47Hy7K/NoXEBJimW/kSI3dxSLnR6CM6uIAtQZk8iDDz
	kHDNmakIXlFmyJ3MMJ4/TqtxhbnHJ/4+7sY4s3puiul+qQLVF8JtL1+wc++ZffkbfSvo
	Ng5ak8Na4ehJTkyjpZ31il/Lyh2FD+MvKP3VJBuxPKmmTqbZjsuI/g0GcauXX4pt3JzR
	XiYnlOhFeE+sNHC6D5Hvf2fmExDs2aQOO9bAvUEf3Ggs3WJCCT3Xo/Tgo7+wG58QWwr9
	Tv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uSko99xPvmIT4ANNs/KYYepG5FvFCUQECJsmaTNEkqQ=;
	b=GrilWAUkmP9+L5Mj1ijY0E/rF2jJNCTePpGHW0kBEl+3gJk9/+0m07NBp2mLfKgSZg
	rtkU5fyyA4h1/d9YXDpXW0FxLQ5493cy2kMnN4VT/GKQi8pk8gaLVZyNZSzephhVRsHL
	h6aH3NZmuOEaIz2dLR6tClwR6O9wAKkGqOA7uW240Ii3Qn1/HqPdMNF5Yqgpryj5UVcn
	b8+qy3+lpZfwBfyoxGibJwhEVSlj209n5QIxrz4UA5EU6z6343XfBq5SeaIz13XVIu1y
	zqypKd+tcFY8amsNrsQAISpd7lg9hQXJHfQf7mKJBXR7oiN/Wz4H0i5dD0cIH0R96Pqs
	ZNDg==
X-Gm-Message-State: APjAAAWqeeu0huKcbZk/EPv5+kwp/gVRQYw1WKrw6s0JAEmc/fJAgtTW
	rknaQJB3cto/esKuxPWIhCUBeRvWZB4BIqZOMROSGgxohLc=
X-Google-Smtp-Source: APXvYqyUceRTO5a/GIBDgR4Jh3wIWx4x9yot+ocPWIvtLhLxp0gZIIBosrRicsHv3BDvc31OZ5BWOgjS8z61wjKj+E4=
X-Received: by 2002:a19:1987:: with SMTP id 129mr6352037lfz.80.1557493693953; 
	Fri, 10 May 2019 06:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190430060855.60494-1-sean@geanix.com>
In-Reply-To: <20190430060855.60494-1-sean@geanix.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 10 May 2019 15:08:02 +0200
Message-ID: <CAP71WjyBr94m0gH4MBG7CEpQcS01UP9ia1Ay9S6zueJdeT-Jcg@mail.gmail.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] cannelloni: new package, CAN to ethernet proxy
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
X-List-Received-Date: Fri, 10 May 2019 13:08:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 8:09 AM Sean Nyekjaer via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
>
> Tool for sending SocketCAN messages
> over Ethernet tunnel.
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> Changes in v2:
> - Added PV
>
>  .../cannelloni/cannelloni_git.bb                | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
> new file mode 100644
> index 000000000..df75e6342
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "a SocketCAN over Ethernet tunnel"
> +HOMEPAGE = "https://github.com/mguentner/cannelloni"
> +LICENSE = "GPLv2"
> +
> +SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https"
> +SRCREV = "44080bb021d1a143e6906f2ec4610513c4e1cece"
> +
> +PV = "20160414+${SRCPV}"
> +
> +LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +inherit cmake
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??= "lksctp-tools"
> +PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"

lksctp-tools recipe is in meta-networking, so we've added an implicit
dependency on meta-networking by taking this patch. should we disable
lksctp-tools support by default?

> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

