Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB49C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 02:21:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.6526.1633918870663983532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Oct 2021 19:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iu0DEwYP;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id np13so12091515pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Oct 2021 19:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jpvhB2qGs5mrkZj9nJyUKGWNnFEcK3CmLyZMGj3Omj0=;
        b=Iu0DEwYPjbbHBXNE/Po6rycHnvvxMdc46+VLo2v5qDorSdnypGyJn97Z5Ol6ffAveQ
         UhLyB3oaqCzka+ofso9t1y8V/pYrm2eQ/KX4Qtfd3DFzqsYEBLVFjR8qoGNTfgcUkxmH
         2R/mQuaDJ/2siZ6b6279QiGyLLJhV0/9FTLSRuslSU/FV5Y7lBOVXsvsbyCqUQPaYWjU
         oIW85plz/vp4K8BBy73hgh2EYHxvdijZjzSARYfLgtkzY4NfL4JKuJ6KPKXdq3W8YeSM
         To6d5pZncFoSr4K4u27E2sIsUVOfd5y5Ry9i4Nykc98U548fx6uXMllHDxsKqZF0FkVi
         /IkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jpvhB2qGs5mrkZj9nJyUKGWNnFEcK3CmLyZMGj3Omj0=;
        b=GJlysa/z3v6FMevohTxupRm88D0bmI0E7C5E7nGX89RaxlM/PoOeguDcLIXaGz6a6e
         B29bVTa8AUEpQ9oJkFF6AelD1f6ImfOKhxJWrv3mwXkyA7NOw52E1McQ8ss+NAMDpr24
         zzohaLKf4rhE3JUy+3sXvkRd8OhnUdbT8rbHsY1OSIS6N/wPTX5PTBK9sSdKAzSTYUCc
         3hRA1nKYtk+BPjQG3fvzgI02mgHFWfq0+bFNOV7sHqwM37wiWHzSi4D5o+dJTLmp5tUX
         nrWT0O1Bfv5cloJKJGzv9HGqnEZ9Wf7E8rsfgvQ4VVA/s7iyt/hkOTOIjyQJh2yZxDLF
         a23A==
X-Gm-Message-State: AOAM532jaczV2c8f97E47MRU0BmFIGbY2d8aUqJSiSXJqmLChvaXgKA9
	V1NoC3m6ntKMi29eD9yukwBgg+Hr5iZ2w2SGdxc=
X-Google-Smtp-Source: 
 ABdhPJyW4EZ+D+7c1pRqavWS5g3sxNFxDQlwNNDO1JSOeDtS4U/2NWlwYZY3doGCyOkLmRfdxC1i4qRkXUuhpbq9hvk=
X-Received: by 2002:a17:90a:7a8b:: with SMTP id
 q11mr27124561pjf.35.1633918870089;
 Sun, 10 Oct 2021 19:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <eb413a79-1edc-74df-02b5-d8323f9127e8@gmail.com>
In-Reply-To: <eb413a79-1edc-74df-02b5-d8323f9127e8@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Oct 2021 04:20:58 +0200
Message-ID: 
 <CA+chaQdtZWhzHWTTG9mNu9PsJPxhEDkoq1G0XYVmwp=+L4p0hw@mail.gmail.com>
Subject: Re: [oe] honister merge request Oct 10th
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d7f5df05ce0a6190"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 02:21:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93210

--000000000000d7f5df05ce0a6190
Content-Type: text/plain; charset="UTF-8"

Hi, is there a reason why you've skipped the first (oldest) commit from
master which isn't in honister?
This one
https://git.openembedded.org/meta-openembedded/commit/?id=3630c30185dd5a3dc29b10a3ccbe40f19ad9aa93

On Sun, Oct 10, 2021 at 6:38 PM Armin Kuster <akuster808@gmail.com> wrote:

> The following changes since commit
> f16efc00b7fcdbfa8c53e35c1fcebed5c06d975e:
>
>   README: updated Maintainers list for Honister (2021-10-01 15:30:15 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded honister-next
>
> for you to fetch changes up to 41e43410611a2fc8aff8da36b558ed338bb85e30:
>
>   pipewire: rework PACKAGECONFIG for systemd service files (2021-10-08
> 17:23:52 -0700)
>
> ----------------------------------------------------------------
> Ivan Maidanski (1):
>       bdwgc: upgrade 8.0.4 -> 8.0.6
>
> Khem Raj (2):
>       gattlib: Upgrade to latest
>       packagegroup-meta-oe: Add lv-drivers and lvgl
>
> Nandor Han (1):
>       libiio: depend on avahi only when network backed is used
>
> Peter Bergin (3):
>       pipewire: remove manpages class
>       pipewire: also handle pipewire-media-session in systemd class
>       pipewire: rework PACKAGECONFIG for systemd service files
>
> Philippe Coval (2):
>       lvgl: Add recipe for Lightweight Graphics Library
>       lv-drivers: Add recipe for lvgl lib
>
> Richard Purdie (1):
>       gattlib: Place pkgconfig file in correct package
>
> Roland Hieber (1):
>       rapidjson: override hard-coded lib install dir
>
> Vyacheslav Yurkov (2):
>       grpc: fix cross-compilation of grpc applications
>       grpc: fix cross-compilation of grpc applications
>
>  meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb  | 24
> +++++++------
>  .../gattlib/files/0001-cmake-Use-GNUInstallDirs.patch           | 53
> ---------------------------
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             |  9
> +++--
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb      |  1 +
>  ...2-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch | 55
> +++++++++++++++++++++++++++++
>  meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb                    |  8
> ++++-
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             |  3 ++
>  meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb              | 45
> +++++++++++++++++++++++
>  meta-oe/recipes-graphics/lvgl/lvgl_8.0.3.bb                     | 40
> +++++++++++++++++++++
>  .../recipes-support/bdwgc/{bdwgc_8.0.4.bb => bdwgc_8.0.6.bb}    |  4 +--
>  meta-oe/recipes-support/libiio/libiio_git.bb                    |  8
> +++--
>  11 files changed, 176 insertions(+), 74 deletions(-)
>  delete mode 100644
>
> meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch
>  create mode 100644
>
> meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
>  create mode 100644 meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
>  create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_8.0.3.bb
>  rename meta-oe/recipes-support/bdwgc/{bdwgc_8.0.4.bb => bdwgc_8.0.6.bb}
> (91%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93208):
> https://lists.openembedded.org/g/openembedded-devel/message/93208
> Mute This Topic: https://lists.openembedded.org/mt/86217429/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d7f5df05ce0a6190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, is there a reason why you&#39;ve skipped the first (ol=
dest) commit from master which isn&#39;t in honister?<div>This one=C2=A0<a =
href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D3630c30=
185dd5a3dc29b10a3ccbe40f19ad9aa93">https://git.openembedded.org/meta-openem=
bedded/commit/?id=3D3630c30185dd5a3dc29b10a3ccbe40f19ad9aa93</a></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Su=
n, Oct 10, 2021 at 6:38 PM Armin Kuster &lt;<a href=3D"mailto:akuster808@gm=
ail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">The following changes since commit f16efc00b7f=
cdbfa8c53e35c1fcebed5c06d975e:<br>
<br>
=C2=A0 README: updated Maintainers list for Honister (2021-10-01 15:30:15 -=
0700)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded" rel=3D"no=
referrer" target=3D"_blank">https://git.openembedded.org/meta-openembedded<=
/a> honister-next<br>
<br>
for you to fetch changes up to 41e43410611a2fc8aff8da36b558ed338bb85e30:<br=
>
<br>
=C2=A0 pipewire: rework PACKAGECONFIG for systemd service files (2021-10-08=
<br>
17:23:52 -0700)<br>
<br>
----------------------------------------------------------------<br>
Ivan Maidanski (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bdwgc: upgrade 8.0.4 -&gt; 8.0.6<br>
<br>
Khem Raj (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gattlib: Upgrade to latest<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-meta-oe: Add lv-drivers and lvg=
l<br>
<br>
Nandor Han (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libiio: depend on avahi only when network ba=
cked is used<br>
<br>
Peter Bergin (3):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pipewire: remove manpages class<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pipewire: also handle pipewire-media-session=
 in systemd class<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pipewire: rework PACKAGECONFIG for systemd s=
ervice files<br>
<br>
Philippe Coval (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lvgl: Add recipe for Lightweight Graphics Li=
brary<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lv-drivers: Add recipe for lvgl lib<br>
<br>
Richard Purdie (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gattlib: Place pkgconfig file in correct pac=
kage<br>
<br>
Roland Hieber (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rapidjson: override hard-coded lib install d=
ir<br>
<br>
Vyacheslav Yurkov (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 grpc: fix cross-compilation of grpc applicat=
ions<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 grpc: fix cross-compilation of grpc applicat=
ions<br>
<br>
=C2=A0meta-multimedia/recipes-multimedia/pipewire/<a href=3D"http://pipewir=
e_0.3.34.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_0.3.34.bb</a>=C2=
=A0 | 24<br>
+++++++------<br>
=C2=A0.../gattlib/files/0001-cmake-Use-GNUInstallDirs.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 53<br>
---------------------------<br>
=C2=A0meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.bb=
" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++--<br>
=C2=A0meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
=C2=A0...2-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch | 55<=
br>
+++++++++++++++++++++++++++++<br>
=C2=A0meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.38.1.bb" rel=
=3D"noreferrer" target=3D"_blank">grpc_1.38.1.bb</a>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++-<br>
=C2=A0meta-oe/recipes-devtools/rapidjson/<a href=3D"http://rapidjson_git.bb=
" rel=3D"noreferrer" target=3D"_blank">rapidjson_git.bb</a>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++<br>
=C2=A0meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv-drivers_7.11.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">lv-drivers_7.11.0.bb</a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 45<br>
+++++++++++++++++++++++<br>
=C2=A0meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_8.0.3.bb" rel=3D=
"noreferrer" target=3D"_blank">lvgl_8.0.3.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 40<br>
+++++++++++++++++++++<br>
=C2=A0.../recipes-support/bdwgc/{<a href=3D"http://bdwgc_8.0.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">bdwgc_8.0.4.bb</a> =3D&gt; <a href=3D"http://b=
dwgc_8.0.6.bb" rel=3D"noreferrer" target=3D"_blank">bdwgc_8.0.6.bb</a>}=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 +--<br>
=C2=A0meta-oe/recipes-support/libiio/<a href=3D"http://libiio_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libiio_git.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 8 +++--<br>
=C2=A011 files changed, 176 insertions(+), 74 deletions(-)<br>
=C2=A0delete mode 100644<br>
meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.pa=
tch<br>
=C2=A0create mode 100644<br>
meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gR=
PC_BUILD_GRPC_CPP.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv=
-drivers_7.11.0.bb" rel=3D"noreferrer" target=3D"_blank">lv-drivers_7.11.0.=
bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/lvgl/<a href=3D"http://lv=
gl_8.0.3.bb" rel=3D"noreferrer" target=3D"_blank">lvgl_8.0.3.bb</a><br>
=C2=A0rename meta-oe/recipes-support/bdwgc/{<a href=3D"http://bdwgc_8.0.4.b=
b" rel=3D"noreferrer" target=3D"_blank">bdwgc_8.0.4.bb</a> =3D&gt; <a href=
=3D"http://bdwgc_8.0.6.bb" rel=3D"noreferrer" target=3D"_blank">bdwgc_8.0.6=
.bb</a>}<br>
(91%)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93208): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93208" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93208</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86217429/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86217429/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d7f5df05ce0a6190--

