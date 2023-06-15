Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C188EEB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 17:21:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.24713.1686849671355092160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 10:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dqg/jd//;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3111547c8f9so869839f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686849670; x=1689441670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OusvCLrVCz3IW6+mPmAKnr/GyRcREeoZiLSvkhMvU6E=;
        b=dqg/jd//YqYiTlizh5XjRonA5RcXnCkab6aquEAVbs4Jzf4Nk9DgxyfaB+y3W8PaFD
         4BaLVT87lgLGYkim8P+ip5YCD8ITEwJniyhQJZ/7e0Tf4d35SOPiR/udpbX1ZUaMDPex
         UPAZdbuhbnMc2rZRjAsR1dyK4YGFiitRmHVBm79OUonqluKwyQACBhNI0f1bBO9nHnuO
         oxGIOC6x2VCbUbTdG0Evs5ImJraWb4HJ7Y54xG+NvbDo/PZrbvxUGmMxGh8k+hQ55nnr
         QFIxB06Ta1HNDqgJI+feltSRJQMiy1uNKbxWXL7u0UXfDdED5mZPNtG0uzCQs87EnqmE
         9cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686849670; x=1689441670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OusvCLrVCz3IW6+mPmAKnr/GyRcREeoZiLSvkhMvU6E=;
        b=A4zYci704xzelCcP/u0as5KYJq8d6kkEYACOxTPFc0AiQIWRNoE4kTGW3KfE3jJKvw
         oGDXuCSYfvPyt+/al9ylDAPVt/GKWNDUyb1Y3tOfm3RyGAKeRzusmKis7Vx5KnnR3UGZ
         t0RccDqKzMeMnebZL5FVUCO7qj2VPI5Q3s8P2Aw3K8FA2dWBMXXRpEqDSEjJiI0NsHvx
         5aHAVVc8paTzBS8br/Lg+Cqu1LvoHFDcLiNmkNFeT6Mpap4Rs9OuMKr3HwLrsvHb19QL
         BXirYe4BjVoIyLyb0rQHNO0wlgt/MiTTjbTQ2yPYtneeoNGpFL5QaGzGPanQdRGHcnaA
         F36g==
X-Gm-Message-State: AC+VfDxDr3EfnpltDs4GJBpPNfqciCYRUSgBFxZUPXXeVWi+DkJ5jshm
	6SrvZWn0+81YMl3bunE7YXQqFcx54cOCz/H54wE=
X-Google-Smtp-Source: ACHHUZ6FWyeKmo9w2b1boS8s8bL6ZNcD4CZgHR8jQZOIP/2VxAw1g/3RZKYBuK889HJg7/o6FPJKtMy1/i0WIgpNsao=
X-Received: by 2002:a5d:6706:0:b0:30f:b953:f9fa with SMTP id
 o6-20020a5d6706000000b0030fb953f9famr10426562wru.16.1686849669432; Thu, 15
 Jun 2023 10:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230615100658.543762-1-archana.polampalli@windriver.com> <SJ0PR11MB671749E856BD1A629D4E062CDC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB671749E856BD1A629D4E062CDC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Jun 2023 19:20:58 +0200
Message-ID: <CA+chaQcJ++DYB=ThD5Yb3sg4ovPH2Gh6Zi3-KbnVTB0+jgzskQ@mail.gmail.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2022-41916
To: schitrod@cisco.com
Cc: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"Hari.GPillai@windriver.com" <Hari.GPillai@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000560c0a05fe2e4bd2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 17:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103318

--000000000000560c0a05fe2e4bd2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I do agree that a link to upstream patch does belong to
Upstream-Status as:
"Upstream-Status: Backport [link]"

When there are many Backported changes I also prefer to add in which tag
they were first included as e.g.
"Upstream-Status: Backport [v1.1 link]"
to make it more clear which patches are expected to be dropped when
upgrading past 1.1 version.

And I think it's better than in separate lines used in the .patch:

Reference to upstream patch:
https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03=
af80c2c

So I think Sanjay's recommendation is useful one for future patches.

Regards,

On Thu, Jun 15, 2023 at 12:48=E2=80=AFPM Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) via lists.openembedded.org <schitrod=
=3D
cisco.com@lists.openembedded.org> wrote:

> Hi Hari,
>
> Regarding format only nothing specific to review of fix,
>
> I saw many developers has contributed to samba package fixes.
> I would be great if we can keep common format inside .patch file as
> following.
>
> ----------------------------------------------
> CVE: CVE-2022-41916
> Upstream-Status: Backport [
> https://github.com/heimdal/heimdal/commit/eb87af0c2d18]
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ----------------------------------------------
>
> Thanks,
> Sanjay
>
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Polampalli,
> Archana via lists.openembedded.org
> Sent: Thursday, June 15, 2023 3:37 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Hari.GPillai@windriver.com
> Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
> CVE-2022-41916
>
> Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.
> Versions prior to 7.7.1 are vulnerable to a denial of service
> vulnerability in Heimdal's PKI certificate validation library, affecting
> the KDC (via PKINIT) and kinit (via PKINIT), as well as any third-party
> applications using Heimdal's libhx509. Users should upgrade to Heimdal
> 7.7.1 or 7.8. There are no known workarounds for this issue.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-41916
>
> Upstream patches:
>
> https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b=
03af80c2c
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103297):
> https://lists.openembedded.org/g/openembedded-devel/message/103297
> Mute This Topic: https://lists.openembedded.org/mt/99545598/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000560c0a05fe2e4bd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I do agree that a link to upstream patch does belong=
 to Upstream-Status as:<div>&quot;Upstream-Status: Backport [link]&quot;</d=
iv><div><br></div><div>When there are many Backported changes I also prefer=
 to add in which tag they were first included as e.g.</div><div>&quot;Upstr=
eam-Status: Backport [v1.1 link]&quot;<br></div><div>to make it more clear =
which patches are expected to be dropped when upgrading past 1.1 version.</=
div><div><br></div><div>And I think it&#39;s better than in separate lines =
used in the .patch:</div><div><br></div><div>Reference to upstream patch:<b=
r><a href=3D"https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c=
7daf483a47b03af80c2c" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03af80c2c</a><br><=
/div><div><br></div><div>So I think Sanjay&#39;s recommendation is useful o=
ne for future patches.</div><div><br></div><div>Regards,</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1=
5, 2023 at 12:48=E2=80=AFPM Sanjaykumar kantibhai Chitroda -X (schitrod - E=
-INFO CHIPS INC at Cisco) via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;schitrod=3D<a href=3D"mailto:cisco.com@lists.op=
enembedded.org">cisco.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi Hari,<br>
<br>
Regarding format only nothing specific to review of fix,<br>
<br>
I saw many developers has contributed to samba package fixes.<br>
I would be great if we can keep common format inside .patch file as followi=
ng.<br>
<br>
----------------------------------------------<br>
CVE: CVE-2022-41916<br>
Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/co=
mmit/eb87af0c2d18" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
heimdal/heimdal/commit/eb87af0c2d18</a>]<br>
<br>
Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@=
windriver.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<b=
r>
----------------------------------------------<br>
<br>
Thanks,<br>
Sanjay<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=
=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"ma=
ilto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openembed=
ded-devel@lists.openembedded.org</a>&gt; On Behalf Of Polampalli, Archana v=
ia <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_=
blank">lists.openembedded.org</a><br>
Sent: Thursday, June 15, 2023 3:37 PM<br>
To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"=
_blank">openembedded-devel@lists.openembedded.org</a><br>
Cc: <a href=3D"mailto:Hari.GPillai@windriver.com" target=3D"_blank">Hari.GP=
illai@windriver.com</a><br>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2022-41=
916<br>
<br>
Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.<br>
Versions prior to 7.7.1 are vulnerable to a denial of service vulnerability=
 in Heimdal&#39;s PKI certificate validation library, affecting the KDC (vi=
a PKINIT) and kinit (via PKINIT), as well as any third-party applications u=
sing Heimdal&#39;s libhx509. Users should upgrade to Heimdal 7.7.1 or 7.8. =
There are no known workarounds for this issue.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-41916" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2022-41916</a><b=
r>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7d=
af483a47b03af80c2c" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03af80c2c</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@=
windriver.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<b=
r>
---<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103297): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103297" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103297</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99545598/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99545598/3617156</a><br>
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

--000000000000560c0a05fe2e4bd2--

