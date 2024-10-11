Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B326DCFC60A
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 07:24:58 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.6140.1728631492226850706
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 00:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZckYJ1M;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5e855a7735aso603422eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728631491; x=1729236291; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0h28JBtQDLhcqfU4LB+afAuTM6mzPyATAjmiy5TK2k=;
        b=kZckYJ1MQjdYXcvaejAyEjhzs0bdnhWFRbFz+YZ3/ZqWhu3QWQUk8EkAuV33JBkfGU
         a7iIe055/lUqJV+DLrEQlmZ2m7GT9NoLNX/MZlpKaxZQrQnKVcylT9XSuNKRQgWzeo8Q
         S6sVFUwouW4GArqpXmMq35vyFhQr4sJYasUfxZeS1Mjrv3Phqf10J3U0nWFQtU3SrD5S
         FiBGGy6UFxhcLawyPfJsvYtzhzrzfgtPFYbfEfCYiLDK0NFcrSDeU6cEFmVFvusadKVi
         FJNw57Vyy2+LxSUiqMa1N7OaCcC7XyM4ZnpZE6Qq5xgLC3F/brmmWFZgYAFzFt41ndtt
         WzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631491; x=1729236291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0h28JBtQDLhcqfU4LB+afAuTM6mzPyATAjmiy5TK2k=;
        b=mfkDz9saTqbtf7JyVKL8aZD/cOk2U9krNY5BZBiE+FTcjrk1VQBF+6HsFqONW8w5C9
         SBXhf7UqiVzjKL/eg8h8ipT2xs47Kv8RsUa+HwsVCCQg/lELPMIxYEyODGyJ9eU15kmI
         QUoPnPR93ZLY0WOeU/xe+xae7ZoVRIYv0kpMine9Fwy3eoS3a30AtodsFu/oNaBdfaT8
         TYUrbH3w4ku5Ol7cXDneRTkmGOKNZWXsmWewyTp0IazZMuXzqSNTLihEffP0K456TumW
         rFwyUkiThciZnEppX+aTbdr11dKEgL3CJCVQQ0Pt1R1z6HEyB+yY7jsVbH+cyWxTQonw
         Rrgw==
X-Gm-Message-State: AOJu0YwcNvKpXOEotPY2cRViu7u+7IOrKyJabR3kSIhRwwt/9JA0MdKA
	n8mTmuTpLqgnLhUKP0BOdXbAgRnyICf0vMgZn6ULPZyFkV6ULOeZ8Ir8/3LU4wG/uY+HKRShdIV
	hTMIqsWalMd8qF7mAFW15+S4Y1p0=
X-Google-Smtp-Source: AGHT+IHc3dSh9lnwqmX/8pETuksXq5vxqASapu21BN49dy+7OITbBsR4f0g59P3WaSad/93EGbqx3BAFMHOT5PX3Ndc=
X-Received: by 2002:a05:6870:819c:b0:27b:4f51:d73a with SMTP id
 586e51a60fabf-2886dddd3b1mr946860fac.21.1728631491127; Fri, 11 Oct 2024
 00:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241011071123.1936609-1-liyin.zhang.cn@windriver.com>
In-Reply-To: <20241011071123.1936609-1-liyin.zhang.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Oct 2024 00:24:24 -0700
Message-ID: <CAMKF1sqYxtyrmpvro=fmHs2pj6qPOhYb3WLsBipZYR3gRSrtAg@mail.gmail.com>
Subject: Re: [oe] [PATCH] libatasmart: Update SRC_URI to fix fetch issue
To: Liyin.Zhang.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112785

is was applied with b631359a42b8d73d7fd33f32851445e90acf4170
why is it being sent again ?

On Fri, Oct 11, 2024 at 12:11=E2=80=AFAM Zhang, Liyin (CN) via
lists.openembedded.org
<Liyin.Zhang.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Liyin Zhang <liyin.zhang.cn@windriver.com>
>
> Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
> ---
>  meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/me=
ta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> index f747ecbf7..8947b9fa8 100644
> --- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> +++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495bef=
ef8f17206a5b0a1"
>  DEPENDS =3D "udev"
>
>  SRCREV =3D "de6258940960443038b4c1651dfda3620075e870"
> -SRC_URI =3D "git://git.0pointer.de/libatasmart.git;branch=3Dmaster \
> +SRC_URI =3D "git://git.0pointer.net/libatasmart.git;branch=3Dmaster;prot=
ocol=3Dhttps \
>             file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patc=
h \
>  "
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112784): https://lists.openembedded.org/g/openembedde=
d-devel/message/112784
> Mute This Topic: https://lists.openembedded.org/mt/108944740/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

