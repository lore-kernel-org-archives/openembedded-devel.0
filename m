Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D938ED10388
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 22:37:55 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.8918.1729809471273388898
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 15:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQDqO6nm;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so12717101fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 15:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729809469; x=1730414269; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n6LmOZfmDlJ72KU9/oTLC3ZqrzZY1JjRUolLO3C/NUw=;
        b=TQDqO6nmBoaJwSo3AboOGGKnlyo4Krnlfo5Szl72/qwqKHOQhXGiBuk2epcP4ybhSD
         2pNeQguxp5yLnTXI+xlu3cMNY+1TXHSETeYzfTOQL3LZI6DPbGq2XN5KhHhngGOdDZ1i
         ITttPA2LXdJGc8Zr82zkOvfNl6c8AZwjJ4VrZf/v7YxuPGpWeBGNMZKIC4nZabi7fFSW
         dOBd9bYWevNwLFPcpMcAMDxZ5uCgnuCc+TOMJR1P73P5bFMqXo7jkuEq6CLoskvIepOP
         wtzSm/vpfVstizVXwJye0P2OFGMNhZyHVtcK4Q6BTqzoM1/4xtS6oqIv7EfoPJhuGu8E
         LcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729809469; x=1730414269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6LmOZfmDlJ72KU9/oTLC3ZqrzZY1JjRUolLO3C/NUw=;
        b=pDZEPJWVM5cVH47RpdnIq40SmmDrXL+Ns6Hay94B8RPt/KSuTTkfTeuN5WT1RQpgib
         sZfUtnvwOhwxo8osJKUzD9YiIK4yjqgFDnyXhilIDhU79oYFV54rRpXyctmpTLUb9JAf
         /3RYzCEvD/e+ccEBRW9tbtBq+hO2Hyv3WELnrFwsPTFU/UqnPUAq7/1pvNSx22lO8v9n
         zliivrehejtfwW06CMWKDFLAf8HzFTxGTcLj7UmglApv3fQma3Qv4eoAmGH4+PeNtQSD
         YiVT3n5pNmr8MNX5vWmUdL70pvmNOkjvfZYXK50/RrBYeTHcgKwtfcOPRkufK4twR2dH
         vSBQ==
X-Gm-Message-State: AOJu0YxZbUuJhlMkRr8Vlwvj3vYH9Z+50u51u6NA4MCV1R83Vuby+RB0
	8AwTl6XM2NnakvZSJZ7lY4+HYaeCnoIO2nUnjVEDYtQfvur0PYWgCMM7D7HTxEdzXSUV2fywERM
	3Q/QH1toK4Tp6A3lFNVkdaUgFULk=
X-Google-Smtp-Source: AGHT+IHmiEJB+zMrT7UqmoBB5uDQ/5JgoIJXJerwuwtMXEe5o5HBdpUKnxqJJASqwxQXJTdn+so4b2egqBUMlDlr1vc=
X-Received: by 2002:a2e:a542:0:b0:2f7:7d69:cb5d with SMTP id
 38308e7fff4ca-2fca80ac3a0mr22188011fa.0.1729809468884; Thu, 24 Oct 2024
 15:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241024201806.440273-1-schonm@gmail.com>
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 24 Oct 2024 15:37:37 -0700
Message-ID: <CANx9H-CtgyE79Zqv2yf30VVeSVgU+Urm+kiDK5-+DKvS5ircZA@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH 0/42]
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec118b062540a6c1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 22:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113221

--000000000000ec118b062540a6c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 1:36=E2=80=AFPM J. S. via lists.openembedded.org <s=
chonm=3D
gmail.com@lists.openembedded.org> wrote:

> This very old news article talks about the migration of search.cpan.org
> to metacpan.
> https://log.perl.org/2018/05/goodbye-search-dot-cpan-dot-org.html
>
> This patch set seeks to remove references to search.cpan.org and replace
> the references with
> the appropriate metacpan location.  This was tested by putting each
> address in firefox to see where
> it resolves.
>
> The changes touch the HOMEPAGE and SRC_URI variables.  In general:
> http://search.cpan.org      =3D=3D> https://metacpan.org
> http://search.cpan.org/CPAN =3D=3D> https://cpan.metacpan.org
>
> Thank you for taking the time to do this. It has been on my TODO list for
a while now.


> After these changes, I built the packagegroup-meta-perl and saw no errors
> fetching packages.
>
> Thanks,
> Jason Schonberg
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113178):
> https://lists.openembedded.org/g/openembedded-devel/message/113178
> Mute This Topic: https://lists.openembedded.org/mt/109197219/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ec118b062540a6c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 24, 2024 at 1:36=E2=80=AF=
PM J. S. via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;schonm=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gma=
il.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">This very old news article talks about the mig=
ration of <a href=3D"http://search.cpan.org" rel=3D"noreferrer" target=3D"_=
blank">search.cpan.org</a> to metacpan.<br>
<a href=3D"https://log.perl.org/2018/05/goodbye-search-dot-cpan-dot-org.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://log.perl.org/2018/05/goodby=
e-search-dot-cpan-dot-org.html</a><br>
<br>
This patch set seeks to remove references to <a href=3D"http://search.cpan.=
org" rel=3D"noreferrer" target=3D"_blank">search.cpan.org</a> and replace t=
he references with<br>
the appropriate metacpan location.=C2=A0 This was tested by putting each ad=
dress in firefox to see where<br>
it resolves.<br>
<br>
The changes touch the HOMEPAGE and SRC_URI variables.=C2=A0 In general:<br>
<a href=3D"http://search.cpan.org" rel=3D"noreferrer" target=3D"_blank">htt=
p://search.cpan.org</a>=C2=A0 =C2=A0 =C2=A0 =3D=3D&gt; <a href=3D"https://m=
etacpan.org" rel=3D"noreferrer" target=3D"_blank">https://metacpan.org</a><=
br>
<a href=3D"http://search.cpan.org/CPAN" rel=3D"noreferrer" target=3D"_blank=
">http://search.cpan.org/CPAN</a> =3D=3D&gt; <a href=3D"https://cpan.metacp=
an.org" rel=3D"noreferrer" target=3D"_blank">https://cpan.metacpan.org</a><=
br>
<br></blockquote><div>Thank you for taking the time to do this. It has been=
 on my TODO list for a while now.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
After these changes, I built the packagegroup-meta-perl and saw no errors f=
etching packages.<br>
<br>
Thanks,<br>
Jason Schonberg<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#113178): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/113178" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/113178</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109197219/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/109197219/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ec118b062540a6c1--

