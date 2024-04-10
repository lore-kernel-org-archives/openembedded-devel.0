Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1089ACD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 17:12:41 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.5936.1712769157162559146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 10:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHviMVzT;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5aa400b917dso2115913eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 10:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712769156; x=1713373956; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQBceOl02DTT0veBkaZ8jUy3+6cEEICl6Pf2ak+Ip1A=;
        b=fHviMVzT5in9ctyl1TtN2U+7COP3QC6y5o1VmhhQ6fceEIQMwhmAAQFZA6YnP27jhq
         RAvWpph8bKdF23tcbNP8xBeNY6i8uaOYG2CDvBG27zTsgzT3fQW8He5ZR/y7/ZJl7l2I
         iYgnnjGuRDGF1eK4VrtlkmaQbriZtNUkgklc/IjE5nAMZS9kPdW0X6pk7lsJC/l0dXtN
         SwijD/0P72tYrBKNTBEkhmx7oMeszMNoWQei/Y1ODepbEphc8mRtXHLJe9Vk19U2o4mT
         JQKCgeVSpmn8+Uf+mC3RbLgUh9AK/PLmFlip6acyThE+Otz8cZiCPG2eLjAHsN2ttiYM
         7uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712769156; x=1713373956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQBceOl02DTT0veBkaZ8jUy3+6cEEICl6Pf2ak+Ip1A=;
        b=pxk0ZZIN3Ynb5bFyOisLykJFl5vHRyxpFe17UUIKnoyOi5exYxI+8lXKaKDTGbmNNH
         4RTTBX0yrYIm5TAchCRxvBKzoGQYPW2UqwoztvW/DWIwty7qmJKjM20LkxUnELBcqHtL
         M8BDBn/BRDc0grBJ1AeALVICFRn6n+yzxTQ+ZX4dsBBjq4KSyMovoUdKISE2Nm3Ti8Dr
         YFFTCzalBpICUkXSrcxEtNVeypvzZM7tWwwVywNHSdyI1OAW1Unmb1SGce7cvNI6kN5i
         Y1aOEiLeWo+78lBfvGSlf9ojCdbFFdTuWPzCNW2ru+Y01ywzMN3Eb6qxqCJ/3Ir9U5vh
         tKjg==
X-Gm-Message-State: AOJu0Yy60/wGGe4USQ5CJ/AztZlc0WQMb0DWR3s6XGSWxpDWO5/Kh2Q4
	iGcKrEDZO+Qs/OUh99QtgsV3hELvae52GbSSpiEGZhaB4epT1jI8ZnHiF1d/1Qs3zm/41uJt93K
	SpcQEGWAejlnTim5gm0cIzJYcgyk=
X-Google-Smtp-Source: AGHT+IFM5RU3en/c8RO/1afLSpw4SXncOSZ7ofCPV4SvGje9oa42mttNrPVgq1Y6qwePzid9zRb9CzRrKVje+Lvz//c=
X-Received: by 2002:a05:6870:e38a:b0:221:8e01:4c6f with SMTP id
 x10-20020a056870e38a00b002218e014c6fmr3779377oad.36.1712769156373; Wed, 10
 Apr 2024 10:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240405151335.55698-1-beniaminsandu@gmail.com>
 <171250415788.900727.6749515569891043462.b4-ty@gmail.com> <AS1PR10MB56975FD5C4814FCFF378A635FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56975FD5C4814FCFF378A635FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Apr 2024 10:12:10 -0700
Message-ID: <CAMKF1spWnKwYon8a4_op_54uv3pBV9C3L3hH-bXAFaqXP14aqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Beniamin Sandu <beniaminsandu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 17:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109907

Beniamin what is the resolution based on ? before we revert we should find

On Wed, Apr 10, 2024 at 10:02=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.=
com> wrote:
>
> This CVE reappeared in https://autobuilder.yocto.io/pub/non-release/patch=
metrics-meta-oe/cve-status-master.txt
> So it should not have been applied.
>
> Peter
>
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
> Sent: Sunday, April 7, 2024 17:43
> To: openembedded-devel@lists.openembedded.org; Beniamin Sandu <beniaminsa=
ndu@gmail.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
>
>
> On Fri, 05 Apr 2024 16:13:35 +0100, Beniamin Sandu wrote:
> > The CVE mentioned in the recipe applies to a different libtorrent
> > library, from:
> > https://github.com/arvidn/libtorrent
> >
> >
>
> Applied, thanks!
>
> [1/1] libtorrent: remove CVE mention
>       commit: 0597c931ffbadf2a2242d8ed9cccb8567953d489
>
> Best regards,
> --
> Khem Raj <raj.khem@gmail.com>

