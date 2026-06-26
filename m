Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8FCCDE010
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 04:38:36 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28844.1782448715398857219
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 21:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PamiLo84;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66490aba02aso738884d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 21:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782448714; cv=none;
        d=google.com; s=arc-20260327;
        b=eJ6/fIcLjsci9sn1WwoDEhTw6hTs7nOZyCvGhVQ/BscOsWTsSnipNCV4gZ4QMd1vor
         URqQbnbK5rAb+G+8Yo4efKQxtgz15GY/IxX+EDMPPAFq3j0LF1xRjvjEm2IHV6O1ZQW7
         2f7qCC7w72qmYeSle1QcWpR+CukOksWfmdgbAPQJ1INKtoBAX42LF2y2RKXWXEVx5hty
         ihpiIEPgrbllX0U4A3I43tBMV2PQNaCHADIYdYCsgz/tNKkFGiw6ZK7XhAl7qpp4nY6y
         qh7Dq4sUssMcQ28ozkPGdLt4gkc3l523/1KCSOVS89kBrVjqqWTIlymX2Xy+vYOU95ky
         14UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SYbIgQ88bY58MorDzUQ+oiWSRTZseO9sRb+aOoPDfTw=;
        fh=8PNNY1YBP0k7pC4r+iuqHOgIvHG77TE5OGYfiV9c3VM=;
        b=M0pRCndzDHxyx6UnxJi9i2ajDBTwia1z3soO+MdUIzo/xCapJHTxGg/YtxNZRi8Mjd
         2xbQAEg1MKooPbpJ4VzGR2IRUMqNwWqbDUoO0w2qNrWjIfjB0zNP32YAfYuEdZRn+VXC
         lVEnR2hZ3BB7vkM6Ct6UKh24mlPXes4SA/e4conDfe7cbHhex+ODJtdU7xYD6v+G5ELi
         olNsqrh/pyWz4cj3LMPTML9zF5UTDGfpH4KPO8bh2QHYPayaevruvd9ej+/wyQax0qmN
         m/+DM1/DYdZzcSFSKznWfzc9yFb20Vf4zQh4fMp2AH9VgTOJ6OxhG+usUghLgjG9Bcyg
         Pevw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782448714; x=1783053514; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SYbIgQ88bY58MorDzUQ+oiWSRTZseO9sRb+aOoPDfTw=;
        b=PamiLo8484z80N2Qc4OtmP9U0T5s8spObb7ebJDjrAh7e2eec6P4zAmuAt7D/SPuos
         kxFsDIXCzcieMKZmxDkX6tzxKf/6RudtjxDGmeBMF/j++3dNrv7dlk5LNKMs54mqm/qc
         Ug7Bt2O1/4smf/PhLAa8CdnoBPkfqla5dn9aL04GFr/VEQqKf/jRkPcbPvMkfts06wMJ
         vGG7fVKuVnNJ2+laYgPLi5bWFt1TGxWA4CnQLRRgwiURXxjIlKYuPW1RkMg5Z5kl4PfD
         M3nJb80ePeTnBVHgPVcQA+PtB07uzDZz/rnNm10n2L1UdwZ/IRJNd1/nEYLwJpSrcfN8
         R8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782448714; x=1783053514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYbIgQ88bY58MorDzUQ+oiWSRTZseO9sRb+aOoPDfTw=;
        b=jmZ65V3ftibp/0mjy9NovmVuP5k8FgeT7dY6XgEAyYhi2uWHRqELWtFFM63wQuWIvf
         aaD442aFXs1AC97CH/djHq8GsXRCF+3YQaB9YR7ObAsyLZJwMNzfpcFCbttdI9Ebtaam
         3pwTndrTDgoSPQaSWhsw9kdP3uvoZccGJ0oS/eJzba20QMUTtZrItIMwvtwOrvbp7Zl2
         FrGTiZ7bHONmW9mvCKPKIHOEym1w+jTLp0jAcUsXNk5T3Lq7kI03QA5Np8xx6N6w7w+C
         7l2W7TXo6i+327q8OkgwDF1pPWqQLTl7HHWWo1jT6+WCFUFK5Y6VTmjn6JmXO1WVMTex
         rWKA==
X-Gm-Message-State: AOJu0Yz3KnJm6nvs853yn3lVCIHc8F3csaTLRyeCqeXi2It82eg0y7M+
	i01QmEMSenWBm4O3soXD+T57YR9bPHCIrhOiaupIlRaesqc9dJjCRqrxITxvCrauoTqaV92luXI
	WM+3wWPFm9GUb7d7eCMbymYIo5WHTDTv+YbiXoxw=
X-Gm-Gg: AfdE7cmwdDxcs5u7KiCauCudClBcN2T4lSTjnbEED3/rXZjrLd8zB+EXjuzD3CR0DfC
	VEgcYZKwHelcfD7iFuIxMjShb+AamsP+yxNlzKaJpgGCXRbXAQGqe2wHyfX9xsSGa7OvCmzko4v
	g1EA9Jm3dUd7HXJzV6HOm1VTAMHVYNE7ZgrFm7ZMmfWBrOtG7lryqn+jRnvACaNDAcjiHbpwwbN
	EG5P87tOtY+QqBizGd9muYW3lWeDcgGzCpU1deI16M7vR/lrvxNPzsoDT4KSIwmVYIkV9FlWehk
	M+BAo/dZ6BNaY537Xv8OroiZrKAyJf4oxIVunGtDUzVGsrt/e7bR16ag2SnRQO5vGXTemttbu92
	Z4/Y3/TfUAM5jBfIBuVhV7Oo4DryLCfH8j6SVh//ljoITKSkQ/y1/f6vrWpcraAGQ/PD+Fg==
X-Received: by 2002:a05:690e:e8f:b0:664:71f:c594 with SMTP id
 956f58d0204a3-66487d1b3efmr4784994d50.11.1782448714404; Thu, 25 Jun 2026
 21:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260626043404.3399027-1-Sandeep.J@windriver.com>
In-Reply-To: <20260626043404.3399027-1-Sandeep.J@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Jun 2026 21:38:08 -0700
X-Gm-Features: AVVi8CfDPGCABtEzT52lEu4t8RjPIFQxPeXJKigGxULLBxmYdSSaJcq9o6JsSXE
Message-ID: <CAMKF1sqKwBy+8sYAn5OmtdbDt1+3Lnryuo_OWof+QNzCz1xRhQ@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] meta-webserver/README.md: update
 broken Yocto reference manual URL
To: Sandeep.J@windriver.com
Cc: openembedded-devel@lists.openembedded.org, Shiva.Komati@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="00000000000073d668065520ae29"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127787

--00000000000073d668065520ae29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why is this patch sent again ?

On Thu, Jun 25, 2026 at 9:34=E2=80=AFPM Sandeep J via lists.openembedded.or=
g
<Sandeep.J=3Dwindriver.com@lists.openembedded.org> wrote:

> Update old URL:
>
> http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-P=
ACKAGECONFIG
> to:
>
> https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFI=
G
>
> Signed-off-by: Sandeep J <Sandeep.J@windriver.com>
> ---
>  meta-webserver/README.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/README.md b/meta-webserver/README.md
> index 17c7c76d94..565269648d 100644
> --- a/meta-webserver/README.md
> +++ b/meta-webserver/README.md
> @@ -43,7 +43,7 @@
>    to the PACKAGECONFIG value for the php recipe in order to enable it.
>    See here for info on how to do that:
>
> -
> http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-P=
ACKAGECONFIG
> +
> https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFI=
G
>
>
>  Maintenance
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127786):
> https://lists.openembedded.org/g/openembedded-devel/message/127786
> Mute This Topic: https://lists.openembedded.org/mt/119969484/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000073d668065520ae29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why is this patch sent again ?</div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Jun 25, 2026 at 9:34=E2=80=AFPM Sandeep J via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;Sandeep.J=3D<a href=3D"mailto=
:windriver.com@lists.openembedded.org">windriver.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Update old URL:<br>
=C2=A0 =C2=A0<a href=3D"http://www.yoctoproject.org/docs/current/ref-manual=
/ref-manual.html#var-PACKAGECONFIG" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKA=
GECONFIG</a><br>
to:<br>
=C2=A0 =C2=A0<a href=3D"https://docs.yoctoproject.org/ref-manual/variables.=
html#term-PACKAGECONFIG" rel=3D"noreferrer" target=3D"_blank">https://docs.=
yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG</a><br>
<br>
Signed-off-by: Sandeep J &lt;<a href=3D"mailto:Sandeep.J@windriver.com" tar=
get=3D"_blank">Sandeep.J@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-webserver/README.md | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md<br>
index 17c7c76d94..565269648d 100644<br>
--- a/meta-webserver/README.md<br>
+++ b/meta-webserver/README.md<br>
@@ -43,7 +43,7 @@<br>
=C2=A0 =C2=A0to the PACKAGECONFIG value for the php recipe in order to enab=
le it.<br>
=C2=A0 =C2=A0See here for info on how to do that:<br>
<br>
-=C2=A0 <a href=3D"http://www.yoctoproject.org/docs/current/ref-manual/ref-=
manual.html#var-PACKAGECONFIG" rel=3D"noreferrer" target=3D"_blank">http://=
www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECON=
FIG</a><br>
+=C2=A0 <a href=3D"https://docs.yoctoproject.org/ref-manual/variables.html#=
term-PACKAGECONFIG" rel=3D"noreferrer" target=3D"_blank">https://docs.yocto=
project.org/ref-manual/variables.html#term-PACKAGECONFIG</a><br>
<br>
<br>
=C2=A0Maintenance<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127786): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127786" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127786</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119969484/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119969484/1997914</a><br>
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

--00000000000073d668065520ae29--

