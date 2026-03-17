Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBB1FF6E70
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:30:46 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86422.1773779437821508120
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q+WKWp+Q;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64c31ca77b4so6638895d50.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 13:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773779437; cv=none;
        d=google.com; s=arc-20240605;
        b=jIn2HomogArgatZaGW/gcioXIMTn4TIyvkTbPhqX6xFHsEl3FQGSmfC6GXz1Un2zlH
         gu0mTZWEjp3njd7DWp2UBTJn/u3+4HvhVtvi999TSe211Krhmd4ikbxsSOsxiSm4wFi3
         XU+TRL5hYBWJ3fsY86rvVWPz7K1EV+peR2pT6hdm1zTFzEZA8rMioMS7eIxyID8ma7vg
         nVnfJnp5a053JDWh2D+9C24AhvKdqeb1VaGcP0hgcRPl9TjDnlVEFO2MnvFtMJJ4SoFT
         avnYJNZ/vRRMYtcP3TbkHb96I23tlT6oqpX2EI3vFzWQapU8+vQpuF3pHLCpuJyphcq6
         iU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xft03M1EVXHFrOc1Jymi88Ub1idb1Nmh0CpnMTVMWfY=;
        fh=mse9LqwZJbjq/ezWXW9Lxg7XK6+ySUiYzgrvPuxBk1U=;
        b=PK+p7ELcz2wQ5QHJw3xEqlD3LO340hPZ1+S78Llp7l8Y36hTUvTo2k57upJIdhajDv
         x9qfOP4wIbDvfn5MzSdAetuNat84+C/A17N4yoX4deIKAvkQ9pnjigUowbd0Xi0Q3xEn
         gMYUBUKzkCXkP9uDbgQMSRwHaWF2d2fBu5nwO6S13jjvcqk4aTETjogrmKWLsIjO6Q6D
         j8DUqHi8xriFfweqjcIQpdSC59VUq3mIzriYD3feP3XiGG7XYbhI1ZRfH3853A8AAHq9
         zeWGMwzy7v8VwobvcVIcqDLcdkFJ5wvaM8nVcgn+Gk7890aLqyrmGCLqEvTYly1bUvNf
         8OVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779437; x=1774384237; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xft03M1EVXHFrOc1Jymi88Ub1idb1Nmh0CpnMTVMWfY=;
        b=Q+WKWp+QVdV3AISbZTHyDmvc1RKryQoeL7zQrwLkR+H+FXdRS4y2qGOozXma28CeHJ
         essdKrZQohpKlBaFQFsonnGNdC4C9AdlNet0DDEp5rr8pN1oi5iJFvg+nVJHj7bQpqiQ
         0WaArdyxP4tGwIF+M1Q31q3FiNBoF7dr33UxJt4Yv2y7QLREQ1YsbJ+jeB3NK1G1A+vL
         I/TVRN1XssPCB5DUQZLHnLlgdDhdO39xvg9eFYDqL34lRiweLa5Wq3eU8rTih8LSQ9z6
         Xxeo/wRpYPeZic+MGTSK4zDN1g23FSniaU6xPwXwfqpTfAdHch0OLxwBmHPvYVg/ffPq
         x0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779437; x=1774384237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xft03M1EVXHFrOc1Jymi88Ub1idb1Nmh0CpnMTVMWfY=;
        b=KeSNxjAcNAosxr/HzSlPAeU2OaOIz9MzMPh8kNSksBkIuWz4iIyVPpbGUttmynkNUd
         EvN5fpMrDtyJYwfIqMg1cdanpqSp4y28d5TMIWT1AB3fPXKsyf2BSjeq5gXDFAGSfhmQ
         FrDjnSbkX3uP1pTL+uTEt6Iz2NudznzH19skM5UPImMxQNbkVIeItfqFU9S8jX9QnVhT
         r1vhAappdX89qbN1RRAtREU/uymLhCOHouglyszHILOWE7B6RqLE3H4FsVZ3w9Sk9/lW
         drXk4R4bmpQdIepsGxcfU4h8PFROO4AlNymcJEzcCFc/j9AeWgoq7i8wkWA4nsd5AbdL
         58MA==
X-Forwarded-Encrypted: i=1; AJvYcCX144OwHK9WNMHYrNM+hQuySKp4mNZZrsxtKc+gnwgzbEYZbbFJL+tEbxlwuJKBUd/6CeKzaOlFmKnROz+yHWe77Wk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9P3zISAvup0x8vxsl8Kpr99I8WDIXjJT+uqc74UBc4vwBZPIT
	T+XcqqnkzQVyhbkwa7wNRNfDKerIP4hAra5ecSMgbZ5a14oiFF7Y6DWMsT79pbDd18g+qg2L6oJ
	XA7vP9qK3FhQRWOpKYPpjJdQRZE+RjCk=
X-Gm-Gg: ATEYQzwsG3YDtA1J5HzKeG3GQCRqZxzRBwXE3lBpZ/02dwJ3dn0q1SNF+1tbbt7Xm+K
	DDcESHJn25BEhMkdJo4EFc2xG6ae2P1g7C7RVGMs553+Jgsu8xMZJdYnPMEo/HUW1npgA2mrib6
	MQfDFq9hq+SSsOsAUm0LBvikJLIoaz0PQCsShfzgqB57+JPL3wng8wel7ZdVLNurCg3vhkUghZH
	IyNTK8U3Ux+bdHj74tw3jN7/+UcB99mnSMGHkD+I08ITAHluJ1ZACCwJW9GGiG6AITe50wprh/N
	ZSutHkU69VuLkKTkbAdlKH1KF0Voe9svaMJocQSkzGjNnYIdobcEcdqQjSjITOCbEu8QTheVM0E
	6xkFbamlpUyscok3elg5jLhYB
X-Received: by 2002:a05:690c:6381:b0:79a:51df:6a0a with SMTP id
 00721157ae682-79a71dc2b29mr8669987b3.60.1773779436732; Tue, 17 Mar 2026
 13:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260313232357.1729272-1-pkj@axis.com> <0Y22CT.71SU5UJGTSVH2@t-online.de>
In-Reply-To: <0Y22CT.71SU5UJGTSVH2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 13:30:09 -0700
X-Gm-Features: AaiRm52iye2aWGDac1H6hRLiHHPIIIktSija4y5KAt_0X9x2RWUhvZzEP0LeQP0
Message-ID: <CAMKF1sp7jWAoB2d+ssHReAJh=_mJagTji92JE9Vg93KArjRkMw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jq: Use Git to fetch the code
To: f_l_k@t-online.de
Cc: peter.kjellerstedt@axis.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003c841f064d3e3587"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 20:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125335

--0000000000003c841f064d3e3587
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:21=E2=80=AFAM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> On Sat, Mar 14 2026 at 00:23:57 +01:00:00, Peter Kjellerstedt via
> lists.openembedded.org <peter.kjellerstedt=3Daxis.com@lists.openembedded.=
org>
> wrote:
>
> jq
>
>
> I see this failure in jq:
> | cc1: fatal error: src/lexer.c: No such file or directory
>
>
> 'inherit autotools-brokensep' fixed the issue for me
>

IMO this should be fixed in source to use path to generated lexec.c file, I
think its pregenerated in archives
but needs to be regenerated when building from git sources.


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125330):
> https://lists.openembedded.org/g/openembedded-devel/message/125330
> Mute This Topic: https://lists.openembedded.org/mt/118307165/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003c841f064d3e3587
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17,=
 2026 at 11:21=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.=
de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D"m_-=
5184816705407950260geary-body" dir=3D"auto">On Sat, Mar 14 2026 at 00:23:57=
 +01:00:00, Peter Kjellerstedt via <a href=3D"http://lists.openembedded.org=
" target=3D"_blank">lists.openembedded.org</a> &lt;peter.kjellerstedt=3D<a =
href=3D"mailto:axis.com@lists.openembedded.org" target=3D"_blank">axis.com@=
lists.openembedded.org</a>&gt; wrote:<br><blockquote type=3D"cite"><div sty=
le=3D"white-space:break-spaces">jq</div></blockquote><div><br></div><div>I =
see this failure in jq:</div><div>| cc1: fatal error: src/lexer.c: No such =
file or directory</div><div><br></div><div><br></div><div>&#39;inherit auto=
tools-brokensep&#39; fixed the issue for me</div></div></blockquote><div><b=
r></div><div>IMO this should be fixed in source to use path to generated le=
xec.c file, I think its pregenerated in archives</div><div>but needs to be =
regenerated when building from git sources.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125330): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125330" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125330</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118307165/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118307165/1997914</a><br>
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

--0000000000003c841f064d3e3587--

