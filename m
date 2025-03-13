Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2A4C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 16:49:02 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.20050.1741884536020355341
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 09:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TI2/P96A;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f6eaa017d0so908226b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 09:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741884535; x=1742489335; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUUJCA8/ezt7S+LsPtxvgAPohmd4wLdsFkL8eMfQ3o0=;
        b=TI2/P96AJW7Nlazm+z2Tz1M/+IUy8mcHeOz5u5iSHs4jmyHFbpJxmiY14HBsjy3aND
         tUqn7cSzEGTAemhR5oWKdB1YnT+KBrNQBYHgYogUWN/4pvGUKQMxioRXfz7pqjZCUkXi
         2TeYHemib+NjhbeCtshnYSG4fRuIE6I1tD7wX7Kqzu91RS4jDIrSoiMLAd/j8QFGpz/y
         +/2G+zZka6hTn0IoZLvsM5I11a8LVzrhtbJjZc2bT6stiLjH94rWBgBPZOQ410CaukSl
         4Q5OzgcIHqO+EsvJUWG3ehj1kw3tp6Sq+e1i1SbiIA2+6MXHUpYT7Xk2lRF6Uzr6qeeF
         L3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884535; x=1742489335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUUJCA8/ezt7S+LsPtxvgAPohmd4wLdsFkL8eMfQ3o0=;
        b=lIOCOFGvvM+eLwdhV+N8lzdoxbwf3QXsMCRHyulnlgClnOJhuPqv9OEpxM4goEzzGZ
         eCTQebb4xXF1SUILkWpnhM/hXWuOJQeraw5ZcMdSjcTWFPpGUkpqPGWKaYwQ5T+DuITG
         thkthLs3kLDoEBGYXE229bzzy87vm5VdaAcVhUfY0zPojCW0F5wKmnDqXYMdJRW+E24M
         TQ5XxdAEb5Ecevqn7muoSQSXGhkwMA/DVQVMSZ3yVrfOgTIZyDHfJWY3JHsD9NDByezw
         q6tBDlBWJoaE9iWuRlUAHuFepgq1gQqcDqM/7RuVC9D5YTQYguomFMdIfMIcm4fwk7e9
         OTZg==
X-Gm-Message-State: AOJu0YyIh1jVchp85bdqf9mkPkK9fwNUDgrVODmwKscPshxpvSXKpWBH
	wWtF965ooeShihzT+J2VwqpLlvExJzkjoeq0n3iRzS1wQNBpWC0tw1i6OGb2YqtaqQRpcrmNk3G
	uXziEpf6SghORXKzNY20dMGeatmg=
X-Gm-Gg: ASbGncsqZBWcuT/ARhabhnxQFLxEDtt3FK0N/c99ziKrpRoXAKRKZVdpIiuvzoCM6il
	me/+3IrIa6ur/rfJ+s2W+uQwQK9UJE+GfQP3okNkDskrgiEEpsvs4kWYa3drFGVfc/RDwE9OLDU
	WUPy/ib6lVWAMD/IIsofgckFf8
X-Google-Smtp-Source: AGHT+IFXOmNprFB71LkZiD1SMojhIim7TmA3XNtmhU+dFRUa3fAcuOp1CVA9BDcNPvkeSb7K5EtLcEPJSz4z+sSekZc=
X-Received: by 2002:a05:6808:144c:b0:3fa:7909:2719 with SMTP id
 5614622812f47-3fda1d4f39amr163516b6e.19.1741884534802; Thu, 13 Mar 2025
 09:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250313031722.2954589-2-hongxu.jia@windriver.com>
 <29623.1741835951970054920@lists.openembedded.org> <CAMKF1srT8wnQR6+7Ep7ciOEA6P=eV5JE=VdF8n5wCRmvTJqEJQ@mail.gmail.com>
In-Reply-To: <CAMKF1srT8wnQR6+7Ep7ciOEA6P=eV5JE=VdF8n5wCRmvTJqEJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Mar 2025 09:48:27 -0700
X-Gm-Features: AQ5f1Jr8XMJRSsOHZIuR4D-BELT0M55YZzAiEVwQs1iGYg_U9GPqrSUgEO8widI
Message-ID: <CAMKF1spcbP58H+KjOHdkWOyicPAozdtM_02Q_PXTGDBK7cq0mQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] protobuf: 4.25.5 -> 4.30.0
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 16:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115979

Can you try a patch like below

diff --git a/CMakeLists.txt b/CMakeLists.txt
index ae3c3246da..eda19aaf5a 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -14,6 +14,10 @@ endif()
 # Project
 project(protobuf C CXX)

+set(CMAKE_CXX_STANDARD 17)
+set(CMAKE_CXX_STANDARD_REQUIRED ON)
+set(CMAKE_CXX_EXTENSIONS OFF)
+
 if(protobuf_DEPRECATED_CMAKE_SUBDIRECTORY_USAGE)
   if(CMAKE_PROJECT_NAME STREQUAL "protobuf")
     get_filename_component(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR} DIRECTORY)


On Thu, Mar 13, 2025 at 9:35=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I am still seeing a protobuf-native build failure on ubuntu 20.04
> which has gcc 10
>
> protobuf-native/4.30.0/git/src/google/protobuf/port_def.inc:105:48:
> error: static assertion failed: Protobuf only supports C+
>    =E2=86=AA +17 and newer.
>    |   105 | #define PROTOBUF_CPLUSPLUS_MIN(x) (__cplusplus >=3D x)
>    |       |                                   ~~~~~~~~~~~~~^~~~~
>    | /home/kraj01/yoe/build/tmp/work/x86_64-linux/protobuf-native/4.30.0/=
git/src/google/protobuf/port_def.inc:119:15:
> note: in expansion of macro =E2=80=98PROTOBUF_CPLUSPLUS_MIN=E2=80=99
>    |   119 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201703L),
>    |       |               ^~~~~~~~~~~~~~~~~~~~~~
>
>
> On Wed, Mar 12, 2025 at 8:19=E2=80=AFPM hongxu via lists.openembedded.org
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
> >
> > Sorry for the duplicated noisy, please ignore this one and keep '[meta-=
oe][PATCH V3] protobuf: 4.25.5 -> 4.30.0'
> >
> > //Hongxu
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#115949): https://lists.openembedded.org/g/openembed=
ded-devel/message/115949
> > Mute This Topic: https://lists.openembedded.org/mt/111673625/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

