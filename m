Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E276719D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 17:51:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g23so8541672wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 09:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UGHi30Ic27NMbPIGGuo35W8ccVmUwPKZhB0OqcT4gSM=;
	b=GvNMo3YqUotP/DkSxSCWl1LQX53pxNdAGi7ynHRSIws3ZEmsKjIK991ZuDfRftikVN
	75TrTHCel015gUJbrOAZoYDdbsZDBKPcYbDjP6iovc17tBRei6+UxEcN2PrRrEIveuOC
	wEPzEhS3emQYzDyzJa0vYtMSNuKvGM0jTlGyuBmiP3SDDMPX2i/7/2u75gzkitAzT4BU
	VQIn/NWQdZovgXSWvsOZHedLGJF0nANm3tpqYIpuzQsxk3pJqVCZRDharfo4IoXYJFVl
	WKNThO1f2iu2RLL9HHyeOOEU8leZmfGLyrdCZLa7NmIycx3a2hdmVPXKv45NS85Z1HP8
	i/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UGHi30Ic27NMbPIGGuo35W8ccVmUwPKZhB0OqcT4gSM=;
	b=gxzYKZi5PuLHYwuh1iHxWsP0XXDKVZz2XWTxHULmeR+lCnik51zrSyJYuQsEPfPq79
	ZOxQmv3gXAYZYp8ZYqu9SwgShhUAxQpoB2d4zqB8pIAHnmbNNOt7Idc7uKUcPAKgWIz4
	5zs5ZLa+CPn4HxSE8At4TvViBpYl6u3pSsOmtQN9QLFqAPS0aUzbbBnUISNAi5eO7RKt
	QOngoMK+vP2f0UtbDPu9pMypuL84ZVNV//x1qGiK+AzrR1AUW4q/M+Dapi3XUriArgWq
	0Xf/lb5WBfUyvmu73+pJoVEdTcdKSKyTzY4F2qpSVHKrTF4TalGmK94QUuMU0H28p7mt
	HHzA==
X-Gm-Message-State: AKaTC03pXAfviTkjs+/9wYOXXINLiLqMf+5uuxH9TjIYflek5iUKbTW48W9fzVED0SCJTVrgvxTRjw2SQa60Ww==
X-Received: by 10.46.1.74 with SMTP id 71mr611587ljb.14.1479491516693; Fri, 18
	Nov 2016 09:51:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.40.6 with HTTP; Fri, 18 Nov 2016 09:51:26 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <1479488770-11390-2-git-send-email-jaragunde@igalia.com>
References: <1479488770-11390-1-git-send-email-jaragunde@igalia.com>
	<1479488770-11390-2-git-send-email-jaragunde@igalia.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 18 Nov 2016 15:51:26 -0200
Message-ID: <CAAPZna1mR2CsORGAw=401YgK-VAoNxqrHf-VuoLTPkCWPPXALw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: eric@eukrea.com, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 2/3] Disable CHROMIUM_ENABLE_WAYLAND in the x11 recipe
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
X-List-Received-Date: Fri, 18 Nov 2016 17:51:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8BHi Jacobo,
=E2=80=8B
You need to skip package if x11 is not in DISTRO_FEATURES, like in your
chromium-wayland patch.

Thanks!

On Fri, Nov 18, 2016 at 3:06 PM, Jacobo Aragunde P=C3=A9rez <jaragunde@igal=
ia.com
> wrote:

> The chromium x11 recipe crashed when run with CHROMIUM_ENABLE_WAYLAND
> enabled, because it missed some steps that are performed in the
> chromium-wayland recipe. Doing this change, we eliminate one possible
> failure point.
>
> Running the chromium_*.bb recipe with CHROMIUM_ENABLE_WAYLAND on
> was crashing because it missed some steps that are performed in the
> chromium-wayland recipe. We remove one possible failure point.
>
> Signed-off-by: Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.com>
> ---
>  recipes-browser/chromium/chromium_52.0.2743.76.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> index 14b519c..ea23a6b 100644
> --- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> +++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> @@ -1,3 +1,5 @@
> +CHROMIUM_ENABLE_WAYLAND =3D "0"
> +
>  include chromium-browser.inc
>
>  DEPENDS +=3D "xextproto gtk+ libxi libxss"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

