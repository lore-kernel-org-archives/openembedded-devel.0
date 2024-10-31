Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7394D767F6
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 18:15:19 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.19434.1730398516882163515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 11:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TntYxkuk;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb3110b964so11380081fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730398515; x=1731003315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/6iQicr7LV/llEOlCXA+88OlRTyfkO2eUW9J6CBkeE=;
        b=TntYxkukTcPkTx2nFC0YwG3Bh9lGNQZ6nW5RqFAyS2eA9z4uwP8vB0qmInU01Ali6g
         8g2hR4ZOiknz6uUG3Uq7f4Ub/LyX4Cch2XOhGwJXinCQod+k4DbYdmTtd5+KMULxJ0/L
         UxJDYUJf/ERZadQCw7LHOBfNNEOvcu8o2AzNoRe1DaLMtc5ur0RkBM8B6jo+1ew+Ct9t
         /+Mzu0hcCIhKz6C/PuZn+HkKnmjX9vGB5w6MR6GsZwsPqjdgGYYREKiulTPlm52sd9eW
         hHPeJrAmuXAlrCmy5axW1wdHlQEEoc1LOXNMK6PyGW90GyTyjPD6b9aZSn4XjojMvdJm
         7eSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730398515; x=1731003315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/6iQicr7LV/llEOlCXA+88OlRTyfkO2eUW9J6CBkeE=;
        b=iTYBKRVVFmmjHgaM5M7JiQ2Mk/WZt9K8wDWgO5fb9gfmoMWEX/l1rSYfr+454irrxH
         Dray/jh/mALkQmnFhuyfvoytgimd1IOO/y3VWc5SshHVfPdBefp+/deS0pahQPkEA/Bl
         Jqww7DiEwEZNxaeyvGt+X4JEbNsQ8066yO8PeqOzEu0Hgj/87t6d12ssnvj0FkP+k+bY
         Iuja55koaaOLbL9942GRb6RIG2ThLuyQfaDkWviECY+cMda+Nwg1sUB/4jIgGhhejJS8
         tSJfcfLVVgu161SDIF4NJOP059U7RRNNeN6BbIGkzAchrzcHkRR/DD3XDdV/zTb7sF6I
         oHgg==
X-Forwarded-Encrypted: i=1; AJvYcCW5KW4LoPL5WvtAQdppDnblW+0pCRC10dGqpPvdlwjpaTFy1zp7i/aNdZ5wjwi/+K0UAut/ofZ/JDf9WL2RdfX+vVY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzeFdyhRk8/3TSMe5KwOpsy3AdOft5PNKrvgZXFK5KyKDafjJqz
	pgO8RlSAYk/ehnjV8Tx+jo61ONWr5JBTg7BXiSLfCQJOcRIn1pPLxsSlWpZuUfNYYTzj+Zjkltp
	n4W2UAB5PcLofzyhkwLSSw+V58vhQf6lQ
X-Google-Smtp-Source: AGHT+IGgGFXFEvaaC8W8MkK2aI4AgD0R9dk1kty25rZh9sy4DymvP4hHiYkijCm/rd0sDIRyADf7Ir8rAAXgu/BePv0=
X-Received: by 2002:a05:651c:98d:b0:2f7:53b8:ca57 with SMTP id
 38308e7fff4ca-2fedb790772mr6020171fa.19.1730398514742; Thu, 31 Oct 2024
 11:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241020150843.1068181-1-raj.khem@gmail.com> <CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
 <JOE8MS.4DEF6FX7L6873@t-online.de>
In-Reply-To: <JOE8MS.4DEF6FX7L6873@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 31 Oct 2024 19:15:03 +0100
Message-ID: <CA+chaQeCjGft6jS2fq0ruuw_KFLWixYX-vqTieOKciZyfaSNzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] snapper: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 18:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113376

Yes, systemd_system_unitdir helps with the systemd files, but the other fil=
es:
  /usr/lib/snapper/systemd-helper
  /usr/lib/snapper/installation-helper
  /usr/lib/snapper/plugins

don't use systemd_system_unitdir and as the path to them is hardcoded
in the source, I guess we should either hardcode the path in FILES as
well (so that they are still packaged and found in runtime even if
someone changes libdir value) or change both the code and the
packaging to respect libdir (which might be too much to ask after
looking at the Makefile.am).

I have a .patch file to change Makefile.am to allow passing PREFIX,
LIBDIR, DATADIR, SYSTEMDDIR values, but then I've noticed plugins and
helpers and stopped there (as I changing that as well to respect
passed LIBDIR) should be at least partially tested in runtime which I
wasn't planning to. Sending PR with just Makefile.am changes and
asking the developers to "finish it" also probably won't help much, so
I've just sent previous e-mail and added SKIP_RECIPE in our DISTRO
with multilib. I can share the draft PR if someone finds that useful.

Cheers,

On Thu, Oct 31, 2024 at 6:43=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Thu, Oct 24 2024 at 12:47:46 PM +02:00:00, Martin Jansa <martin.jansa@=
gmail.com> wrote:
>
> should the packaging be changed to use nonarch_libdir and let lib32-snapp=
er and snapper conflict with each other? Or is there some better way to res=
olve this?
>
>
> Using systemd_system_unitdir will also basically just use nonarch_libdir.=
 But I wouldn't have a problem with them conflicting each other. I only nee=
d snapper for some experiments. Thanks for looking into this

