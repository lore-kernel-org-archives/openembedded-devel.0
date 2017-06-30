Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id B97A878260
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 12:10:05 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id y70so7294538vky.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 05:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=MhqamW3zUKDqWi3rbH+wOv5cVww0GwAABal/9QpjnC0=;
	b=h/u6BGnQtngV5GSZsk8haKDLll3uwEWc6boPToFTh+o+Gefgdp95+TIGpUuhcOY3Mg
	MxzFlbTrem8SgVtsAWVKMpFHqPq1koSDRmiIaCFwO2i9PWKRfarfBHe6TXlyz27B1YHc
	3nsDVb4iHyPzzQziAVhzgNgEdc11VDwz44gSAhwOaTcsKqSGisxlslIB8mNBE8VOGQ5O
	glm/VqMnahmI75ruWPdin6YczQSNlTC4KiIo/uypty6Lg0/z5Iws7aLyVtZckDHpguqx
	JQXZPNEcUyzEYXm8ZG1ixsh9/VQkrE+hQQyeYuNUCjFi4mclMSnjtlcm0eRwNWmGyNgT
	TCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=MhqamW3zUKDqWi3rbH+wOv5cVww0GwAABal/9QpjnC0=;
	b=DgQsZ8OSrkkGyWqsSFrrEwv44hTn7JiIsm7pJE4Jo49Gk+iM5Ss21TiHXYds0AdK1T
	t0CMJqZPZfsFwTJu1FBP6qg+VfkC6IpEGLAPlkf9VsOAnJJZ6/TC09OdnJmCO5tDk4BR
	n4d78LtTmfCNC5fT27XxF6hirZdnewGoWCbQIIwj4pBfmQb5rggRVCmLh/on3dAD/L4q
	HV+zSIwqjn4W/1uidk6IlwD6QeX+u/oBEttEp4TIYRulFC/+0BZJZY65xHV8wfzkzmNq
	Umyb4bnjQYxwvvukbqMpLFJUg3sAYvVdcHPPUEbIxFqB8t9VpAQAVMy/tlC6Vy4KY9OL
	ULmA==
X-Gm-Message-State: AKS2vOzztJyfY00U6YPcKFwDBmF9QZMjCe29BDfi3F6SxPV4vV9VUUyL
	Xt2nPD2cXUtALYpQn6NyUnpRZk3MKQ==
X-Received: by 10.31.186.130 with SMTP id k124mr11518038vkf.124.1498824606077; 
	Fri, 30 Jun 2017 05:10:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Fri, 30 Jun 2017 05:10:05 -0700 (PDT)
In-Reply-To: <20170630120731.3745-1-schnitzeltony@googlemail.com>
References: <20170630120731.3745-1-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 30 Jun 2017 14:10:05 +0200
Message-ID: <CALbNGRRU67B0TZXShLBxdsMWZnjhYQvGm-PmVcN196vFByoonw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/3] gimp related updates
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
X-List-Received-Date: Fri, 30 Jun 2017 12:10:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2017 at 2:07 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> It started with gegl failing with gcc 7.1...
>
> Andreas M=C3=BCller (3):
>   babl: update 0.1.16 -> 0.1.26
>   gegl: update 0.3.4 -> 0.3.16
>   gimp: update 2.8.20 to 2.8.22
>
>  meta-oe/recipes-graphics/babl/{babl_0.1.16.bb =3D> babl_0.1.26.bb} | 4 +=
+--
>  meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb =3D> gegl_0.3.16.bb}  | 4 +=
+--
>  meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb =3D> gimp_2.8.22.bb} | 4 +=
+--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-graphics/babl/{babl_0.1.16.bb =3D> babl_0.1.26.bb=
} (72%)
>  rename meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb =3D> gegl_0.3.16.bb}=
 (91%)
>  rename meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb =3D> gimp_2.8.22.bb=
} (89%)
>
> --
> 2.9.4
>
Please ignore this series - it went out a bit over enthusiastic...

Andreas

