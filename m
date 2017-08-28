Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 64D1278093
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 08:55:31 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id m24so174004uai.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 01:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VnGFjcJLJfKRf0+gaQiLb+IXBW6S6qxgDRZdvEuIySE=;
	b=p+Vk1D9nLY5Xh3ddrw1nBZNljJAjbz1d0J2W4I+qlyjzOegw3wvZrIinN/XHpBcaBN
	fd0Z/6isnU8kDF+t/ut1df2tuJeX2xl9+OSpeTuiYA5FOiM4i+8gl2QwpraOnQb/gdEQ
	1YDgMr0aKs4iGZ7QDFnKYNPlS2bcSdDlY2b35hP24Q2ojaZ7xdtjt6SbLl01WCuvjQBk
	v6H+UyPSkp/+6qfY6oyX0u4NFLmR3qR//zXh0ox3CmCS6o2A1hnEGJ6LtTIbtn3tskoU
	DAeXdPQEpGnVOCG4m7PJ7p9dScWiReZzDHiNPvc9xA+QjW1SFdm1SAYoEHapbcOxfnLp
	y1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VnGFjcJLJfKRf0+gaQiLb+IXBW6S6qxgDRZdvEuIySE=;
	b=AafvOpeljeuknVHMKBXpbWb2vGwdT7321XgS9QHx0Hg9yDrayy9MaQEHRqxH48o12A
	yboRv8koYws0GbAonLLXo9xgukzX7/W3OhD+qhyy2hxweoGbl0dGNsf6Bz4EooLdiuLt
	RjX6z4xBqDMdnbiaIlTrTZFtDQMeD5kZBhvaSVw7uNe3lRuhiXXXdXi+K3QAQNns0GNQ
	K9jfJpm4pj+dSlRf/3Nt91oosbYNMuPxqO3K74xB2pTyO1tIfulYh+1Ak2nGeMVvO0IE
	IqUpv/pRUkro5lVbhCJxl7+1Wat2uvCNDrmGK+47J4+FuFcVQ6LGuaTIiNucaUPgHZaU
	iKZg==
X-Gm-Message-State: AHYfb5jmIgZd9aAihvireFxxlW+oOhRm8dwaAU8MqiUj2G40NOtM4zpK
	vnQ2UGFMntDROW103eGIPI25GqyVeo8k
X-Received: by 10.176.95.85 with SMTP id z21mr3468169uah.183.1503910533023;
	Mon, 28 Aug 2017 01:55:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Mon, 28 Aug 2017 01:55:32 -0700 (PDT)
In-Reply-To: <20170824142324.8677-1-Martin.Jansa@gmail.com>
References: <20170823174520.61466-1-jason.wessel@windriver.com>
	<20170824142324.8677-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2017 10:55:32 +0200
Message-ID: <CA+chaQeJXR3_BLxf2Qn+LWO1D26EtZh-RbPg2fzaR9VOGPs_Rw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-gnome][PATCHv2] gnome-keyring: Fix compatibility with gcr 3 in oe-core
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
X-List-Received-Date: Mon, 28 Aug 2017 08:55:32 -0000
Content-Type: text/plain; charset="UTF-8"

I've moved this before the removal of blacklisted recipes, but it still
fails to build at least with gold, see:

http://errors.yoctoproject.org/Errors/Details/154233/

On Thu, Aug 24, 2017 at 4:23 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> From: Jason Wessel <jason.wessel@windriver.com>
>
> The gnome-keyring is used to configure save certain wifi attributes
> when using xfce or a gnome based UI.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb | 9
> ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.
> 32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
> index 4ac75cbef..76c6dad80 100644
> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
> @@ -42,4 +42,11 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/
> \
>                      ${libdir}/${BPN}/devel/.debug/ \
>                      ${base_libdir}/security/.debug/"
>
> -PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from
> oe-core - the recipe will be removed on 2017-09-01 unless the issue is
> fixed"
> +# Make compatible with gcr version 3 or newer by removing
> +# org.gnome.crypto.pgp.*, which is the provider for this optional
> +# functionality.
> +
> +do_install_append() {
> +       rm ${D}${datadir}/GConf/gsettings/org.gnome.crypto.pgp.convert
> +       rm ${D}${datadir}/glib-2.0/schemas/org.gnome.crypto.pgp.
> gschema.xml
> +}
> --
> 2.14.1
>
>

