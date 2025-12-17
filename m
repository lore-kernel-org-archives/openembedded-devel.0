Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B84D5C0C9
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 03:48:33 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6103.1765943309437882723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 19:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QDTU31k1;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6420c08f886so6344146d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 19:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765943308; x=1766548108; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XUzt8/XKplZRYvp9I2b69vgnJ/RDlAX3PpZaMyKvyI0=;
        b=QDTU31k1Q1BbGSgtAIYPhnpXYbd9pSWJvEcdgAdiePOf56MPmPugeXCLPaHR9h1dho
         MV+dD2BivhbcRSCghCaQq9S+bvofHtuzhZvdJPzLZn0xT9RlTJ2AylVFRcwXNBpKhwM0
         MFr9XszLTOP5JG9y6ynpds0uHQ9G/hzVZPVaNvuktTTGl3l4D0GDds2Ym7j86TPtSX7a
         BR/GaMMLW90YGQJY9vPrIR9t9+qggAy+dHmHrODDTzex7EJZK9wbG+vh5yfHnl3wh4wT
         FO79E7fcN9kjEMvEDpbsR/2c+Lu8qBkMWc5Fw9cfsNIo1jhFXFF1YBVyLmj2//UUAlUd
         uiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765943308; x=1766548108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUzt8/XKplZRYvp9I2b69vgnJ/RDlAX3PpZaMyKvyI0=;
        b=P5xZCzAfmnE/tuxo6W+7BI6SOn8226S6vnJQMcGnoZ3rS+CQJydeYYNn9pSYH4h8+A
         C56DCJmS8jeKAqwCo8m5Ui3RoRDUVlWaNRVXtUfBMrGmV3TjtMTFRuOR4IwpBr43PAjZ
         xuOTV/9OcUSIz/oN6LtTyFE1341IxJmm64C2/ggQW28aA4O+b+6eKnMZq5sPdmZNkVmy
         4OJhOvqX8PFGUpffsJXTW83SuQ6BqwMs4VqEcPk/L0j22W7svKQZvtXpGsURcECBLx+v
         Dk8ttwUeBAQE/nrtBqL2KS/nEhcRoteaAZgJoRkyHLxnmHzXg43FrLyuqwxfQEcBmdRM
         /O8Q==
X-Gm-Message-State: AOJu0YzXFSEgcJJwxGqf7rU4daIRXV+QfiBJbHh98i/RqhJn7o8A/XtW
	SX4FduV1gDcWtFpHCZFd1DG1lmiywwVCsfOPYXM2BzcBHAqXKfxtkLk+EabvxbIl0Ol3S9Q6r8/
	N8ykyTuaFk0y4MJr7vLuixFDhVu9oShKoGE/zGzg=
X-Gm-Gg: AY/fxX5D7E7fKItG3O7383+w3/eVmPsM5tc2wBIphD9i5ZZdy3mSkAGcvTBD0INzZRs
	YslIZjdFM6lMdvocfaksCokiMAtGrZCGTXucm+guMSzMS/ohIC04K6QuelRD6dhoBHEtxY5KnBW
	lH2oVVhgI0pfntFygUJRaSJypUqkofa2RUCR7/7MQ19gLNQzBeAld7mvUEHUGEF9fSLQkasHmpv
	RdAzsMHbQPIHpWvtbg45HsL5LSyg3YL8SxrSDzzry0XfARMrSLHcSvXxRPvHnwO1xNGIuqo1xty
	7QAGCtfiAwU7+1yT1pXoVL9tA/ksrJ9OUH15qI1QejD1ki09AVH2AamHacoUlPvbaIRc7wjPFAw
	qgwg0om8gUnMy
X-Google-Smtp-Source: AGHT+IFbscP+VA7wxrVapShcC8Zy62yDiqZQj46AMDuLYxwhuvRyyoHJz0qmkU9EV61aO1QxzLjez8ItWC2ZR+c1Azw=
X-Received: by 2002:a05:690e:4088:b0:645:5b1f:4cbf with SMTP id
 956f58d0204a3-6455b1f548emr12379790d50.82.1765943308377; Tue, 16 Dec 2025
 19:48:28 -0800 (PST)
MIME-Version: 1.0
References: <18802E459FACF88F.1129279@lists.openembedded.org> <CA+s=J=w4qe+BRS_J91jehOZCWCNNhsCEVCRQPn0S1v0R9UhNhw@mail.gmail.com>
In-Reply-To: <CA+s=J=w4qe+BRS_J91jehOZCWCNNhsCEVCRQPn0S1v0R9UhNhw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Dec 2025 23:48:02 -0400
X-Gm-Features: AQt7F2rSYh4t8oNFm_JWAa9XX5ebDl00mngiiDLq34QIhNM05sNOeB-d8rwWPBs
Message-ID: <CAMKF1so4eC_BSW1_ZzOVQJDMx+Pga-hXJrCzQ_V3K7vd-kBfHg@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/10] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096e11f06461db722"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 03:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122711

--00000000000096e11f06461db722
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Anuj, Looks good.

On Mon, Dec 15, 2025 at 9:55=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Hi Khem
>
> Can you merge these please if there are no objections?
>
> On Thu, Dec 11, 2025 at 10:05=E2=80=AFPM Anuj Mittal via
> lists.openembedded.org
> <anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Please merge these changes in scarthgap.
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1172
> >
> > The following changes since commit
> 7ed4330bcf1ecd4aa34bfbe1fd7079381b62b1e7:
> >
> >   net-snmp: Update Upstream-status in the
> net-snmp-5.9.4-kernel-6.7.patch (2025-12-05 17:46:29 +0530)
> >
> > are available in the Git repository at:
> >
> >   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthga=
p
> >
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
> >
> > Ankur Tyagi (3):
> >   python3-django: upgrade 5.0.11 -> 5.0.14
> >   smarty: update CVE_PRODUCT
> >   libavif: patch CVE-2025-48174
> >
> > Hitendra Prajapati (1):
> >   wireshark: fix CVE-2025-13499
> >
> > Peter Marko (1):
> >   nftables: remove python dependency from main package
> >
> > Sudhir Dumbhare (1):
> >   hdf5 1.14.4-3: fix CVE-2025-2912
> >
> > Valeria Petrov (1):
> >   apache2: upgrade 2.4.65 -> 2.4.66
> >
> > Vijay Anusuri (1):
> >   proftpd: Fix CVE-2023-48795
> >
> > Viswanath Kraleti (1):
> >   gflags: switch Git branch from master to main
> >
> > Wang Mingyu (1):
> >   corosync: upgrade 3.1.9 -> 3.1.10
> >
> >  .../libavif/libavif/CVE-2025-48174_1.patch    |  27 +
> >  .../libavif/libavif/CVE-2025-48174_2.patch    |  31 +
> >  .../libavif/libavif/CVE-2025-48174_3.patch    |  27 +
> >  .../libavif/libavif/CVE-2025-48174_4.patch    |  72 ++
> >  .../libavif/libavif_1.0.1.bb                  |   7 +-
> >  .../proftpd/files/CVE-2023-48795.patch        | 785 ++++++++++++++++++
> >  .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
> >  .../corosync/corosync/CVE-2025-30472.patch    |  69 --
> >  .../{corosync_3.1.9.bb =3D> corosync_3.1.10.bb} |   5 +-
> >  .../recipes-filter/nftables/nftables_1.0.9.bb |   2 +
> >  .../wireshark/files/CVE-2025-13499.patch      |  45 +
> >  .../wireshark/wireshark_4.2.14.bb             |   1 +
> >  .../recipes-support/gflags/gflags_2.2.2.bb    |   2 +-
> >  ...atch =3D> CVE-2025-2913-CVE-2025-2912.patch} |   3 +-
> >  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   2 +-
> >  .../recipes-support/smarty/smarty_4.4.1.bb    |   2 +
> >  .../python3-django/CVE-2025-26699.patch       | 100 ---
> >  ...ngo_5.0.11.bb =3D> python3-django_5.0.14.bb} |   4 +-
> >  .../{apache2_2.4.65.bb =3D> apache2_2.4.66.bb}  |   2 +-
> >  19 files changed, 1007 insertions(+), 180 deletions(-)
> >  create mode 100644
> meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_1.patch
> >  create mode 100644
> meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_2.patch
> >  create mode 100644
> meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_3.patch
> >  create mode 100644
> meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_4.patch
> >  create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
> >  delete mode 100644
> meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
> >  rename meta-networking/recipes-extended/corosync/{corosync_3.1.9.bb =
=3D>
> corosync_3.1.10.bb} (94%)
> >  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
> >  rename meta-oe/recipes-support/hdf5/files/{CVE-2025-2913.patch =3D>
> CVE-2025-2913-CVE-2025-2912.patch} (94%)
> >  delete mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
> >  rename meta-python/recipes-devtools/python/{python3-django_5.0.11.bb
> =3D> python3-django_5.0.14.bb} (65%)
> >  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb =3D>
> apache2_2.4.66.bb} (99%)
> >
> > --
> > 2.52.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#122586):
> https://lists.openembedded.org/g/openembedded-devel/message/122586
> > Mute This Topic: https://lists.openembedded.org/mt/116729072/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000096e11f06461db722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Anuj, Looks good.</div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec =
15, 2025 at 9:55=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@o=
ss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Khem<br>
<br>
Can you merge these please if there are no objections?<br>
<br>
On Thu, Dec 11, 2025 at 10:05=E2=80=AFPM Anuj Mittal via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;anuj.mittal=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org=
" target=3D"_blank">oss.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Please merge these changes in scarthgap.<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81=
/builds/1172" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/81/builds/1172</a><br>
&gt;<br>
&gt; The following changes since commit 7ed4330bcf1ecd4aa34bfbe1fd7079381b6=
2b1e7:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0net-snmp: Update Upstream-status in the net-snmp-5.9.4-ker=
nel-6.7.patch (2025-12-05 17:46:29 +0530)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembedded-=
contrib" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
meta-openembedded-contrib</a> anujm/scarthgap<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembedded-=
contrib/log/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">http=
s://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap=
</a><br>
&gt;<br>
&gt; Ankur Tyagi (3):<br>
&gt;=C2=A0 =C2=A0python3-django: upgrade 5.0.11 -&gt; 5.0.14<br>
&gt;=C2=A0 =C2=A0smarty: update CVE_PRODUCT<br>
&gt;=C2=A0 =C2=A0libavif: patch CVE-2025-48174<br>
&gt;<br>
&gt; Hitendra Prajapati (1):<br>
&gt;=C2=A0 =C2=A0wireshark: fix CVE-2025-13499<br>
&gt;<br>
&gt; Peter Marko (1):<br>
&gt;=C2=A0 =C2=A0nftables: remove python dependency from main package<br>
&gt;<br>
&gt; Sudhir Dumbhare (1):<br>
&gt;=C2=A0 =C2=A0hdf5 1.14.4-3: fix CVE-2025-2912<br>
&gt;<br>
&gt; Valeria Petrov (1):<br>
&gt;=C2=A0 =C2=A0apache2: upgrade 2.4.65 -&gt; 2.4.66<br>
&gt;<br>
&gt; Vijay Anusuri (1):<br>
&gt;=C2=A0 =C2=A0proftpd: Fix CVE-2023-48795<br>
&gt;<br>
&gt; Viswanath Kraleti (1):<br>
&gt;=C2=A0 =C2=A0gflags: switch Git branch from master to main<br>
&gt;<br>
&gt; Wang Mingyu (1):<br>
&gt;=C2=A0 =C2=A0corosync: upgrade 3.1.9 -&gt; 3.1.10<br>
&gt;<br>
&gt;=C2=A0 .../libavif/libavif/CVE-2025-48174_1.patch=C2=A0 =C2=A0 |=C2=A0 =
27 +<br>
&gt;=C2=A0 .../libavif/libavif/CVE-2025-48174_2.patch=C2=A0 =C2=A0 |=C2=A0 =
31 +<br>
&gt;=C2=A0 .../libavif/libavif/CVE-2025-48174_3.patch=C2=A0 =C2=A0 |=C2=A0 =
27 +<br>
&gt;=C2=A0 .../libavif/libavif/CVE-2025-48174_4.patch=C2=A0 =C2=A0 |=C2=A0 =
72 ++<br>
&gt;=C2=A0 .../libavif/<a href=3D"http://libavif_1.0.1.bb" rel=3D"noreferre=
r" target=3D"_blank">libavif_1.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 .../proftpd/files/CVE-2023-48795.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 785 ++++++++++++++++++<br>
&gt;=C2=A0 .../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7f.bb"=
 rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7f.bb</a> |=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 .../corosync/corosync/CVE-2025-30472.patch=C2=A0 =C2=A0 |=C2=A0 =
69 --<br>
&gt;=C2=A0 .../{<a href=3D"http://corosync_3.1.9.bb" rel=3D"noreferrer" tar=
get=3D"_blank">corosync_3.1.9.bb</a> =3D&gt; <a href=3D"http://corosync_3.1=
.10.bb" rel=3D"noreferrer" target=3D"_blank">corosync_3.1.10.bb</a>} |=C2=
=A0 =C2=A05 +-<br>
&gt;=C2=A0 .../recipes-filter/nftables/<a href=3D"http://nftables_1.0.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">nftables_1.0.9.bb</a> |=C2=A0 =C2=A02=
 +<br>
&gt;=C2=A0 .../wireshark/files/CVE-2025-13499.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 45 +<br>
&gt;=C2=A0 .../wireshark/<a href=3D"http://wireshark_4.2.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">wireshark_4.2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../recipes-support/gflags/<a href=3D"http://gflags_2.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">gflags_2.2.2.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
&gt;=C2=A0 ...atch =3D&gt; CVE-2025-2913-CVE-2025-2912.patch} |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_1.14.4-3.bb"=
 rel=3D"noreferrer" target=3D"_blank">hdf5_1.14.4-3.bb</a> |=C2=A0 =C2=A02 =
+-<br>
&gt;=C2=A0 .../recipes-support/smarty/<a href=3D"http://smarty_4.4.1.bb" re=
l=3D"noreferrer" target=3D"_blank">smarty_4.4.1.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +<br>
&gt;=C2=A0 .../python3-django/CVE-2025-26699.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 100 ---<br>
&gt;=C2=A0 ...<a href=3D"http://ngo_5.0.11.bb" rel=3D"noreferrer" target=3D=
"_blank">ngo_5.0.11.bb</a> =3D&gt; <a href=3D"http://python3-django_5.0.14.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.0.14.bb</a>} |=C2=
=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://apache2_2.4.65.bb" rel=3D"noreferrer" tar=
get=3D"_blank">apache2_2.4.65.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.=
66.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.66.bb</a>}=C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 19 files changed, 1007 insertions(+), 180 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/libavif/li=
bavif/CVE-2025-48174_1.patch<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/libavif/li=
bavif/CVE-2025-48174_2.patch<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/libavif/li=
bavif/CVE-2025-48174_3.patch<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/libavif/li=
bavif/CVE-2025-48174_4.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-daemons/proftpd/files=
/CVE-2023-48795.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-extended/corosync/cor=
osync/CVE-2025-30472.patch<br>
&gt;=C2=A0 rename meta-networking/recipes-extended/corosync/{<a href=3D"htt=
p://corosync_3.1.9.bb" rel=3D"noreferrer" target=3D"_blank">corosync_3.1.9.=
bb</a> =3D&gt; <a href=3D"http://corosync_3.1.10.bb" rel=3D"noreferrer" tar=
get=3D"_blank">corosync_3.1.10.bb</a>} (94%)<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/wireshark/fil=
es/CVE-2025-13499.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-support/hdf5/files/{CVE-2025-2913.patch =
=3D&gt; CVE-2025-2913-CVE-2025-2912.patch} (94%)<br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/python3-d=
jango/CVE-2025-26699.patch<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-django_5.0.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-django=
_5.0.11.bb</a> =3D&gt; <a href=3D"http://python3-django_5.0.14.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-django_5.0.14.bb</a>} (65%)<br>
&gt;=C2=A0 rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://a=
pache2_2.4.65.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.65.bb</a=
> =3D&gt; <a href=3D"http://apache2_2.4.66.bb" rel=3D"noreferrer" target=3D=
"_blank">apache2_2.4.66.bb</a>} (99%)<br>
&gt;<br>
&gt; --<br>
&gt; 2.52.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#122586): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/122586" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/122586</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11672907=
2/3616702" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116729072/3616702</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:anuj.mittal@oss.qua=
lcomm.com" target=3D"_blank">anuj.mittal@oss.qualcomm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000096e11f06461db722--

