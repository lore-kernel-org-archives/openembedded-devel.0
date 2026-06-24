Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE5BCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 00:50:27 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2198.1782262223613019666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 17:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r26koyyh;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66077e90382so545544d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 17:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782262223; cv=none;
        d=google.com; s=arc-20240605;
        b=D7gs9clqtL8/HKjpLNZdWCDq8HRxIp+BuyDiLxkUeQsxDVT0ri4j5ezkqzReu9cGyT
         EsqzvlqWc3DHybjTm9qRcfr3nhMuXiKXneY+KBtbYNRuleGqYNAlizqgWZtUuabjKIFO
         ox0idzp9NF70t1gohdjNVwdVgvhbeceGo+IC55gUAcStql9u52CBY8v0WcJAtuS/Qri/
         OFMMsosy8aRXbdF24+uLNTE6lXFK5zYtBcczobPEvmY7we+Hy+quDjD6nJomFM3sITB5
         NnPJsyGCH5gmGtQDJA8My51MVQwYZe9A3k7+Z68H/rWtgRzHxcNsvnxHa4cgxOKaljEL
         u2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pLAphhu23TWQgtI9D/qd9P5yM5U93WPMYgfjTvKgEI8=;
        fh=+tH1cz9qGuim2bz9gTA45aulN9BPUvOh3KGziYIT2kY=;
        b=bdL/385akCSTR4WKGJ5DP7x0aaFhMRq3kZPkhRWd9H3YuC2z7khd73ZVcnRRMgw8bD
         1+47Woiq6KGqm6+TbxldS/znxXmSSMV/LTn9kUdmf7QNaSC9F+BOB4CSAzKirU0BM25E
         g54mpk0xyiLM/ZlHSTd/iU5W/EYmBZcRJEhVc/wY42+QW9DHc6fP3rYEnTGOa7tHKrgp
         uIHnuYwcVJLIJxKIzGdmnRSjFKfS4qv4qNhcKmv8X9ozx0Nd3nPCFm3Evf2TACeYXxra
         vkaJUbAaZZlzH7wSU379gaEF7wgCQkv1C8by3rZRdHV6DdhkmtDoJvBjVwrtz2GKh/1G
         Q4kw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782262223; x=1782867023; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pLAphhu23TWQgtI9D/qd9P5yM5U93WPMYgfjTvKgEI8=;
        b=r26koyyh/0nFLPY0FsU6Qq5xz7axarTbdOUXH4tv6UPyMXl3FcREIV5Nng5zwcQJ34
         SNi0zpOPmVHqOntXHnNcgJjMm4Yts9fiSGfcGHXyeDiqJjIEV4xcAQdU/rVOap4OnmJZ
         RqKRiIJJ2Kc0H1EuEibDo/u3Q24QBmavD7GVInvuW8tuUSNiBbd+Si5Q5xdG+PIg+L2+
         81e5hFMhmiEisqyrjXwQk25K2JPnSuKlP2tQQf6Rqp6jhfawlyVWhDVwDBatEkWlHmab
         sULmdVWO+vU5l96lyWIiySPeRVBsB4OOV58OR37Byf+5FRZPak+oNDbw7ON03QTkJk8O
         W2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782262223; x=1782867023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLAphhu23TWQgtI9D/qd9P5yM5U93WPMYgfjTvKgEI8=;
        b=fdTNKLYFjUYW3g77pyXrNPr3/XbHv9zmP4XkWOB9yXJbeg8hmSZXKIO4wMNXpwveKS
         v1n7Jnko5mAa3vMleVwjQsqLr4a+LUwYnhRkZ8Ikzo3sLa5vuRA7y8cpOmNhEIapBE1D
         SPIE71H5BPCsXE0jALigBHAzqoAVbeBbeJpbimzM8vyQbM9YCHI6LA84lYHeKVpTo8Su
         Xcu+h9FGZ9CyS2GHKdB7pbf6iuHfyo+iHzsvRZwskj4gmBprsTk82+A50nNseCY0hST1
         HhfeSaYV4EHZYFS/Idi5eHzoOAk6q+78fKak9vE+yhjtCqD7cb+zJWflBFS3ROPJumD+
         vaHQ==
X-Gm-Message-State: AOJu0YzpWjGkzXsOJrqp7jXGUnVby3G9Bk7Ik6rG6UTeDLX3mO8rSzl9
	NrGi5kUUBFazAA5NWl5W9HsDkCgMHK8N99x+oNnwaJaSYCiAd8+2gADzDM7dGZhylyOF7y/qt7Y
	ilaIgJqaJhATOCSYfJj336pqjDQySBb9+SYMdgDFzcw==
X-Gm-Gg: AfdE7cmvrn6jyzZ4NUP3CJnxdKc0+oNAJhluiwEGuaVLRxdlftVUWb/XmtuygYCNukA
	uMjSJmcsm+htNKQx/zVXkDxa4cDdE/k0EP/k9aK1O/mnRoLnm0haNLLDA0bGzVO8n6YnPc2qYKn
	lHMmj5og5Xrp9yw3dTDYGHRkTbgq8vLylmzpDd9p8Bnc+C7S3V4WlWEm0BGMO7ig4STPbZr2fa/
	r7B6eqewc+4Fu+FXxOxZZblfc0BVGO7KlVlSdVAOIky/mRe38n2RteZtsczjwWJ/ynaGoXLzcrZ
	ogdoCoxSd741Evq3qwUs80bHrkTHaLS9JgiIrDwcNOrl9QD7Phh+Jywp5rjmtWxrh+T4Vn2HWN0
	gDO7vJHMXxywB3RfRCzi6zAmSxkE6cjX/jd7iAytcdxiqhrFozP13fl7Ei6b8m7lCnTBnww==
X-Received: by 2002:a05:690e:1919:b0:663:5ffa:1671 with SMTP id
 956f58d0204a3-6635ffa24bfmr4087862d50.44.1782262222414; Tue, 23 Jun 2026
 17:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260616065405.440-1-wangmy@fujitsu.com> <TYRPR01MB13423ED75D4D9C166432FD39ADCED2@TYRPR01MB13423.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB13423ED75D4D9C166432FD39ADCED2@TYRPR01MB13423.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jun 2026 17:49:53 -0700
X-Gm-Features: AVVi8CfwVqyLBiiL3-lSOvx3vEW7wwUl1-lWlF5JNckIkOCdvo_gmKdzY1j_9lY
Message-ID: <CAMKF1sq-zCdbmVmKdd0bkM60qR9S5=wv1POe2fsc1j9S10HYmg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] crash: build bundled GDB with GNU C++17
To: wangmy@fujitsu.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a9e88c0654f542db"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 00:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127703

--000000000000a9e88c0654f542db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was watching, https://github.com/openembedded/meta-openembedded/pull/1056
and expecting this to be ready before considering this patch as it is a
workaround. But sadly it is still not ready
meanwhile it would make sense to take this in.

On Tue, Jun 23, 2026 at 5:15=E2=80=AFPM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> I submitted a small patch.
> I would greatly appreciate it if someone could take a quick look and let
> me know if there is any issue with the patch, or if it can be merged. I=
=E2=80=99m
> happy to revise it if needed.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: Wang Mingyu <wangmy@fujitsu.com>
> > Sent: Tuesday, June 16, 2026 2:54 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Subject: [oe] [meta-oe] [PATCH] crash: build bundled GDB with GNU C++17
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > The GDB 10.2 sources still rely on std::allocator::construct, which was
> removed
> > in C++20.
> >
> > This causes the build to fail with errors such as:
> >
> > default-init-alloc.h:52:12: error:
> > 'construct' has not been declared in 'class std::allocator<...>'
> >
> > Explicitly build the C++ sources with GNU C++17 to retain compatibility
> with the
> > bundled GDB sources.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  meta-oe/recipes-kernel/crash/crash.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-kernel/crash/crash.inc
> > b/meta-oe/recipes-kernel/crash/crash.inc
> > index 3c9a99ae4a..cd40ffb9e0 100644
> > --- a/meta-oe/recipes-kernel/crash/crash.inc
> > +++ b/meta-oe/recipes-kernel/crash/crash.inc
> > @@ -44,6 +44,7 @@ COMPATIBLE_HOST:riscv32 =3D "null"
> >  COMPATIBLE_HOST:mipsarchn64 =3D "null"
> >  COMPATIBLE_HOST:mipsarchn32 =3D "null"
> >
> > +CXXFLAGS +=3D "-std=3Dgnu++17"
> >
> >  EXTRA_OEMAKE =3D 'RPMPKG=3D"${PV}" \
> >                  GDB_TARGET=3D"${TARGET_SYS}" \
> > --
> > 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127702):
> https://lists.openembedded.org/g/openembedded-devel/message/127702
> Mute This Topic: https://lists.openembedded.org/mt/119829667/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a9e88c0654f542db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was watching,=C2=A0<a href=3D"https://github.com/openemb=
edded/meta-openembedded/pull/1056">https://github.com/openembedded/meta-ope=
nembedded/pull/1056</a> and expecting this to be ready before considering t=
his patch as it is a workaround. But sadly it is still not ready<div>meanwh=
ile it would make sense to take this in.</div></div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Jun 23, 2026 at 5:15=E2=80=AFPM wangmy via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujits=
u.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I submitted=
 a small patch. <br>
I would greatly appreciate it if someone could take a quick look and let me=
 know if there is any issue with the patch, or if it can be merged. I=E2=80=
=99m happy to revise it if needed.<br>
<br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<br>
No.6 Wenzhu Road, Nanjing, 210012, China<br>
TEL=EF=BC=9A+86+25-86630566--8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; Sent: Tuesday, June 16, 2026 2:54 PM<br>
&gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Cc: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; Subject: [oe] [meta-oe] [PATCH] crash: build bundled GDB with GNU C++1=
7<br>
&gt; <br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; <br>
&gt; The GDB 10.2 sources still rely on std::allocator::construct, which wa=
s removed<br>
&gt; in C++20.<br>
&gt; <br>
&gt; This causes the build to fail with errors such as:<br>
&gt; <br>
&gt; default-init-alloc.h:52:12: error:<br>
&gt; &#39;construct&#39; has not been declared in &#39;class std::allocator=
&lt;...&gt;&#39;<br>
&gt; <br>
&gt; Explicitly build the C++ sources with GNU C++17 to retain compatibilit=
y with the<br>
&gt; bundled GDB sources.<br>
&gt; <br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-kernel/crash/crash.inc | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-kernel/crash/crash.inc<br>
&gt; b/meta-oe/recipes-kernel/crash/crash.inc<br>
&gt; index 3c9a99ae4a..cd40ffb9e0 100644<br>
&gt; --- a/meta-oe/recipes-kernel/crash/crash.inc<br>
&gt; +++ b/meta-oe/recipes-kernel/crash/crash.inc<br>
&gt; @@ -44,6 +44,7 @@ COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
&gt;=C2=A0 COMPATIBLE_HOST:mipsarchn64 =3D &quot;null&quot;<br>
&gt;=C2=A0 COMPATIBLE_HOST:mipsarchn32 =3D &quot;null&quot;<br>
&gt; <br>
&gt; +CXXFLAGS +=3D &quot;-std=3Dgnu++17&quot;<br>
&gt; <br>
&gt;=C2=A0 EXTRA_OEMAKE =3D &#39;RPMPKG=3D&quot;${PV}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GDB_TARG=
ET=3D&quot;${TARGET_SYS}&quot; \<br>
&gt; --<br>
&gt; 2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127702): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127702" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127702</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119829667/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119829667/1997914</a><br>
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

--000000000000a9e88c0654f542db--

