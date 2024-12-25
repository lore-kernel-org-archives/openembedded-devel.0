Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24AFE7718B
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 05:16:42 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.3029.1735103796002233279
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 21:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lID7qooD;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-540201cfedbso5714018e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 21:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735103794; x=1735708594; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7M3+o7B9/CNhDNwaw9IKeU3CU7PvfuwfcX0prQPS7m8=;
        b=lID7qooDBME4HAWiz800rPq67l0oZnbK48ivUjM7N0Agmj0tZ8a42BrqL6sY2diw6Y
         5Rvh6x/SvIaso0WvLdRsKh1KziDydgjhqGepXIxJnIHrrF8xTBoARHgSH0mFQe47TT2b
         BRT+Chv7oSOzn/nv6FUxiKvtn25jmI4dEf0N5uP89qexjnLDB65BsHM8TOjYWVoMjptx
         PPhFQlibSsTFiTzVhAuq3AHKQe2v4KEQ91khytJxVBRIiRFTf0Aof1zq52TbXFwXH11P
         nlc3Af0NMz1oPRXJqY5KphfCvz2pB2ZvWPabwszB4Nj/+V4gVDrC+LWefy92KYzUKbDl
         PbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735103794; x=1735708594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7M3+o7B9/CNhDNwaw9IKeU3CU7PvfuwfcX0prQPS7m8=;
        b=G67gA2uWyIbeKWCFbjmZ/wkyuI27bbYVDNPRJSkSp3BZ1xfPWGfk0tglE8kkHiNE/3
         Y8BqQ7WObsBHbz4RxE5hHv5j3V0g/cF1ISjMaffcOKbtW9PiMFZOlcE0zChXi3CSHDUv
         GKPikBFOUyKf0kUhak5SN+XSOMBmpeXuVmTiCm2Rx5gFIZkuC0cX5C54fZpa/Ilt7djM
         nzqjgfIOAiQv/fV1BLGm4u0MkrlVfrLXoOcWkTLFJ2k3B6HeJKsFww18JmUQocbb/IJ7
         dlwBb63RRUioh1pscGmJ6gNq4jO6KkGOrhg4zvXP2p2WdGM2QfUb4vL11PnbsJoju6BG
         Iwpg==
X-Forwarded-Encrypted: i=1; AJvYcCVRGD4rCgIsj27tDEKNopDxHYP/hSqCEGpDh3+Rb5PX8OiqMiK/Tp4SXyi+rKZhiqroCWtzKMH/8gBqVu4lSeP+I2M=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxvwNmYTJfh3mGmszq+ITYXSleINZRsCvG8ElOKfHBvnvylb8a
	srGdivVz0P24OTOB7ldj6ElJnTJffuvPdXXghk3ad9cxSZkTpA5ZdjHvYObEMKUxzfZKJaNSibT
	BmnAvhGt/KcNIVa49GzhI6QilKtg=
X-Gm-Gg: ASbGncs0z5iTRpOmugYM2v0XPiXrbGUBRLIqYFljcvxtpJqILQFfbEhk349wQZv+HW8
	CJpelBEW890y1j49H3wAInS2Nr+mJr/HDP++cZ9Uqk0SQjmfTJmLZe53w5rI1eyE6reUNSA==
X-Google-Smtp-Source: AGHT+IHc+Mo+uJvBAS2prO6y58NF4EOnwb69dnhpCZLjn04XK/LRsx4LTmJ3u31yuEtTYCJlw0IFHEFDdmYd1lERKMU=
X-Received: by 2002:a05:6512:b94:b0:53e:23ec:b2e7 with SMTP id
 2adb3069b0e04-54229554ea3mr6185818e87.34.1735103793595; Tue, 24 Dec 2024
 21:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20241222081612.239474-1-hongxu.jia@windriver.com>
 <14778.1734856199190674571@lists.openembedded.org> <AS1PR10MB5697ED581F502680854FBAD3FD022@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697ED581F502680854FBAD3FD022@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Dec 2024 06:16:22 +0100
Message-ID: <CA+chaQcHpKHqbNZ8FAPjc6CVzcGWnYEx9TjCPhwzvTWtq=zfhQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/4] Use 7zip 24.09 to replace
 p7zip 16.02
To: peter.marko@siemens.com
Cc: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 05:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114548

There is also newer p7zip version 17.05 in:
https://github.com/p7zip-project/p7zip
which I've just noticed being used in Gentoo.

I didn't check if those CVE issues were fixed in this version.

On Mon, Dec 23, 2024 at 5:03=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Please note that 7zip provides also a library, so it=E2=80=99s probably n=
ot safe to do this upgrade in LTS.
>
> It may be however possible to do it as alternative opt-in recipe.
>
>
>
> Peter
>
>
>
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of hongxu via lists.openembedded.org
> Sent: Sunday, December 22, 2024 9:30
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/4] Use 7zip 24.09 to repla=
ce p7zip 16.02
>
>
>
> Hi Armin,
>
>
>
> The p7zip is too old and dead since 2016 and has many vulnerable CVEs, su=
ch as:
>
> CVE-2024-11612
> CVE-2024-11477
> CVE-2023-52169
> CVE-2023-52168
> CVE-2023-40481
> CVE-2023-31102
> CVE-2023-1576
> CVE-2022-47069
>
>
>
> The 7z is a standalone command, and the version of all affected recipes (=
android-tools, python3-rarfile, xarchiver) has no change between master and=
 scarthgap
>
> so I back ported the new 7zip recipe to scarthgap to instead of p7zip, I =
think the regression is little
>
>
>
> //Hongxu
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114472): https://lists.openembedded.org/g/openembedde=
d-devel/message/114472
> Mute This Topic: https://lists.openembedded.org/mt/110240687/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

