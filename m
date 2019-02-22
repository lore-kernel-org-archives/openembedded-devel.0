Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 90EA87CA71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 18:19:20 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r21so1665962qkl.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 10:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gZHyBbUKDNAEYhCTZEI98B4wq6BON1crQ9gmf6O1KB8=;
	b=HixAUjTIGYnMiy6A/S3edmCI4Cm5lDUDYeDQ3oz+SebUpoNUjYlsG7uEQVS5fHaz/S
	2c5+76Wdr2RXKKWKPyN2uLYryCPuqRrmXG9NvAZ4rxmaP1JMNPip3CLDlxZ+9+QPhO9n
	Lp+O7RYWwWH1AVRpbatTn4cZ4CqPRCsaSYd55b5xfrmnyTRfs7DqrgkUdv9LNp/7BYWf
	GR0/BKPQF3AU3jZNSi45pNfYvEFtJRHrYnwUE7cvWcPx8c9FJ4uKgjaO3EFkwcRxk4lY
	/f+OrDafZQZddUPL1ZX4woPR5E/GZP55Nyg/JW2LO5gI86E3bKaf0kKek1WGJahwZdb+
	hKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gZHyBbUKDNAEYhCTZEI98B4wq6BON1crQ9gmf6O1KB8=;
	b=Nxmt2djJAIfkVciQG7+jJbdcixNujqxikLqiV0tHwSl8Jt96cgeFOPfLbzxoUfCvLj
	U8aP67pZa33efXesLj8efQ7U0spINfj3YDtSvLvAfljquni6Wrrjm3t4eIVpWAHphDkF
	rstQloQ/F/WJN41Zsc4RVuDlcB4aCuHXqIIRkzXJAU+GkdoykF2i9RnKpouBJ0hwN8Sb
	otgAipX9O1rNoGlso8XW8HaLd6+nOIxpMIabI3dYWp7hgBn9El6gqKmeRJCATVih+4LM
	hrpdjSQFCiIHzJ85rOyxqq1NPR5J9MJmbhaDL6UiQaKr5TU/Nld5h43wbnISeueKKp/Z
	KnKQ==
X-Gm-Message-State: AHQUAuaIihX8o3d1zdR6ayC6NJg9abaly7jP1LggonYG3i4LDXd6+hYc
	d6s2YkPL7xS+FUdb/9lNyKCqhB3q3mO9aje/vaw=
X-Google-Smtp-Source: AHgI3IZ8S39tTzJR26qcVu0zzJSa3F4IuElFf3cqJMKsXMeOo4JA/U1A7s2a0uPvCT+UUGiRj/Z6GUAdNuW+iTPSOew=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr3885796qkd.223.1550859561368; 
	Fri, 22 Feb 2019 10:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
	<20190222172949.3661-2-nicolas.dechesne@linaro.org>
In-Reply-To: <20190222172949.3661-2-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Feb 2019 10:18:55 -0800
Message-ID: <CAMKF1sqPdBOQSq8Aejj5ji_yOGk3qPU_n8C_TqzEou4H0kuKpw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to include meta-python
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
X-List-Received-Date: Fri, 22 Feb 2019 18:19:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 22, 2019 at 9:30 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> meta-oe depends on meta-python, for mongodb recipe, since
> 5cf9a144ad16 (mongodb: Upgrade to 4.0.1 release)
>

The dependency was always there, but I wonder if there is a better
place for mongodb than meta-oe

> Trying to run the yocto-check-layer script fails with:
>
> ERROR: Nothing PROVIDES 'python-cheetah-native' (but /work/yocto/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> DEPENDS on or otherwise requires it). Close matches:
>   python3-git-native
>   python-nose-native
>   python-native
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'mongodb', 'python-cheetah-native']
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta-oe/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 23c10ce339..8cedcf0d0b 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -28,6 +28,7 @@ BBFILE_PRIORITY_openembedded-layer = "6"
>  LAYERVERSION_openembedded-layer = "1"
>
>  LAYERDEPENDS_openembedded-layer = "core"
> +LAYERDEPENDS_openembedded-layer = "meta-python"
>
>  LAYERSERIES_COMPAT_openembedded-layer = "thud"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

