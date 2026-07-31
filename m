Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C73C5516F
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 17:56:52 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1985.1785520604830319203
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 10:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FVQhyjV7;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66892c81725so1493733d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 10:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785520604; cv=none;
        d=google.com; s=arc-20260327;
        b=QbqkRul9FAafRU+NwdEcnmioOKB57gcGH/mW6rMPWzOeS+fS3AVLq3prt+rOiGCx4j
         ptU4Lx1KA9D57z/aIBl8mwfgZfnIDP2i4P+sIA9YgIUvEevn/xMvIih8G+ZIegHdAXSO
         DZOTSGFaJpnh603fys/jDkmDWUZ39xwxPRKiJHmJ0WJ/0x5NxvaEu5BVUDQl6mzqbb8U
         TOPOM2J3u1vpKYxCrVa3BxhWnQOIOhyjvAvi/tosaLjviS1ZVLP3YUo3ejru0uXBwcNq
         gZftjQRRjBmCzTd4uFhVM4UnCQ2dvJHAQMMh/njiOQ4CxMsPCzcg0UZW70G8m8NG2Pdm
         Iy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HxHE7VbmnffLdCKWXAfQyt344n3Zfum1uewJNSBPu8g=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=Lbg0Es4ixXvzre/kscEgdKYgeKkc+ju+gTYXi0CfkfViDaZMc8wLtSt0EyxHAvDmrY
         XKSmyhTp0JidB4WHjOHcEIXuE1dJptYfQCY6O+oscCczLT3WGzjNrz6FkVd3od+nhkp7
         DTWhoWEwnyAoLwB6Dvl43lH0FqQ17NtkJmYDPib2lp/Lx75hG6UvaNNbjD+ORmlq91DG
         6p90XUPRzb8py+hoRovDgGG8lBBx6Ap3RoM4J8zJdPZtBZLH4rslZpNY5VoYav5zNpGG
         /eBB7ZNODEvsYehsZ+qrnZHcPn+umaEthVVylaUEClUsSrXMCPavxUZt+MufY6RuFl3G
         M7eQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785520604; x=1786125404; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxHE7VbmnffLdCKWXAfQyt344n3Zfum1uewJNSBPu8g=;
        b=FVQhyjV7iBMvdSY2etuIR44hWyr2cmTGeQs9Lge9rOQ5arW/0lct5jYpYgUFMb5tv0
         8BSiOpUsm/aZEdugME1R2yfT1WdaqINcKIH036fIBok9KyAMPhgsaIXdPlOGrDcWgzah
         w+nBZdkZy6sEodiKAWMGp2C72pHXTWkPFDtSLNq4MHWrQnQuXlad1GgFKA37mSn9RGL5
         /f8fbxqeVImI0gZmscp7MblUkEPiBFdjRK2p8S9p6cNNG89mvDIcIphPNDgaxAjWLNAr
         SAspQLy189P4e84TcW5sUvgpFj8GJFS0huFVLb1gh6BvcbnaG02vjzj/D+6n/n3/jOEl
         ElDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520604; x=1786125404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HxHE7VbmnffLdCKWXAfQyt344n3Zfum1uewJNSBPu8g=;
        b=X3/+SP2Zyn2ZujicQsfo0aOjENIEN2HROjlg+n907awbEz7fj8K2EKG1TW3gmse/V7
         cqrwzxlOHjyldfUsBnj6BXMzjppvYGrWaK2UsIqlRway2O79QIRq95gklGxkMcmRGLIp
         P3ByF5CGbC7RmtlINobvFtA2SlLRQ6XgT6nstUuF0SJe0pZ6laWpF/EqffdRtwSeEssC
         shnnS9afyTTeZM+bJD4ediPTyK5DlFI+3RssCN3pE+0QreQ6/hiOw19y/Qhve3Qktbad
         13EA43t9yCpNMyWrVgTwAqj8BUTPbJpfPwFm23FV5FWwbeBYPabLVEfutQ8L8PUn+YOv
         SBIg==
X-Gm-Message-State: AOJu0Yw98OnFQ+Vco+cVQM9qXCRxdMKMgFA4R/KESXDEVj+uM5I8yNoG
	lWxaUup2ugYAiMTb1nbLrerGzZERFX6sno7wx8eVoBv11WwpUGim0GzeVoYHrTWYqKSS8R0Agk7
	ci1h4HCyL6qDilsuPB3pxTb7JJOPNjNc=
X-Gm-Gg: AR+sD11+nNK47WhNYhJp45Dwn6OT8qh+/4mMBScMdFjgQGBBdB2WB+pL5cumsdM70F/
	nG+NMBm5zVwuGAcSTvPqSqfpNfVsKrJzVrcmgysQG+7Ta9PIngdkRAe8WEJJu1jTMGeCXxG1mjz
	sYJQnI9C+TYFG0IsJzArbpDFMuhPsIx4jQWrh4VHlCRSQfkGZrEnakksF80nLO8Dr1WVM328cNi
	Ao22YKGeE8l45kHdK11W+WxSnSTTXVjz/J3Bp81Cr+a4PGqSgopvQKLu0XsTIrxC4BsksU+GufR
	apCstrJTuXURFlPlrIB+n66fd2vnuBZN1WTDg2iIJunwuw/DfviPPDFkUFHuarwlwmE2+xX9cD7
	bW72PUrKIcc10LeE1TLqKUZhSgNEVz2cpGxjHU0CXA7zsKQjzPlVLmZWBNi+k4UGYq98hp78s2D
	YUz+flQczUWyhohGFEzIhSYLJyj21p0YHv5phSv9lWTrui
X-Received: by 2002:a53:d053:0:20b0:667:dd2f:9441 with SMTP id
 956f58d0204a3-6694f01c0e6mr965513d50.13.1785520603565; Fri, 31 Jul 2026
 10:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785461355.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1785461355.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Jul 2026 10:56:14 -0700
X-Gm-Features: AUfX_mzCXqaHLwclzrQtTK_LNJHxRPoX0Zid3p17ABCZNZQC7A819_2GsusmmTo
Message-ID: <CAMKF1srT_n5FVS8xyP33gyuWVLC83X9D9dCqpodnXPVfUEcXvg@mail.gmail.com>
Subject: Re: [PATCH 00/21] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005092f20657ebe96a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 17:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128584

--0000000000005092f20657ebe96a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM. merged now thanks Anuj

On Thu, Jul 30, 2026 at 9:21=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Please merge these changes in scarthgap. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1679
>
> The following changes since commit
> 7eb94107580092f79ff1b639a87762fe6f96aa12:
>
>   nginx: fix CVE-2026-42055 (2026-07-16 15:49:44 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to ef3df29f2cfca6a9513b51ebcdccf82b6c8a836f:
>
>   libdbi-perl: Fix CVE-2026-14740 (2026-07-30 07:53:25 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (2):
>   postfix: upgrade 3.8.17 -> 3.8.19
>   haveged: upgrade 1.9.22 -> 1.9.23
>
> Benjamin Robin (Schneider Electric) (1):
>   dnsmasq: fix CVE-2026-4890
>
> Darsh Kelaiya (6):
>   jq: Fix CVE-2026-43895
>   jq: Fix CVE-2026-47770
>   jq: Fix CVE-2026-49839
>   jq: Fix CVE-2026-54679
>   dnsmasq: Fix CVE-2026-12725
>   dnsmasq: Fix CVE-2026-12969
>
> Deepak Rathore (1):
>   ldns: fix CVE-2026-10846
>
> Hetvi Thakar (5):
>   libdbi-perl: Fix CVE-2026-9698
>   libdbi-perl: Fix CVE-2026-10879
>   libdbi-perl: Fix CVE-2026-14380
>   libdbi-perl: Fix CVE-2026-14739
>   libdbi-perl: Fix CVE-2026-14740
>
> Joao Marcos Costa (1):
>   nginx: backport fixes for CVE-2026-42533
>
> Khem Raj (1):
>   apache2: upgrade 2.4.67 -> 2.4.68
>
> Peter Marko (2):
>   libwebsockets: patch CVE-2026-10650
>   hostapd: set status for CVE-2026-58374
>
> Qliangw (1):
>   libuio: fix FILE descriptor leak
>
> Wang Mingyu (1):
>   monocypher: upgrade 4.0.2 -> 4.0.3
>
>  .../{postfix_3.8.17.bb =3D> postfix_3.8.19.bb}  |   2 +-
>  .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |   3 +
>  .../dnsmasq/files/CVE-2026-12725.patch        | 111 +++
>  .../dnsmasq/files/CVE-2026-12969.patch        |  54 ++
>  .../dnsmasq/files/CVE-2026-4890.patch         |  75 ++
>  .../hostapd/hostapd_2.10.bb                   |   2 +
>  .../libwebsockets/CVE-2026-10650.patch        |  46 ++
>  .../libwebsockets/libwebsockets_4.3.3.bb      |   1 +
>  ...onocypher_4.0.2.bb =3D> monocypher_4.0.3.bb} |   2 +-
>  .../jq/jq/CVE-2026-43895.patch                | 206 +++++
>  .../jq/jq/CVE-2026-47770.patch                | 449 +++++++++++
>  .../jq/jq/CVE-2026-49839.patch                |  37 +
>  .../jq/jq/CVE-2026-54679.patch                |  74 ++
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   4 +
>  .../ldns/ldns/CVE-2026-10846_p1.patch         | 117 +++
>  .../ldns/ldns/CVE-2026-10846_p2.patch         | 117 +++
>  .../ldns/ldns/CVE-2026-10846_p3.patch         |  34 +
>  meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb   |   6 +-
>  .../perl/libdbi-perl/CVE-2026-10879.patch     |  34 +
>  .../perl/libdbi-perl/CVE-2026-14380_p1.patch  |  37 +
>  .../perl/libdbi-perl/CVE-2026-14380_p2.patch  |  65 ++
>  .../perl/libdbi-perl/CVE-2026-14380_p3.patch  |  27 +
>  .../perl/libdbi-perl/CVE-2026-14380_p4.patch  |  56 ++
>  .../perl/libdbi-perl/CVE-2026-14739.patch     | 170 +++++
>  .../perl/libdbi-perl/CVE-2026-14740.patch     |  40 +
>  .../perl/libdbi-perl/CVE-2026-9698.patch      |  43 ++
>  .../perl/libdbi-perl_1.643.bb                 |   9 +
>  .../{haveged_1.9.22.bb =3D> haveged_1.9.23.bb}  |   2 +-
>  ...ix-fclose-leak-in-uio_line_from_file.patch |  31 +
>  .../recipes-extended/libuio/libuio_0.2.1.bb   |   1 +
>  .../{apache2_2.4.67.bb =3D> apache2_2.4.68.bb}  |   2 +-
>  .../nginx/nginx-1.24.0/CVE-2026-42533-1.patch | 126 ++++
>  .../nginx/nginx-1.24.0/CVE-2026-42533-2.patch | 381 ++++++++++
>  .../nginx/nginx-1.24.0/CVE-2026-42533-3.patch | 704 ++++++++++++++++++
>  .../nginx/nginx-1.24.0/CVE-2026-42533-4.patch | 587 +++++++++++++++
>  .../nginx/nginx-1.24.0/CVE-2026-42533-5.patch |  55 ++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   5 +
>  37 files changed, 3710 insertions(+), 5 deletions(-)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.8.17.bb =3D>
> postfix_3.8.19.bb} (99%)
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-12725.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-12969.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.p=
atch
>  rename meta-oe/recipes-crypto/monocypher/{monocypher_4.0.2.bb =3D>
> monocypher_4.0.3.bb} (85%)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch
>  create mode 100644
> meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch
>  create mode 100644
> meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p2.patch
>  create mode 100644
> meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p3.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p1.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p2.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p3.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p4.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.22.bb =3D>
> haveged_1.9.23.bb} (94%)
>  create mode 100644
> meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_from_f=
ile.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.67.bb =3D>
> apache2_2.4.68.bb} (99%)
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-1.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-2.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-3.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-4.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-5.patch
>
> --
> 2.54.0
>
>

--0000000000005092f20657ebe96a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM. merged now thanks Anuj</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Jul 30, 2026 at 9:21=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.mitt=
al@oss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Please merge these changes=
 in scarthgap. Tested locally and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1679" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1679</a><br>
<br>
The following changes since commit 7eb94107580092f79ff1b639a87762fe6f96aa12=
:<br>
<br>
=C2=A0 nginx: fix CVE-2026-42055 (2026-07-16 15:49:44 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to ef3df29f2cfca6a9513b51ebcdccf82b6c8a836f:<br=
>
<br>
=C2=A0 libdbi-perl: Fix CVE-2026-14740 (2026-07-30 07:53:25 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (2):<br>
=C2=A0 postfix: upgrade 3.8.17 -&gt; 3.8.19<br>
=C2=A0 haveged: upgrade 1.9.22 -&gt; 1.9.23<br>
<br>
Benjamin Robin (Schneider Electric) (1):<br>
=C2=A0 dnsmasq: fix CVE-2026-4890<br>
<br>
Darsh Kelaiya (6):<br>
=C2=A0 jq: Fix CVE-2026-43895<br>
=C2=A0 jq: Fix CVE-2026-47770<br>
=C2=A0 jq: Fix CVE-2026-49839<br>
=C2=A0 jq: Fix CVE-2026-54679<br>
=C2=A0 dnsmasq: Fix CVE-2026-12725<br>
=C2=A0 dnsmasq: Fix CVE-2026-12969<br>
<br>
Deepak Rathore (1):<br>
=C2=A0 ldns: fix CVE-2026-10846<br>
<br>
Hetvi Thakar (5):<br>
=C2=A0 libdbi-perl: Fix CVE-2026-9698<br>
=C2=A0 libdbi-perl: Fix CVE-2026-10879<br>
=C2=A0 libdbi-perl: Fix CVE-2026-14380<br>
=C2=A0 libdbi-perl: Fix CVE-2026-14739<br>
=C2=A0 libdbi-perl: Fix CVE-2026-14740<br>
<br>
Joao Marcos Costa (1):<br>
=C2=A0 nginx: backport fixes for CVE-2026-42533<br>
<br>
Khem Raj (1):<br>
=C2=A0 apache2: upgrade 2.4.67 -&gt; 2.4.68<br>
<br>
Peter Marko (2):<br>
=C2=A0 libwebsockets: patch CVE-2026-10650<br>
=C2=A0 hostapd: set status for CVE-2026-58374<br>
<br>
Qliangw (1):<br>
=C2=A0 libuio: fix FILE descriptor leak<br>
<br>
Wang Mingyu (1):<br>
=C2=A0 monocypher: upgrade 4.0.2 -&gt; 4.0.3<br>
<br>
=C2=A0.../{<a href=3D"http://postfix_3.8.17.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.8.17.bb</a> =3D&gt; <a href=3D"http://postfix_3.8.19.=
bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.8.19.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.90.bb" rel=3D=
"noreferrer" target=3D"_blank">dnsmasq_2.90.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +<br>
=C2=A0.../dnsmasq/files/CVE-2026-12725.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
11 +++<br>
=C2=A0.../dnsmasq/files/CVE-2026-12969.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 54 ++<br>
=C2=A0.../dnsmasq/files/CVE-2026-4890.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 75 ++<br>
=C2=A0.../hostapd/<a href=3D"http://hostapd_2.10.bb" rel=3D"noreferrer" tar=
get=3D"_blank">hostapd_2.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../libwebsockets/CVE-2026-10650.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 46 ++<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.3.3.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://onocypher_4.0.2.bb" rel=3D"noreferrer" target=3D=
"_blank">onocypher_4.0.2.bb</a> =3D&gt; <a href=3D"http://monocypher_4.0.3.=
bb" rel=3D"noreferrer" target=3D"_blank">monocypher_4.0.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../jq/jq/CVE-2026-43895.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 206 +++++<br>
=C2=A0.../jq/jq/CVE-2026-47770.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 449 +++++++++++<br>
=C2=A0.../jq/jq/CVE-2026-49839.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 37 +<br>
=C2=A0.../jq/jq/CVE-2026-54679.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 74 ++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
=C2=A0.../ldns/ldns/CVE-2026-10846_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 117 +++<br>
=C2=A0.../ldns/ldns/CVE-2026-10846_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 117 +++<br>
=C2=A0.../ldns/ldns/CVE-2026-10846_p3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 34 +<br>
=C2=A0meta-oe/recipes-devtools/ldns/<a href=3D"http://ldns_1.8.3.bb" rel=3D=
"noreferrer" target=3D"_blank">ldns_1.8.3.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A0=
6 +-<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-10879.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
34 +<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14380_p1.patch=C2=A0 |=C2=A0 37 +<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14380_p2.patch=C2=A0 |=C2=A0 65 ++<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14380_p3.patch=C2=A0 |=C2=A0 27 +<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14380_p4.patch=C2=A0 |=C2=A0 56 ++<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14739.patch=C2=A0 =C2=A0 =C2=A0| 170 ++=
+++<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14740.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
40 +<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-9698.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
43 ++<br>
=C2=A0.../perl/<a href=3D"http://libdbi-perl_1.643.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libdbi-perl_1.643.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
=C2=A0.../{<a href=3D"http://haveged_1.9.22.bb" rel=3D"noreferrer" target=
=3D"_blank">haveged_1.9.22.bb</a> =3D&gt; <a href=3D"http://haveged_1.9.23.=
bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.23.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...ix-fclose-leak-in-uio_line_from_file.patch |=C2=A0 31 +<br>
=C2=A0.../recipes-extended/libuio/<a href=3D"http://libuio_0.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">libuio_0.2.1.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0.../{<a href=3D"http://apache2_2.4.67.bb" rel=3D"noreferrer" target=
=3D"_blank">apache2_2.4.67.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.68.=
bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.68.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-42533-1.patch | 126 ++++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-42533-2.patch | 381 ++++++++++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-42533-3.patch | 704 +++++++++++++++++=
+<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-42533-4.patch | 587 +++++++++++++++<b=
r>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-42533-5.patch |=C2=A0 55 ++<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +<br>
=C2=A037 files changed, 3710 insertions(+), 5 deletions(-)<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.8.17.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.8.17.bb</a> =
=3D&gt; <a href=3D"http://postfix_3.8.19.bb" rel=3D"noreferrer" target=3D"_=
blank">postfix_3.8.19.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-12725.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-12969.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4890.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-10650.patch<br>
=C2=A0rename meta-oe/recipes-crypto/monocypher/{<a href=3D"http://monocyphe=
r_4.0.2.bb" rel=3D"noreferrer" target=3D"_blank">monocypher_4.0.2.bb</a> =
=3D&gt; <a href=3D"http://monocypher_4.0.3.bb" rel=3D"noreferrer" target=3D=
"_blank">monocypher_4.0.3.bb</a>} (85%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_=
p1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_=
p2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_=
p3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-10879.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14380_p1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14380_p2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14380_p3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14380_p4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14739.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14740.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-9698.patch<br>
=C2=A0rename meta-oe/recipes-extended/haveged/{<a href=3D"http://haveged_1.=
9.22.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.22.bb</a> =3D&gt;=
 <a href=3D"http://haveged_1.9.23.bb" rel=3D"noreferrer" target=3D"_blank">=
haveged_1.9.23.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libuio/libuio/fix-fclose-=
leak-in-uio_line_from_file.patch<br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.67.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.67.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.68.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.68.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42533-1.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42533-2.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42533-3.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42533-4.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42533-5.patch<br>
<br>
-- <br>
2.54.0<br>
<br>
</blockquote></div>

--0000000000005092f20657ebe96a--

