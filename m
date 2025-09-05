Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DF7CA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 18:33:01 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.1071.1757097179783342581
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 11:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=j8XHm/9G;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.208.50, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so4589454a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 11:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1757097178; x=1757701978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KWr0vHyrQqlDeFx2Vt0XbtQxPLLB08twQk5ir185/pQ=;
        b=j8XHm/9GAerlhqdx+qtZwS3lxRSChLY/tj9KITN8JvOB0MwGITPD6SXJltaTDmZx2X
         Fh5HYAmoAF0nAw+dIOyZRnmRHOmfGcyRSJInvDSx20VUjQP30DkhqfHNBlEL4qQbn4u0
         bYCI0xEibAX4jfMaYw7/QjpqF09B0t0G+OZwnkRLJC39AMIEkwaVtZT8C8H0aj9/MxUs
         4CWhttNAjDkbGHY2E/hwWx9Fv0m29J5a/P5Kl6cxLDxE/sZ0Lwu1TroCyhXmvYUQvwMl
         qoKzQ97lYm5odDaKNNmPWEM7uxce9zeKLywls2u6iuYnVlBFBmXHzElGrVINrJ7z9nAV
         TkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757097178; x=1757701978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWr0vHyrQqlDeFx2Vt0XbtQxPLLB08twQk5ir185/pQ=;
        b=nb6SLiKYLwqU/LxpYMgp7qjB2ZluZw+mqe5w1GaV7/ezrdi4HpFFuNyoPurrarlEPj
         M119Hh7ckFh0eCYYx80DEj6pwLPTPqF2eGbbnd62vjxSMdW7cmXEpO3hb48o7IxP2XDk
         7dooP25v2w5rFSSG5NsNdEIVxtrQBlhCfvOkF/evQbDKWd5XSQBp5Xi2lz+1nPr05YsS
         nTWY3L3gPjYPauwqA5WBzpMlLDuPw7eTEkfUjEcI+d+NxyGJ+TW0tHF3qteptQgRyjs7
         HqBnBj4EkkcNXKEb67cwhQRdDvPhUgt1yjGi9pjq2HEBHoyJzs3j52TmHCCF7b6ND03y
         Fz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxT24LGy5W1nd6TJF1wgj3Azgj9ClJxX1pk0tJvIzq9FbWFS5AdT8hY1+6xB5ggOF/99Z7t3i6naThJfYCc1/u8F4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1F9lSeMRCM/LzFFMTALTztVU42dZM8CcNPa9fLAAOlnTh6l9/
	NYSU7iX0rCYjs0Tv/BpaM4hNUyqsLXxMMzBxsAlSlTFbOt1AngF7lkL7ifzo9LJTr0Tf0tQwnM3
	c5pPcLTMMN96M23pZM6tKRIZeaytga2B6RMGypkvoyw==
X-Gm-Gg: ASbGncvE/XxeOroFnEMarbR2nbbFCJVgqlaOgMbE5xk0krOe0D/e8VizXUVZ/dO8XXx
	7v21MGOlTDsBZizkHyoYWkFminCaeuBPIPe8hqE17lDwl+XI8q0JWx2xbAVGdjsnslsTaNT48uc
	yxLCt5VyKSIFeiGguzC8dnq/enY1K3m2GSb+anlRxjYbPyHaTbWVDIgGi18v7mKwCWWQ72fCA2K
	GKBxPnk7TV1ndT94C/J55gqGzfdd3mRBroy2RxgzF0W8HPOyi9w
X-Google-Smtp-Source: AGHT+IHzSwll/ivhVsIIArOEJwxZHRp2sCEPanc8sM4ZAW8th0t47MKLFQM/jZf4d9Op6MZJKtBCce4oDZqbcH0L2xs=
X-Received: by 2002:a17:907:9410:b0:b04:7702:c18f with SMTP id
 a640c23a62f3a-b047702c450mr920377066b.15.1757097177974; Fri, 05 Sep 2025
 11:32:57 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 5 Sep 2025 20:32:31 +0200
X-Gm-Features: Ac12FXwpTHYhcLDW4J6EKWX5QWE2lqmCSdTMcAvL7EIiHaVpRR8442er3BxQQGs
Message-ID: <CAEt6Nwoo7YJnEmMO2qneyuKstuGbwE__OVUGUptppT0+GL=75A@mail.gmail.com>
Subject: RFQ / job opening: Yocto Project Ecosystem Engineering and Operations Lead
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Cc: Michelle Favalora <mfavalora@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 18:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119318

Hear me, hear me!

<quote>
We are seeking a highly motivated and autonomous Ecosystem Engineering
and Operations Lead to support the ongoing operations of a high-impact
open source project. This is a full-time role focused on maintaining
and evolving the release processes, technical infrastructure, and
interaction with members and community across a complex and widely
adopted open source ecosystem.

The role will work across multiple domains=E2=80=94including release
engineering, automation systems (e.g., autobuilders), CVE and security
management, documentation, and community/member support=E2=80=94to ensure
timely execution, quality, and alignment with Technical Steering
Committee (TSC) direction and Yocto Project governance board (GB)
goals.
</quote>

Curious? Check out
https://jobs.smartrecruiters.com/LinuxFoundation/744000080228346-ecosystem-=
engineering-and-operations-lead-remote-contractor

Josef
Yocto Project Community Manager
on behalf of the YP Leadership working group

