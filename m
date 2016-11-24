Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 273BD6010D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 17:49:16 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id l126so1327160vkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CePdM7KV81DJDz+1qsq1NC7G239Dgued3IeETNUVpZI=;
	b=M//+QukK8ff/O2QUoAiB70zExib3QAEbwVsUzPgAdX96ZvWKQRFZujohRaLO/vFX7Q
	QDQyX4/H4c4rf9eR8aeLEf7nWrvKVlBD+fPL7WthalNbZSaN4Cc7V7V1SU/ESxUk6hNu
	I9LB0cZ8FOT9MGreOZ2xvQSMBqOeiRI8wKKsb/7UZ7LK16vxCY13BJNkPCO4e9mQfV5j
	Us5AtGOYtcVrFaMSWLkqKBFNMJpgv8sQe/JR6/QG+aqjxIl8oL+QFkzO/pD68C1qFeWL
	wsIqSOVazumk9yjN/SQ1YAMkl9zpZ4BSYob2mwDXQyJanaZ4jDJfrB9otYOyEyABDVLi
	elig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CePdM7KV81DJDz+1qsq1NC7G239Dgued3IeETNUVpZI=;
	b=IAzED1T0mi72eENGSwAGmskV+2GnVIwLoRQ8jdP0zSBz7/iT4oKEJfJKdUMkbM7Azv
	sGh6up6vMja5jOgDBQrtARLC2hYTQ06IU6onqesb9cgfB8WpbVrmjOTCQmzNJzwdk8qb
	U+gjUyak3OfedrO8JlQlmWXvcfJTq96hL20V4F/nHY5Bl3XKgIE2KOEyrAC9yq2HyX56
	hxZ/PJcBMtXHnN+DPbELZRQKZZaPpfL13FO9RxaMyFFTeiDtjRKn7Y63oe9P7f2ryY+s
	fHk97yNxxmKnUfxDHkBZaINGnN7gdIynek+67f41OM8Ho23D2u2y0mPrY51sipz2lsoA
	Hv9g==
X-Gm-Message-State: AKaTC00BBJYznQa/FVkTobNJJ/K+L8lLcxfA9w1ya/4t5rO5O7OUlIyAAiYBMahmZX75fVAaKK/n3ZSA4egP1w==
X-Received: by 10.31.153.195 with SMTP id b186mr1551593vke.140.1480009757291; 
	Thu, 24 Nov 2016 09:49:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Thu, 24 Nov 2016 09:48:46 -0800 (PST)
In-Reply-To: <1479904789-1607-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1479904789-1607-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Nov 2016 09:48:46 -0800
Message-ID: <CAMKF1sp0Ggqp3F7985=t=8ARZ62kC78vNjj1HnER93x+8pdv7w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] nis/opencv: Update getVar/setVar syntax
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
X-List-Received-Date: Thu, 24 Nov 2016 17:49:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 4:39 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The deprecated APIs are removed from bitbake, update two old style references
> in meta-oe/meta-networking.
>

Note, that the corresponding change in bitbake is already in, so this
patch needs to be applied quickly to unbreak meta-openembedded.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta-networking/recipes-support/nis/nis.inc  | 2 +-
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
> index c4aa10e..e027a1c 100644
> --- a/meta-networking/recipes-support/nis/nis.inc
> +++ b/meta-networking/recipes-support/nis/nis.inc
> @@ -25,7 +25,7 @@ do_install() {
>  # so force the package to be skipped here (this will cause a
>  # 'nothing provides' error)
>  python () {
> -    os = bb.data.getVar("TARGET_OS", d, 1)
> +    os = d.getVar("TARGET_OS", True)
>      if os == "linux-uclibc":
>          raise bb.parse.SkipPackage("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
>  }
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> index 2136b07..670c94b 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -108,7 +108,7 @@ python populate_packages_prepend () {
>      for pkg in packages[1:]:
>          if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
>              metapkg_rdepends.append(pkg)
> -    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
> +    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
>
>  }
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

