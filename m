Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4560E7F32C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 13:55:03 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 201so17046555qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pm8vvikCrXqbATgOsy3j5R8izwKRQyAk/tGe77sPEM4=;
	b=Pyk9EIj9cSEWIYqwj/DCk4u+0TI9Id7g2IaKnfTOE1HR1fmLug3mXQomQBL00bd1vh
	mNs9ZSY1dIi/EdKyojEQvecYrV0O1LI9cSH6yrmJ4pP/lZYLpjU0kvl3rwKoIbYdPCgk
	w561DNFaQzooIXV8FpGnLGCfiyoYIkxH1NoCXhz/sJQBAeEbaKC05OBoIHNudZ3pWK1r
	KDWHJWmJrGKvvVr02cvjOQNuyiU3GqfJjyndsTXG1JMgpMu52NBGJvk76fQoFkjncn12
	KALgeSybe0C8QP1EAYl9K9CTyceP4uzvqvlZDZAoeCLk2GU+AYqByEfH6+0yitwk1Qkw
	1eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pm8vvikCrXqbATgOsy3j5R8izwKRQyAk/tGe77sPEM4=;
	b=f5DFIpmCuwqEq9H/LyKWOTSaKaQiQP7+QVamhh+XNAv6PFp0AO+wfrfAxOtpEFzbZ6
	7kqnHqBTasQWaHIrWB1p7Qo6vE4qrY3RHO5DtuFd00Z2B5CtkFaCvkCIuwrev3M7gsGC
	UwxAfpSxxCWz8HBKrBaHhcprxqWWAPSOC/QpiHQpAhUPuQoI1qlpfLkdnVuLHy6ZEMfc
	c5kXe83mpohBVUsQuamJqhwKg2y8+yA/ssvqJn0xvATGI3UZnulCLoSPLv4LCMOllwgR
	5BVniY66VTvj9je0SxW7Ae/tRZ5fxrq2qv80x01ByuEXepVMLXSvWREh31/aterBTNTx
	4PaA==
X-Gm-Message-State: APjAAAW92By+NW4NPkA4Ucg57c0/6f6HTUEfBEET5F1j+buk0e9M1rC9
	qXp5txUMmBERh8PGyza3hWNHjJJwu1S/rRjBfBc=
X-Google-Smtp-Source: APXvYqxrTXE572Ft15FNzQKCDu5i5ZdPQEFrM28rLwkfH31Dlb5+2awN7kmJv/rOTEYVijwKRcOUynB7l2Iq8xKAFYo=
X-Received: by 2002:a37:e40b:: with SMTP id y11mr28320602qkf.9.1568123703792; 
	Tue, 10 Sep 2019 06:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190910132907.2257494-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190910132907.2257494-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Sep 2019 06:54:37 -0700
Message-ID: <CAMKF1spn_++XWCFNmzNr+jsoOzccFsT2oPs+dJG-BmJG3atz+g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] remmina: add distro_features_check for GTK3DISTROFEATURES
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
X-List-Received-Date: Tue, 10 Sep 2019 13:55:03 -0000
Content-Type: text/plain; charset="UTF-8"

Martin

This patch does not apply cleanly on top of master or master-next can
you rebase and send again

On Tue, Sep 10, 2019 at 6:29 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> index b95c400b28..0895a9d35b 100644
> --- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> @@ -15,7 +15,10 @@ SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea5
>
>  S = "${WORKDIR}/Remmina-v${PV}"
>
> -inherit cmake
> +inherit cmake distro_features_check
> +
> +# depends on avahi-ui with this restriction
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

