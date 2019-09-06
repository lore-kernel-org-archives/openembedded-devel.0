Return-Path: <aehs29@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 761017F3E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 16:35:46 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id h2so73927ljk.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xBG1b4UaX6fe1G8V1zGrezQKwWd078sqvPelKfD/Qtc=;
	b=oBgEidAjml8Uo+40wrbE9dJqncltUoNLDE7WS3B4zy6+G7MPZ6dYMYMgs42XvrDb/8
	c640JQ8+x4C0wmcmvUbwf1rrnSsLFLzWcipLDy8F0uO2nGu7xJGHXpUYwffWsfThr2G2
	Qup7trRq2a+Nw6DfoJKBcPDh0K4W2bUuk35gQP4qypp3XU9/dZFlgsP4Anl0BoqJhE3p
	KiFaqMlIw0MQ1CIieBk0i2uyLYulJt/W1jPPkqCR6911Qj4UFiwSoMkI1fPDU6gD1JZk
	eTcI64Mf22nrYFG+j8AGZ8qgPjL8hCFL63nYWTjTmwbyVLUHernenDUbfVlNiQ78YSzZ
	ucaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xBG1b4UaX6fe1G8V1zGrezQKwWd078sqvPelKfD/Qtc=;
	b=i4hy8OGcYO0Cms2b07DkGEO50JFBoeLnkJ6sGuu8jEN5bnDRCts4K0SYNJYEDIPwg9
	HAwv4Joz58TP6gFQyVhF/llqT/VE3azB5U1jWeWgXJsxQuQGjpnMQoguegHkPH3uoAd5
	3utE47Zdpibfzqbi6rOLfE8mLBpFLBc+tC04pbzsjjxv6Rq4+G1q9qUbi1hjtwOcik0D
	n0vJ8gZ8N0im4nnGkjm3BRlln5OzeAPmK1vTvdTYVXOh66O9tzBRs+0r1UOYiHlJkSZZ
	DW0nwcTejH+pFN/V/rySpuRG3tct6dPwGqWI6uJfVWMnL22zDd4Zz9+gyYfoC4GYkwvW
	/GPA==
X-Gm-Message-State: APjAAAUQQHe/sv/HyG5iY8vFQV75z+LHGeN8qVStaetQENFUH60hxgQ+
	LAunVnTNtKGKjYy7VXGhsCQ1fZanxVwwMNmoloc=
X-Google-Smtp-Source: APXvYqxZAjeE182ZzALatcGDF01UWgr4Lok2J9qmsC9lGbW7W+0wshE+ithynd0lfR0ifD0wpjW/l2/OoyRFCgdDljA=
X-Received: by 2002:a2e:3c0b:: with SMTP id j11mr6323686lja.78.1567787746798; 
	Fri, 06 Sep 2019 09:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190906163242.4770-1-raj.khem@gmail.com>
	<20190906163242.4770-2-raj.khem@gmail.com>
In-Reply-To: <20190906163242.4770-2-raj.khem@gmail.com>
From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Date: Fri, 6 Sep 2019 09:35:35 -0700
Message-ID: <CAHMutraN95VB7aMUsTi53sxOQ-hcMrdnw0Ji1uee6RTA=TDFpw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] remmina: Link with libexecinfo explicitly on musl
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
X-List-Received-Date: Fri, 06 Sep 2019 16:35:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hey Khem,

Thanks for this, I hadn't fixed it because I have no access to my laptop
for now, looks good to me though.

Alejandro

On Fri, Sep 6, 2019, 9:32 AM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
> ---
>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> index a14a2592cd..a86deccc8f 100644
> --- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> @@ -5,6 +5,9 @@ LICENSE = "GPLv2 & openssl"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f
> file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
>  DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui
> libsodium libssh vte json-glib libsoup-2.4 libvncserver spice
> spice-protocol libsecret"
>
> +DEPENDS_append_libc-musl = "libexecinfo"
> +LDFLAGS_append_libc-musl = " -lexecinfo"
> +
>  SRC_URI = "
> https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2
> \
>  "
>  SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
> --
> 2.23.0
>
>

