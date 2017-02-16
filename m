Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0F11F77236
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:42:43 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d5so1059161uag.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=kagKkq2GP+zN0sfvtZcVnPi6UgYrlnEkgWGIwEl+OGs=;
	b=r/dBTgLNM8naFbUKExkdDLbkZUeEALDtmjeQktZi6ccX//zPe9VLJYGzaPgkhl2S10
	UJ6UKX5/FI5tlaYkQLod/QAgHA2tevMtm9mUpyg7IOrHPkYqBf9kaoceFiHdJOeasZhS
	ZaLCHq89uu4fECWS96NWYqRIxWqNC2z5P16+2mQ6tkOt/ZHVZrhFhLRDf8NcHCrWWzbW
	phc5WOhFdVmRr+uZnMiyIjjy0WnMh8X5by6+v1Z/7eEzCyA+0h3hh1tWgs/+tZBOuQHi
	dztRobEJqvmxeZ4FrANsZ1qjLMWU5qnrBy6oGtaqUsCybUgDMf8VHnapULIFi8eoAP/9
	yBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=kagKkq2GP+zN0sfvtZcVnPi6UgYrlnEkgWGIwEl+OGs=;
	b=LTiFxWyfuOdK/proN8c7i7NfvLosd61PTHAnLWxfC7jTghaQZgiWPuI66xFIg/7aP5
	93NjYZjInW2DAhG2ecIcRvJ+xxViiV783AqWBwfwxSsbk/uYmVrCsDHZuXGwjA+0goXH
	2XvUJ5SseR6L3oyWhteosFc8bCKWcesN40R7LeYNgB4V+0AXXiw/k2PV4k9KJHlTvM3t
	YMW1rGmG9nk3Lpo4QQDZoWRVeKik2amPLFq2dJRBjwny0wEgz9tdZpVRYo8ndiE+r47J
	ELcziij6uC0c1hScKDuVIeJhISCrP/FsX9/zDwWSp2xEZKXC1PynWZ/nmAEomHUaWsEF
	qDXg==
X-Gm-Message-State: AMke39ntVMYMrKkgokKpAKnhw4zygv5gnnhSZAjioLR/SrDKHCbg/ewbPtKj0iN2XJuFL88ZWmYXzEA00li9mQ==
X-Received: by 10.176.24.152 with SMTP id t24mr708954uag.79.1487241763543;
	Thu, 16 Feb 2017 02:42:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Thu, 16 Feb 2017 02:42:43 -0800 (PST)
In-Reply-To: <1487241365-6326-1-git-send-email-obi@opendreambox.org>
References: <1487241365-6326-1-git-send-email-obi@opendreambox.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2017 11:42:43 +0100
Message-ID: <CALbNGRRKU-bYBOUqtUsEqP4vM097qqdXgGk-27LHPaFVCXfsmA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libmikmod: create packageconfig option for pulseaudio
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
X-List-Received-Date: Thu, 16 Feb 2017 10:42:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 16, 2017 at 11:36 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> index 2e1b9bf..9d31c92 100644
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> @@ -3,7 +3,7 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
>
> -DEPENDS = "alsa-lib texinfo pulseaudio"
> +DEPENDS = "alsa-lib texinfo"
>
>  SRC_URI = "\
>      ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
> @@ -24,3 +24,5 @@ EXTRA_OECONF = "\
>      --enable-threads \
>  "
>
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
> +PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
> --
Does pulseaudio do something useful without pulseaudio-server in the
image? Something like

PACKAGECONFIG[pulseaudio] =
"--enable-pulseaudio,--disable-pulseaudio,pulseaudio,pulseaudio-server"

Andreas

