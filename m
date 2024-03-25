Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD47C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 15:57:43 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.56131.1711382253480556489
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 08:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eL+nYvuP;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60a434ea806so48921837b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711382252; x=1711987052; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i7Mj00PD7E5jlg7eNmieGkiBGEGPCKH45n0d9IkdoXQ=;
        b=eL+nYvuPrBZ7jxGtDxnakMzYPpyGCsnLhao546XjMYx3mGogDz8nSQ23pZhSvWjiWx
         qtFHNsAx/XMT/f9awqWPOxNDzB8uQbywjk0sMaynjI01BaABMamB+/FJvPPtIZifY4Ch
         jQaIyV3ESbitXXqkjywTUCCe2LZ8foUCovh2ieEDIsXHJ3u1eH2ZckHObYQ+iJsezB8O
         pUYkeC5FQ5LYdxVHGxdQmYpYrSdszU6VuDI2SwIWNkXDkH3+kbuOCn8iAAwL9UvIhj+p
         DDi7cehkFlSQ/uTLTRG0Tk3uzeRNpvxsqOpzvZgwv7j+vAuTwCsY8FF4QtAOqr9PHD+J
         cicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382252; x=1711987052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7Mj00PD7E5jlg7eNmieGkiBGEGPCKH45n0d9IkdoXQ=;
        b=WiDA0GygTx88TugEzSKB9qjScJHKuJt0zfDq7ZV2pPHlRiLhg9xazIvCGG9LKtW3kh
         H4b4WkXATGDC/ujteXaKcvkPE8IuNEQwBKeNCq6VsZcv/VQUtCIrWoOjCJKO8pG2M0f8
         CtqFlc8HPYyqSXvgdY9lgJ80FgW7bnAgYBZsfVjupSKUA7aVn+ptUOmJy1DHhCKDEJAR
         DeqrISsaTiyHSFow5Hzp1WdjjS/IKb0eblnhxEhPLfE05atV1+uNHsG9YN9L6cYLmam7
         hU7JuThJWN7BvRUwwuR1m9GC4c+M8mpQHCkMejBaeRMRZObvy0ApVO68YlBaLmcq0g0H
         B+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWU9vgTIBdXSRHBWA7Hw+t/Q9nDiSD+jIQYkrR+O1cFPF5z8HB2BuWdQs/NAtQD8jSJ0Aht99perNcxcT4zEfd4yEirvLmohv53z1aII2WrnE8+DN37d+fPFQ==
X-Gm-Message-State: AOJu0YyOW1Z8TTPcI2ZgFWPnzVW93F8WOYyGupT3OOmuFbo4lhdQtmc9
	APWMxq5Wf+qMJTYyofPKMTi3E5etUS8zFwbRkdSWWVhWrfmA9Y6lyDNr/3fFbNdKE8HOd8CMxEA
	RHoUYnje+RmX71FXss7exfdGKASA=
X-Google-Smtp-Source: AGHT+IFxSnHJ4pB3TkM7iuskEl5FqWWmwMnZjUWK4q2k1a3IoneX2pFZDbUSzo+Ie3Zy/6GCAVnuaF0nQwnos2MoO/k=
X-Received: by 2002:a0d:c487:0:b0:60a:67fb:146 with SMTP id
 g129-20020a0dc487000000b0060a67fb0146mr6899954ywd.17.1711382252657; Mon, 25
 Mar 2024 08:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230609144646.1977-1-jermain.horsman@nedap.com>
 <20230609144646.1977-3-jermain.horsman@nedap.com> <CANx9H-DSMeHjAyVTeLKzPCxEd9UASas5nO4tdctN7H2HTeFERg@mail.gmail.com>
 <VI1PR10MB3182BB9126E26C25D17EEB72F7362@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB3182BB9126E26C25D17EEB72F7362@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 25 Mar 2024 08:57:21 -0700
Message-ID: <CANx9H-B5ZttP=mhRvJh8JHTMnhzBiEb4cqGFgx7jEWrG=o3O+A@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH 3/3] rxtx: Remove obsolete rename of libtool
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: "henning@itconsulting-heinold.de" <henning@itconsulting-heinold.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>, 
	"richard.leitner@skidata.com" <richard.leitner@skidata.com>
Content-Type: multipart/alternative; boundary="0000000000003ea41206147e3bb8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 15:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109594

--0000000000003ea41206147e3bb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 3:40=E2=80=AFAM Jermain Horsman <jermain.horsman@ne=
dap.com>
wrote:

> > Still seeing a do_compile failure (attached)
>
> I believe this is caused by sstate being incorrect,
> If you do a clean build this should not happen.
>
> > Can you investigate and send a revised solution?
>
> I could increase the PR, I believe that should prevent the issue.
> Would that be acceptable?


Ah. Good points/ideas. Let me test that after my current build/test run
completes.

I=E2=80=99ll just add the PR bump to this commit.


>
> Sincerely,
>
> Jermain Horsman
>

--0000000000003ea41206147e3bb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 25, 2024 at 3:40=E2=80=AFAM Jermain Horsman &lt=
;<a href=3D"mailto:jermain.horsman@nedap.com">jermain.horsman@nedap.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">&gt; Still seeing a do_compile failur=
e (attached)<br>
<br>
I believe this is caused by sstate being incorrect,<br>
If you do a clean build this should not happen.<br>
<br>
&gt; Can you investigate and send a revised solution?<br>
<br>
I could increase the PR, I believe that should prevent the issue.<br>
Would that be acceptable?</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Ah. Good points/ideas. Let me test that after my current build/te=
st run completes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=E2=
=80=99ll just add the PR bump to this commit.</div><div dir=3D"auto"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Sincerely,<br>
<br>
Jermain Horsman<br>
</blockquote></div></div>

--0000000000003ea41206147e3bb8--

