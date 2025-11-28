Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D43D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 19:30:30 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2525.1764358227239982166
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 11:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W5zVj9pD;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787ff3f462bso32352077b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764358226; x=1764963026; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qrXJfO1wH5IKmR3gTQCeahRRmX8WiOEyN5hxuj8QtjU=;
        b=W5zVj9pDbNPEtVob2Luze6eRl9lbzk3diyqrusZuKkokmKTgQUE0Zr47uSQK655RXa
         UZwvqGZqWWmaJ07mcUb02s0akp42aBFn3iaGylywDdYAZ127ex7fjD68VJZvvO7dgR7v
         ndSvObwrA/UfuS9gFQxbkQ8l7aR3WT7q7T9PXiS0xryFV/MTdOmfbQZoi+9md7kPQsNV
         WIB3ChDBL6Tf2LCywHMpBaWGxxUzB1vdltxM30FaXBhcG8J6wOtfNiy5ImChogTEFt7K
         1qU6lbV9uhPfrNjyjNXRHdeKEWR/Hve/DMxv9wCdIzJtvvQPj1Lq75Av6LEwnqyz0REl
         52rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764358226; x=1764963026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrXJfO1wH5IKmR3gTQCeahRRmX8WiOEyN5hxuj8QtjU=;
        b=KCXqNMH0/Q25SLdalcjUrQDt+c4i+ZPvNZuUa5hOW6osKTjpIqyVWjXpkztq8r6DYD
         xh/doQdjj2p/w81/iYSQO2+E3YEq1JN1qkRbf1Ygy6QKN96CKOxLHOBexXUPwCFVeMQ/
         qH7A+mgwvry5g1pfJTTe7KXwxaZfdpdluR4EgDbBveqHm2ZcMgNgByE94HqSXM7qjmrP
         +Ep2XOO8SGstGAJBydvuocVwig15/cErtfJjpAxJZp+OFX/id8qR2aBBq0sGP6uUbh7c
         EAwDnJcarlO90rHZ5YkjSp3i+Dcspu9Zrserv7I4kZiH9IAHAYoE4seH/8rNopVxc+iS
         7esQ==
X-Gm-Message-State: AOJu0YxmCQxQpOc+oJ67Th1cFPBZrVqd/KN+dVVs4X5Y95aDK49uwujE
	DW5UMOEHlQRiOnXk7z+H/5L9CEWFjRfMIM5KGTTyOVOTdcsL6SSEeJjJ3+LI1C8yxLlxy4wt+wW
	hzYcLGrFnapAAPojqdclhOI4I5mTSYzA=
X-Gm-Gg: ASbGncvWgswBdIofpz1GHX8O5h8snEMB0WZHQzX0vnL9azJJ0CurzAFX/s/W1SQqzbT
	TjtG+UrfyIFT5kRQUICC9uiP8v6UlBJCMCjVTVoxctaBnPnSnPoYwS7uHhbmc4tJ5753FnUxjUp
	m1CCrAq8dTZYZvtuDKWw3eTZ7NB962nlDQtJrGxaxVEdGguYXrsz3lNgjIHq/QC9XXZbTKrAaxA
	pdVPcbbO745TupUcZF6R6yP4pH8ON+iB4fmkiUAa3e8Q8YccdV0zyCZMu+ep3MY0QnOFi79OGFX
	CJ1/pUEoDXerp5GV/yFKXRQGl4RqzjXgDBsr2IXDFsmqBFxcjc8QLdQusOmkxNuqDGIKcAqeFM/
	tiEpAyZtTmOTllsPS9xYSdIouuhmaQvDLvhLmAd2zhmjiSes=
X-Google-Smtp-Source: AGHT+IFOIw9lUv0SVJ3ovtWO8MUwSrXpiMojrERw+TnMq+vWMFhogNSF6MeF2BbkwpfDPdmi582zFsSlePJdpGkyh0o=
X-Received: by 2002:a05:690c:e4e8:b0:78a:a2f1:1414 with SMTP id
 00721157ae682-78aa2f11537mr150058397b3.18.1764358225771; Fri, 28 Nov 2025
 11:30:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764335008.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1764335008.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Nov 2025 11:29:57 -0800
X-Gm-Features: AWmQ_bmJ7_WBR0n5iF6CTzD6V7JrZ_sOynjl2-48hy-HfqHLD1diVILzd9tQDNM
Message-ID: <CAMKF1so5fVm_nszK-AC6rt--b9SV9KvRw8hLXTp_vwCOOxxGZQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004dc1150644aca93d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 19:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122123

--0000000000004dc1150644aca93d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anuj

Thanks for the PR, I wanted to note that this commit

https://github.com/anujm1/meta-openembedded/commit/1ce52bafebe3fa90771c823d=
790bafacbb42d092

results in

remote: Invalid author Gyorgy Sarvari via lists.openembedded.org

It has an author field that is rejected by the install hook. I have fixed
it before installing this patchset, but it will be worth
to investigate the trail of this patch and see how it got the author the
way it is in patch



On Fri, Nov 28, 2025 at 5:55=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Please merge these changes for scarthgap. Tested on AB and locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1130
>
> The following changes since commit
> b79cf94b4d53d75ddc4b4f468c1b1ad42a3fffe2:
>
>   grilo: fix buildpaths QA error (2025-11-19 16:56:37 +0530)
>
> are available in the Git repository at:
>
>   https://github.com/anujm1/meta-openembedded anujm/scarthgap
>   https://github.com/anujm1/meta-openembedded/tree/anujm/scarthgap
>
> Gyorgy Sarvari (1):
>   cockpit: set correct CVE_PRODUCT
>
> Gyorgy Sarvari via lists.openembedded.org (1):
>   links: set CVE_PRODUCT
>
> Hugo SIMELIERE (2):
>   libwebsockets: fix CVE-2025-11677
>   libwebsockets: fix CVE-2025-11678
>
> Khem Raj (1):
>   ot-br-posix: Define config files explicitly
>
> Pavel Zhukov (1):
>   fbida: Require opengl feature for pdf only
>
> Peter Marko (1):
>   uw-imap: patch CVE-2018-19518
>
> Yoann Congal (1):
>   zfs: fix host-related reproducibility
>
> Zhang Peng (1):
>   frr: fix CVE-2024-55553
>
>  .../recipes-filesystems/zfs/zfs_2.2.2.bb      |   6 +
>  .../openthread/ot-br-posix_git.bb             |   2 +
>  .../frr/frr/CVE-2024-55553.patch              | 253 ++++++++++++++++++
>  .../recipes-protocols/frr/frr_9.1.3.bb        |   1 +
>  .../libwebsockets/CVE-2025-11677.patch        | 161 +++++++++++
>  .../libwebsockets/CVE-2025-11678.patch        | 128 +++++++++
>  .../libwebsockets/libwebsockets_4.3.3.bb      |   5 +-
>  .../uw-imap/uw-imap/CVE-2018-19518.patch      |  24 ++
>  .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
>  meta-oe/recipes-graphics/fbida/fbida_git.bb   |   2 +-
>  meta-oe/recipes-support/links/links.inc       |   2 +
>  .../recipes-webadmin/cockpit/cockpit_304.bb   |   2 +
>  12 files changed, 585 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.p=
atch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.p=
atch
>  create mode 100644
> meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
>
> --
> 2.52.0
>
>

--0000000000004dc1150644aca93d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Anuj<div><br></div><div>Thanks for the PR, I wanted to not=
e that this commit</div><div><br></div><div><a href=3D"https://github.com/a=
nujm1/meta-openembedded/commit/1ce52bafebe3fa90771c823d790bafacbb42d092">ht=
tps://github.com/anujm1/meta-openembedded/commit/1ce52bafebe3fa90771c823d79=
0bafacbb42d092</a></div><div><br></div><div>results in</div><div><br></div>=
<div>remote: Invalid author Gyorgy Sarvari via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a></div><div><br></div><div>It has an=
 author field that is rejected by the install hook. I have fixed it before =
installing this patchset, but it will be worth</div><div>to investigate the=
 trail of this patch and see how it got the author the way it is in patch</=
div><div><br></div><div><br></div></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 28, 202=
5 at 5:55=E2=80=AFAM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss.qual=
comm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Please merge these changes for scarth=
gap. Tested on AB and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1130" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1130</a><br>
<br>
The following changes since commit b79cf94b4d53d75ddc4b4f468c1b1ad42a3fffe2=
:<br>
<br>
=C2=A0 grilo: fix buildpaths QA error (2025-11-19 16:56:37 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://github.com/anujm1/meta-openembedded" rel=3D"noref=
errer" target=3D"_blank">https://github.com/anujm1/meta-openembedded</a> an=
ujm/scarthgap<br>
=C2=A0 <a href=3D"https://github.com/anujm1/meta-openembedded/tree/anujm/sc=
arthgap" rel=3D"noreferrer" target=3D"_blank">https://github.com/anujm1/met=
a-openembedded/tree/anujm/scarthgap</a><br>
<br>
Gyorgy Sarvari (1):<br>
=C2=A0 cockpit: set correct CVE_PRODUCT<br>
<br>
Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer" target=3D"_blank">lists.openembedded.org</a> (1):<br>
=C2=A0 links: set CVE_PRODUCT<br>
<br>
Hugo SIMELIERE (2):<br>
=C2=A0 libwebsockets: fix CVE-2025-11677<br>
=C2=A0 libwebsockets: fix CVE-2025-11678<br>
<br>
Khem Raj (1):<br>
=C2=A0 ot-br-posix: Define config files explicitly<br>
<br>
Pavel Zhukov (1):<br>
=C2=A0 fbida: Require opengl feature for pdf only<br>
<br>
Peter Marko (1):<br>
=C2=A0 uw-imap: patch CVE-2018-19518<br>
<br>
Yoann Congal (1):<br>
=C2=A0 zfs: fix host-related reproducibility<br>
<br>
Zhang Peng (1):<br>
=C2=A0 frr: fix CVE-2024-55553<br>
<br>
=C2=A0.../recipes-filesystems/zfs/<a href=3D"http://zfs_2.2.2.bb" rel=3D"no=
referrer" target=3D"_blank">zfs_2.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A06 +<br>
=C2=A0.../openthread/<a href=3D"http://ot-br-posix_git.bb" rel=3D"noreferre=
r" target=3D"_blank">ot-br-posix_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../frr/frr/CVE-2024-55553.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 253 ++++++++++++++++++<br>
=C2=A0.../recipes-protocols/frr/<a href=3D"http://frr_9.1.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">frr_9.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0.../libwebsockets/CVE-2025-11677.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
61 +++++++++++<br>
=C2=A0.../libwebsockets/CVE-2025-11678.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
28 +++++++++<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.3.3.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +-<br>
=C2=A0.../uw-imap/uw-imap/CVE-2018-19518.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
24 ++<br>
=C2=A0.../recipes-devtools/uw-imap/<a href=3D"http://uw-imap_2007f.bb" rel=
=3D"noreferrer" target=3D"_blank">uw-imap_2007f.bb</a> |=C2=A0 =C2=A01 +<br=
>
=C2=A0meta-oe/recipes-graphics/fbida/<a href=3D"http://fbida_git.bb" rel=3D=
"noreferrer" target=3D"_blank">fbida_git.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A02=
 +-<br>
=C2=A0meta-oe/recipes-support/links/links.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-webadmin/cockpit/<a href=3D"http://cockpit_304.bb" rel=3D=
"noreferrer" target=3D"_blank">cockpit_304.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A012 files changed, 585 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-55553.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2025-11677.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2025-11678.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-=
19518.patch<br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--0000000000004dc1150644aca93d--

