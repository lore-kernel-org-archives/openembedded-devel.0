Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9773DCA5FE6
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 21:54:09 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4533.1768686843673348982
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 13:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SHHSaOBA;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7926b269f03so26960247b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 13:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768686843; cv=none;
        d=google.com; s=arc-20240605;
        b=VgHW0ptKTtg4Pd0MWd0r96Zt+SZZw8tBcDDszUwrdQ7DNXcXsi4bBwncRxrty07VcV
         InK7qeoZIgL4vPKpG7UUJwVzCPjbDK9WOodqqHrVXAw/rqulji7Ku8XmWDFpBlDYUY2J
         Tc1e4kY1hstMIA3wL7oapvSJx58S+1Ig0rFPpspuHGAaVp8qbNfLkfm/+anVf2j9/QgS
         BzgyXnwqSZfuMfbmH3EWy9icJR5XutK4zmcd5AdVLuySmG1F6jjtG05CZF++4+PJUnBc
         qnbbHSkaX3Ve0aWE7bhhN3eTaB5m/JyVH6I4XybPaMFkaSHpUwVwaBn97hxe42B0V5Ah
         Jw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=16CF7c/jtL5GwI/NiSnCR7h1KerUiCSAFXOowRZiijc=;
        fh=cNEV3+nz374qoAuOmK0NcPMcZv2wshaXLDAnI1O70yw=;
        b=KMyu9dfYBhoKz3D6dYzXWrofDI3/oBZNfhgpB5Tg9sd+g/Ho0AvPIQmKGGUqv4/IRC
         Aw7GlnLTenf72SkHvpuGwyDW9Yt2Kr6RCOxpfVuK9nlXO/+1SWsxdsfqSQejPVM5hHuu
         RACcSV4IhK0jvtlZm7ygVwg1J6C5tpWM074a9gAmgw6vfNFlBbRpLRCy7GHH8BP+HYsl
         Kk2xqTr6wltuW8CW2XT5pEle5umxGDgrBuBfPNwzj8NiG7QhmCvBzBO14mGGaxdlNWCn
         /5D5+K4/hIgf71gsy+YT4PQYC12YMzCFB40NVobFYyrlFGjhWY5yQNLX00J+z0+P/LtC
         n/Ng==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768686843; x=1769291643; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=16CF7c/jtL5GwI/NiSnCR7h1KerUiCSAFXOowRZiijc=;
        b=SHHSaOBAKDDITnE+n5yjnQ0wBcfhISKvIK8h1cG/jGye31U2PvNYdpIQTVk1V9actr
         5qOtjgOpSAG4q0TKmseNc4JnM4x6vSqd0qHtKbSUGQr+DUcYG4n3AeTplqPou2LntVS9
         7SqDQQ7gGvF5FS6J82nCoIP5NNXwzWBgxTknX9+CnSVmxOGCZ+V6j3jJD3qr0p0r+2ui
         1MQuNIdqVx/SKhdCn2tlRrt68VkUEKu6VtAM8cHboyRHSVTTXhyU20wn4G8sRXQrCSuy
         0MMVmAQ/qsw2ifMX8TFXnSCXm5fKzCkcsJMcqacqP47WMv7MYFBDPPQW5p/E5W2uY54+
         1IFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686843; x=1769291643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16CF7c/jtL5GwI/NiSnCR7h1KerUiCSAFXOowRZiijc=;
        b=VpDI/ypMC1dJVB5dsdlnvqPj24scif9Oi2f0oGa0AtPf7yw6EWHxroK7kaSXhkuUsc
         n3DDQIaIn4wYYtyr+83R4cAcL+xeHZ+8G/HjTA0S12EQskbZNW/nHwU3zNp4x6HM9KDS
         MuZCP2iX5QkTiwpCmXnHhDeoiKh4Mecw/w20hM9xBRRQrl3Unxom10m35kpCXxJR5iwa
         6MbLTCiJrnFTCnfSm8bTefb+v3uGdKGVqUViZKL3qy4rSTz1uWfCOW+Lm/xdW5T8R9bc
         9msbV24Qp1d+Y4EDDcNQdoTarauEDdQRBCu4XcXgAmtPQGf57LQDGte5S9eqhR2cs0xp
         fbEw==
X-Forwarded-Encrypted: i=1; AJvYcCWg6pfkPHnO2q1fNZNVkXRqG0PEu1h1LdrC2heu738XKM/4RNJcxfNByGlpupJHomm3lpfbwfp4nEO9AfNGYuZhG5g=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyU3Gdw4to6I7Ez5jXVmsTYwFPKD1lqytOiQBRpsKSjGZeEtpHd
	2AKm9Pk9XoFgM9vBjx0l4vWt21eKx0XTxY1de3bRtXNSifgabZUcbup7PEKNLC1zUoJGPv3mNMa
	4QjJVvnreC2MAt4gAGEf62xISCslVYkkJuw==
X-Gm-Gg: AY/fxX5FVs44QYTAYwu7FoLU0O6E5EjyaD/fqAILqDjmvJnzxeYG2NA1QwF+VZeDGAS
	Vh5ndLkiHQbyxi7YHK85ryLT4NjGMrwxTTWsGAPHJ7BULQKDYMLdCx4+UtvAO/U0jHvYKjeH8x7
	7YECtDSLxDxJGGeZluvf0FYZvFFEPvYn0XaAH5D47ur4Krt5VST2rmdAl+WQJ1XJ9AtZh6ARSw5
	oDxZUMNDSdlWZj+z+wLSwn0cHroFPF8aHyrnKl247/WeC/efMDIBr+cbLkMMEtyzcoV27voppyD
	LkdfC8Fe5GIWNY3KWEtNBKwQ1lg50gIieIhhFr7m+Z7cvV7vgz8phigRyaMlgP9qW07aatv8W3w
	5S50nsUFhLFwyIYUCfY0Yo6jF74cbOR+kOSFODNFPokR729dfJFSG2g6D
X-Received: by 2002:a05:690c:c512:b0:789:61ca:88f6 with SMTP id
 00721157ae682-793c523ce57mr126275387b3.4.1768686842712; Sat, 17 Jan 2026
 13:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20260116075959.111147-1-f_l_k@t-online.de> <CADySD0FQ1TaSHvtcs+7ksBe5NJTmd0VepTnYOYie44T112G9tw@mail.gmail.com>
 <OF309T.INVXHWIQ3QWN2@t-online.de> <CADySD0Gy3QXFVT=V3zf3fEPJLcuxKXUXX+K=x6Hz_gpst4jm6Q@mail.gmail.com>
In-Reply-To: <CADySD0Gy3QXFVT=V3zf3fEPJLcuxKXUXX+K=x6Hz_gpst4jm6Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Jan 2026 13:53:51 -0800
X-Gm-Features: AZwV_QicXhG71vessHU_omP_TGhgeohd8MCT3xXixG_JIt-PBppf9oszxckjawg
Message-ID: <CAMKF1sq0nLeHQ6qZpN+Rp5VeH8t888u7XNp-bpkaz5OXAaVpvw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update
 0.7.0 -> 0.8.1
To: ankur.tyagi85@gmail.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fa977006489c7eb1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 21:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123560

--000000000000fa977006489c7eb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If we add PV .=3D =E2=80=9C+git=E2=80=9D that will do it for now

On Sat, Jan 17, 2026 at 1:29=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> On Sat, Jan 17, 2026 at 9:55=E2=80=AFPM Markus Volk <f_l_k@t-online.de> w=
rote:
> >
> > On Sat, Jan 17 2026 at 21:49:25 +13:00:00, Ankur Tyagi via
> lists.openembedded.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > can please also include tag=3Dv${PV} in the SRC_URI
> >
> >
> > I guess that will not work since as said the SRCREV is set two commits
> ahead of the release. If this is really needed, I'll probably need to
> > backport these two?
>
> Gotcha but I think setting SRCREV not matching the PV is slightly
> misleading.
>
> I would rather prefer backports but let's wait to hear from others as wel=
l.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123546):
> https://lists.openembedded.org/g/openembedded-devel/message/123546
> Mute This Topic: https://lists.openembedded.org/mt/117294478/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fa977006489c7eb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If we add PV .=3D =E2=80=9C+git=E2=80=9D that will do it =
for now=C2=A0</div><div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 17, 2026 at 1:29=E2=80=
=AFAM Ankur Tyagi via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.opene=
mbedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Sat, Jan 17, 2026 at 9:55=E2=80=AFPM Markus Vo=
lk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-onlin=
e.de</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, Jan 17 2026 at 21:49:25 +13:00:00, Ankur Tyagi via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; can please also include tag=3Dv${PV} in the SRC_URI<br>
&gt;<br>
&gt;<br>
&gt; I guess that will not work since as said the SRCREV is set two commits=
 ahead of the release. If this is really needed, I&#39;ll probably need to<=
br>
&gt; backport these two?<br>
<br>
Gotcha but I think setting SRCREV not matching the PV is slightly misleadin=
g.<br>
<br>
I would rather prefer backports but let&#39;s wait to hear from others as w=
ell.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123546): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123546" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123546</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117294478/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117294478/1997914</a><br>
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

--000000000000fa977006489c7eb1--

