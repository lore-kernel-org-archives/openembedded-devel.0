Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7682ECA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 17:53:00 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.1336.1757008377374671376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 10:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X9iv2+Cm;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-723bc91d7a6so13018607b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757008376; x=1757613176; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx1QLbI2dfYlGIUGO7hUeW56lnIv3usIieQZ/yTvD18=;
        b=X9iv2+CmNKiVtEpL0Gm6U8FOaEdMmd8vj3GYrM+BEwbtponynb7HC4qOSaCvQKE+S/
         sJeohub0jaENcm2FVzVusou++zIexza+ZC9m5tFTDwVyn4bkJft7CZEAbJ0nwvyuVDyS
         amNdHvqXheg81MzfP+2Bqnp42B43KzKu0E1R6h075tEY8kmdCPmQtk+Eon4evAqBCcMl
         tX4hLjNeEnjbiRjTgeZYI9oEDvNkfw37UL4zvKaJBgOiswSSKi/oxGaqsl203QVoM95e
         9GAfGOofGtedVtJ/R9fnC6EBYx025MGAmj84kL6p/xvfesIxPhVFjc4+SSiBE/RStYR2
         p7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757008376; x=1757613176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nx1QLbI2dfYlGIUGO7hUeW56lnIv3usIieQZ/yTvD18=;
        b=aYjNIQThye3DVT/ymM4UHCy6ilERrcWuQHv1Etpm1H2pb/PJf0Ht2uNe4UvqLJrF5F
         IRiT2G90KDY3e2oDrHNYwfUo7a+fc614peK67KeX9dwJYI8v8LRmuDFwCJdvILIaP8yu
         M6svl/MLmlLGvpRxl7apZVL78Xj0w9jY5VPwK1B6+Q+aHG7+Qjo6GJf+cVWN86r6j7kr
         J9uWl6M6mgiV37zMy7ey84shRn/wEHcrB9/S9w1fTSkaO1Xwjr8YL/8QT53XMV0pgue6
         CmjjnqiOlM3bC/jdH+UR2VrXzsK60xNViVKjSPWOqu9gbfig3mvz/S3QOOWLFtbnaSKu
         vMBQ==
X-Gm-Message-State: AOJu0YyUAxI/wYLjao9GJQ9GM4xih3+zXdl34J4VCHNo2YQgrnDzU38C
	dMMRjRX/qNb22INMacTuIUCSvuGQ26d/NBtNVRCMwVoD6igC67tmNP+wsYGytrXnKNH1EAAAw7q
	TUmjC+ecI84sHzj3+OMasfWAgwuUq0t4=
X-Gm-Gg: ASbGncuqIBQtcby4T0TEq/wiNj1QvujHgj3ZlLYTG6dBDDkq6amGu9DUfSVaYWyBMjT
	/PHbabiakQk7cyEzoJZdDbUuPPju6WnF6FqP4OvCjFbyCT0n/cjl0Vfnr3xoh8dTpwf1tetxIze
	PgGf6rSeu02A4tnQGsYwj64+0YP4eoEXGJr2VVs9V9xiVzBaS82B+i5qFJKaLBn5NqYTh4v/Not
	Ljjz9PP5Cqti1Hjw/acrrbpPkXvllswKqQAmSj2iVOWqtyt2kB9YSuLCi0pIrNCKD74mc2wUskw
	+rWalCPTqjep4tQL7inuDj+ZTuKxBoJnpFUVMdKuQsOb1iyZrjmCdvXaMbY4Osps
X-Google-Smtp-Source: AGHT+IH1Hac8K/6hzQYjHNnXmqx3k8DPXY2LZMAvKzWltEiz3Jy887a1qJWVfFMRRp4RtNp0Q4Lwx/eMb4qlS95NF9s=
X-Received: by 2002:a05:690c:6a03:b0:724:c055:3cf3 with SMTP id
 00721157ae682-724c0553f47mr31360487b3.14.1757008376337; Thu, 04 Sep 2025
 10:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <18620AA9DA393CA3.28859@lists.openembedded.org> <QE522T.UEJTRZ12736I1@t-online.de>
In-Reply-To: <QE522T.UEJTRZ12736I1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Sep 2025 10:52:29 -0700
X-Gm-Features: Ac12FXxpF3ddj_vuxc0EbGHO-p-fWifH06GlBQATXcK28fCpfTV1-PqekrIu_w0
Message-ID: <CAMKF1soWtutXvORmqQNV-Zqs=+x9uQQj7zsCkebd-g_1NzDyxQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC][PATCHv2] glibmm: update 2.80.0 -> 2.85.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 17:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119288

does it have hard dependency upon gtk 4.20.0 or will it work with 4.18 as w=
ell.

On Thu, Sep 4, 2025 at 2:37=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> v2: fix LIC_FILES_CHECKSUM
>
> On Thu, Sep 4 2025 at 11:35:14 +02:00:00, Markus Volk via lists.openembed=
ded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - LIC_FILES_CHECKSUM changed but LICENSE is still valid update is require=
d for gtk 4.20.0 Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../{gl=
ibmm-2.68_2.80.0.bb =3D> glibmm-2.68_2.85.0.bb} | 6 +++--- 1 file changed, =
3 insertions(+), 3 deletions(-) rename meta-oe/recipes-core/glib-2.0/{glibm=
m-2.68_2.80.0.bb =3D> glibmm-2.68_2.85.0.bb} (75%) diff --git a/meta-oe/rec=
ipes-core/glib-2.0/glibmm-2.68_2.80.0.bb b/meta-oe/recipes-core/glib-2.0/gl=
ibmm-2.68_2.85.0.bb similarity index 75% rename from meta-oe/recipes-core/g=
lib-2.0/glibmm-2.68_2.80.0.bb rename to meta-oe/recipes-core/glib-2.0/glibm=
m-2.68_2.85.0.bb index 48a1a2a624..325ad4d5cd 100644 --- a/meta-oe/recipes-=
core/glib-2.0/glibmm-2.68_2.80.0.bb +++ b/meta-oe/recipes-core/glib-2.0/gli=
bmm-2.68_2.85.0.bb @@ -2,8 +2,8 @@ SUMMARY =3D "C++ bindings for the glib l=
ibrary" HOMEPAGE =3D "http://www.gtkmm.org/" SECTION =3D "libs" LICENSE =3D=
 "LGPL-2.1-only & GPL-2.0-only" -LIC_FILES_CHKSUM =3D "file://COPYING;md5=
=3D42dfffebc56fec7527aac53b7a89d1d8 \ - file://COPYING.tools;md5=3D75141926=
0aa954499f7abaabaa882bbe" +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf66=
1c1e3793e55c8d1051bc5e0ae21 \ + file://COPYING.tools;md5=3D570a9b3749dd0463=
a1778803b12a6dce" DEPENDS =3D "mm-common glib-2.0 libsigc++-3 glib-2.0-nati=
ve" @@ -12,7 +12,7 @@ inherit gnomebase SHRT_VER =3D "${@d.getVar('PV').spl=
it('.')[0]}.${@d.getVar('PV').split('.')[1]}" -SRC_URI[archive.sha256sum] =
=3D "539b0a29e15a96676c4f0594541250566c5ca44da5d4d87a3732fa2d07909e4a" +SRC=
_URI[archive.sha256sum] =3D "0771306711299fbf62e53c752d53ed581635127167a6cc=
79ae05f2b8421d29d7" S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119276): https://lists.openembedded.org/g/openembedde=
d-devel/message/119276
> Mute This Topic: https://lists.openembedded.org/mt/115060688/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

