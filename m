Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C2DCE8364
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:14:32 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.59201.1727712869792937427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gkt9hpoX;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2872134c806so1092898fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727712869; x=1728317669; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6BKZT5rwhkCx6iehn4bSbvxMdGJoKcuXxz381gSx7Bg=;
        b=Gkt9hpoX+/JO2+Tp7SHOZoL7NsSsiiVTlCZrUOM4tnE2lVlx20Eic9s67mHUm/kZVV
         wgmEY56urpxC2nLQULyzorUiYafzzK7PAFJEjsUXFu/lxG7mY/q3MqPiObu8l7QB20CV
         mn/R2tL5WLbDPy6QeRr/aFntMy+IktnDOb/68yCZ0aco996dW3VLGhjGZ3SSd1WgiO0h
         Vh8rV4/mYj1yNoMqhhZxEqwze8JKtc+OYIftDE2WCfbuAlspglAh04zfaVmRe63GcX9/
         Hk48f5xMpz9Vs1XBVGUId5EnRafLLt8BFW1/nQMl0amJDlYzUT20cKqjbXqgK6OnDe5N
         walQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727712869; x=1728317669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BKZT5rwhkCx6iehn4bSbvxMdGJoKcuXxz381gSx7Bg=;
        b=vBkxBIiF2lFJ+0SB5PuKecnbuN9ow5UGdcabQuZ6JJR8S89Nwy77KPaGrMuPiXqBpt
         3rF45uRG0QZcql1iKpnELgZTUi9VGXTUYA/ZhTiuPPGqhdOCpjaMoqLPZvluFnKS0RGE
         x3ICcgYI/UQiN5Cq6mGtfnpH3+S/8PJ7ycKkJfaJHCffCJyqykIPT3CT90scfhVOJfhX
         1jxe44Qj32PkB4a4cgzraDsbtF81tC99rqOOFgM8X+vy3wzOcIRel3IvVhkPf8eACD7i
         gBHAeMeTlDykJQ7ibsI/XUKjuqjBrAMbs0WDwoefnQ7Wgskn/gP9KA5fDLF08hmcq8od
         hpvw==
X-Gm-Message-State: AOJu0YxyAfWeZf2C0BffsJuu7Ewxz2FMO3IFWQ+kC1Ei9iFUov/lcr4Y
	5LWleHIOeDIeZbGCHtpJ0YQbFUTJayn8cs1vNNYJyP7umyofnnF8PmwyzgC60LZJKZ20RhM8K2f
	dsqmijvjrEG5qX7UbzHaL31vUGFXHjg==
X-Google-Smtp-Source: AGHT+IHWVf7y7LET3TKLheaj7G1OjH/0tGyBvbg8Q6GOTa1kYRb7B/bLQpTRpSIAqxHgSROZpVTrOX37yK1FxEdohbg=
X-Received: by 2002:a05:6870:9e9c:b0:259:88b4:976 with SMTP id
 586e51a60fabf-28710c13c2amr7645228fac.43.1727712869003; Mon, 30 Sep 2024
 09:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240930120524.2051403-1-niko.mauno@vaisala.com>
 <CAMKF1sp_0-6Ep9av_PMS37EfDxKz4vA7UswcY4nPbgPzTjLd+Q@mail.gmail.com> <5853cef6-3edf-4614-9b0e-fd572b6286d4@vaisala.com>
In-Reply-To: <5853cef6-3edf-4614-9b0e-fd572b6286d4@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Sep 2024 09:14:17 -0700
Message-ID: <CAMKF1soMOpdvsV7gf7c82YdFaV6UvGHX1hznRifPiu0qnf_vhQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/4] mysql-python: Remove obsolete recipe
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d4bf590623587fd4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112608

--000000000000d4bf590623587fd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rebase your series then on master next and resend

On Mon, Sep 30, 2024 at 8:34=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com>=
 wrote:

> On 30.9.2024 17.56, Khem Raj wrote:
> > Thanks for the cleanup, it would be cool to shed some more perhaps. I
> > had to resolve merge conflicts to get this staged into master-next,
> > please check if all is ok on master-next
>
> Hi Khem, glad if I can help.
>
> To me the following three commits currently seem to be in good shape in
> master-next:
>   - "lio-utils: Remove obsolete recipe"
>   - "telepathy-idle: Remove obsolete recipe"
>   - "cherokee: Remove obsolete recipe"
>
> Unfortunately with two commits I noticed some issues, which I will try
> to detail below:
>
>   - "openlmi-tools: Remove obsolete recipe" commit in master-next
> currently removes only the RDEPENDS line in
> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb, it should
> remove also two more lines in that file which reference
> 'packagegroup-meta-oe-extended-python2'. Furthermore, it doesn't remove
> meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb as it should.
>
> Please see
>
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D7b178cf9ea8fe2683741f75ebc220f0f70cb45f8
> vs.
>
> https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.205140=
3-4-niko.mauno@vaisala.com/
>
>   - "mysql-python: Remove obsolete recipe" commit in master-next
> currently removes only the recipe files
> meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with=
-MariaDB-with-10.3.13.patch
>
> and meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb (as it should), but
> it doesn't remove the two lines referencing
> 'packagegroup-meta-oe-dbs-python2', nor the
> RDEPENDS:packagegroup-meta-oe-dbs-python2 declaration in
> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as it should.
>
> Please see
>
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D1a5d5087f66ad3cea99473223971aab9391ffc94
> vs.
>
> https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.205140=
3-1-niko.mauno@vaisala.com/
>
> Kind regards, Niko
>

--000000000000d4bf590623587fd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Rebase your series then on master next and resend=C2=A0</=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Sep 30, 2024 at 8:34=E2=80=AFAM Niko Mauno &lt;<a href=3D"mailto=
:niko.mauno@vaisala.com">niko.mauno@vaisala.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 30.9.2024 17.56, Khem Raj wrote:<br>
&gt; Thanks for the cleanup, it would be cool to shed some more perhaps. I<=
br>
&gt; had to resolve merge conflicts to get this staged into master-next,<br=
>
&gt; please check if all is ok on master-next<br>
<br>
Hi Khem, glad if I can help.<br>
<br>
To me the following three commits currently seem to be in good shape in <br=
>
master-next:<br>
=C2=A0 - &quot;lio-utils: Remove obsolete recipe&quot;<br>
=C2=A0 - &quot;telepathy-idle: Remove obsolete recipe&quot;<br>
=C2=A0 - &quot;cherokee: Remove obsolete recipe&quot;<br>
<br>
Unfortunately with two commits I noticed some issues, which I will try <br>
to detail below:<br>
<br>
=C2=A0 - &quot;openlmi-tools: Remove obsolete recipe&quot; commit in master=
-next <br>
currently removes only the RDEPENDS line in <br>
meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-meta-oe.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>, it sho=
uld <br>
remove also two more lines in that file which reference <br>
&#39;packagegroup-meta-oe-extended-python2&#39;. Furthermore, it doesn&#39;=
t remove <br>
meta-oe/recipes-extended/openlmi/<a href=3D"http://openlmi-tools_0.10.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">openlmi-tools_0.10.5.bb</a> as it sho=
uld.<br>
<br>
Please see <br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaste=
r-next&amp;id=3D7b178cf9ea8fe2683741f75ebc220f0f70cb45f8" rel=3D"noreferrer=
" target=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?=
h=3Dmaster-next&amp;id=3D7b178cf9ea8fe2683741f75ebc220f0f70cb45f8</a> <br>
vs. <br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/202409301205=
24.2051403-4-niko.mauno@vaisala.com/" rel=3D"noreferrer" target=3D"_blank">=
https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.2051403-=
4-niko.mauno@vaisala.com/</a><br>
<br>
=C2=A0 - &quot;mysql-python: Remove obsolete recipe&quot; commit in master-=
next <br>
currently removes only the recipe files <br>
meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-M=
ariaDB-with-10.3.13.patch <br>
and meta-oe/recipes-dbs/mysql/<a href=3D"http://mysql-python_1.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">mysql-python_1.2.5.bb</a> (as it should),=
 but <br>
it doesn&#39;t remove the two lines referencing <br>
&#39;packagegroup-meta-oe-dbs-python2&#39;, nor the <br>
RDEPENDS:packagegroup-meta-oe-dbs-python2 declaration in <br>
meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-meta-oe.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a> as it s=
hould.<br>
<br>
Please see <br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaste=
r-next&amp;id=3D1a5d5087f66ad3cea99473223971aab9391ffc94" rel=3D"noreferrer=
" target=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?=
h=3Dmaster-next&amp;id=3D1a5d5087f66ad3cea99473223971aab9391ffc94</a> <br>
vs.<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/202409301205=
24.2051403-1-niko.mauno@vaisala.com/" rel=3D"noreferrer" target=3D"_blank">=
https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.2051403-=
1-niko.mauno@vaisala.com/</a><br>
<br>
Kind regards, Niko<br>
</blockquote></div></div>

--000000000000d4bf590623587fd4--

