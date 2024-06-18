Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF27C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 13:31:43 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.86265.1718717493862285939
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jun 2024 06:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kgPsMN8z;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6e40d54e4a3so4053414a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718717493; x=1719322293; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nWJlYVgNbLdqYFsacj3IdUR8Kw3EMJcDU4RSz4hPTTM=;
        b=kgPsMN8zODAZuOR4/i0mnV182hrS0hkyQhv6EfdRdK3T9s6+MsGuF8RHCAZQ3FLy6f
         Xcd2lbKUXGKDTd9+o6Qxw0ZrzhZeWdwobtjM7OIxhnqnEkzH/7prT+QnCPD/L33ulqbv
         9fg5tsM88/+wzvEcalNymD+MU6J+wcprFgHUXksCWrH+kZ5agLrF61s5lntV2/B2GF7n
         iAi8I1gqhov39Hq5Jc20h0y6jYa2NlbIWo6hfo/Q6cpNZJaT75kLEOXgvJMjMDOSi+jF
         7ebvaYVE2E4OuVwHvmg0nDw2C0NzLo1rEu3+0gORFs1T57ztjITXESR2FgKz0YQRGYQC
         Baqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717493; x=1719322293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWJlYVgNbLdqYFsacj3IdUR8Kw3EMJcDU4RSz4hPTTM=;
        b=q7Kod5lRKuWbOx/rg6v0ApiUWMPBzMkIXhKfIhOlk588OrYIo0uanqj2ZT59xSncEE
         or5oPkt1UHHVeCgtz2vTnVFPV54gWbUjkLozF8hrFkuYYJPx7x+Gud+PWheKJeK/Tw8d
         lYLXBvgXKz5A5H/qOOQ06bbdFqyPz0m2bg/HtWQ44VAnzbglkNO5jzj/4/ZpjriQyAYw
         e+YGOYWJikn599U/oFy5Rt6vqCAKOQdoXfy25vntrB0bSkSLGlxhHCAzqwb9wAGc951A
         DZ9i03XgKons30clK5zpla7oOpG4I+OEvu9joSdqxsaRpMJE+LlyrhYZ2vtR5x5Rfu1G
         3IEQ==
X-Gm-Message-State: AOJu0YyzTkNrjSuUvPz5PomNQClLzJzeF9fJcQnbNfhHQcrTb0LljDsq
	Lwhog4kkE4Qz4DctDkWMI3d73Fv94f+X0UihuKXpgEFj915fvz8bA2t2mSAJ5CEvvg8YWGZQKSl
	iMzfyANAay/7Fw8/wTVClkix222o=
X-Google-Smtp-Source: AGHT+IECO+OwHOKqYJIIhsAznOiYuh1Bw+5bN3NU0bOtGbiWd0VbB3fVs7qZwGF3zTJNl9/J1iIPgyAdwW/j5BxFbDA=
X-Received: by 2002:a17:90a:c903:b0:2c3:3d22:b304 with SMTP id
 98e67ed59e1d1-2c4db13220dmr11279435a91.3.1718717492929; Tue, 18 Jun 2024
 06:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240614111911.46353-1-ninette@thehoodiefirm.com> <20240614111911.46353-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240614111911.46353-2-ninette@thehoodiefirm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 18 Jun 2024 15:31:21 +0200
Message-ID: <CAApg2=SS1O4LrEJOTWf4SD13yji2Pu0SCnXTV1STOzy0BTeVgw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/1] smarty: Update status for CVE-2020-10375
To: ninette@thehoodiefirm.com
Cc: openembedded-devel@lists.openembedded.org, engineering@neighbourhood.ie
Content-Type: multipart/alternative; boundary="000000000000a2af9b061b2a191a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 13:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110952

--000000000000a2af9b061b2a191a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 1:19=E2=80=AFPM Ninette Adhikari via lists.openembe=
dded.org
<ninette=3Dthehoodiefirm.com@lists.openembedded.org> wrote:

> The recipe used in the meta-openembedded is a different package compared
> to the one which has the CVE issue.
> Package used in meta-embedded: https://www.smarty.net/
> Package with CVE issue is from newmediacompany:
> https://www.smarty-online.de
> No action required.
>
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  meta-oe/recipes-support/smarty/smarty_4.4.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
> b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
> index 1caa4cd1b..e0979bb5a 100644
> --- a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
> +++ b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
> @@ -24,3 +24,5 @@ do_install() {
>          install -m 0644 ${S}/libs/sysplugins/*.php
> ${D}${datadir}/php/smarty3/libs/sysplugins/
>  }
>  FILES:${PN} =3D "${datadir}/php/smarty3/"
> +
> +CVE_STATUS[CVE-2020-10375] =3D "cpe-incorrect: The recipe used in the
> meta-openembedded is a different smarty package compared to the one which
> has the CVE issue."
> --
> 2.44.0
>
>
Hello,
I think that here, instead of CVE_STATUS, it would be better to clarify the
CPE. Recent CVEs in "the PHP smarty" use smarty:smarty CPE, see:
https://nvd.nist.gov/products/cpe/detail/1CEBBFA2-1F23-49CA-99EE-4EC4497960=
7B?namingFormat=3D2.2&orderBy=3DCPEURI&keyword=3Dcpe%3A2.3%3Aa%3Asmarty%3As=
marty&status=3DFINAL%2CDEPRECATED

Kind regards,
Marta

--000000000000a2af9b061b2a191a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 14, 2024 at 1:19=E2=80=AF=
PM Ninette Adhikari via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;ninette=3D<a href=3D"mailto:thehoodiefirm.com@lists.o=
penembedded.org">thehoodiefirm.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">The recipe used in=
 the meta-openembedded is a different package compared to the one which has=
 the CVE issue.<br>
Package used in meta-embedded: <a href=3D"https://www.smarty.net/" rel=3D"n=
oreferrer" target=3D"_blank">https://www.smarty.net/</a><br>
Package with CVE issue is from newmediacompany: <a href=3D"https://www.smar=
ty-online.de" rel=3D"noreferrer" target=3D"_blank">https://www.smarty-onlin=
e.de</a><br>
No action required.<br>
<br>
Signed-off-by: Ninette Adhikari &lt;<a href=3D"mailto:ninette@thehoodiefirm=
.com" target=3D"_blank">ninette@thehoodiefirm.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/smarty/<a href=3D"http://smarty_4.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_4.4.1.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_4.4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">smarty_4.4.1.bb</a> b/meta-oe/reci=
pes-support/smarty/<a href=3D"http://smarty_4.4.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">smarty_4.4.1.bb</a><br>
index 1caa4cd1b..e0979bb5a 100644<br>
--- a/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_4.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_4.4.1.bb</a><br>
+++ b/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_4.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_4.4.1.bb</a><br>
@@ -24,3 +24,5 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/libs/sysplugins/*.ph=
p ${D}${datadir}/php/smarty3/libs/sysplugins/<br>
=C2=A0}<br>
=C2=A0FILES:${PN} =3D &quot;${datadir}/php/smarty3/&quot;<br>
+<br>
+CVE_STATUS[CVE-2020-10375] =3D &quot;cpe-incorrect: The recipe used in the=
 meta-openembedded is a different smarty package compared to the one which =
has the CVE issue.&quot;<br>
--<br>
2.44.0<br>
<br></blockquote><div><br></div><div>Hello,</div><div>I think that here, in=
stead of CVE_STATUS, it would be better to clarify the CPE. Recent CVEs in =
&quot;the PHP smarty&quot; use smarty:smarty CPE, see:</div><div><a href=3D=
"https://nvd.nist.gov/products/cpe/detail/1CEBBFA2-1F23-49CA-99EE-4EC449796=
07B?namingFormat=3D2.2&amp;orderBy=3DCPEURI&amp;keyword=3Dcpe%3A2.3%3Aa%3As=
marty%3Asmarty&amp;status=3DFINAL%2CDEPRECATED">https://nvd.nist.gov/produc=
ts/cpe/detail/1CEBBFA2-1F23-49CA-99EE-4EC44979607B?namingFormat=3D2.2&amp;o=
rderBy=3DCPEURI&amp;keyword=3Dcpe%3A2.3%3Aa%3Asmarty%3Asmarty&amp;status=3D=
FINAL%2CDEPRECATED</a></div><div>=C2=A0</div><div>Kind regards,</div><div>M=
arta<br></div></div></div>

--000000000000a2af9b061b2a191a--

