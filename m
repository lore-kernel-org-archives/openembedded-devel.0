Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEFC71A5A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 14:12:51 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 62so8794396oif.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=XwIQe8i/XMws9LID70dwwtlCFs0J/dUc+l//cXS6cfE=;
	b=aPJboCUKIKUMFHJkmTBIx2TZc8pp7R001iIdeH3rRSyCUR7bRAHbPeAVRcUEDPnH8E
	qr+HR9FCdIwEqb7I6QUOvNnfnqNggRiq2CZD4LAFgPmEP4pn4DMre7rC+45+A9YYb5jH
	jEECZ30c7nFhr2oAv9qPHjPoYJ/sngP1Ddpvt5yTAWwIZD+jMsXnNME9jBTJSdvirFjx
	mvxhdxzLZE+lDNC07tXRA1So7omPJn16M4sUMxiNYROltLaDrCe1A+978idFMFE1p6UQ
	/yXGZXAGCYKH6JzwzMR9CgEdWBGijlm+ISyaSdfyeD/yulAW2roebTL2kKdviaHqqHA3
	b1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=XwIQe8i/XMws9LID70dwwtlCFs0J/dUc+l//cXS6cfE=;
	b=OmC5klRelx9vaqJAjyy5QPNU0Vf9wmaPlfZYOS9ccErbm/o+UUx96BAUlEv3aXq+ax
	GMmMfzX81Pqgf1G/W7d03yx8/ABTp2v8APPVCmU7p/883WI2Gz+STcrBd/WWmMHijwU+
	Yve0i322nntg6yV5GekpwmnCsK9Zs+tZw0TRtre4NdYo+q1LiNUDFWuYkcrypDW2p4/P
	Em5ifaLVsoZ//DbTZzFgWMilSPmdU47R938IqNv7EQn0lhvtb9kqmYFtaExx04Tn/D3u
	c4gyWR/wsWt+jGnf/uQ9AEv9e0LHoQ4NjDWLvZiC5o0t2gScfBlN/epoVow00a7MMaGO
	2+5A==
X-Gm-Message-State: ABUngvfImq+VRYg6ImihcmR2Ye8tTFfK1jCzqw5B3h/Vj4zBiEfqeS8D/yV4PW44DQhO5VaQcE9oTeCcpHu9Ag==
X-Received: by 10.202.195.79 with SMTP id t76mr15005300oif.118.1477923172233; 
	Mon, 31 Oct 2016 07:12:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.1.49 with HTTP; Mon, 31 Oct 2016 07:12:51 -0700 (PDT)
In-Reply-To: <1477898963-3759-1-git-send-email-mike.looijmans@topic.nl>
References: <1477898963-3759-1-git-send-email-mike.looijmans@topic.nl>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 31 Oct 2016 15:12:51 +0100
Message-ID: <CAEHkU3U4wbOuPLCy-Ndj+ScuH2QnyBHd76FhOiTyQJzG1Kxqqg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt4][PATCH] qt4-embedded: Default to build tslib when touchscreen is defined
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
X-List-Received-Date: Mon, 31 Oct 2016 14:12:52 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I sent a similar patch:
https://lists.yoctoproject.org/pipermail/yocto/2016-October/032661.html

Both fix the build error with the HEAD of meta-qt4.

Question is if "touchscreen" in MACHINE_FEATURES should build for
tslib by default.
If yes, your patch is needed.

However the error will pop up again if someone chooses to set
PACKAGECONFIG to not include tslib.
That would be handled by the patch above, so applying both patches
would fix the problem and default to having tslib support.

Max

P.S.What is the 'correct' mailinglist for meta-qt4?

2016-10-31 8:29 GMT+01:00 Mike Looijmans <mike.looijmans@topic.nl>:
> When "touchscreen" is in the MACHINE_FEATURES, packagegroup-core-qt4e
> will RDEPEND on qt4-embedded-plugin-mousedriver-tslib, but that
> library is not being built by default, resulting in an error like:
> opkg_prepare_url_for_install: Couldn't find anything to satisfy 'qt4-embedded-plugin-mousedriver-tslib'.
>
> To prevent that from happening, add "tslib" to the default
> PACKAGECONFIG when touchscreen is defined.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> Applies to both morty and master branches.
>
>  recipes-qt4/qt4/qt4-embedded.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt4/qt4/qt4-embedded.inc b/recipes-qt4/qt4/qt4-embedded.inc
> index 1122080..9c2d9da 100644
> --- a/recipes-qt4/qt4/qt4-embedded.inc
> +++ b/recipes-qt4/qt4/qt4-embedded.inc
> @@ -3,7 +3,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
>  SECTION = "libs"
>  HOMEPAGE = "http://qt-project.org/"
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= '${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib", "",d)}'
>  PACKAGECONFIG[tslib] = " -plugin-mouse-tslib, ,tslib"
>
>  QT4EDEPENDS = ""
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

