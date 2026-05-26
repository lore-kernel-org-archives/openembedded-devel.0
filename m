Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846ABCD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 20:08:52 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5114.1779826127462845269
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2026 13:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kSJTXMF4;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43b48e67e54so2219799fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 13:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779826127; cv=none;
        d=google.com; s=arc-20240605;
        b=Kp7ayV2hUuhynVrA+oHeCGTLyF0KM5aFEzVROTkaNtwnEIFMQtVESVJZwyu9orIw/T
         NGdYNkbefRe9E1uKUOI5oW3ZccVchdLJ9lNnui0+PdfO4hDtXX1QwCm/yE1fnG9leats
         1DanZGRYPBtGSU1W1f4kuyhLc4xswFofAaMBfAA3a60yguPeKASRirgG5yEc1WfV05np
         ZlIfcVV8DYSM2RtzJqDLFnZuAhfm96UufG6nBOxf8y2h7L2wRE2H+oJUrAIZFmA7Xl9K
         OuFcArwfj26w8OP890QuvG9MJYIfX9Z3Sswq+TjMmPM/hS78uj70vb6bdfas7IzPi4OW
         yMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HDAw5A01AGxvxQRlKyxvWkYgePtV+P63OlV+TiLyY/s=;
        fh=r1X4OtMxPcjUq59EejrNNYxpdeisx79nSW2CT+BOhWo=;
        b=BtbCCvYGaGsNq+mmiAYhvh5HsSkY/spYFwWo3OQR7rcaN9ck8kbWfoIl3mgSSh+AyF
         JAc77md7hFfJ+WrdKgYgO2cr0V8vKbJ+CVTJyRNMKJbfxSIuzMYc4C+he6SJ/qqa2EXE
         AO2paIfGRTjMWH0bpr0vkofJtHYPXnNvIdEyq06A/NW+YOsU6yPSuXfXRFUPh54DVy9a
         qThEYiOBc9k9aiRhXxhXNHnEFruo/k13wFVvV3qYlo+R6Athd4Jp7w9Oj2/AO/6GOIqX
         rHG85NQ/jPio77YsgJ0BNeLCWI/nZcVSimixHCFBc0VrupBpGRlLsyQv7BCchdq9CQyn
         QDJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779826126; x=1780430926; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDAw5A01AGxvxQRlKyxvWkYgePtV+P63OlV+TiLyY/s=;
        b=kSJTXMF4DupJQKmY8jQTlBkLzMhkXUN8cQxXj8XdpI+2L8VBGIrOpfYgWpWifn7VFB
         ds6BnPhcBrgQhSwSznjzUyyk8bC4lY778psaZWl5UZtbBIG1F8W1bjGqdlEdUndg1dGk
         r9WplzA5u4aFttDXcLEULIRInmfKYhF7f1E0YXgCbHvSSST4LjL6y/h3m8XsXimjSMh2
         geo3t0GTUteDwo4rRp8Pya/pXU+FY4bdIBZIlYsCMymBye2JKkFtKSreOt11Na1x4k0j
         kxkMvUtBSl1xEy2/Ln5Ah2U2q2yN7P/+wZqBTgkkIS3owy4ryUY+d2ZNLaJzRSU1ZFug
         FCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779826127; x=1780430927;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HDAw5A01AGxvxQRlKyxvWkYgePtV+P63OlV+TiLyY/s=;
        b=ZLnt5DqwZYdtb3hYcun6qqeCTtNyj2vXGeMktF/JK+CtYwYB32dB0ZyfXE4B+qcSBB
         /4J1JgGn3bDIZ7OEm3KxQXk8nJyuWdQbVFHZ8ZYW4mlJGYMa4o97CxVgfUWMm0+oK0ZS
         VzYX/VhLW5uKit5TgvoS8rdJ2fnPKBX5INfearw0cHDCNLDvBBvwIyKsd86l5shexNsE
         7qMj6mzJre9uHM8o0e2iyimDkJyPxTbEpuKgTP85DYohVaILsy15nBY6by99mg1KY/iY
         lxMHPFAgiCjhYvEyjA89AALaNerQ1vwSSAu6fMgi2JXDtkybK681H5iiTAZV/8V4bBQC
         mtig==
X-Forwarded-Encrypted: i=1; AFNElJ+wqyxQuOh+oAAMSpyOs34F1/jr+N13QmrNGJHt1Z7lGkl+eDXjNUfFMnAz11KfW+sjHm+C4l8rNtgRSj7rw6HVnJ0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3y2ln7hb+EwWEdur17IGmd+XXfHKlIA3Rm9nwSqewa4nIn6cw
	IMdVy8TZINgy9F67aMeLsSDLtioBWZaJkRJxFHqsrPWyMDgydwc1y274ha0+5EqFZ04E2vGANqH
	9M/CwD4ia42bNQ2nFpL1vuRXd1mtEUHg=
X-Gm-Gg: Acq92OFgu/Oa4Sj75QN1p7yJCvgCb04cMbBRckZ+Z/5WhfCha8qeTL8QPExGOQyJJfk
	eVFvdHcyuw5P7jpV3d58v7ymJeJS7BVl/67cajSKRQghiyqI8Y10SvRD3tmflGflJ3Lyc+ToMdk
	PTrUZlOgBXbUykK41C1Ey2dXS3CcV/ebsigm/0EPZ3Kp5e68qsiUQSrUWuokvdfKGTUBDMk9GnH
	xkKP4Xi1HSV5FBK1wxIEQvrCT3ky/HD8YFFaO87Cj8pFPGnS3H9GVcYwMA2zce5rb+8Wnw6cIHf
	d6BmnsqYr1fIz+WE7EGD
X-Received: by 2002:a05:6820:99a:b0:694:921b:b1b3 with SMTP id
 006d021491bc7-69d7ebc41abmr12584028eaf.26.1779826126504; Tue, 26 May 2026
 13:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260511055013.1806816-2-skandigraun@gmail.com>
In-Reply-To: <20260511055013.1806816-2-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 27 May 2026 08:08:35 +1200
X-Gm-Features: AVHnY4IRhA3tYe7x7zBq7CarXDSUrvlkaeO9pYY-FyLqfDwU5rClA0C8x4NJfAM
Message-ID: <CADySD0EBFZhepZnj++YSPW2cUX30V1j3mfwZY_tW47yYEbghLQ@mail.gmail.com>
Subject: Re: [oe] CVE report - master - 2026-05-11
To: skandigraun@gmail.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 20:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127206

Hello Gyorgy,

We haven't received CVE reports since 11 May, are you still planning
to continue sending them?

I personally find them extremely helpful and appreciate the efforts
you put into it.

cheers
Ankur

On Mon, May 11, 2026 at 5:50=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Do you see a recipe on this list that is important for you? Help us busti=
ng some CVEs by sending some patches.
>
> List of all open CVEs (195, out of which new this week: 82):
>
>  - [NEW] apache2: CVE-2026-23918: https://nvd.nist.gov/vuln/detail/CVE-20=
26-23918
>  - [NEW] apache2: CVE-2026-24072: https://nvd.nist.gov/vuln/detail/CVE-20=
26-24072
>  - [NEW] apache2: CVE-2026-28780: https://nvd.nist.gov/vuln/detail/CVE-20=
26-28780
>  - [NEW] apache2: CVE-2026-29168: https://nvd.nist.gov/vuln/detail/CVE-20=
26-29168
>  - [NEW] apache2: CVE-2026-29169: https://nvd.nist.gov/vuln/detail/CVE-20=
26-29169
>  - [NEW] apache2: CVE-2026-33006: https://nvd.nist.gov/vuln/detail/CVE-20=
26-33006
>  - [NEW] apache2: CVE-2026-33007: https://nvd.nist.gov/vuln/detail/CVE-20=
26-33007
>  - [NEW] apache2: CVE-2026-33523: https://nvd.nist.gov/vuln/detail/CVE-20=
26-33523
>  - [NEW] apache2: CVE-2026-33857: https://nvd.nist.gov/vuln/detail/CVE-20=
26-33857
>  - [NEW] apache2: CVE-2026-34032: https://nvd.nist.gov/vuln/detail/CVE-20=
26-34032
>  - [NEW] apache2: CVE-2026-34059: https://nvd.nist.gov/vuln/detail/CVE-20=
26-34059
>  - [NEW] bubblewrap: CVE-2026-41163: https://nvd.nist.gov/vuln/detail/CVE=
-2026-41163
>  - [NEW] cannelloni: CVE-2026-37539: https://nvd.nist.gov/vuln/detail/CVE=
-2026-37539
>  - civetweb: CVE-2026-5789: https://nvd.nist.gov/vuln/detail/CVE-2026-578=
9
>  - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
>  - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-2=
3026
>  - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-=
67125
>  - [NEW] dovecot: CVE-2025-59028: https://nvd.nist.gov/vuln/detail/CVE-20=
25-59028
>  - [NEW] dovecot: CVE-2025-59032: https://nvd.nist.gov/vuln/detail/CVE-20=
25-59032
>  - [NEW] dovecot: CVE-2026-27859: https://nvd.nist.gov/vuln/detail/CVE-20=
26-27859
>  - [NEW] emacs: CVE-2026-6861: https://nvd.nist.gov/vuln/detail/CVE-2026-=
6861
>  - [NEW] exiftool: CVE-2026-7580: https://nvd.nist.gov/vuln/detail/CVE-20=
26-7580
>  - [NEW] firewalld: CVE-2026-4948: https://nvd.nist.gov/vuln/detail/CVE-2=
026-4948
>  - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5271
>  - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5272
>  - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5273
>  - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5274
>  - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5276
>  - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5277
>  - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5278
>  - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5280
>  - freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-228=
51
>  - freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-228=
56
>  - freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-228=
57
>  - freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-228=
58
>  - freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-228=
59
>  - freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-235=
31
>  - freerdp: CVE-2026-23533: https://nvd.nist.gov/vuln/detail/CVE-2026-235=
33
>  - freerdp: CVE-2026-23534: https://nvd.nist.gov/vuln/detail/CVE-2026-235=
34
>  - freerdp: CVE-2026-23732: https://nvd.nist.gov/vuln/detail/CVE-2026-237=
32
>  - freerdp: CVE-2026-23883: https://nvd.nist.gov/vuln/detail/CVE-2026-238=
83
>  - freerdp: CVE-2026-23884: https://nvd.nist.gov/vuln/detail/CVE-2026-238=
84
>  - freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-239=
48
>  - freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-244=
91
>  - freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
75
>  - freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
76
>  - freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
77
>  - freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
78
>  - freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
79
>  - freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
80
>  - freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
81
>  - freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
82
>  - freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
83
>  - freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-246=
84
>  - freerdp: CVE-2026-25942: https://nvd.nist.gov/vuln/detail/CVE-2026-259=
42
>  - freerdp: CVE-2026-25952: https://nvd.nist.gov/vuln/detail/CVE-2026-259=
52
>  - freerdp: CVE-2026-25953: https://nvd.nist.gov/vuln/detail/CVE-2026-259=
53
>  - freerdp: CVE-2026-25954: https://nvd.nist.gov/vuln/detail/CVE-2026-259=
54
>  - freerdp: CVE-2026-25955: https://nvd.nist.gov/vuln/detail/CVE-2026-259=
55
>  - freerdp: CVE-2026-25959: https://nvd.nist.gov/vuln/detail/CVE-2026-259=
59
>  - freerdp: CVE-2026-25997: https://nvd.nist.gov/vuln/detail/CVE-2026-259=
97
>  - freerdp: CVE-2026-26271: https://nvd.nist.gov/vuln/detail/CVE-2026-262=
71
>  - freerdp: CVE-2026-26955: https://nvd.nist.gov/vuln/detail/CVE-2026-269=
55
>  - freerdp: CVE-2026-26965: https://nvd.nist.gov/vuln/detail/CVE-2026-269=
65
>  - freerdp: CVE-2026-26986: https://nvd.nist.gov/vuln/detail/CVE-2026-269=
86
>  - freerdp: CVE-2026-27015: https://nvd.nist.gov/vuln/detail/CVE-2026-270=
15
>  - freerdp: CVE-2026-27950: https://nvd.nist.gov/vuln/detail/CVE-2026-279=
50
>  - freerdp: CVE-2026-27951: https://nvd.nist.gov/vuln/detail/CVE-2026-279=
51
>  - freerdp: CVE-2026-29774: https://nvd.nist.gov/vuln/detail/CVE-2026-297=
74
>  - freerdp: CVE-2026-29775: https://nvd.nist.gov/vuln/detail/CVE-2026-297=
75
>  - freerdp: CVE-2026-29776: https://nvd.nist.gov/vuln/detail/CVE-2026-297=
76
>  - freerdp: CVE-2026-31806: https://nvd.nist.gov/vuln/detail/CVE-2026-318=
06
>  - freerdp: CVE-2026-31883: https://nvd.nist.gov/vuln/detail/CVE-2026-318=
83
>  - freerdp: CVE-2026-31884: https://nvd.nist.gov/vuln/detail/CVE-2026-318=
84
>  - freerdp: CVE-2026-31885: https://nvd.nist.gov/vuln/detail/CVE-2026-318=
85
>  - freerdp: CVE-2026-31897: https://nvd.nist.gov/vuln/detail/CVE-2026-318=
97
>  - freerdp: CVE-2026-33952: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
52
>  - freerdp: CVE-2026-33977: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
77
>  - freerdp: CVE-2026-33982: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
82
>  - freerdp: CVE-2026-33983: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
83
>  - freerdp: CVE-2026-33984: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
84
>  - freerdp: CVE-2026-33985: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
85
>  - freerdp: CVE-2026-33986: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
86
>  - freerdp: CVE-2026-33987: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
87
>  - freerdp: CVE-2026-33995: https://nvd.nist.gov/vuln/detail/CVE-2026-339=
95
>  - freerdp: CVE-2026-40254: https://nvd.nist.gov/vuln/detail/CVE-2026-402=
54
>  - gimp: CVE-2026-40915: https://nvd.nist.gov/vuln/detail/CVE-2026-40915
>  - gimp: CVE-2026-40916: https://nvd.nist.gov/vuln/detail/CVE-2026-40916
>  - gimp: CVE-2026-40917: https://nvd.nist.gov/vuln/detail/CVE-2026-40917
>  - gimp: CVE-2026-40918: https://nvd.nist.gov/vuln/detail/CVE-2026-40918
>  - gimp: CVE-2026-40919: https://nvd.nist.gov/vuln/detail/CVE-2026-40919
>  - gimp: CVE-2026-6384: https://nvd.nist.gov/vuln/detail/CVE-2026-6384
>  - [NEW] lcms: CVE-2026-42798: https://nvd.nist.gov/vuln/detail/CVE-2026-=
42798
>  - libcoap: CVE-2026-29013: https://nvd.nist.gov/vuln/detail/CVE-2026-290=
13
>  - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38=
949
>  - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38=
950
>  - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
>  - libsoup-2.4: CVE-2026-1536: https://nvd.nist.gov/vuln/detail/CVE-2026-=
1536
>  - libsoup-2.4: CVE-2026-2436: https://nvd.nist.gov/vuln/detail/CVE-2026-=
2436
>  - [NEW] libsoup-2.4: CVE-2026-2708: https://nvd.nist.gov/vuln/detail/CVE=
-2026-2708
>  - libsoup-2.4: CVE-2026-3099: https://nvd.nist.gov/vuln/detail/CVE-2026-=
3099
>  - libsoup-2.4: CVE-2026-3632: https://nvd.nist.gov/vuln/detail/CVE-2026-=
3632
>  - libsoup-2.4: CVE-2026-3633: https://nvd.nist.gov/vuln/detail/CVE-2026-=
3633
>  - libsoup-2.4: CVE-2026-3634: https://nvd.nist.gov/vuln/detail/CVE-2026-=
3634
>  - libsoup-2.4: CVE-2026-4271: https://nvd.nist.gov/vuln/detail/CVE-2026-=
4271
>  - libsoup-2.4: CVE-2026-5119: https://nvd.nist.gov/vuln/detail/CVE-2026-=
5119
>  - libssh: CVE-2025-14821: https://nvd.nist.gov/vuln/detail/CVE-2025-1482=
1
>  - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
>  - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
>  - mbedtls: CVE-2025-66442: https://nvd.nist.gov/vuln/detail/CVE-2025-664=
42
>  - miniupnpd: CVE-2026-5720: https://nvd.nist.gov/vuln/detail/CVE-2026-57=
20
>  - ntfs-3g-ntfsprogs: CVE-2026-40706: https://nvd.nist.gov/vuln/detail/CV=
E-2026-40706
>  - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-=
1000155
>  - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39=
328
>  - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39=
329
>  - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
>  - polkit: CVE-2026-4897: https://nvd.nist.gov/vuln/detail/CVE-2026-4897
>  - [NEW] postfix: CVE-2026-43964: https://nvd.nist.gov/vuln/detail/CVE-20=
26-43964
>  - proftpd: CVE-2026-42167: https://nvd.nist.gov/vuln/detail/CVE-2026-421=
67
>  - [NEW] proftpd: CVE-2026-44331: https://nvd.nist.gov/vuln/detail/CVE-20=
26-44331
>  - python3-binwalk: CVE-2026-7179: https://nvd.nist.gov/vuln/detail/CVE-2=
026-7179
>  - [NEW] python3-django: CVE-2026-35192: https://nvd.nist.gov/vuln/detail=
/CVE-2026-35192
>  - [NEW] python3-django: CVE-2026-5766: https://nvd.nist.gov/vuln/detail/=
CVE-2026-5766
>  - [NEW] python3-django: CVE-2026-6907: https://nvd.nist.gov/vuln/detail/=
CVE-2026-6907
>  - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/C=
VE-2021-23401
>  - python3-grpcio-tools: CVE-2026-33186: https://nvd.nist.gov/vuln/detail=
/CVE-2026-33186
>  - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE=
-2023-50781
>  - [NEW] python3-pillow: CVE-2026-42309: https://nvd.nist.gov/vuln/detail=
/CVE-2026-42309
>  - [NEW] python3-pillow: CVE-2026-42310: https://nvd.nist.gov/vuln/detail=
/CVE-2026-42310
>  - [NEW] python3-pillow: CVE-2026-42311: https://nvd.nist.gov/vuln/detail=
/CVE-2026-42311
>  - [NEW] redis: CVE-2026-23479: https://nvd.nist.gov/vuln/detail/CVE-2026=
-23479
>  - [NEW] redis: CVE-2026-23631: https://nvd.nist.gov/vuln/detail/CVE-2026=
-23631
>  - [NEW] redis: CVE-2026-25243: https://nvd.nist.gov/vuln/detail/CVE-2026=
-25243
>  - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-268=
43
>  - thrift: CVE-2025-48431: https://nvd.nist.gov/vuln/detail/CVE-2025-4843=
1
>  - thrift: CVE-2026-41602: https://nvd.nist.gov/vuln/detail/CVE-2026-4160=
2
>  - thrift: CVE-2026-41603: https://nvd.nist.gov/vuln/detail/CVE-2026-4160=
3
>  - thrift: CVE-2026-41604: https://nvd.nist.gov/vuln/detail/CVE-2026-4160=
4
>  - thrift: CVE-2026-41605: https://nvd.nist.gov/vuln/detail/CVE-2026-4160=
5
>  - thrift: CVE-2026-41606: https://nvd.nist.gov/vuln/detail/CVE-2026-4160=
6
>  - thrift: CVE-2026-41607: https://nvd.nist.gov/vuln/detail/CVE-2026-4160=
7
>  - thrift: CVE-2026-41636: https://nvd.nist.gov/vuln/detail/CVE-2026-4163=
6
>  - [NEW] thrift: CVE-2026-43868: https://nvd.nist.gov/vuln/detail/CVE-202=
6-43868
>  - [NEW] thrift: CVE-2026-43869: https://nvd.nist.gov/vuln/detail/CVE-202=
6-43869
>  - [NEW] thrift: CVE-2026-43870: https://nvd.nist.gov/vuln/detail/CVE-202=
6-43870
>  - tinyproxy: CVE-2026-31842: https://nvd.nist.gov/vuln/detail/CVE-2026-3=
1842
>  - uriparser: CVE-2026-42371: https://nvd.nist.gov/vuln/detail/CVE-2026-4=
2371
>  - [NEW] uriparser: CVE-2026-44927: https://nvd.nist.gov/vuln/detail/CVE-=
2026-44927
>  - [NEW] uriparser: CVE-2026-44928: https://nvd.nist.gov/vuln/detail/CVE-=
2026-44928
>  - [NEW] wireshark: CVE-2026-5299: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5299
>  - [NEW] wireshark: CVE-2026-5401: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5401
>  - [NEW] wireshark: CVE-2026-5402: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5402
>  - [NEW] wireshark: CVE-2026-5403: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5403
>  - [NEW] wireshark: CVE-2026-5404: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5404
>  - [NEW] wireshark: CVE-2026-5405: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5405
>  - [NEW] wireshark: CVE-2026-5406: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5406
>  - [NEW] wireshark: CVE-2026-5407: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5407
>  - [NEW] wireshark: CVE-2026-5408: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5408
>  - [NEW] wireshark: CVE-2026-5409: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5409
>  - [NEW] wireshark: CVE-2026-5653: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5653
>  - [NEW] wireshark: CVE-2026-5654: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5654
>  - [NEW] wireshark: CVE-2026-5655: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5655
>  - [NEW] wireshark: CVE-2026-5656: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5656
>  - [NEW] wireshark: CVE-2026-5657: https://nvd.nist.gov/vuln/detail/CVE-2=
026-5657
>  - [NEW] wireshark: CVE-2026-6519: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6519
>  - [NEW] wireshark: CVE-2026-6520: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6520
>  - [NEW] wireshark: CVE-2026-6521: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6521
>  - [NEW] wireshark: CVE-2026-6522: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6522
>  - [NEW] wireshark: CVE-2026-6523: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6523
>  - [NEW] wireshark: CVE-2026-6524: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6524
>  - [NEW] wireshark: CVE-2026-6525: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6525
>  - [NEW] wireshark: CVE-2026-6526: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6526
>  - [NEW] wireshark: CVE-2026-6527: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6527
>  - [NEW] wireshark: CVE-2026-6528: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6528
>  - [NEW] wireshark: CVE-2026-6529: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6529
>  - [NEW] wireshark: CVE-2026-6530: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6530
>  - [NEW] wireshark: CVE-2026-6531: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6531
>  - [NEW] wireshark: CVE-2026-6532: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6532
>  - [NEW] wireshark: CVE-2026-6533: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6533
>  - [NEW] wireshark: CVE-2026-6534: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6534
>  - [NEW] wireshark: CVE-2026-6535: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6535
>  - [NEW] wireshark: CVE-2026-6536: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6536
>  - [NEW] wireshark: CVE-2026-6537: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6537
>  - [NEW] wireshark: CVE-2026-6538: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6538
>  - [NEW] wireshark: CVE-2026-6867: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6867
>  - [NEW] wireshark: CVE-2026-6868: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6868
>  - [NEW] wireshark: CVE-2026-6869: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6869
>  - [NEW] wireshark: CVE-2026-6870: https://nvd.nist.gov/vuln/detail/CVE-2=
026-6870
>  - [NEW] wireshark: CVE-2026-7375: https://nvd.nist.gov/vuln/detail/CVE-2=
026-7375
>  - [NEW] wireshark: CVE-2026-7376: https://nvd.nist.gov/vuln/detail/CVE-2=
026-7376
>  - [NEW] wireshark: CVE-2026-7378: https://nvd.nist.gov/vuln/detail/CVE-2=
026-7378
>  - [NEW] wireshark: CVE-2026-7379: https://nvd.nist.gov/vuln/detail/CVE-2=
026-7379
>  - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-088=
0
>  - [NEW] zabbix: CVE-2026-23926: https://nvd.nist.gov/vuln/detail/CVE-202=
6-23926
>  - [NEW] zabbix: CVE-2026-23927: https://nvd.nist.gov/vuln/detail/CVE-202=
6-23927
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Removed this week (0):
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126836): https://lists.openembedded.org/g/openembedde=
d-devel/message/126836
> Mute This Topic: https://lists.openembedded.org/mt/119252071/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

