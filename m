Return-Path: <asselsm@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id C7924745A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 13:11:22 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id e190-v6so8857196ybb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 06:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=j1FYr47Ri2Ghy9BiRJChCbqgMUirwdA0CMEtvpX+AkA=;
	b=dvKKNXiHDYr+xjkNCCCGt8heZePW+bH9QiAHltkdNGIIoupoXdBVMFZCwgyZWu87o/
	WWzud5JWwGp4zAeXiNYdIg3zAN3SWIas+gTFxr7EheXQlg/g0fh/JLF2h3lkjJuD3ht4
	syOhxXi7heM858wkwYNTFz3xLjwSKGlxqcu6m0ErRNzLJDwHF6bf35QZD7ysgYfETYGd
	iR1hwVKT7PQpVsjLuogJJc61wSzLo9ofxzjnR1PO2Ddef2wL9RFhJlevpvQAMQQ88V/B
	2T+lQ4i34eBepz70jGHf+bVWpHOy9DQv2/1DHD2xIue1oitngwkVnXS2+ld9Sw9OCt8s
	Zy7w==
X-Gm-Message-State: ABuFfoj5iis+V5Hfy8jWoDBwJfmVJgbAmYrfr+cQyXnTmYxVfKaHMBkw
	y1/sHwzPluD9uv34Zp/XhEG8S5As+QOwXmUCL1E=
X-Google-Smtp-Source: ACcGV60N2mPMSepJEjVE+g0rb6nE+Hr23jDh7xqWN3bY92r/xyyqZchUeX6sd/G6oIfDjZXFVPq+HsgyDl+4Tja2J4s=
X-Received: by 2002:a25:200b:: with SMTP id
	g11-v6mr11737896ybg.390.1539695483367; 
	Tue, 16 Oct 2018 06:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <1539637881-20308-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sowVnGuDxLyK1mmgyT9B2=HbLv-pxWuW+jsAR1r+8Opnw@mail.gmail.com>
	<03c98f69-1127-172e-ac59-bb7450f37c04@windriver.com>
In-Reply-To: <03c98f69-1127-172e-ac59-bb7450f37c04@windriver.com>
Reply-To: mark.asselstine@windriver.com
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 16 Oct 2018 09:11:12 -0400
Message-ID: <CAPuovELzqySBRn2e+jXO4RjMC6-NwUZkpQPBhJn3PQcxZXB2Lw@mail.gmail.com>
To: hongxu.jia@windriver.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] polkit: fixup 'installed but not shipped' error
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
X-List-Received-Date: Tue, 16 Oct 2018 13:11:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 3:35 AM Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
> On 2018=E5=B9=B410=E6=9C=8816=E6=97=A5 06:01, Khem Raj wrote:
> > may be we can use bitbake variables here and also optimize it a bit if
> > possible ?
> > too many installs there
>
> It is not the issue of polkit, but gobject-introspection.bbclass in oe-co=
re,
> I've sent the fix to oe-core.

Hongxu, my search for a fix overlooked your patch, thanks for the
heads up. For now let's withdraw my patch.

Mark


>
> Here is my fix:
>
> commit 29b41806fa5679881efd04b0b41ecbf4ddd07d11
> Author: Hongxu Jia <hongxu.jia@windriver.com>
> Date:   Tue Oct 16 15:31:23 2018 +0800
>
>      gobject-introspection.bbclass: fix gir installed but not shipped in
> any package while multilib enabled
>
>      Since commit [9524330 gobject-introspection: fix multilib install
>      file conflicts] applied in oe-core, while multilib enabled, gir
>      files will be installed to `${libdir}'.
>
>      Refer above commit, modify gobject-introspection.bbclass to
>      split gir to package correctly.
>
>      Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
> diff --git a/meta/classes/gobject-introspection.bbclass
> b/meta/classes/gobject-introspection.bbclass
> index b6160b8..a323c1f 100644
> --- a/meta/classes/gobject-introspection.bbclass
> +++ b/meta/classes/gobject-introspection.bbclass
> @@ -40,4 +40,4 @@ FILES_${PN}_append =3D " ${libdir}/girepository-*/*.typ=
elib"
>
>   # .gir files go to dev package, as they're needed for developing (but
> not for
>   # running) things that depends on introspection.
> -FILES_${PN}-dev_append =3D " ${datadir}/gir-*/*.gir"
> +FILES_${PN}-dev_append =3D " ${datadir}/gir-*/*.gir ${libdir}/gir-*/*.gi=
r"
>
> //Hongxu
>
> >> +        mv ${D}${libdir}/gir-1.0 ${D}/usr/share/.
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

