Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id E4CB57E437
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 19:53:11 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m4so22319365qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 11:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tYOXSPSQ6T/3rtI0s8Ep3NSVjxxBO+w27O0Zppcswo4=;
	b=WzH4Skz7mK0o0kUpk60U3nfyDfO0BAROK3d8TiHaAUqxd/AF4gSF2hGeOu8dbSFgq/
	ttoDIOuGcRvg9xImwXEXqTonkizwOORaiVblg4widI7nCdcEwsmOu+EVzDZzuwkC8hyY
	Oe9uf3tSZro81xKwXU5OzP7ncRMmlfcnJmP3KD+E/m/FJ2xoWBfFU3sDnHYj4KQwq4nv
	31d5tiIcRZH0R2DtzvlYLKt2etHvZ0UhzE40adLuU1Q3c3vKYw01uGp6izA8dyeQ5JXd
	xwIambhxhgPmMA8NebbKoN3WPaKbdh74nYtHriOODRDuL+5jGoKaD4qndBSnnFFjgOUM
	xQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tYOXSPSQ6T/3rtI0s8Ep3NSVjxxBO+w27O0Zppcswo4=;
	b=O801ngWsxcbPlFP4e5IT6i3aLnkOap47jSPAJoxfZ3Eg/CihqGg7MVCUFnScykRIv0
	rWHT0Ovh7csBQFJAecsTCOjARacQfYmoSAYy3deExZH38MH70zK/r+XzZISdC4sOJ9gK
	uDB6g6NSWuUKxU5xiA50Sm1uF53cVfDJoui0sYSHCgl6gldIg/B4i9Ug2mSMDqs/AAIh
	sOi57xSli8n/qRxvb3wJRuPvzP1EQ0U8Vo20ljvO/4L4TvBOvXuoUHUVopQj0l6Dm4KR
	UD6blvgjOiYbsGcrnEAQC/Y3Gn7GX+fP0uy61mJfT+q67ps9FZD9TgA24dGV+PxtnGyO
	zDFQ==
X-Gm-Message-State: APjAAAU6YkXaJploRv0PbI5W2G6DDY4pm/iJ3hRCEyh4r45k7wgQge8J
	n+sXf0vgh4VUF0LSq0jVYF3+pfm7GCZGfGzSmKw=
X-Google-Smtp-Source: APXvYqyd+TJv+waxe+dj4etxT5VEKIy7RduQjNY1uK7B8QWxuCtdrjE8P9WLE8x6cI4U9hiJuzqb9XAsLt0/ymMa6WA=
X-Received: by 2002:a05:620a:a9a:: with SMTP id
	v26mr23724402qkg.71.1572983592292; 
	Tue, 05 Nov 2019 11:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20191105074104.24378-1-schnitzeltony@gmail.com>
In-Reply-To: <20191105074104.24378-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 11:53:01 -0800
Message-ID: <CAMKF1sr+WRrR8xkF-+SDaZFoa+eZtr=QkxNG8oqzvJbL_ya-Ug@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add gnome help packages to image according to IMAGE_LINGUAS
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
X-List-Received-Date: Tue, 05 Nov 2019 19:53:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2019 at 11:41 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> In case
>
> * 'helpfiles' is in DISTRO_FEATURES and
> * PACKAGE_NO_HELP_SPLIT is not set to '1'
>
> those help packages matching language selections in IMAGE_LINGUAS are
> added to
> image automatically.
>
> For more details see:
>
> [1]
> https://github.com/openembedded/meta-openembedded/blob/master/meta-gnome/=
classes/gnome-help.bbclass
> [2]
> https://github.com/openembedded/openembedded-core/commit/3a9e9585aeb67234=
901b2f842113dbe20c3801b3
> ---
>  meta-gnome/conf/layer.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index 862d622ee..996f4f64a 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -8,6 +8,8 @@ BBFILE_COLLECTIONS +=3D "gnome-layer"
>  BBFILE_PATTERN_gnome-layer :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_gnome-layer =3D "7"
>
> +IMAGE_LINGUAS_COMPLEMENTARY_append =3D " *-help-%s"


This should be dependent on distro feature and here it=E2=80=99s unconditio=
nal


> +
>  # This should only be incremented on significant changes that will
>  # cause compatibility issues with other layers
>  LAYERVERSION_gnome-layer =3D "1"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

