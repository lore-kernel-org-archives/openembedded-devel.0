Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE5CCAC5A0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 12:31:53 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.13071.1758198709989298200
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 05:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=SN3ItiqG;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.208.49, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62f4273a404so3875617a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1758198708; x=1758803508; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=djOk2/QgqErOXnd6RaUKB5QmJw6vn2wPD1rGEO0tuYs=;
        b=SN3ItiqGFIQTYCVdL128DLFDG2RJ38L7t6jY8dmu/m26Bh146P3mHDiOiN3HbTJVUM
         yZm8tpJv1PArlxBt9rXBVZzajjWNTJqFihtIGl0aIwaM7xmanl0Co5UMCZT6Oxheb4dJ
         w9zid3tLJ6W+KlFBEClnMhWu4xMkxFs6e+rjzg/iy/HsiqZ5t9npLMKi2tChNwk64C37
         OuLGYRyUBiY/NwWMpnqiKC5rtnFdtunH0B5gZT+f9VyQ90uS6Y4UwqnNWLzTLd+WCvLo
         IJ8jvlUAjaHHVDx4DAIBWKTMIApmf0JmYKmhDyP7BH49pfqwUD9pQPCDOibjKGM4cl6i
         TIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198708; x=1758803508;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djOk2/QgqErOXnd6RaUKB5QmJw6vn2wPD1rGEO0tuYs=;
        b=grf+1hBP1J91TcghQV3nSz/17NqP2VIhi9Leus205oFB/8HaIQ59Z+wwCUHSPrgvwl
         l7uuXiPpCbR4aB8AVTm/WVyesbAGT27ZPNTfo2BBKYlSyVDU3etFdXttqOmCUUqRT3Nj
         F/fS13TEB1VZbGqChF2rtnQU2mgCq5IefEump6m/4RM5ND9jLWCspbgTh0aotxYN+N3J
         +rvXaBuf1TNrdBT/eu1/kPg6NaZJtFe7nE1gi7w8+asxJ+nScnRmCEOykdEj/OPGHc7z
         x+gz5fNqrcqPpSI+s0UzeL03T5rX/KORQTQUF7rhN7tJygalUfUYd6ZpKdK7GtsCmKmN
         O1KA==
X-Forwarded-Encrypted: i=1; AJvYcCWpcV4FPr7YDI57d1D/RSxHIuSr2CGSENNRWU6bDFojKSsvY4JSK37hZTxD+PGuVg3dYx4cul1fxD66CltPIKOnkCE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxck+sebbtwemSVJ+G3kZMrsi8m7YYk6ZtWEQqJuS8JSgIYKdfP
	NfSElRw/26f9oCQFbSLD+PtixGagb+8tmFs7mkaJSzCdBpi6jA1xdy3KxmTcsMNhyYh+ZqqmTsf
	QyBj0wHhZiIp3JZJ6cv9cfC2G/AMNPXgLtl0xcl9OQQ==
X-Gm-Gg: ASbGnctLynU8W9Nwy48nVwAqRUzNi6wAv4RRZEsmIn9TshxEDosFb6KPQNoe2mx9SCD
	fHMxgT1yqUtlsZrig3MfHuwm3ugyaEPpdE4urqGgoDWDV7A0sX1QwWr8qFrEZdrILRbK1F1ZoU7
	etEWxdO1xkQ6/UQWwZnhlKFecZ4NM2MT3qTRdLTT8Qgnr600K+TCkVKblkzB4LriAbYHmLKsCCG
	Fl3LKucuKeq4hpCuv4w2FNoZpPgytePesY=
X-Google-Smtp-Source: AGHT+IFSFf4DKcR/TV1fSwQ85GM9aJGvFwg4hB/lkfie6z8m4+Ld7ZCspd+dXhM0LIGirF8/3rW8fA9sBxAQ8znH1RU=
X-Received: by 2002:a17:907:d7cb:b0:b04:1d85:7106 with SMTP id
 a640c23a62f3a-b1fab24299cmr271191966b.21.1758198707717; Thu, 18 Sep 2025
 05:31:47 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 18 Sep 2025 14:30:00 +0200
X-Gm-Features: AS18NWD2JIG8TKyFRFE8XaH0EL5A94YNASpA_0nNM_gdDbxzwzenLAB4Qa_m2UI
Message-ID: <CAEt6NwpRTafz3+NVdraQFDtqb2xgPAnKdSVVRc=pCr6=1a2QQw@mail.gmail.com>
Subject: RFQ / job opening: Yocto LTS Maintainer-Contractor
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 12:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119575

Did you enjoy Dunfell daily? Step on a Kirkstone every time you left
home and never missed the Scarth Gap?

Here's your chance to *TOTALLY* have a Wry Nose. No kidding.=F0=9F=91=87

The Yocto Project is seeking an experienced, community-minded LTS
Maintainer to take over maintenance of its Long-Term Stable (LTS)
releases, beginning with the upcoming Yocto Project 6.0 LTS release in
April 2026.

This is a critical role that ensures long-term stability, security,
and support for the Yocto Project=E2=80=99s LTS branches. You=E2=80=99ll wo=
rk closely
with the current maintainer during a transition phase and ultimately
own the process of delivering quarterly (or more frequent) point
releases.

If you=E2=80=99re a long-time Yocto/OpenEmbedded contributor with deep
technical skills and a passion for open source sustainability, we=E2=80=99d
love to hear from you.

Find the opening at
https://jobs.smartrecruiters.com/LinuxFoundation/744000081384375-yocto-lts-=
maintainer-contractor

