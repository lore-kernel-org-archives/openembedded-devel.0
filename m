Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 056D7770E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 13:22:33 +0000 (UTC)
Received: by iofl186 with SMTP id l186so89421095iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2N5ekI+fMF8DZhZLh8OEsn2ZRffHSC+Wcrf2Vejbkic=;
	b=an/AM8nhIeycSdqnA7bPEW/zhWCLXJ0CHy453lurPJRp9PC1nIDEuz9MfdwVM7ExVH
	cBlbxIBc5wj+dcV2plR9wxPfnuTXepYiebx1fAWzRyJR1PvOlE0dk6BburL3lj0oFiGy
	W5lM70omWlPeBsXWYIJb7YfRvCEjsUXit2ZbuOBegHoJ6iQs3rQKnL0GcJPePAZur6XE
	ZzQwZXcm6I/G5DAVIcJXH7d2bGlgb8wIZULyl6Fx83/9fMFxhc6n5HdChe9iZo/gADeZ
	olkZm/7lIYflsDYwvnm2vvJnhhYFgZMqt5Kl8mcS77hgSa3q3C0boPZLv8rWi4RnQ/hU
	+0IQ==
MIME-Version: 1.0
X-Received: by 10.107.14.140 with SMTP id 134mr9496527ioo.148.1444915352966;
	Thu, 15 Oct 2015 06:22:32 -0700 (PDT)
Received: by 10.36.98.143 with HTTP; Thu, 15 Oct 2015 06:22:32 -0700 (PDT)
In-Reply-To: <1444871185-1173-1-git-send-email-raj.khem@gmail.com>
References: <1444871185-1173-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 15 Oct 2015 15:22:32 +0200
Message-ID: <CALbNGRQ1vE0=GP7EfvpdHpNiHW1C1O1ntmFmTPtzeP9+ryTZFg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] plymouth: Disable documentation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 13:22:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 3:06 AM, Khem Raj <raj.khem@gmail.com> wrote:
> It need docbook-xsl built natively and right now its not in its deps
> disable the documentaion generation completely to avoid the build issue
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> index b8c82ed..01f633d 100644
> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> @@ -20,7 +20,7 @@ SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
>  SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
>
>  EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk \
> -                 --with-logo=${LOGO} \
> +                  --with-logo=${LOGO} --disable-documentation \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
>                  "
>
> --
> 2.6.1
>
I think I've sent similar - and if I am not mistaken it was already applied.

Andreas

