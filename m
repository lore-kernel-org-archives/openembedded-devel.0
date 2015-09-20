Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9389375772
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2015 15:15:06 +0000 (UTC)
Received: by igxx6 with SMTP id x6so44270873igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2015 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=nVY+FBy0yRsD/KBEhUW2QJ5MlkJQY7ZjISMlKJ/ncYA=;
	b=fi4LVx3IkE3jlbkQaZBGHoJnqYha77zqYxhA1a1gCdtW+lbDOblnvBqNmPhGoDVjHe
	AV+bk158QqEocUUP5wCalpLKpAZ8YY+geinXHUmkhXdwP/1couZJAQgGumFLMGXARHDK
	E51qYvxh0YnMyEQg+0ew7xRtfrM6d1bR0cJ32xprnpnEQDRXSr6KCja00Sz2CqnmayJi
	HmIKK9ian1jh2z6by8cLllD1QjCTdWq6hyW21Bt+yoBmU1EJLbH4vKVOkp7zJ21GS0PS
	D9EE8ldbG0+FSU05tEFyjXbnC19fKcJjPQOSIKkQdmiLAq4ZSuAN49mp4kzeXPd/rWvK
	0iZA==
X-Received: by 10.50.122.42 with SMTP id lp10mr6173741igb.75.1442762106133;
	Sun, 20 Sep 2015 08:15:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Sun, 20 Sep 2015 08:14:36 -0700 (PDT)
In-Reply-To: <1442761673-22041-2-git-send-email-schnitzeltony@googlemail.com>
References: <1442761673-22041-1-git-send-email-schnitzeltony@googlemail.com>
	<1442761673-22041-2-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Sep 2015 08:14:36 -0700
Message-ID: <CAMKF1sr7v_fvQWPCER9b4paztM2smVUs95Z_B8zUPa68Kp+0GA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] plymouth: building documatation sometimes fails to download so disable it
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
X-List-Received-Date: Sun, 20 Sep 2015 15:15:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2015 at 8:07 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> | I/O error : Attempt to load network entity http://docbook.sourceforge.n=
et/release/xsl/current/manpages/docbook.xsl
> | warning: failed to load external entity "http://docbook.sourceforge.net=
/release/xsl/current/manpages/docbook.xsl"
> | cannot parse http://docbook.sourceforge.net/release/xsl/current/manpage=
s/docbook.xsl
> | Makefile:622: recipe for target 'plymouth.1' failed
>

this is ok

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/re=
cipes-core/plymouth/plymouth_0.9.2.bb
> index b8c82ed..1fb4443 100644
> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D "http://www.freedesktop.org/software/plymou=
th/releases/${BPN}-${PV}.ta
>  SRC_URI[md5sum] =3D "ff420994deb7ea203df678df92e7ab7d"
>  SRC_URI[sha256sum] =3D "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294=
a06eade29fbed57f"
>
> -EXTRA_OECONF +=3D " --enable-shared --disable-static --disable-gtk \
> +EXTRA_OECONF +=3D " --enable-shared --disable-static --disable-gtk --dis=
able-documentation\
>                   --with-logo=3D${LOGO} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--=
enable-systemd-integration --with-system-root-install', '', d)} \
>                  "
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

