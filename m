Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id BBD69782D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 16:31:19 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id b85so54969pfj.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+4tzdYVUP5VTZfs+t3SX+44eRDW3QsVHYuifQ58CJ+U=;
	b=opJErhTj7KzG834fTDAHyuZvEgixGr5wdq47LEr0dTEMr5ovccnxjeGucv500IBbNr
	3efNWjrCgsJN/m7PkY6uraA9m0yudKlhRiT2+SynwMhNrFLGwN7yCcMZJ+b6zMbPiWls
	vCAHpbJ1mQojVJxlp9InAgnJoKFy10vlCI5cB+qSMLbxenx4sAmq/9165HhZH2+Ay5OU
	bEvpNfu1cAQEdYgnmnSGX/UoVWkkm6w61VWEKkv3DhhXQWz73yOCtqV6e+3dBshXUuZ/
	YeYk98Bt1Jr70DEBVHclQURAlv4204QSMkKFo1ZxV8uiI52cM8zJMr1du5kBj/qlQXzh
	7X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+4tzdYVUP5VTZfs+t3SX+44eRDW3QsVHYuifQ58CJ+U=;
	b=mqsF1sxLRWqytZwSpw+z0WokQ1eqXiawh/+IK8JDpXvgz/Fi2NDe6Ldx9OcKDpo9A9
	eYWORKNOdJucNSraQqD/9PEkrWzQSWHyqJZ+LYDS8mhZWh6p3QZQ/ol/xSoRtcd+sT1U
	9lejOU6ekrJwg7nYnDGwO8kol2a0FDr2sb/DCdJSNygNqqDsnvFy/8JdUimplgN8hOXA
	gRjuZtNGeB5IadSIr4sgOj52bDkOOZ+WsYmffx497XKtDpYuTLdaaBMgfye2MX+etmMA
	TO6Tegro8OS99/vhiKU633NYhNWGI3QYaWy7e6WgsmLngCsWmWNhBwPGp6y/wgdnvrHS
	oC1A==
X-Gm-Message-State: AMCzsaV3AqUOaSRuWluYym2uPlwwqdUJUHgqd2F/PnwKtJ8tuskEr55g
	/AXm+gMGW5Ii/sr0+3Z2oipp50P+YLJoKE6nbE0=
X-Google-Smtp-Source: ABhQp+QyuuEB3R9W33f1CDebMdGj2mP/cF9X6iGuccJgxEZaWP4JF00VCl6TDq0OpUkldg9xaDnsGbJoPA+cR3X2GhM=
X-Received: by 10.84.128.97 with SMTP id 88mr3885387pla.161.1509640280597;
	Thu, 02 Nov 2017 09:31:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Thu, 2 Nov 2017 09:30:50 -0700 (PDT)
In-Reply-To: <20171102103129.3703-2-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
	<20171102103129.3703-2-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Nov 2017 09:30:50 -0700
Message-ID: <CAMKF1spbF2bJDQK_htfwpEKRgh1MzZEpkxpyde1x1dfoaqNYhw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/10] tumbler: make thumbnails work again
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
X-List-Received-Date: Thu, 02 Nov 2017 16:31:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2017 at 3:31 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> fixes:
> | Failed to load the cache plugin "tumbler-cache-plugin.so": /usr/lib/tum=
bler-1/plugins/cache/tumbler-cache-plugin.so: cannot open shared object fil=
e: No such file or directory
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce=
/recipes-xfce/tumbler/tumbler_0.1.31.bb
> index 1f5419a..fe331cb 100644
> --- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> @@ -15,6 +15,10 @@ INSANE_SKIP_${PN} =3D "dev-so"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gstreamer-thumbnailer] =3D "--enable-gstreamer-thumbnailer=
,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
>
> +do_install_appen() {

typo

> +    ln -sf tumbler-cache-plugin.so ${D}${libdir}/tumbler-1/plugins/cache=
/tumbler-xdg-cache.so
> +}
> +
>  FILES_${PN} +=3D "${datadir}/dbus-1/services \
>                  ${libdir}/tumbler-1/tumblerd \
>                  ${libdir}/tumbler-1/plugins/*.so \
> --
> 2.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

