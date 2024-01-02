Return-Path: <iillyyaa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64819C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 20:32:14 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1241.1704227528642720148
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 12:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BGkjQiey;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: iillyyaa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5559bb6b29dso4437502a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 12:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704227527; x=1704832327; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=78crgeD8Bm21Q3/OqQ604vXUOCa9O7gvQkJv8Dhmrk0=;
        b=BGkjQieyHfBxBbreo1kMykqevUovBNozFx5+Z9KI+hn9F9+YpIK29MI7OMj27AT5l1
         gR3Q+ufMth/vjwsCydoW5/7tVDJAlm0ECbb5EtIXsGDqhMx780IeGmYIMopovJKo3YRu
         AXQRHg2YOqPVOyibnnoDG7+MDBKCiiRxF4myEU+g8VKdOkpY9I3Tqux/okqMSFq62baV
         2n6s2Va2Mo8+th+4TBl9GhBPRdb9G1F6n5NJ994CpEFUgWrF9QGniwQ+9BkX4x6mdGF9
         f66yEd/w2tVydcMu5xFTw7ZIHdv2sMii+j8Y7ezcrKZAIE10++gFzThsJIuEofq4+O7T
         jyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704227527; x=1704832327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78crgeD8Bm21Q3/OqQ604vXUOCa9O7gvQkJv8Dhmrk0=;
        b=CtmLte2ijqSovqmMDv0qYSEDAqqulZWN2FPnmbZFf7yWmmgspgdA9v4i56Be9CPkGC
         Hk0OUyF9jHIDwEgLl3ZhYoma39VQHj45pCGdocvlRlEzq58KISShVCwttnFi9EK3xooU
         BtsUmtvXAGwKiCwjPQe0slmYAKK7XrVhFCnKfSup9d5/XgfNSdIcN/ftjJBuDEcZ2Ztd
         t6m67hyr24fjr6W4PA7OcvUa+Qg0mGbMyXCaaJxPCp2njSt0BmO7d71I4maDzXxw+MHA
         D/D1cD+UtlqIzYLSKj2bZbvPgtGaJDU3s7iplJ7BN/qdFr2w8Yu+fmgKIQHPVMKFVayD
         bgCA==
X-Gm-Message-State: AOJu0YxQmqXjwldQrUT3v//GsrNkz9bL0bytFNZI5SEBJUDhtFstQ1AK
	xS5Hwlh/FxxbL66D+BjSEO8GyG3k53YEr+f9/1E=
X-Google-Smtp-Source: AGHT+IGBIyTU6cmUmtitstEg9NyX8c4mqCve38ujEYWv2YdiHkKjl3Hk3NhTBjauKCrnTGJhSjwj3tZo83u/ebivKeo=
X-Received: by 2002:a17:906:10ca:b0:a26:8eb9:8a3d with SMTP id
 v10-20020a17090610ca00b00a268eb98a3dmr9011668ejv.5.1704227526573; Tue, 02 Jan
 2024 12:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20240102191222.833181-1-iillyyaa@gmail.com> <CAMKF1sr1QZEW-fJB6sncQNhF-Huaa3iEXinZr9n87-Ub+Pau+A@mail.gmail.com>
In-Reply-To: <CAMKF1sr1QZEW-fJB6sncQNhF-Huaa3iEXinZr9n87-Ub+Pau+A@mail.gmail.com>
From: Ilya Kriveshko <iillyyaa@gmail.com>
Date: Tue, 2 Jan 2024 15:31:55 -0500
Message-ID: <CAFn2fAuyB+2Y59QX_-MSvYLAEvmp6FaMtWHt5rs1S_=709WT4g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] srecord: fix install prefix
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000568431060dfc6424"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 20:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108017

--000000000000568431060dfc6424
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 2:29=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> I think if we can change the logic to check for CMAKE_INSTALL_PREFIX
> before setting it to /usr here
> could work here as well as become worth upstreaming too.
>

OK, thanks for the suggestion.  I previously struggled to write that check,
since cmake defines CMAKE_INSTALL_PREFIX by default.
However, with your prodding, I found:
https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX_INITIALIZ=
ED_TO_DEFAULT.html

I will re-create the patch with this, and make an upstream submission.

--000000000000568431060dfc6424
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 2, 2024 at 2:29=E2=80=AFPM Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
I think if we can change the logic to check for CMAKE_INSTALL_PREFIX<br>
before setting it to /usr here<br>
could work here as well as become worth upstreaming too.<br></blockquote><d=
iv><br></div><div>OK, thanks for the suggestion.=C2=A0 I previously struggl=
ed to write that check, since cmake defines CMAKE_INSTALL_PREFIX by default=
.</div><div>However, with your prodding, I found:<br><a href=3D"https://cma=
ke.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAU=
LT.html">https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX_=
INITIALIZED_TO_DEFAULT.html</a><br><br>I will re-create the patch with this=
, and make an upstream=C2=A0submission.</div></div></div>

--000000000000568431060dfc6424--

