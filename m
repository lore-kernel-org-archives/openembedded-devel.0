Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987FCCD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 13:32:08 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75450.1778592725386813724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 06:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HviISel8;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65c0bda7f15so5773889d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 06:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778592724; cv=none;
        d=google.com; s=arc-20240605;
        b=TQz5xzO9gsxxyCyYI3DyDUUwSVQMieIdMEhdMLAssqmmiDeH3Dcapmla9Zm0bP4LJR
         xJkcI3ViVv4F9pqQL7TVRd8q3gNLXTdj4c1jwvZoHaviGw7hEf3Ro43JT6QV7dN2a7l5
         82HFVopyX5fH3YLSmLVx9C1e+OaBksP2BYuNFxka7AmbCTjqkBELBxJwQyhMut8gNQU5
         +1a4E2CAlzbHGeej3cY4WGGeCnxfMtaHpyAkL/9gn3gsfbn8cfwi5FD5V/xRoq54Z3yG
         3L64/SObPYHaGTMYN5w9NHaI7yLfxesRZSBCLDy8HxFdTYDEV8LPftYbpevXrocwgJU3
         wSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U5SdAXlobPuNtUZxPRk/ItmuXUntUbpWiaz1ZO59CzA=;
        fh=BweJFI7uJ9oaV/GYRDjLPRD3TWxUGQYfg9nwy/AIVLg=;
        b=ZWhtHsNaQbuR1qdmfbbB6s1vneUqPvGQtgF9VWL7XXVD70F/fjja8+s2Ju+TpwZG3t
         YFvYkOLaZDWIT+VgsjRXlh9T2u2FcdfH7CFraL7VvmjjfYvlz2Kx2H8WP3kCo6qaNZpg
         zhINEhvULmxm1FudVLcIDf8shDXtCDCS2pxKr1e9wbhmkWCkwJnowcDLohU6X8ZU8DLc
         fJ3Ol4xmibSZnYDZpIsuk1i1GWwtQAzD+Sv9OzWaDvHLjKYwRno8wOdoFO82APgGWOc7
         vP8VMLJFqXT37RgmzhsIx0Lz2OPMU5TAUsfqGRLdNws2OftfQAEIgItOgpjjLUtWZlHf
         rH+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778592724; x=1779197524; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U5SdAXlobPuNtUZxPRk/ItmuXUntUbpWiaz1ZO59CzA=;
        b=HviISel8gdfWfD4PJYilenoV19C5ndDzqUSPi/IpwEgRsd59rwSbyuvcBvf4g6YMIU
         cRgs4+MxugubMoBllQchHPcxFuyxMPrmbfyRFlSUBUp9KyJg5ix3hBKLdAFqVP/AIDgD
         g0cMLjq567Ccm8zcHnJTe1YcbIrwN48892uvKJAvN3rvGJvFNdWuboi0iB/DMtA8RRiN
         RR6MvuiKbK75tKcpruex2DlNSbpC9oR+4gGnud4n/Xs3Bm1l1SDkWsYtgjEVfKBhAPeT
         9gv0EpDwd69v+4oUENN9O2+ZAuUgwtq0Mgnvz4qbBJ9YdHh6rjo18htXZJHn88v1eto+
         xefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592724; x=1779197524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5SdAXlobPuNtUZxPRk/ItmuXUntUbpWiaz1ZO59CzA=;
        b=LOrQhAukWyQ3UVaLJJaphaiXxkyppXHlGTvRvIYlZbli1ahOv+sCagLssPTGxexO3w
         j4OyCuOm7B2mcvzxkSZvytbAYr26Bvc2yzH0Rgmzd+GnYnhKSqG5y1Tr66bYm96alYe3
         AsGGIxL2SvDiu5pnpTKrHoVb+IQHk4EWmo/le3OoCNQ2mr+No6spXIc5n2I2l+0qK7WI
         xxmnpORDYK6IAiD/4n0j+v1KsVPiw3wS2zW7zoGTC6m1/MnyhlZT0XPdISHmPugNE6yB
         2ZkTCE9YwvZcRwn7iKo78be9XVDiVsyUhMyP+YedUA4s9/c0HIotLUwwDUHvmOsXvTTs
         TTJg==
X-Gm-Message-State: AOJu0YzE1JU2jU8wWAjrnfGh0+6HDyjG5V8nx/oJ4NuQuZ/Ne96qWs8M
	3kybj20askpiaVjiOP9g8FFHAQO2K7zhmun24VEIZUfrzlPayCEUaSem37pcDzTtGUW8RiLWiG/
	sBJPuPwH6XtqBrTlDBAj1hIlKJfuzhNT1D22v
X-Gm-Gg: Acq92OHEmD18JpK6HfgUOKirqUMZ/PBJNLA366a6wqbJAof+uLCCF6fa1rExU+JZXu4
	/LTa8kL6JHP+ZcfcXTfFuhB0S1aIuUmFyriicLlhiIMh8mUB4AAK6PndR11pNwnQTkI0+v70+/3
	EmdfOANOeBopl7HUAusCYGkOqrTYcXzenYiDSeD95DRDKyJVr6/E9oxXihHMx8UkXzW52tzAUhc
	rwG2SXczZS3C7qYNcEmFwHWOsCYTq2IfuTDqjJrSTWdDDqiJw3nckaO9XJu1v7/GD5rQQ5Z4Ihs
	dh3zsTWT71a6hLiJ1z9mCG+ua0uewpNQbeQZYODifsELnLqbvT3tfWc37A330lVPkRkeM5gmQ8R
	4rqyeGBCc/J3OT9BCDJlftm3sQhpcFbnL5RlgIre/H9A7+1WZrz7yqBM9B/3b4v5j354fa7d+Mc
	FZQ2Ri
X-Received: by 2002:a05:690e:d04:b0:64e:f106:60e5 with SMTP id
 956f58d0204a3-65da85cb36dmr12146905d50.52.1778592723609; Tue, 12 May 2026
 06:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-bash-rr-v2-1-4987ca21e7d8@non.se.com>
 <CAMKF1soSKFt_BdUsN-ir=BWRsJOOwPPV9YYfR0HEcYZ2-uj-GA@mail.gmail.com> <a083ae32-59d7-4128-9507-77faae3960f5@semalibre.com>
In-Reply-To: <a083ae32-59d7-4128-9507-77faae3960f5@semalibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2026 06:31:50 -0700
X-Gm-Features: AVHnY4JFTORVuLt99bfh69NCnjs-EHJoQRxwJjVOceWoF0M6-g-xWt9Ha3Sjgww
Message-ID: <CAMKF1sq_QkHqQOSvQUH=v40KhP+gW4hGqxughRuDD-LutMQ5gQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] openvpn: create an extra package
 for the dns-updown script
To: Louis Rannou <louis.rannou@semalibre.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
Content-Type: multipart/alternative; boundary="0000000000007db5eb06519ee3e1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 13:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126867

--0000000000007db5eb06519ee3e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Louis,

Thank you for the update on the test results.

Regarding the errors you mentioned, could you please clarify if these occur
both with and without the proposed change to the openvpn recipe? I am
interested to know if these are pre-existing issues or if they are specific
to the new package structure.

-Khem


On Tue, May 12, 2026, 1:09=E2=80=AFAM Louis Rannou <louis.rannou@semalibre.=
com>
wrote:

> 12 mai 2026 06:35:59 Khem Raj <raj.khem@gmail.com>:
>
> >
> >
> > On Mon, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via lists.openembe=
dded.org[
> http://lists.openembedded.org] <louis.rannou=3D
> semalibre.com@lists.openembedded.org> wrote:
> >> From: Louis Rannou <louis.rannou@non.se.com>
> >>
> >> The dns-updown script is written in bash which is under the GPLv3
> >> license. As this script is optional, it is preffered to have it in an
> extra
> >> package.
> >
> > Does ptest work ok after this change ?
>
> I get some errors but I suppose they are parts of the test as the result
> looks fine:
>
> DURATION: 84
> END: /usr/lib/openvpn/ptest
> 2026-05-12T07:56
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
>
> >
> >>
> >> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> >> ---
> >> change in v2: new package openvpn-dns-updown
> >> ---
> >>  meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[
> http://openvpn_2.7.0.bb] | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[
> http://openvpn_2.7.0.bb] b/meta-networking/recipes-support/openvpn/
> openvpn_2.7.0.bb[http://openvpn_2.7.0.bb]
> >> index 0cbe4641cd..6ddebde4d1 100644
> >> --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[
> http://openvpn_2.7.0.bb]
> >> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[
> http://openvpn_2.7.0.bb]
> >> @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D
> "--enable-iproute2,,iproute2,iproute2-ip"
> >>  PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,system=
d"
> >>  PACKAGECONFIG[selinux] =3D
> "--enable-selinux,--disable-selinux,libselinux"
> >>
> >> -RDEPENDS:${PN}:append =3D " bash"
> >> +RDEPENDS:${PN}-dns-updown:append =3D " bash"
> >>  RDEPENDS:${PN}-ptest:append =3D " bash"
> >>
> >>  do_install:append() {
> >> @@ -114,7 +114,7 @@ do_install_ptest() {
> >>      cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
> >>  }
> >>
> >> -PACKAGES =3D+ " ${PN}-sample "
> >> +PACKAGES =3D+ " ${PN}-dns-updown ${PN}-sample "
> >>
> >>  RRECOMMENDS:${PN} =3D "kernel-module-tun"
> >>
> >> @@ -124,5 +124,6 @@ FILES:${PN} +=3D
> "${systemd_system_unitdir}/openvpn-server@.service \
> >>                  ${systemd_system_unitdir}/openvpn-client@.service \
> >>                  ${nonarch_libdir}/tmpfiles.d \
> >>                 "
> >> +FILES:${PN}-dns-updown =3D "${libexecdir}/openvpn/dns-updown"
> >>  FILES:${PN}-sample =3D "${sysconfdir}/openvpn/sample/ \
> >>                       "
> >>
> >> ---
> >> base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
> >> change-id: 20260506-bash-rr-5fd0820519e4
> >>
> >> Best regards,
> >> --
> >> Louis Rannou <louis.rannou@non.se.com>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#126849):
> https://lists.openembedded.org/g/openembedded-devel/message/126849
> >> Mute This Topic: https://lists.openembedded.org/mt/119254470/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org[
> openembedded-devel%2Bowner@lists.openembedded.org]
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>

--0000000000007db5eb06519ee3e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Louis,<br><br>Thank you for the update on the test res=
ults.<br><br>Regarding the errors you mentioned, could you please clarify i=
f these occur both with and without the proposed change to the openvpn reci=
pe? I am interested to know if these are pre-existing issues or if they are=
 specific to the new package structure.<br><br>-Khem<div><br></div></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 12, 2026, 1:09=E2=80=AFAM Louis Rannou &lt;<a h=
ref=3D"mailto:louis.rannou@semalibre.com">louis.rannou@semalibre.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=20
 =20
=20
 <div>
  <span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">12 mai 2026 =
06:35:59 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;:</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt; On =
Mon, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via <a href=3D"http://lis=
ts.openembedded.org" target=3D"_blank" rel=3D"noreferrer">lists.openembedde=
d.org</a>[<a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=
=3D"noreferrer">http://lists.openembedded.org</a>] &lt;louis.rannou=3D<a hr=
ef=3D"mailto:semalibre.com@lists.openembedded.org" target=3D"_blank" rel=3D=
"noreferrer">semalibre.com@lists.openembedded.org</a>&gt; wrote:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 From: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" target=
=3D"_blank" rel=3D"noreferrer">louis.rannou@non.se.com</a>&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 The dns-updown script is written in bash which is under the GPLv3</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 license. As this script is optional, it is preffered to have it in an extr=
a</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 package.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt; Doe=
s ptest work ok after this=C2=A0change=C2=A0?</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">I get so=
me errors but I suppose they are parts of the test as the result looks fine=
:</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">DURATION=
: 84</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">END: /us=
r/lib/openvpn/ptest</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">2026-05-=
12T07:56</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">STOP: pt=
est-runner</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">TOTAL: 1=
 FAIL: 0</span>
  <br>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt; =C2=
=A0</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com"=
 target=3D"_blank" rel=3D"noreferrer">louis.rannou@non.se.com</a>&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 change in v2: new package openvpn-dns-updown</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.=
7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2.7.0.bb</a>[<a href=
=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">http://op=
envpn_2.7.0.bb</a>] | 5 +++--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A01 file changed, 3 insertions(+), 2 deletions(-)</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 diff --git a/meta-networking/recipes-support/openvpn/<a href=3D"http://ope=
nvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2.7.0.bb</a>[<a=
 href=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">http=
://openvpn_2.7.0.bb</a>] b/meta-networking/recipes-support/openvpn/<a href=
=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2=
.7.0.bb</a>[<a href=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"no=
referrer">http://openvpn_2.7.0.bb</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 index 0cbe4641cd..6ddebde4d1 100644</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 --- a/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.=
7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2.7.0.bb</a>[<a href=
=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">http://op=
envpn_2.7.0.bb</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 +++ b/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.=
7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2.7.0.bb</a>[<a href=
=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">http://op=
envpn_2.7.0.bb</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D &quot;--enable-iproute2,,ipr=
oute2,iproute2-ip&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0PACKAGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-systemd,=
systemd&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-selinux,=
libselinux&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 -RDEPENDS:${PN}:append =3D &quot; bash&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 +RDEPENDS:${PN}-dns-updown:append =3D &quot; bash&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0RDEPENDS:${PN}-ptest:append =3D &quot; bash&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0do_install:append() {</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 @@ -114,7 +114,7 @@ do_install_ptest() {</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0}</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 -PACKAGES =3D+ &quot; ${PN}-sample &quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 +PACKAGES =3D+ &quot; ${PN}-dns-updown ${PN}-sample &quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0RRECOMMENDS:${PN} =3D &quot;kernel-module-tun&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 @@ -124,5 +124,6 @@ FILES:${PN} +=3D &quot;${systemd_system_unitdir}/openv=
pn-server@.service \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_sy=
stem_unitdir}/openvpn-client@.service \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_li=
bdir}/tmpfiles.d \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 +FILES:${PN}-dns-updown =3D &quot;${libexecdir}/openvpn/dns-updown&quot;</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0FILES:${PN}-sample =3D &quot;${sysconfdir}/openvpn/sample/ \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 change-id: 20260506-bash-rr-5fd0820519e4</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 Best regards,</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 --</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" target=3D"_bla=
nk" rel=3D"noreferrer">louis.rannou@non.se.com</a>&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 Links: You receive all messages sent to this group.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 View/Reply Online (#126849): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/126849" target=3D"_blank" rel=3D"noreferrer">http=
s://lists.openembedded.org/g/openembedded-devel/message/126849</a></span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119254470/19=
97914" target=3D"_blank" rel=3D"noreferrer">https://lists.openembedded.org/=
mt/119254470/1997914</a></span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedd=
ed.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists=
.openembedded.org</a>[<a href=3D"mailto:openembedded-devel%252Bowner@lists.=
openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel%2=
Bowner@lists.openembedded.org</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub" target=3D"_blank" rel=3D"noreferrer">https://lists.openembedded.or=
g/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br>
  <br>
 </div>
</blockquote></div>

--0000000000007db5eb06519ee3e1--

