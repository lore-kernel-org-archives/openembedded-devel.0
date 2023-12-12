Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CF8C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 17:00:45 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.1662.1702400439586613096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 09:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kYwNEihh;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-20306782371so339265fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 09:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702400439; x=1703005239; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY2/MsqSBN70h7VCLY5DPUSwq/0hfqxct9b/kd1MvUk=;
        b=kYwNEihhQso69hpwXGEfy8CKOr8yMN0wMKWM87ban6GEhytbAddJFDcVzf4rCOkUky
         Bw/DhJjFh70XwkagJiCHgn5NmXzrsOZyj1Y/FrB3RvWg6wmSc30j9J4pfDzHS/v2LPUM
         a1NQwfgzugtE29b6lZydMhiBuJ73LcpXqbvTOlpQy9N/S/hlfOOuZjgN92xJq5OyJchq
         Ev8L6kiF0SxNsYsCsepbXgswVbF81fFXoBX/8OdtqQvCF+5GK/vxx/j7xghssNGMoRDT
         s9+UKGyBr2zqNmjAE7s7H2FL5yL1M2EwJ9CpClaQgVVzOyvyD5HVOWOBHgaH0dnMdvyK
         bjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400439; x=1703005239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY2/MsqSBN70h7VCLY5DPUSwq/0hfqxct9b/kd1MvUk=;
        b=J9ZEpWfTXFaOaPzncUsDk1KfATI0r3OTh8Lgt4d7V3zzGa/I72Uo1OtRgKUD1FFCb5
         iabLaVatC5IzctzH46BTvIwPPjOP4QtFGjhPrnWBarTw6+d/H2MonIf3nUP/zL2OtDon
         ZJ6BqjK+BCPWvdlrwmiMeohW7+hDbFVuzSznbIemOUfuE3CYBFZ3r2u0IiZs8qGHKYWl
         BhwmycINp1xLe6enUs2praZLjXFxJATde5+cqnmjeGgGsrxUIbBIT6SS4mTHO18yvyAv
         lfTg2xwEvilpv8T7GKDDlZ8lGvxep1uhwfvIemL8EZcEa5gBl6gR4OkZNo5gR6pkOddg
         gPjw==
X-Gm-Message-State: AOJu0Yxzh3Tn9C5//jf1colcuTkDtxJin19Cg0ZP3j3UidYtuAM9+aFZ
	kBhJ5EblLqLU6LT6DjT8JGgafrB8iJ+TU/Sdjsw=
X-Google-Smtp-Source: AGHT+IGawXMEe+rh4Gn7kNY32ypbagFU8352b/gnr0AVY1JtFNbU6Pzdbe+EmsRtmljMhZB5Ykf0Fk0PkvRvurGy3ZU=
X-Received: by 2002:a05:6871:824:b0:203:fde:f894 with SMTP id
 q36-20020a056871082400b002030fdef894mr566795oap.57.1702400438778; Tue, 12 Dec
 2023 09:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
 <04DE494E-01A3-41BF-9E0D-591DF8ED739E@arm.com> <A4B1763A-59C1-456B-9734-569475DF2174@arm.com>
In-Reply-To: <A4B1763A-59C1-456B-9734-569475DF2174@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Dec 2023 09:00:12 -0800
Message-ID: <CAMKF1soasL2uu1hGEq9o59PsAHUquA-tp1x0FNiFEnbRNbbisQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder aarch64
To: Ross Burton <Ross.Burton@arm.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 17:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107338

On Tue, Dec 12, 2023 at 8:49=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 12 Dec 2023, at 16:42, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
> > Also this is a huge red flag as it means this recipe is embeddings its =
own copy of the uuid library instead of using the system library.
>
> OH DEAR GOD NO.
>
> https://github.com/apache/nifi-minifi-cpp/tree/main/thirdparty
>
> If I were an OSV I=E2=80=99d be BBMASKing that recipe out because it=E2=
=80=99s going to be carrying an impressive number of CVEs.
>

yeah :) Now you see the reality

> Ross

