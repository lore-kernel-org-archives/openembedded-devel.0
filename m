Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 712597988E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 00:19:25 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i10-v6so199883qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2018 17:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kgZ162+C7AaBeAIp0saA0bRYPpYFvtsXfZA7lIr3muQ=;
	b=iBcZtfSwt456mN1dSMF8ztZDL7f//xg9t1Aw2Ou4acQhWumGyQxZRd/uKxeU/9nuFA
	DMS6p5nMKlHDzORR/BuTm3IewBi1dkh5yttzNCP/Hqxh5HjUff2l5WATh6ZHJHsGXtqc
	GeeIYFcXwVobebXgANRAF0FPV8j51ouVeir/5F2WSrnd2GQQXGSpmUhK6PhNQBAE0Kmh
	PTCOxUDQUuB0GKduoaQADEEaUmdK6K+SkJvMexgyu5UjX6R90SZ9a3nc4sZse4+uPlBU
	KSUD/SOlkqEdUuNfcYduGdG+z3m/TLZ/61YIuP6/Yur4KSCHNXkKSsDulWxB/3rUbJX5
	+34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kgZ162+C7AaBeAIp0saA0bRYPpYFvtsXfZA7lIr3muQ=;
	b=OmDvYFi/QkGqzxOXlem+T5rxtOSrCtkZNV1H+1aN8JDiKS6g/8O1az1BAcjOoOTk5f
	dvww2142aiuLW/NIlXZPFvIeoH6TeutKxZ89/xGG+quAjVlvVV+u2XRxHfrHPtT4PuqT
	/apQLpEw2bMsSSyniYOsTOokvV5ruMwlNrAk7fDTXUiPdmv9ekLAkB6YTViMJDNqtZgb
	6dCbD8qYy98liFxlREgIo5SV4KEwS8Q7uai5U3gmwiWfCuWy1obK/7F4X1JxfAp+c9nE
	MJiSh68Dtp/KJJCHPUAuA7aTXiOCr/08rqb14GjICW29Tweq6EYxKKXr9C7p2mAvtBzu
	FOxg==
X-Gm-Message-State: APzg51AeMPrru9ReapQAXgnjveS0Mn3dqxmW/rNTwB6DdZRZC3NxkZup
	qv0gKrBHBqqVgNy2k1RxQrLsIozx7SBNBS3vFYE=
X-Google-Smtp-Source: ANB0Vdawy3hMQa16A7jm/zTRH1YDB3j0ZsCxqnLVedBo8+kykB1qtUztEMg2QWEbMlmyF9ToODk2dV8P9opFUWlBHic=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr29718524qte.218.1537489166188; 
	Thu, 20 Sep 2018 17:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180920195929.5625-1-max+openembedded@blarg.de>
In-Reply-To: <20180920195929.5625-1-max+openembedded@blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Sep 2018 17:18:58 -0700
Message-ID: <CAMKF1spB414U2iQh0k9DYTK0WV2ay___ahp932cfCU8Stzc20Q@mail.gmail.com>
To: max+openembedded@blarg.de
Cc: max.kellermann@gmail.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libmpdclient: new recipe
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
X-List-Received-Date: Fri, 21 Sep 2018 00:19:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 20, 2018 at 12:59 PM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  .../recipes-multimedia/musicpd/libmpdclient_2.15.bb  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
> new file mode 100644
> index 000000000..889231864
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "C client library for the Music Player Daemon"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=06b9dfd2f197dc514d8ef06549684b77"
> +HOMEPAGE = "https://www.musicpd.org/libs/libmpdclient/"
> +
> +inherit meson
> +
> +TAG = "v${PV}"
> +SRC_URI = " \
> +    git://github.com/MusicPlayerDaemon/libmpdclient;tag=${TAG};nobranch=1 \
> +"

no tags as suggested

> +S = "${WORKDIR}/git"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

