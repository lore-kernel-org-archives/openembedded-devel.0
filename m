Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0E7D2F33F
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 16:24:33 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62838.1768321468317103914
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 08:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tt15oy5U;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64472c71fc0so7702852d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 08:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768321467; x=1768926267; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n1SeTgWOoAyuTFbcGEaRHOeGaVJPNNeXqiWaC2v1Y3w=;
        b=Tt15oy5Uymdl2NsDaIHY1OfrkrLEw1Z7K5McIkmzidTOUVcvYjeI/tRNSI/b0AVJkg
         hU0z2kwz/Cckb0GKYblaxs7gBGcZVDZD/ueLB+rHQlqZxd/KT0m+SRIwqR017+krm5b/
         YX+Z7b1eH5d5peRjWsKI3c0dJiumurHep4UwD2B76CqhLisDx5nST4DOcCqPxwa7Kdt5
         XtR2gRNUOCTLfVYHDimVc3NWGo4d0apOIYiFXjeAeV3ow5FcudTC5QsgQOr7/L4M/PPe
         x4GRDEYtdzElVId022hUMQBPWF7Ndok4FRPxj9qeZihyDrRz8RmxeNLvE3eoRBrzZ1Pd
         q27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768321467; x=1768926267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1SeTgWOoAyuTFbcGEaRHOeGaVJPNNeXqiWaC2v1Y3w=;
        b=hladscBwJNeVYjPQ7DgWYNrXIKnRTlx7QGDbzdbQQSWBi4oYURyBc1m9vdqKBYV4Vx
         rgHDkY+KzpVIoYKIeQAXz/Ri6UCVxOhPzLOE9Xs4m4Uyu8bNtnM/xhSUNAMswOfYPFiD
         2vUHjrHzSNfw6ZP+JEf1fKn1EnqkwHNZDLvT3g0P8qdY3WnZznEYguUi5RytsRDj73D8
         iWduFL1wzlnZTCGmFSf7J0DGQT+0SqlRUrQegi6ohX5MzttOb4Dgmx44O4uwFW7dOPa5
         26FTkxWzutvi2O/oSZ3p1z9CQUMabIbkGnxTCLY1BZFpJB6X41eOBWQTIKh4I9usCq90
         Nj7w==
X-Forwarded-Encrypted: i=1; AJvYcCUvInLBVW7sSpDo9V92hsB9wOp3UhLHCGB7/jMaY9ejq23g7+INJfekPSwD2QWZErdBH9/1GH14jfNec+Qa5GJQqUU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxjaPRKgjaZoNdMnh1ENqwZHfPilh16XqWS1iHHSCOgPGGQpUMW
	mo7l/vekAGtN48VMQcPxnwFBHIzUqdwqi+NAVgkldQZFbDdEyrJlQhJi5SsSflOICalNOyAHJ0G
	pil+EPJP5ObcaBGTaDawy93szwVoNpAs=
X-Gm-Gg: AY/fxX5jnjSpcLM1NDSM9jhHgpP8QXJZt/++ZoOkgSKxOUVi6KeSlZRkIYLfumTR2VP
	DBbdaEHON+0DhDVJxfdmvf6zeYGN4ocTXfEv0eDcurs5FkJxgcx6d0sC1l58OF/UTm9SrK2DgkN
	QC1hL6cnkmXnhwtireB7YRw4rr+EaBy7gUzGntrEw2dHrXW4TztSyV03DkbItFCkcH82AKZM+VG
	pOJKCJnRmKI0mjI9AMnjuDs+PTbjaqpEwjhdCrXIGF1XXlqIB3nQrofr4JpLXwIA268GlXjMdDe
	gFX9xB86MPtGehVzWE4PxDaXLOz+KFY08Sbh1WYDa2S7tyGljHxzz5F5Bo6qvyRwyRWMAuFtEY+
	UMrwwZUn5wMkgLFOiqVWJambzepDOOTzh2R90Vg==
X-Google-Smtp-Source: AGHT+IFRl1P+Q/nifG5Cg+DTzTkVK0hBtmhgo0MgH6xahY/7w3m1D40LqGXxgY9iLHkzl6wWKjnne0yyQy//aafJurw=
X-Received: by 2002:a53:b2f5:0:b0:644:444e:370e with SMTP id
 956f58d0204a3-64716bdd6c8mr15160946d50.43.1768321467229; Tue, 13 Jan 2026
 08:24:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767765802.git.anuj.mittal@oss.qualcomm.com>
 <CAMKF1spBMrhRuBanPsZC8EBiRX_jRUUCMUerFOsDJ=SjYsEmqw@mail.gmail.com> <28fa70bd-9218-4e07-953f-47287912edb0@gmail.com>
In-Reply-To: <28fa70bd-9218-4e07-953f-47287912edb0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jan 2026 08:23:59 -0800
X-Gm-Features: AZwV_QgHWS-vxfA37LETHark79M_ezT4B_rJK3mglApTcXywL25imE3SisWf3cg
Message-ID: <CAMKF1sriOzf=jKwHXyyzCvV6QgEqmuFqkSMEiasMcLU70FbOgA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/30] Whinlatter pull request
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e729e10648476ce0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 16:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123437

--000000000000e729e10648476ce0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 12:45=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.=
com>
wrote:

> Khem,
>
> Was the merge successful? I still see a 4 weeks old commit as Whinlatter
> HEAD in both github and https://git.openembedded.org/meta-openembedded
> Could you please take a look at that?
>
>
Thanks for reporting this, it ended at dry push check :) removed -n now and
should be
there.


> Thanks
>
> On 1/9/26 08:19, Khem Raj via lists.openembedded.org wrote:
> > Looks good. Merged now, thanks Anuj
> >
> > On Wed, Jan 7, 2026 at 6:11=E2=80=AFPM Anuj Mittal
> > <anuj.mittal@oss.qualcomm.com> wrote:
> >
> >     Please merge these changes in whinlatter. Tested on AB and locally.
> >
> >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1225
> >
> >     The following changes since commit
> >     a4e768dcfae181dd99e39c4286fa0729ca7f4e47:
> >
> >       bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA (2025-12-17
> >     16:54:28 +0530)
> >
> >     are available in the Git repository at:
> >
> >       https://git.openembedded.org/meta-openembedded-contrib
> >     stable/whinlatter-next
> >
> >
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/wh=
inlatter-next
> >
> >     Ankur Tyagi (1):
> >       fetchmail: patch CVE-2025-61962
> >
> >     Gyorgy Sarvari (26):
> >       fex: ignore unrelated CVEs
> >       accountsservice: ignore CVE-2023-3297
> >       minio: ignore irrelevant CVEs
> >       cifs-utils: patch CVE-2025-2312
> >       cups-filters: patch CVE-2025-64524
> >       dovecot: patch CVE-2025-30189
> >       fio: ignore CVE-2025-10824
> >       tigervnc: fix typo in CVE_STATUS
> >       tigervnc: sync xserver code with oe-core
> >       tigervnc: ignore CVE-2023-6377
> >       tigervnc: ignore CVE-2023-6478
> >       tigervnc: ignore CVE-2025-26594...26601
> >       civetweb: ignore CVE-2025-9648
> >       freerdp3: ignore CVE-2025-68118
> >       gimp: patch CVE-2025-14422
> >       gimp: patch CVE-2025-14423
> >       gimp: patch CVE-2025-14424
> >       gimp: patch CVE-2025-14425
> >       imagemagick: upgrade 7.1.2-8 -> 7.1.2-12
> >       libcoap: ignore CVE-2025-50518
> >       openvpn: upgrade 2.6.16 -> 2.6.17
> >       php: upgrade 8.4.15 -> 8.4.16
> >       postgresql: upgrade 17.6 -> 17.7
> >       python3-configobj: ignore CVE-2023-26112
> >       python3-django: upgrade 4.2.26 -> 4.2.27
> >       python3-django: upgrade 5.2.8 -> 5.2.9
> >
> >     Hugo SIMELIERE (2):
> >       libwebsockets: fix CVE-2025-11677
> >       libwebsockets: fix CVE-2025-11678
> >
> >     Jason Schonberg (1):
> >       c-ares: upgrade 1.34.5 -> 1.34.6
> >
> >      .../gimp/gimp/CVE-2025-14422.patch            |  66 +++++++
> >      .../gimp/gimp/CVE-2025-14423.patch            | 106 ++++++++++++
> >      .../gimp/gimp/CVE-2025-14424.patch            |  34 ++++
> >      .../gimp/gimp/CVE-2025-14425.patch            |  79 +++++++++
> >      meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
> >     <http://gimp_3.0.6.bb>    |  15 +-
> >      .../accountsservice_23.13.9.bb
> >     <http://accountsservice_23.13.9.bb>                |   2 +
> >      .../civetweb/civetweb_1.16.bb <http://civetweb_1.16.bb>
> >            |   3 +-
> >      .../libcoap/libcoap_4.3.5a.bb <http://libcoap_4.3.5a.bb>
> >            |   2 +
> >      .../cifs/cifs-utils/CVE-2025-2312.patch       | 135 ++++++++++++++=
+
> >      .../recipes-support/cifs/cifs-utils_7.0.bb
> >     <http://cifs-utils_7.0.bb>    |   4 +-
> >      .../dovecot/dovecot/CVE-2025-30189-1.patch    | 128 ++++++++++++++
> >      .../dovecot/dovecot/CVE-2025-30189-2.patch    |  51 ++++++
> >      .../dovecot/dovecot/CVE-2025-30189-3.patch    |  36 ++++
> >      .../dovecot/dovecot/CVE-2025-30189-4.patch    |  72 ++++++++
> >      .../dovecot/dovecot/CVE-2025-30189-5.patch    |  31 ++++
> >      .../dovecot/dovecot/CVE-2025-30189-6.patch    |  88 ++++++++++
> >      .../dovecot/dovecot/CVE-2025-30189-7.patch    |  76 +++++++++
> >      .../dovecot/dovecot_2.4.1-4.bb <http://dovecot_2.4.1-4.bb>
> >             |   7 +
> >      .../fetchmail/fetchmail/CVE-2025-61962.patch  |  51 ++++++
> >      .../fetchmail/fetchmail_6.5.2.bb <http://fetchmail_6.5.2.bb>
> >             |   1 +
> >      .../{openvpn_2.6.16.bb <http://openvpn_2.6.16.bb> =3D>
> >     openvpn_2.6.17.bb <http://openvpn_2.6.17.bb>}  |   2 +-
> >      meta-oe/recipes-benchmark/fio/fio_3.39.bb <http://fio_3.39.bb>
> >      |   2 +
> >      .../libwebsockets/CVE-2025-11677.patch        | 161
> >     ++++++++++++++++++
> >      .../libwebsockets/CVE-2025-11678.patch        | 128 ++++++++++++++
> >      .../libwebsockets/libwebsockets_4.3.5.bb
> >     <http://libwebsockets_4.3.5.bb>      |   2 +
> >      ...c-bypass-autoconf-2.69-version-check.patch |   2 +-
> >      ...{postgresql_17.6.bb <http://postgresql_17.6.bb> =3D>
> >     postgresql_17.7.bb <http://postgresql_17.7.bb>} |   4 +-
> >      meta-oe/recipes-devtools/fex/fex_2511.bb <http://fex_2511.bb>
> >       |   6 +
> >      .../php/{php_8.4.15.bb <http://php_8.4.15.bb> =3D> php_8.4.16.bb
> >     <http://php_8.4.16.bb>}      |   2 +-
> >      meta-oe/recipes-extended/minio/minio_git.bb
> >     <http://minio_git.bb>   |   6 +
> >      .../tigervnc/tigervnc_1.15.0.bb <http://tigervnc_1.15.0.bb>
> >              |  16 +-
> >      .../cups/cups-filters/CVE-2025-64524.patch    |  82 +++++++++
> >      .../cups/cups-filters_2.0.1.bb <http://cups-filters_2.0.1.bb>
> >                 |  10 +-
> >      .../c-ares/0001-ares_uri-memory-leak.patch    |  21 ---
> >      .../{c-ares_1.34.5.bb <http://c-ares_1.34.5.bb> =3D>
> >     c-ares_1.34.6.bb <http://c-ares_1.34.6.bb>}    |   3 +-
> >      .../freerdp/freerdp3_3.18.0.bb <http://freerdp3_3.18.0.bb>
> >             |   1 +
> >      ...ick_7.1.2-8.bb <http://ick_7.1.2-8.bb> =3D>
> >     imagemagick_7.1.2-12.bb <http://imagemagick_7.1.2-12.bb>} |   2 +-
> >      .../python/python3-configobj_5.0.9.bb
> >     <http://python3-configobj_5.0.9.bb>         |   2 +
> >      ...ngo_4.2.26.bb <http://ngo_4.2.26.bb> =3D>
> >     python3-django_4.2.27.bb <http://python3-django_4.2.27.bb>} |   2 +=
-
> >      ...jango_5.2.8.bb <http://jango_5.2.8.bb> =3D>
> >     python3-django_5.2.9.bb <http://python3-django_5.2.9.bb>} |   2 +-
> >      40 files changed, 1397 insertions(+), 46 deletions(-)
> >      create mode 100644
> >     meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
> >      create mode 100644
> >     meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch
> >      create mode 100644
> >     meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
> >      create mode 100644
> >     meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
> >      create mode 100644
> >     meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
> >      create mode 100644
> >
>  meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-1.patch
> >      create mode 100644
> >
>  meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-2.patch
> >      create mode 100644
> >
>  meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-3.patch
> >      create mode 100644
> >
>  meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-4.patch
> >      create mode 100644
> >
>  meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-5.patch
> >      create mode 100644
> >
>  meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-6.patch
> >      create mode 100644
> >
>  meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-7.patch
> >      create mode 100644
> >
>  meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
> >      rename meta-networking/recipes-support/openvpn/{openvpn_2.6.16.bb
> >     <http://openvpn_2.6.16.bb> =3D> openvpn_2.6.17.bb
> >     <http://openvpn_2.6.17.bb>} (98%)
> >      create mode 100644
> >
>  meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.=
patch
> >      create mode 100644
> >
>  meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.=
patch
> >      rename meta-oe/recipes-dbs/postgresql/{postgresql_17.6.bb
> >     <http://postgresql_17.6.bb> =3D> postgresql_17.7.bb
> >     <http://postgresql_17.7.bb>} (69%)
> >      rename meta-oe/recipes-devtools/php/{php_8.4.15.bb
> >     <http://php_8.4.15.bb> =3D> php_8.4.16.bb <http://php_8.4.16.bb>}
> (99%)
> >      create mode 100644
> >     meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
> >      delete mode 100644
> >     meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.pat=
ch
> >      rename meta-oe/recipes-support/c-ares/{c-ares_1.34.5.bb
> >     <http://c-ares_1.34.5.bb> =3D> c-ares_1.34.6.bb
> >     <http://c-ares_1.34.6.bb>} (87%)
> >      rename
> >     meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-8.bb
> >     <http://imagemagick_7.1.2-8.bb> =3D> imagemagick_7.1.2-12.bb
> >     <http://imagemagick_7.1.2-12.bb>} (99%)
> >      rename
> >     meta-python/recipes-devtools/python/{python3-django_4.2.26.bb
> >     <http://python3-django_4.2.26.bb> =3D> python3-django_4.2.27.bb
> >     <http://python3-django_4.2.27.bb>} (79%)
> >      rename
> >     meta-python/recipes-devtools/python/{python3-django_5.2.8.bb
> >     <http://python3-django_5.2.8.bb> =3D> python3-django_5.2.9.bb
> >     <http://python3-django_5.2.9.bb>} (60%)
> >
> >     --
> >     2.52.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#123277):
> https://lists.openembedded.org/g/openembedded-devel/message/123277
> > Mute This Topic: https://lists.openembedded.org/mt/117146356/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000e729e10648476ce0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 13,=
 2026 at 12:45=E2=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@=
gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Khem,<br>
<br>
Was the merge successful? I still see a 4 weeks old commit as Whinlatter<br=
>
HEAD in both github and <a href=3D"https://git.openembedded.org/meta-openem=
bedded" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/m=
eta-openembedded</a><br>
Could you please take a look at that?<br>
<br></blockquote><div><br></div><div>Thanks for reporting this, it ended at=
 dry push check :) removed -n now and should be</div><div>there.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
<br>
On 1/9/26 08:19, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Looks good. Merged now, thanks Anuj<br>
&gt;<br>
&gt; On Wed, Jan 7, 2026 at 6:11=E2=80=AFPM Anuj Mittal<br>
&gt; &lt;<a href=3D"mailto:anuj.mittal@oss.qualcomm.com" target=3D"_blank">=
anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Please merge these changes in whinlatter. Tested on=
 AB and locally.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://autobuilder.yoctoproject.org/val=
kyrie/#/builders/81/builds/1225" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1225</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The following changes since commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4e768dcfae181dd99e39c4286fa0729ca7f4e47:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA=
 (2025-12-17<br>
&gt;=C2=A0 =C2=A0 =C2=A016:54:28 +0530)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 <a href=3D"https://git.openembedded.org/meta=
-openembedded-contrib" rel=3D"noreferrer" target=3D"_blank">https://git.ope=
nembedded.org/meta-openembedded-contrib</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0stable/whinlatter-next<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openem=
bedded-contrib/log/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Dstable/whinlatter-next</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Ankur Tyagi (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 fetchmail: patch CVE-2025-61962<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Gyorgy Sarvari (26):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 fex: ignore unrelated CVEs<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 accountsservice: ignore CVE-2023-3297<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 minio: ignore irrelevant CVEs<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 cifs-utils: patch CVE-2025-2312<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 cups-filters: patch CVE-2025-64524<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 dovecot: patch CVE-2025-30189<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 fio: ignore CVE-2025-10824<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tigervnc: fix typo in CVE_STATUS<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tigervnc: sync xserver code with oe-core<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tigervnc: ignore CVE-2023-6377<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tigervnc: ignore CVE-2023-6478<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tigervnc: ignore CVE-2025-26594...26601<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 civetweb: ignore CVE-2025-9648<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 freerdp3: ignore CVE-2025-68118<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gimp: patch CVE-2025-14422<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gimp: patch CVE-2025-14423<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gimp: patch CVE-2025-14424<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gimp: patch CVE-2025-14425<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 imagemagick: upgrade 7.1.2-8 -&gt; 7.1.2-12<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 libcoap: ignore CVE-2025-50518<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 openvpn: upgrade 2.6.16 -&gt; 2.6.17<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 php: upgrade 8.4.15 -&gt; 8.4.16<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 postgresql: upgrade 17.6 -&gt; 17.7<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 python3-configobj: ignore CVE-2023-26112<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 python3-django: upgrade 4.2.26 -&gt; 4.2.27<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 python3-django: upgrade 5.2.8 -&gt; 5.2.9<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hugo SIMELIERE (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 libwebsockets: fix CVE-2025-11677<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 libwebsockets: fix CVE-2025-11678<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Jason Schonberg (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 c-ares: upgrade 1.34.5 -&gt; 1.34.6<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../gimp/gimp/CVE-2025-14422.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 66 +++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../gimp/gimp/CVE-2025-14423.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 106 ++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../gimp/gimp/CVE-2025-14424.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 34 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../gimp/gimp/CVE-2025-14425.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 79 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-gnome/recipes-gimp/gimp/<a href=3D"http:=
//gimp_3.0.6.bb" rel=3D"noreferrer" target=3D"_blank">gimp_3.0.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gimp_3.0.6.bb" rel=3D"norefer=
rer" target=3D"_blank">http://gimp_3.0.6.bb</a>&gt;=C2=A0 =C2=A0 |=C2=A0 15=
 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../<a href=3D"http://accountsservice_23.13.9=
.bb" rel=3D"noreferrer" target=3D"_blank">accountsservice_23.13.9.bb</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://accountsservice_23.13.9.bb" r=
el=3D"noreferrer" target=3D"_blank">http://accountsservice_23.13.9.bb</a>&g=
t;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../civetweb/<a href=3D"http://civetweb_1.16.=
bb" rel=3D"noreferrer" target=3D"_blank">civetweb_1.16.bb</a> &lt;<a href=
=3D"http://civetweb_1.16.bb" rel=3D"noreferrer" target=3D"_blank">http://ci=
vetweb_1.16.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../libcoap/<a href=3D"http://libcoap_4.3.5a.=
bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5a.bb</a> &lt;<a href=
=3D"http://libcoap_4.3.5a.bb" rel=3D"noreferrer" target=3D"_blank">http://l=
ibcoap_4.3.5a.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../cifs/cifs-utils/CVE-2025-2312.patch=C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 135 +++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-support/cifs/<a href=3D"http://ci=
fs-utils_7.0.bb" rel=3D"noreferrer" target=3D"_blank">cifs-utils_7.0.bb</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://cifs-utils_7.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://cifs-utils_7.0.bb</a>&gt;=C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dovecot/dovecot/CVE-2025-30189-1.patch=C2=
=A0 =C2=A0 | 128 ++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dovecot/dovecot/CVE-2025-30189-2.patch=C2=
=A0 =C2=A0 |=C2=A0 51 ++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dovecot/dovecot/CVE-2025-30189-3.patch=C2=
=A0 =C2=A0 |=C2=A0 36 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dovecot/dovecot/CVE-2025-30189-4.patch=C2=
=A0 =C2=A0 |=C2=A0 72 ++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dovecot/dovecot/CVE-2025-30189-5.patch=C2=
=A0 =C2=A0 |=C2=A0 31 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dovecot/dovecot/CVE-2025-30189-6.patch=C2=
=A0 =C2=A0 |=C2=A0 88 ++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dovecot/dovecot/CVE-2025-30189-7.patch=C2=
=A0 =C2=A0 |=C2=A0 76 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../dovecot/<a href=3D"http://dovecot_2.4.1-4=
.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.1-4.bb</a> &lt;<a hre=
f=3D"http://dovecot_2.4.1-4.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/dovecot_2.4.1-4.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../fetchmail/fetchmail/CVE-2025-61962.patch=
=C2=A0 |=C2=A0 51 ++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../fetchmail/<a href=3D"http://fetchmail_6.5=
.2.bb" rel=3D"noreferrer" target=3D"_blank">fetchmail_6.5.2.bb</a> &lt;<a h=
ref=3D"http://fetchmail_6.5.2.bb" rel=3D"noreferrer" target=3D"_blank">http=
://fetchmail_6.5.2.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../{<a href=3D"http://openvpn_2.6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">openvpn_2.6.16.bb</a> &lt;<a href=3D"http=
://openvpn_2.6.16.bb" rel=3D"noreferrer" target=3D"_blank">http://openvpn_2=
.6.16.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://openvpn_2.6.17.bb" rel=3D"norefer=
rer" target=3D"_blank">openvpn_2.6.17.bb</a> &lt;<a href=3D"http://openvpn_=
2.6.17.bb" rel=3D"noreferrer" target=3D"_blank">http://openvpn_2.6.17.bb</a=
>&gt;}=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-benchmark/fio/<a href=3D"http=
://fio_3.39.bb" rel=3D"noreferrer" target=3D"_blank">fio_3.39.bb</a> &lt;<a=
 href=3D"http://fio_3.39.bb" rel=3D"noreferrer" target=3D"_blank">http://fi=
o_3.39.bb</a>&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../libwebsockets/CVE-2025-11677.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 161<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../libwebsockets/CVE-2025-11678.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 128 ++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../libwebsockets/<a href=3D"http://libwebsoc=
kets_4.3.5.bb" rel=3D"noreferrer" target=3D"_blank">libwebsockets_4.3.5.bb<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libwebsockets_4.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://libwebsockets_4.3.5.bb</a>&gt;=C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...c-bypass-autoconf-2.69-version-check.patch=
 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...{<a href=3D"http://postgresql_17.6.bb" rel=
=3D"noreferrer" target=3D"_blank">postgresql_17.6.bb</a> &lt;<a href=3D"htt=
p://postgresql_17.6.bb" rel=3D"noreferrer" target=3D"_blank">http://postgre=
sql_17.6.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://postgresql_17.7.bb" rel=3D"norefe=
rrer" target=3D"_blank">postgresql_17.7.bb</a> &lt;<a href=3D"http://postgr=
esql_17.7.bb" rel=3D"noreferrer" target=3D"_blank">http://postgresql_17.7.b=
b</a>&gt;} |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-devtools/fex/<a href=3D"http:=
//fex_2511.bb" rel=3D"noreferrer" target=3D"_blank">fex_2511.bb</a> &lt;<a =
href=3D"http://fex_2511.bb" rel=3D"noreferrer" target=3D"_blank">http://fex=
_2511.bb</a>&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 |=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../php/{<a href=3D"http://php_8.4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.4.15.bb</a> &lt;<a href=3D"http://p=
hp_8.4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://php_8.4.15.bb</a>=
&gt; =3D&gt; <a href=3D"http://php_8.4.16.bb" rel=3D"noreferrer" target=3D"=
_blank">php_8.4.16.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://php_8.4.16.bb" rel=3D"norefer=
rer" target=3D"_blank">http://php_8.4.16.bb</a>&gt;}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/recipes-extended/minio/<a href=3D"htt=
p://minio_git.bb" rel=3D"noreferrer" target=3D"_blank">minio_git.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://minio_git.bb" rel=3D"noreferr=
er" target=3D"_blank">http://minio_git.bb</a>&gt;=C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../tigervnc/<a href=3D"http://tigervnc_1.15.=
0.bb" rel=3D"noreferrer" target=3D"_blank">tigervnc_1.15.0.bb</a> &lt;<a hr=
ef=3D"http://tigervnc_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">http:=
//tigervnc_1.15.0.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../cups/cups-filters/CVE-2025-64524.patch=C2=
=A0 =C2=A0 |=C2=A0 82 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../cups/<a href=3D"http://cups-filters_2.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">cups-filters_2.0.1.bb</a> &lt;<a =
href=3D"http://cups-filters_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">=
http://cups-filters_2.0.1.bb</a>&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1=
0 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../c-ares/0001-ares_uri-memory-leak.patch=C2=
=A0 =C2=A0 |=C2=A0 21 ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../{<a href=3D"http://c-ares_1.34.5.bb" rel=
=3D"noreferrer" target=3D"_blank">c-ares_1.34.5.bb</a> &lt;<a href=3D"http:=
//c-ares_1.34.5.bb" rel=3D"noreferrer" target=3D"_blank">http://c-ares_1.34=
.5.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://c-ares_1.34.6.bb" rel=3D"noreferr=
er" target=3D"_blank">c-ares_1.34.6.bb</a> &lt;<a href=3D"http://c-ares_1.3=
4.6.bb" rel=3D"noreferrer" target=3D"_blank">http://c-ares_1.34.6.bb</a>&gt=
;}=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../freerdp/<a href=3D"http://freerdp3_3.18.0=
.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.18.0.bb</a> &lt;<a hre=
f=3D"http://freerdp3_3.18.0.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/freerdp3_3.18.0.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"http://ick_7.1.2-8.bb" rel=3D"n=
oreferrer" target=3D"_blank">ick_7.1.2-8.bb</a> &lt;<a href=3D"http://ick_7=
.1.2-8.bb" rel=3D"noreferrer" target=3D"_blank">http://ick_7.1.2-8.bb</a>&g=
t; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://imagemagick_7.1.2-12.bb" rel=3D"n=
oreferrer" target=3D"_blank">imagemagick_7.1.2-12.bb</a> &lt;<a href=3D"htt=
p://imagemagick_7.1.2-12.bb" rel=3D"noreferrer" target=3D"_blank">http://im=
agemagick_7.1.2-12.bb</a>&gt;} |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../python/<a href=3D"http://python3-configob=
j_5.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-configobj_5.0.9.bb=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-configobj_5.0.9.bb" r=
el=3D"noreferrer" target=3D"_blank">http://python3-configobj_5.0.9.bb</a>&g=
t;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"http://ngo_4.2.26.bb" rel=3D"no=
referrer" target=3D"_blank">ngo_4.2.26.bb</a> &lt;<a href=3D"http://ngo_4.2=
.26.bb" rel=3D"noreferrer" target=3D"_blank">http://ngo_4.2.26.bb</a>&gt; =
=3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://python3-django_4.2.27.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-django_4.2.27.bb</a> &lt;<a href=3D"h=
ttp://python3-django_4.2.27.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/python3-django_4.2.27.bb</a>&gt;} |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"http://jango_5.2.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">jango_5.2.8.bb</a> &lt;<a href=3D"http://jango=
_5.2.8.bb" rel=3D"noreferrer" target=3D"_blank">http://jango_5.2.8.bb</a>&g=
t; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://python3-django_5.2.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-django_5.2.9.bb</a> &lt;<a href=3D"htt=
p://python3-django_5.2.9.bb" rel=3D"noreferrer" target=3D"_blank">http://py=
thon3-django_5.2.9.bb</a>&gt;} |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A040 files changed, 1397 insertions(+), 46 dele=
tions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/cifs/cifs-utils/CVE=
-2025-2312.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dovecot/dovecot/CVE=
-2025-30189-1.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dovecot/dovecot/CVE=
-2025-30189-2.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dovecot/dovecot/CVE=
-2025-30189-3.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dovecot/dovecot/CVE=
-2025-30189-4.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dovecot/dovecot/CVE=
-2025-30189-5.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dovecot/dovecot/CVE=
-2025-30189-6.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/dovecot/dovecot/CVE=
-2025-30189-7.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking/recipes-support/fetchmail/fetchmail=
/CVE-2025-61962.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-networking/recipes-support/openvp=
n/{<a href=3D"http://openvpn_2.6.16.bb" rel=3D"noreferrer" target=3D"_blank=
">openvpn_2.6.16.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://openvpn_2.6.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://openvpn_2.6.16.bb</a>&gt; =3D&gt; <a href=
=3D"http://openvpn_2.6.17.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_=
2.6.17.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://openvpn_2.6.17.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://openvpn_2.6.17.bb</a>&gt;} (98%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/recipes-connectivity/libwebsockets/libwebso=
ckets/CVE-2025-11677.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/recipes-connectivity/libwebsockets/libwebso=
ckets/CVE-2025-11678.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a hre=
f=3D"http://postgresql_17.6.bb" rel=3D"noreferrer" target=3D"_blank">postgr=
esql_17.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://postgresql_17.6.bb" rel=3D"no=
referrer" target=3D"_blank">http://postgresql_17.6.bb</a>&gt; =3D&gt; <a hr=
ef=3D"http://postgresql_17.7.bb" rel=3D"noreferrer" target=3D"_blank">postg=
resql_17.7.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://postgresql_17.7.bb" rel=3D"no=
referrer" target=3D"_blank">http://postgresql_17.7.bb</a>&gt;} (69%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-oe/recipes-devtools/php/{<a href=
=3D"http://php_8.4.15.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.15.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://php_8.4.15.bb" rel=3D"norefer=
rer" target=3D"_blank">http://php_8.4.15.bb</a>&gt; =3D&gt; <a href=3D"http=
://php_8.4.16.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.16.bb</a> &l=
t;<a href=3D"http://php_8.4.16.bb" rel=3D"noreferrer" target=3D"_blank">htt=
p://php_8.4.16.bb</a>&gt;} (99%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/recipes-printing/cups/cups-filters/CVE-2025=
-64524.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri=
-memory-leak.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-oe/recipes-support/c-ares/{<a hre=
f=3D"http://c-ares_1.34.5.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1=
.34.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://c-ares_1.34.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://c-ares_1.34.5.bb</a>&gt; =3D&gt; <a href=
=3D"http://c-ares_1.34.6.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.=
34.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://c-ares_1.34.6.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://c-ares_1.34.6.bb</a>&gt;} (87%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe/recipes-support/imagemagick/{<a href=3D"htt=
p://imagemagick_7.1.2-8.bb" rel=3D"noreferrer" target=3D"_blank">imagemagic=
k_7.1.2-8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://imagemagick_7.1.2-8.bb" rel=
=3D"noreferrer" target=3D"_blank">http://imagemagick_7.1.2-8.bb</a>&gt; =3D=
&gt; <a href=3D"http://imagemagick_7.1.2-12.bb" rel=3D"noreferrer" target=
=3D"_blank">imagemagick_7.1.2-12.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://imagemagick_7.1.2-12.bb" rel=
=3D"noreferrer" target=3D"_blank">http://imagemagick_7.1.2-12.bb</a>&gt;} (=
99%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-python/recipes-devtools/python/{<a href=3D"htt=
p://python3-django_4.2.26.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
django_4.2.26.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-django_4.2.26.bb" rel=
=3D"noreferrer" target=3D"_blank">http://python3-django_4.2.26.bb</a>&gt; =
=3D&gt; <a href=3D"http://python3-django_4.2.27.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-django_4.2.27.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-django_4.2.27.bb" rel=
=3D"noreferrer" target=3D"_blank">http://python3-django_4.2.27.bb</a>&gt;} =
(79%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-python/recipes-devtools/python/{<a href=3D"htt=
p://python3-django_5.2.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-d=
jango_5.2.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-django_5.2.8.bb" rel=
=3D"noreferrer" target=3D"_blank">http://python3-django_5.2.8.bb</a>&gt; =
=3D&gt; <a href=3D"http://python3-django_5.2.9.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-django_5.2.9.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-django_5.2.9.bb" rel=
=3D"noreferrer" target=3D"_blank">http://python3-django_5.2.9.bb</a>&gt;} (=
60%)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.52.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#123277): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/123277" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/123277</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11714635=
6/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/117146356/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigraun@gmail.c=
om" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000e729e10648476ce0--

