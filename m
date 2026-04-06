Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DDEE9D83B
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 05:25:28 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49074.1775453123445306397
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 22:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YQazGTNW;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64e87a81639so3260573d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 22:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775453122; cv=none;
        d=google.com; s=arc-20240605;
        b=PlciADNv2/2dzQWs0LbyIwrFjepwTAXho1OHDpJAF8OhjZwLaKKNPrQceE7uAU/350
         J64kunJFFBM2R2rDjnUHXsYUqcHdstj5772ZL9MzIMGwG7YUxL0RnEZm60OP48kJ9EV5
         267GHTczjrao6ImMPECL5JKL9WqBBLFUCa1boe7yMQWczE0PZTy5r/ZR85Bx8WUl1obm
         3ve8aW4iQrWTBEB8QG44bMhJLcdqcQviGOxhidZp1mwridz+rGLl3DjeTbD2zx77Ea81
         OSLZR6WkWrvcM5/b5O2J6uo5k7lmS0hjdz5ekCDvOqqetJMwQD36W+IZgAr/FfIa6axB
         AMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8QhuX01yt/rh/J6bwdOwzPBNkIidL2z3BRe6bY3U3PY=;
        fh=slY3CzseMmVDlMmqrvz76xOxCzFnPvB9OKGPtS1cyuU=;
        b=MpTJh0KwI7n+Awu3D5N7rfPp0ov0QKn1WEN9tA0mDLcqlMfsdOl/snf4AVEvqT34L6
         3IOvQgYGTPZKIu/s9fb1GAkJ3u/nJB70m10WmkuElTYcruY9PHJ+MP3VO1RS/xyqcCPG
         DqQ/QFyjivkIzy+gHwjXspN0J0h6jUWRsAQwQ9gSh9ZH8zW5MTm2lxWvdTYU7k0OMCHy
         NkrwRUd2FaSmvU5Q11CmNuNUt6oo/C/Iz/LxzkK1GIdSUeOG+3CkCpUoguVQixyYzJdb
         fPmRWd9CDgqKkDkvODp6wvpcqh1nxGGDAkQqS5d6Mkcqed2F4YNNn9Aacoo1rLFnpL3t
         27Fw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775453122; x=1776057922; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8QhuX01yt/rh/J6bwdOwzPBNkIidL2z3BRe6bY3U3PY=;
        b=YQazGTNWnGakeG3/RYPeAihxuJjONuLUoiopGnVqhfHLQfNWO3Dy/qEv6Ajs/h7wtz
         ynh7/M8je4GE8r0Xf8eKJZGT1BXacJ0LdtSz0d+8+EtbrhaIk9HAZ1vZLcSK2SUq9Dfh
         f4KvOA94gPCvvLAwHb5Fhk08iuF53KRidV6WVEkCpVJAdLEW2a3Mct9GjN0ed3MwmMxW
         CCEw3w42t1DsD0h2IVBU/CdN6FttDCqSNhdQbx7HZdH3q6xHePZwM1ozmY1CF+dfoleJ
         7pGA91GG2NlEOSAfNN6NveRDPkS2NNHWKtlIKNtpdyClinwQyJOA+sCj5PbGk39mUpyz
         F9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775453122; x=1776057922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QhuX01yt/rh/J6bwdOwzPBNkIidL2z3BRe6bY3U3PY=;
        b=ct37sN+v+xcdNSKAdfEF5JH/L/fE6+HPM3xSey6gsNk4in0LRoMHroODZBepqnxEWQ
         Gamzcxykm0B/UjrATDUi4ubvzNwlZ07Zi+ulrSoJxcc3YKIcZybuGjBUSWXHF/Oi81KI
         PTSr3vqWIA0/fLNUzGasn54Oajeqg3UOEBcRnaVUYJ61vOTe+6M96sfNHDq1r+FeKrP/
         qU0/xAaZooV4CPP4Pf+Cx9jOzFzYI3NE9oaq9K0O+HW6fVsfLns2rJtERQxobjXu0+lb
         Ww2ewynmxHC/lJsotdcfuSdaE+E3b+z01Mo5Qmw012Jowr3u/tC4Ee0/ioosj9KF4OUe
         CFsA==
X-Gm-Message-State: AOJu0YzBzSDwA6R/HnSW+CvV2qyDLw7jnsZ+Uxwq3VUbIl9XE2MEJ6sq
	zcD4Lq1KqdhqRQeBGOw0JHMveCbgfNEqyDLIHh+P+AOViHt9h46sFin5ZWpT2Rsuc0TW4js7cu/
	HvChbNl4L+oo4cFI6GnVQd27vdpoLBpZ4aA==
X-Gm-Gg: AeBDievnJs/XNlYpNp9vbGs4t/Norfj63qvoc3G7DgqMDW87SzKkCpBMiTsLLrGB4gD
	QhI66P1Lc/cxIIeC4Wsx1irA9ioZs9lBBEiEb6wOiftxsH7QZoqOgzPb3bZu8pTUtJDiU9UJNyd
	V25hmA+P0Ur6EL9Y+TU0eVOsfymEdX8Wu+huhNAvRFhBZV0Hd17g0Jv1Yre+ENpdWuv/MWnqg7J
	SRsLQ+2MtX3/4gvKKbwSwo2AZwkcRnB/5EAQ1DquDT+gXkhVi+Uf2/UCm/ED2N977Cfyi/cPjld
	t1qf+iciw2IFPTKJaf15pRl1StgePRb6QSGOY850ak4H899TeAGdD5mNiWlHFuge39iUUAYnxxb
	Ah0LATHiM8B3Kai5l5AF62UdNHJbWNBBSokg=
X-Received: by 2002:a05:690e:43cb:b0:650:1485:26c6 with SMTP id
 956f58d0204a3-650486ef810mr7279440d50.19.1775453122272; Sun, 05 Apr 2026
 22:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
 <20260330100744.739123-1-git-patches@bmwtechworks.in> <CAMKF1sryuqEYDpMSwgeisFftBSfPcg0G9P5THZQop6+K5QXGZA@mail.gmail.com>
 <275547.1775452720211204594@lists.openembedded.org>
In-Reply-To: <275547.1775452720211204594@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Apr 2026 22:24:56 -0700
X-Gm-Features: AQROBzC04ASZM73GOviEfLdINh206AbuNc5o5_NdJFCDxp_iZJ7ZYoAKt3TbNGo
Message-ID: <CAMKF1sq5bjjj+21e7DtSjT-DpOHSnf-yRZAhu6+Sf+WOpAgLLQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 0/2] android-tools: migration and cleanup
To: emailaddress.ashish@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ab23ad064ec3e4df"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126023

--000000000000ab23ad064ec3e4df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 5, 2026 at 10:18=E2=80=AFPM Ashish Mishra via lists.openembedde=
d.org
<emailaddress.ashish=3Dgmail.com@lists.openembedded.org> wrote:

> Hi Khem ,
> In this RFC have removed the selinux dependency.
> If any suggestions or any additional change required for selinux , can
> work on it .
>
>

I think that was my concern I can take a closer look and test it out. But
please send the final patch series as v3 so it's clear which one
we are looking at.


> Thanks ,
> Ashish
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126022):
> https://lists.openembedded.org/g/openembedded-devel/message/126022
> Mute This Topic: https://lists.openembedded.org/mt/118576547/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ab23ad064ec3e4df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 5, =
2026 at 10:18=E2=80=AFPM Ashish Mishra via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;emailaddress.ashish=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v>Hi Khem ,=C2=A0</div>
<div>In this RFC have removed the selinux dependency.</div>
<div>If any suggestions or any additional change required for selinux , can=
 work on it .</div>
<div>=C2=A0</div></blockquote><div><br></div><div>I think that was my conce=
rn I can=C2=A0take=C2=A0a closer look and test it out. But please send the =
final patch=C2=A0series as v3 so it&#39;s clear which one</div><div>we are =
looking at.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div></div>
<div>Thanks ,</div>
<div>Ashish=C2=A0</div>
<div>=C2=A0</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126022): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126022" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126022</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118576547/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118576547/1997914</a><br>
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

--000000000000ab23ad064ec3e4df--

