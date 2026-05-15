Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED98CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 14:23:12 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36102.1778854984522050667
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2026 07:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Pe0pBeo7;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65c7a459105so2277806d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 07:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854984; cv=none;
        d=google.com; s=arc-20240605;
        b=Cp8TsB7MbJsRDgvhpKpM8MjSnXT+ZoX1zrWQVhyBv5kLSyZlqNznuH9rq28xyNszTu
         dVAUZ+PvhyQxUuxdAzj5/k/C1rsy2yY2Kw3YvqO1yNdPtwzFmqqLabaPLVokUcg9gmVv
         gAAc4C1qQ4soXMP30y5hk419H6pWXWPie3vnO7l97aB+PPDOsl7XTEukkQoOlcV11lyo
         m2cpNsqPjmx2P9/xgOaDMTwid2vT9rII55n3lLzTIdHVm0nXq8+Bfb8FWst0fKuB9Ln5
         KdFZMwmTVK9QBUrWn5m5hmynH3iPdYVaZn/W9S9gfRcCoRdRRNuZy18wvz9eaEr8tsVw
         qwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=64oPIK7S8b5r4TEDdTn+zonROG4jbqwyQlOKAZP/USI=;
        fh=zDV/DJKlvtgdBhH596m+CAdizR6eZ4xdrOYuUQ4WjP4=;
        b=NblWsJ6x+ZVmxre7G/KDH2ITQMEG5TP7c/ehu5dCiPcrCdcz5RYh0TjPJsBmQMHirs
         A9vAckmq8WjcGib/GSMo1PWz1g0YMXRGNhUw0PNZ82/Ekbf1XNg0U0FttufU6bUtYrYO
         wbdJWUMjMueE1fWHvsZPRRdMar6HEBUYRFvnsNU/DZ6PmXj3dvze2RTzkWWB3hrAvJdf
         MwaZ9SWd97VHUsx3WxfReNbfK11uzSB5KXHtoX4Uh3stWus3pK+UhAC4VW74jJAMwz5Q
         ntZCnUoS38JPtaGdHx87tJGLQLsSsVVnbP+79TsleXnZXQjhm/23FCA9Ovzoxvli3g6Z
         6iJA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778854984; x=1779459784; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=64oPIK7S8b5r4TEDdTn+zonROG4jbqwyQlOKAZP/USI=;
        b=Pe0pBeo7uw6yTQhGeH1z5blGy61hLvLlnS6UFJ1DNhzfcr/9rCbhgh9/DSxU9/IpFZ
         yBQ0lC3yRb9652iveKh4HL3VwHlyMQUpovCMxLsU0aQg5IQ61MgTqXpl9LaU3cpsJ2g2
         5B/QweH+6+eRjwC7e/J6nfugndGAH1r8xQE4vfD5MTVu4jinSo/tOGsvbkjB7y65eVOu
         BxPPlpLPn6TjdL1UfgdlULZT5lkM4kvfeAlgd3FNY1RbBesxWpZgHvarGeDIUxAMER8C
         7xrR6YiqkJtzeNFe8jD9Z21/eXvlf1dPCezPdo5cby7LoqAA+lbQQ+0FKWQf8ZWdtqlH
         CCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854984; x=1779459784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64oPIK7S8b5r4TEDdTn+zonROG4jbqwyQlOKAZP/USI=;
        b=PtUfdg3rMNkaNc4b2UBaE3IAzZosRf5Suj5Lc+ikLMLAmH22eUYh2CTVNqh19ZaB9s
         JQRxqdh/vdnP5Z141eEu4I6U85ccWR73u5dfkPLdYofeCTUlT6+jb5lLxcS6HLGLy98V
         kqHCVMBZzGnakODbxBbZ/JjHaR5EVD4C4uqNIpTRoJEo7ek9rUESi6CBevO3yy8VMs2B
         rR2XY0EUnxHfgIFOS/MYWFC3nguScabyP6Eira+UX934XM+Yi4OrXJ9K92E2rWbhs1I7
         0UMKBCQ6EBdNysEk9eCgIvkXFUUYN+VSyxRgaoQaF4Qex5uo/1SzeglojjL7S0g6C4FN
         lynA==
X-Gm-Message-State: AOJu0Yx+L4+aGsXnkow6+i9oxneoQs1PlUrGWLfzsYZiPMDMU/naV/Ce
	5wSpCGWbFggKn8IWGsOs4uHOaQVvRe+VQ8KhBE7mZhM7M/CQVr8+YLf5i0xr7LCsJRu4tU+11Mw
	l17rI4y4km6o+a6do1nyA0zuBZZriy+k=
X-Gm-Gg: Acq92OGXo2d41u8GdGCxNKciVrQvfhu5fEATklQjvwIEt1oena5cganT6DsOjrNpsBS
	C2P7HKK2y/Ddy+/EGxespEOhq7Py4WqWvNN/bMq/KsuvzLKsJW0EJpii0sG+tw4r/6dEigHNA6x
	8XXPg4nPbpm2IjsCBA5otsTkWVyvz9nWeFjjwGEXw9T+6x2OQX4lR46OjGmU24F4szRqQxY6mcZ
	MwHH2H+mZ9sa7byVoRVcaYpEYUVQ/1XviBgXE1DFKQMeN1K67ruGLf0Tj5dyD4XHGqgq0wg08cK
	NhkHByjZHXxko2Z+d4+AVAHSn8hihk+VCq60M48vJYILHdRlwvEp7k4ZpALHdkP6SG8JntViXUs
	xgtIfktRGPpVjCXG5meuqOSGS+X6Aon5NiAUhgKLW9h1ZgesPQ0+gtSgMINzEdRe/ZkPkobyvlU
	4xDBUcHhAzk369qJY=
X-Received: by 2002:a05:690e:1595:10b0:650:4854:10ec with SMTP id
 956f58d0204a3-65e0b274c0amr5941058d50.35.1778854983580; Fri, 15 May 2026
 07:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260515123037.9535-1-schonm@gmail.com>
In-Reply-To: <20260515123037.9535-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 May 2026 07:22:35 -0700
X-Gm-Features: AVHnY4Lgu_0vf78CsdyyL8dtbzi4Idwhc9iWgdS79Arqa6-w4mPNDimxwoEeE-4
Message-ID: <CAMKF1so-8N4G+b1hbXbPXciHACV3=NOeRzwLTj+qLJDjr+W_QQ@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][wrynose][PATCH] Update README.md example
 with new branch name.
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000673fc30651dbf3c8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 14:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127008

--000000000000673fc30651dbf3c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 5:31=E2=80=AFAM J. S. via lists.openembedded.org <s=
chonm=3D
gmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  meta-webserver/README.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/README.md b/meta-webserver/README.md
> index 17c7c76d94..35e04853de 100644
> --- a/meta-webserver/README.md
> +++ b/meta-webserver/README.md
> @@ -54,7 +54,7 @@ with '[meta-webserver]' in the subject.
>
>  When sending single patches, please use something like:
>  ```
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D"meta-webserver][PATCH"
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D"meta-webserver][wrynose][PATCH"
>  ```
>

would you mind it doing for all layers READMEs under meta-openembedded ?


>  Layer maintainer: Derek Straka <derek@asterius.io>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127006):
> https://lists.openembedded.org/g/openembedded-devel/message/127006
> Mute This Topic: https://lists.openembedded.org/mt/119328583/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000673fc30651dbf3c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 15,=
 2026 at 5:31=E2=80=AFAM J. S. via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;schonm=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Jason Sch=
onberg &lt;<a href=3D"mailto:schonm@gmail.com" target=3D"_blank">schonm@gma=
il.com</a>&gt;<br>
---<br>
=C2=A0meta-webserver/README.md | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md<br>
index 17c7c76d94..35e04853de 100644<br>
--- a/meta-webserver/README.md<br>
+++ b/meta-webserver/README.md<br>
@@ -54,7 +54,7 @@ with &#39;[meta-webserver]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
=C2=A0```<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&quot;meta-webserver][PATCH&quot;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> --subject-prefix=3D&quot;meta-webserver][wrynose][PATCH&quot;<br>
=C2=A0```<br></blockquote><div><br></div><div>would you mind it doing for a=
ll layers READMEs under meta-openembedded ?=C2=A0</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0Layer maintainer: Derek Straka &lt;<a href=3D"mailto:derek@asterius.i=
o" target=3D"_blank">derek@asterius.io</a>&gt;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127006): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127006" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127006</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119328583/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119328583/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000673fc30651dbf3c8--

