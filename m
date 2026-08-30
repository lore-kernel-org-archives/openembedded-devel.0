Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C79C61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 18:31:47 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13741.1788114706632442061
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 11:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HcPZHhgT;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ee6b2da98so33122027b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 11:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788114706; cv=none;
        d=google.com; s=arc-20260327;
        b=AnVbfQk00iP4sBATET5/rDhKmXeiJoRm5DknK7vyXpQ7/Q4t4r45oo9be5DNUWCGYT
         NCYpaFwBgGFM5lgFtTtmQFqO9Y5dtPeB2BgQNlL5qaqOaqa7RVGtjN+TvDNsHzfgnmMr
         kHDH51P8iSHK8LnldarjHr2N3sIciB9wrXIy2OI+1ChEuJrhLmppuBP5pnyFeohwC3jW
         XadGbtMARZH0D9fyms5yYhDJj0wwrHtT23auE5VnBg2zZoTmuTnBnIpIQ0wZOF4+8ajM
         1iDxwRt1+r7nGutul2aqiBy3RJOV6EtYVhxiBJqnGvov1WeUFX/N5lWyg4wgAEf8C1+p
         Gy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UUnuUV5Wo+XqQ+ejvL4GTH8WutR+ne5AQDrx1ziCCkA=;
        fh=zuUO74UOB17NBaaWR1Ig9VcZFyGpk2Me7Bc/1jELMJE=;
        b=ZvVMqZvL1Y3B8BFkgbCJXL1Qz90631iOn4H6OuIcYk9LMANW/ZgxsmAQzIFMKOdb3d
         x6Zsypier4rk2Xq3+/42ainqqeQVet3oc+ZSy4DcCapZsQJtq2a8cmQrYRmPqwL5txPx
         dqzQbdidPFsKbwwBu50MHiXjrCmUck45yKPJAcYIo+bwGvZRigrSIOTEYCIGNAuiclBT
         +jlC14qXlw+LCpkkAYjdvi/Ou2DVmJsQRwFdKBmKFyY/glgPl+92P/T6STQZHgxb060p
         1RqrXkffv5oFU86X+jHzcIKCkDHZ2bxQgLy1ADcQkRbMdg/61tHnPJzQ1zDO4a51FqWW
         BJwQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114706; x=1788719506; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUnuUV5Wo+XqQ+ejvL4GTH8WutR+ne5AQDrx1ziCCkA=;
        b=HcPZHhgTMZ5aniyuPIkFPGJXUolmvdrfFbKInfQziTf3R55pwge6medHH24B1dZ5kX
         N3tKG1CD2D0Vg+BdiVqPZT8Y7vB3x75PJuH+Raqh1ubN8WkopmgewDplBzhiRH7sCh3+
         XFqCemBmeCvod5kPsL7//PjjWUk91nYwOUWI3XJJpeI2j78+i1gHas7QVMjj9FpPqYnH
         2yBkeyVFKB6Z+/zC8ATOeP6jPxP4LpHeDLBwa/tRqI8PUiliz92HAPlpFjxffSY+rzzP
         wxdnuK0CgQ0LGB/m2Ry/R5bJHRErEicxWm0TebObT4VGFzfKKtYYH9iWvISQ8sRxCjx4
         V1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114706; x=1788719506;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UUnuUV5Wo+XqQ+ejvL4GTH8WutR+ne5AQDrx1ziCCkA=;
        b=jpYCIW28JgagaZLneUIW4IVdZGD8sZa9yTNjoUHUqdBT+azkAoN5AvYqXXiJjymW73
         ltcgTuH9vZNxGeQJDQlrKgQANl/kl2+8oPDW1sG436W3PgKbv1Dm/4wF9Zg9mdZDDkze
         4yofQa07wG6HIZD425lDUAUoaQErk7GZu/4DcOC3pouqCMS1KQZCtdOcER9/Pnb/mjCt
         aGaJ4CYU6uqKcINEQW9G+ErwYkNvV2aUt1zro99FhwpPJAQhEpLpKrha8+xQrLR+GCx6
         YTcikOAXAt2a/KLFGrrj9XwdiVg+24M2MZhe+iX49AcK/q55RlDYleN80JYS+hLIa93r
         +3Pw==
X-Gm-Message-State: AFuF++nWV5kL3ElVhyLiHINNa/qVDa060BWnMKql7Rm+P6lbK92oOGUC
	jd+vWVntvarVqZwoo8VYPgAPSa4cNvO0f+PhNo82r7HSQILCejAC5rHSxxu4CUx+PRPSaFtb2ym
	zUISeAEnnZ3Ogsg9JmGEum3L4IvUfkJw=
X-Gm-Gg: AYBFou1yvzH5kqox0vhC2vANM8QLCZBsO9CqIaVVM6lQvp2kdZSJZL+EgGkROAkEAzH
	ZZtL9a1NXw/LVvIMy3CDQKw27mlsOmS5dIf0Zqg/6EOL/dqpaiBiKAr0WTmx0Y6aCmUcVPYp7+9
	CDu1BpZj/twZIqLsWPTVckYf0DxQNgYYZsUQF1QXm/O0Ve2xq2Uua8VS2dT3JTc6/J8V/2tz2dF
	vYb64bZH9iae2+g3FFLiTPsk63xEGsAo/jSYadCtrnXRaItOU8mjUGphwd6p+U1ZkQUUASnhTYa
	ANBfw684aHuDVi827vGS/8ylyoTCm00IRIJ1QtHeIVmX9h/8T3S1G8IIyIvExasDxlP/3AR1QtP
	ACpoEq3zm2qsSKIYPps37N06znBKazSvroLpkGSAKfeKMXOj9IzESDrkgwcUfbQbULy8hNWmJfO
	fLhtc2pbBVzH4wuK8NP1yuhieyS789WMFTCSfevU29HTEvda9i/9IOPX0xxvyXlpLotr1Sw//cC
	LKjk2vs38wy/g==
X-Received: by 2002:a05:690c:386:b0:855:2d6d:2db5 with SMTP id
 00721157ae682-85d69e03e9cmr76674877b3.12.1788114705598; Sun, 30 Aug 2026
 11:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=yheHCLAo=jCHROfC6k99652Kg73tZBJie1woRcgA8ccFw@mail.gmail.com>
 <CABF_=yird-Xz_nEWtVbgeve0WC2FH_Bq8Nu39kx2-DveyaHZZA@mail.gmail.com>
In-Reply-To: <CABF_=yird-Xz_nEWtVbgeve0WC2FH_Bq8Nu39kx2-DveyaHZZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Aug 2026 11:31:55 -0700
X-Gm-Features: AcwNN1VJcpMlw8m_fl69GOOuwgXpLoSOwdVfCpPQxPyyJZNblGnBQGeF-bEaDSg
Message-ID: <CAMKF1spidgd5zZgf98evVWEHgPeMXTg99tc6F7pojOhnuZZVLw@mail.gmail.com>
Subject: Re: [oe] When can a recipe scattered around be ready to promote to meta-openembedded?
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d8518d065a47e56a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 18:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129599

--000000000000d8518d065a47e56a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Being in multiple layers is a good argument to bring it into common layers
along with that it should be a maintained package upstream. I would also
suggest to add ptests when bringing in and update to latest version. Once
merged, notify the respective layers about the move as they might need to
adjust for future releases. Ensure that it does not create additional layer
dependency for the target layer where it is being proposed for.

On Sun, Aug 30, 2026 at 11:22=E2=80=AFAM Jan Vermaete via lists.openembedde=
d.org
<jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:

> Let me redo, without sending it too fast :-(
>
> For example the recipe python3-construct
> (
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpyt=
hon3-construct
> )
> exist in 5 different layers.
>
> Although it didn't had a release in the near past
> (https://pypi.org/project/construct/), those 5 layers kind of prove
> it's a useful thing to have.
>
> So, when and how to promote this to meta-python?
>
> On Sun, Aug 30, 2026 at 8:19=E2=80=AFPM jan vermaete <jan.vermaete@gmail.=
com>
> wrote:
> >
> > For example the recipe python3-construct
> > (
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpyt=
hon3-construct
> )
> > exist in 5 different layers
> >
> >
> > openembedded-devel@lists.openembedded.org
> >
> > --
> > Jan Vermaete
> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hame=
l
>
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129598):
> https://lists.openembedded.org/g/openembedded-devel/message/129598
> Mute This Topic: https://lists.openembedded.org/mt/121002496/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d8518d065a47e56a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Being in multiple=C2=A0layers is a good argument to bring =
it into common layers along with that it should be a maintained package ups=
tream. I would also suggest=C2=A0to add ptests when bringing in and update =
to latest version. Once merged, notify the respective layers about the move=
 as they=C2=A0might need to adjust for future releases. Ensure that it does=
 not create additional layer dependency for the target layer where=C2=A0it =
is being proposed for.</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 30, 2026 at 11:22=
=E2=80=AFAM Jan Vermaete via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;jan.vermaete=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Let me redo, without sen=
ding it too fast :-(<br>
<br>
For example the recipe python3-construct<br>
(<a href=3D"https://layers.openembedded.org/layerindex/branch/master/recipe=
s/?q=3Dpython3-construct" rel=3D"noreferrer" target=3D"_blank">https://laye=
rs.openembedded.org/layerindex/branch/master/recipes/?q=3Dpython3-construct=
</a>)<br>
exist in 5 different layers.<br>
<br>
Although it didn&#39;t had a release in the near past<br>
(<a href=3D"https://pypi.org/project/construct/" rel=3D"noreferrer" target=
=3D"_blank">https://pypi.org/project/construct/</a>), those 5 layers kind o=
f prove<br>
it&#39;s a useful thing to have.<br>
<br>
So, when and how to promote this to meta-python?<br>
<br>
On Sun, Aug 30, 2026 at 8:19=E2=80=AFPM jan vermaete &lt;<a href=3D"mailto:=
jan.vermaete@gmail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; For example the recipe python3-construct<br>
&gt; (<a href=3D"https://layers.openembedded.org/layerindex/branch/master/r=
ecipes/?q=3Dpython3-construct" rel=3D"noreferrer" target=3D"_blank">https:/=
/layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpython3-cons=
truct</a>)<br>
&gt; exist in 5 different layers<br>
&gt;<br>
&gt;<br>
&gt; <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D=
"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt;<br>
&gt; --<br>
&gt; Jan Vermaete<br>
&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el<br>
<br>
<br>
<br>
-- <br>
Jan Vermaete<br>
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel<br=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129598): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129598" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129598</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121002496/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121002496/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d8518d065a47e56a--

