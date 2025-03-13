Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1B7C35FF3
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 16:35:52 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.19586.1741883749777400652
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 09:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YyB6HNo8;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f546cbf71cso507313b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741883749; x=1742488549; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogC+Rpqonm1prCqjW4isPVjWvrNXxRCZjwpwgSqQJMs=;
        b=YyB6HNo8e2iEuA0JmGvDTA832U2dwhkeHwOyJBr2KnvaIJdp1ySjZBogu2gZ+RE+KU
         s7mC4MLxtbdcjqwQrvUnHzd6nUK/pMnfujRwgofPRB+bP+C9ZXWM6Wkqp+PvwXspMPNA
         263mL7Ck2/y//i94ioF3RIe8bULCI7jQz+OGwW5xf1/1VpA1k4gTzT9EmOQcPl0gqs/h
         4vVEosXZftqbP5fP7EwPa5lF/kTzweYZCsQG6lFg7QWJHtBXEl4CnMCDTyqnFbTRD9S1
         hXzbAW0QhVtLX4Orjr99cB6fz6HW2IezdA/3tb4zlplmUGzrxvH3jiz6XINESBX8qbwN
         yvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883749; x=1742488549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogC+Rpqonm1prCqjW4isPVjWvrNXxRCZjwpwgSqQJMs=;
        b=kH9pz21oHqrkCCceJPpskOs6+d3xaHoTa9izOKHjVplRwIy0VboNUilDsARxgEnG8y
         sYPIUZFf5olxfMD5ZrEv/yNqkumYx24BwQ5xvFgo2lTLaAddbP2GrHyNdt97fiZKk+/f
         E+xNWck9XQxnkrdVMaevzccgVlEth3Lakg+MUhWWjD33KIN+ScJdCttroT2H6rOnlxJt
         Eu34eW01x1jErul5ig9RJmdtLVK2GIhBuAFY3Xg2mYODiAce2fHQmwWdXrKy7JrO3tpt
         iIzGwW4penyoYDpwKu6OmGnz/2ekMnvphmRGcjvsjgJ5nz3XUFSz5WJesipygUbt6vbT
         VqGA==
X-Gm-Message-State: AOJu0YyPjJONPj0DFb4/TUlkQUUVHcMrHMZpEHPS83M2EymjQpilVMMF
	+rVBjgbhJdd99gbTyGEk5EEDT9BnboAU/jJS0bLiFhxr6p1yj4lHZC6Lvsj6OR4pDVEHYq/+hEa
	Sro1/YpXbQAZR3OU94v39aqCRDpTuy06g18Q=
X-Gm-Gg: ASbGncvpBV8/AnN/gRAPBLGj5rRQ+XhsXSYAHv3rTQtMlqqTuffhA7zR+P2/iCL/8+W
	cp4HuhGnaHgWF1NqVDwX3SIDiq/vmy1xWtiA3QnnRGXZdfd3JFvBKFgD3TX81PbFEogy6EWkzMb
	VER3q8soaE1cArFHHvJqgjRjCe
X-Google-Smtp-Source: AGHT+IHGEKgvJ+hOOAscSbT8Txbk4dLOiIBv+NDTTGRmfRT85hheAXBNL7uERL6ljmIKfCBzyRMuNmTHWrcC+9Hw9YQ=
X-Received: by 2002:a05:6808:398a:b0:3fb:3059:3789 with SMTP id
 5614622812f47-3fda352a506mr147534b6e.32.1741883748929; Thu, 13 Mar 2025
 09:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250313031722.2954589-2-hongxu.jia@windriver.com> <29623.1741835951970054920@lists.openembedded.org>
In-Reply-To: <29623.1741835951970054920@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Mar 2025 09:35:23 -0700
X-Gm-Features: AQ5f1JpwAqkAchnT6xAlzFzQG9IE9HSEiilbr5C3fleyCndGVIHhCVD24bVrmU4
Message-ID: <CAMKF1srT8wnQR6+7Ep7ciOEA6P=eV5JE=VdF8n5wCRmvTJqEJQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] protobuf: 4.25.5 -> 4.30.0
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 16:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115978

I am still seeing a protobuf-native build failure on ubuntu 20.04
which has gcc 10

protobuf-native/4.30.0/git/src/google/protobuf/port_def.inc:105:48:
error: static assertion failed: Protobuf only supports C+
   =E2=86=AA +17 and newer.
   |   105 | #define PROTOBUF_CPLUSPLUS_MIN(x) (__cplusplus >=3D x)
   |       |                                   ~~~~~~~~~~~~~^~~~~
   | /home/kraj01/yoe/build/tmp/work/x86_64-linux/protobuf-native/4.30.0/gi=
t/src/google/protobuf/port_def.inc:119:15:
note: in expansion of macro =E2=80=98PROTOBUF_CPLUSPLUS_MIN=E2=80=99
   |   119 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201703L),
   |       |               ^~~~~~~~~~~~~~~~~~~~~~


On Wed, Mar 12, 2025 at 8:19=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Sorry for the duplicated noisy, please ignore this one and keep '[meta-oe=
][PATCH V3] protobuf: 4.25.5 -> 4.30.0'
>
> //Hongxu
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115949): https://lists.openembedded.org/g/openembedde=
d-devel/message/115949
> Mute This Topic: https://lists.openembedded.org/mt/111673625/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

