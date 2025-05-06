Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A26C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 08:06:53 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.71561.1746518806698956749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 01:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=pDRrrZOO;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.222.176, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5445cb72dso51118485a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 01:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1746518805; x=1747123605; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di1UlUY0eDg37gOX9nMHOWdz5gQqdCCWvpBrGmp4UyE=;
        b=pDRrrZOO0leppgzTpWPMswH8cTf22MDgF60YDOew+rTLRsaXv1RjwiCEpT9YTBblEj
         KnFTS8oFMV9bH7nBR0yR04yA6J2zXyJY3141la/wM7J/jzcKSBfDZGPPl8sRat1ayVcy
         FfF6LEdaTVD564CS9nEu8aet7FAOxz7UeLEItRs9eDF7r91BJ1NqokWJcgOC2Qd6FAdg
         F3dzx4a55YktqFxTs4fWMBU/FFUWkT3nrTFz5wOqCyhe5KSXDEIeRDgKrOFmch1iqFdy
         rzG+cdRfAkWIs72IGhbdQRVA+Hyf9xTorX0gBs1Vkd5NTHPsKHhX7t8uRC16JohGdMEG
         1hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518805; x=1747123605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Di1UlUY0eDg37gOX9nMHOWdz5gQqdCCWvpBrGmp4UyE=;
        b=bypP5Jhiy29y0f4PZI1205crf3+xR/CTua2OIqr3IwQ8IXtDrRX1VWlJpCEdkoC3jp
         ks5EinnSDqq8Poe8SmetYM7FHznAp8WaF0XVd+TVS+zWwc0UYCXA0ErNX9vQhgzmQAxc
         julBzWf8CSbFny/E2Adp0se5gV3JWn+oMsuei+n5E3CZWngHjQAHTh57mCRuWGjfnEmZ
         KPZ7n1cQYL6K9zNDIt50BslPemEks68TsFijkLwTu+eftVwmjSb1iNxZ472LRYZi05CS
         fsrAtC8D0FD40Ama0KHm9Dbn+E1ytfzhxUQbvyPiSX8g5ZxV8eBaW2a41Gr8z+L0ZwQy
         KPCQ==
X-Gm-Message-State: AOJu0YxJ+oT9LCaPQSw1tW8fVyaHhH8fzScrCOnfPWE6nNP2W8Jw7KbX
	I/axZ3XxuHwLURXbP5yRYriaLhAekYSs95OESMnRflihy7pVucVV2D4kxGkQkB+G6vEHtDEpLHX
	xea1OI9pB/TBb6LXDsPU2Af2wXwowoX8EkhFBpkevBbTgjzxTgnB+qPaKGd1W16R1b9EiUb3h8b
	7BbsyOVRmSuY+EQ0hChQYfQmTHGE0kOnh/L7uylPthUwqxNbwQ9SJBYr4MRQ==
X-Gm-Gg: ASbGncvoLLUgM952S3/sITgvuRZ+q50Tqt0sCk5/xMd8KQ6ujklIR0DXhkqHrfuhZkY
	dWqH6FLj/oTJlp/P9Fdl2n+vJjJPRsN/b8ItQgC2maw5KxTd9gHAHRcAZ1pLd1LI9LM5iH044b/
	zeeC6/4I58nih7SiAZODO4
X-Google-Smtp-Source: AGHT+IFcD32O1EwnaIuOZeCbJmGA6Vn6AoCz6NGkPgQURMLEeH+FjHNHk4MApOd5ntM+1uTv4MYJAgxIv079Rs+w+7s=
X-Received: by 2002:a05:620a:2894:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7cad5b235dbmr862780585a.3.1746518805453; Tue, 06 May 2025
 01:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250505095815.15137-1-l.anderweit@phytec.de>
In-Reply-To: <20250505095815.15137-1-l.anderweit@phytec.de>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Date: Tue, 6 May 2025 10:06:29 +0200
X-Gm-Features: ATxdqUFodWVzlLmx-WWqzw3Or3AtNYNxZn9ATvMiduQbzAx7lCR0Yt0OZdmEl_g
Message-ID: <CAJpXRYQyv5Qvr=ogU+YrCLYQBkbhy+9LpQf2g1W87V8R-gJNPg@mail.gmail.com>
Subject: Re: [meta-oe][kirkstone][PATCH] lmsensors: Fix build without sensord
To: Leonard Anderweit <l.anderweit@phytec.de>
Cc: openembedded-devel@lists.openembedded.org, upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 08:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117341

Am Mo., 5. Mai 2025 um 11:58 Uhr schrieb Leonard Anderweit
<l.anderweit@phytec.de>:
>
> When building with sensord disabled (PACKAGECONFIG =3D ""), do_install
> would fail because it tried to build sensord which was skiped in
> do_compile.
> Error log:
> make: *** No rule to make target 'rrd.h', needed by 'prog/sensord/rrd.rd'=
. Stop.
>
> Avoid building sensord in do_install by explicitly setting PROG_EXTRA.
>
> (master rev: fc88c96c4e40d9dbc6097c4679ac79ed55356730)
>
> Fixes: 86b20b84ec27 (lmsensors: Clean stale files for sensord to avoid
> incorrect GCC header dependencies)
>
> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Works for me. So

Tested-By: Jonas Gorski <jonas.gorski@bisdn.de>

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=C2=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=C3=B6psel


Commercial register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=C2=A0DE283257294


