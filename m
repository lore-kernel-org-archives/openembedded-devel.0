Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96D8A797C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 14:09:17 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j7-v6so16363184qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 07:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OfLAqMrViGvwR3gD2lWzL6aqONgVYaOmWHu/3OhhkeQ=;
	b=qJtNe4+wLi6tllgxCadWeTN56GyJn7++iB7N8eqZmuwI7+G7FcToGu/nDpRK2UbPUB
	JW1PjWdN7DwuFSc07Vlps54FONQsnUz6atA0fnhjvrzoVAUlFi5yRp/BXfJlAMor6SjD
	lqEPTMrZL8rxgiZDSs0PTA+qf5DKuwH+gFszMdFMeUwgpAhlSFMsPyTMDq7rqJw82HLn
	5bjr/Wrv+mSogUPOJAmjOyAyUslvuO4Ygeo7ivqY4e00E5o1wHT3kz74QbWFpf2IKiwt
	CYcmx+v8AIOgXcG57h4rDdjmKUtOyle03T/8vlBSMYyvS8P5h8JU8i8Mi4Ft0KI0gr2f
	vS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OfLAqMrViGvwR3gD2lWzL6aqONgVYaOmWHu/3OhhkeQ=;
	b=EmL3CGq3d6Xn2QKkpM1pi/HL4NTwmVLMenf9EHh+KnduOr4cFNw4RDvDqTQMeEGa+d
	578dTdnoH9g0pCfI/87QmQaUUOzVnf/3Pb6LV4+4K9xWzgjsPKyD3TAo8NOmsYZndQKM
	qiiD7Cu9uWRzSo/plmBihzALdUNGfh9t7IJ7D+1hFEvNm+g442Rzfl/sst18zNV2rmGf
	ZFFo39kHGz9jJtn1xszuhSpNYGNDgDu9EKk1coeYxVUy3dgMoXiAdhyvSH7qvFGdL7Xw
	RH/1jIngiGjbFf5AiTVESi497Lq6DAp9J+FZZacsq+mDFkd1d7QYzrgm/Q8mn6YwsJqe
	yBlQ==
X-Gm-Message-State: APzg51DqWOTZpXFxUb+wAP60Zl8SN3Sum9Dc/BB5i/9BP3wAMUrFG/dm
	ik2kjnuENKqytB3+NaRwUACxj02CtfGd+v21Lyw=
X-Google-Smtp-Source: ANB0VdY7BgKalb8uM2ogTtsDbvpWWb0UzprATFn066/f05bo53tOpSdA2SqGGRsYo8axxLL7ReOYFjeJ09ZOTw91ifE=
X-Received: by 2002:ac8:4649:: with SMTP id f9-v6mr6325520qto.34.1536329358222;
	Fri, 07 Sep 2018 07:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180907102842.24197-1-schnitzeltony@gmail.com>
In-Reply-To: <20180907102842.24197-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2018 07:08:52 -0700
Message-ID: <CAMKF1speuTVVk+o9svpy-Chudk18WGvMcvEEd70dsw8x+9Kdag@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] blueman: rdepend on packagegroup-tools-bluetooth instead of bluez5-obex
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
X-List-Received-Date: Fri, 07 Sep 2018 14:09:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Andreas

On Fri, Sep 7, 2018 at 3:29 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Have a better out-of-the-box experience
>

Making a recipe rdep on a meta recipe is sort of too coarse grained
the vice versa is expected
can we encode all needed recipes in rdep ?

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-connectivity/blueman/blueman_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/blueman/blueman_git.bb b/meta-o=
e/recipes-connectivity/blueman/blueman_git.bb
> index f479386c1..947db7836 100644
> --- a/meta-oe/recipes-connectivity/blueman/blueman_git.bb
> +++ b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
> @@ -25,7 +25,7 @@ SYSTEMD_AUTO_ENABLE_${PN} =3D "disable"
>  RRECOMENDS_${PN} +=3D "adwaita-icon-theme"
>  RDEPENDS_${PN} +=3D " \
>      python3-dbus \
> -    bluez5-obex \
> +    packagegroup-tools-bluetooth \
>  "
>
>  PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-sendt=
o,,thunar"
> --
> 2.14.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

