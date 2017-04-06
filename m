Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2F49B71A8E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 16:12:58 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o21so7649833wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AUmbyOHrgqkMqBEkkFTFI+9Fhrn0K1qWIDsuriiltMo=;
	b=amKxcNeTYumJXxBVQ3Fx4j2sUzKDRj6oSddzWtvod/rdAdikapsWM/zImWwBF5Jq2X
	EGPMyU6PJALwu82IaD9CXq0Nzryogf8/FoCMZerpZLAgFUm9eHMHV45lhJOKNDC2Oytm
	6blqzsOCmAzfuCmm4LT6Yh3qPvHs/SlyYDwzz0ea9MMsVwS24zWJljDu1jdDYe9EkYpX
	lxWES0xMV/X2vXvkG5e+tVTPxarA/d8shBJnWCtZ+BqOO2jAdr2MLEK9o+jxI+1rH+uA
	u1jbcXkD4IGT4rzqtC4PsJqARrymT/q9MrwMKiHOzntj9RVAe1PZE3Uc4xsghAh1HRbw
	yRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AUmbyOHrgqkMqBEkkFTFI+9Fhrn0K1qWIDsuriiltMo=;
	b=EjWXdQfyg40/n5eLrocJL/9bKLkvKh7pym68KCCGayKwTKs6tc2eqYxk1l8kZWAYGW
	eNQ0K62h5taYQtuZvszRuEwOfc9AcVGRuu4kDNxv1P3Puo7Me6tpOumXsF3tiVdVkx5r
	yOXdLHKE7YTbjBdpfUDTQkNW3RpuYg+fn+rGR1YQvSIAJmTKzRmp8v+pySPE+umxHRtv
	YphpIbQAVxREot4m/yaraanfB7h74e1L/CVAJxzEvXWO1Gohy21yL9LzEXyFQPsmptC2
	MFzt+UF4n+cjGvdZ3rBQDCd6A3zLMCHowmafDggNW5/FUIid+un+L+cA3A+QCunle1Og
	SyTw==
X-Gm-Message-State: AFeK/H2e9rVzXCBGL/kk23SE3Z9thjs4gv911hNJ8t+cKGOfJ1NPC5G8pafArLds+vXqRvcDLKwKO5GfSpVcYw==
X-Received: by 10.28.103.84 with SMTP id b81mr24546700wmc.124.1491495179766;
	Thu, 06 Apr 2017 09:12:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 09:12:59 -0700 (PDT)
In-Reply-To: <1491488169-27594-1-git-send-email-fw@javox-solutions.com>
References: <1491488169-27594-1-git-send-email-fw@javox-solutions.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 18:12:59 +0200
Message-ID: <CA+chaQed7K6WGiJurV+UeW4mFBLznixmdoz=LNrzJoiVwxqOPw@mail.gmail.com>
To: Florian Wickert <fw@javox-solutions.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] jack: allow empty jack package to satisfy jack-dev dependency
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
X-List-Received-Date: Thu, 06 Apr 2017 16:12:59 -0000
Content-Type: text/plain; charset=UTF-8

NAK, no more useless empty packages, see ML it's discussed every few weeks.

On Thu, Apr 6, 2017 at 4:16 PM, Florian Wickert <fw@javox-solutions.com>
wrote:

> jack-dev depends on jack, which does not exist before this patch.
> The empty package satisfies this dependency.
>
> Signed-off-by: Florian Wickert <fw@javox-solutions.com>
> ---
>  meta-oe/recipes-multimedia/jack/jack_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb
> b/meta-oe/recipes-multimedia/jack/jack_git.bb
> index be5f7bb..61064f4 100644
> --- a/meta-oe/recipes-multimedia/jack/jack_git.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
> @@ -32,6 +32,8 @@ PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
>  # portaudio is for windows builds only
>  EXTRA_OECONF = "--portaudio=no"
>
> +ALLOW_EMPTY_${PN} = "1"
> +
>  PACKAGES =+ "libjack jack-server jack-utils"
>
>  FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

