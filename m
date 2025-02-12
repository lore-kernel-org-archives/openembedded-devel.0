Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E326C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:33:58 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.20490.1739378035619359695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G4KW/x8a;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-726f943b6f4so165482a34.0;
        Wed, 12 Feb 2025 08:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739378035; x=1739982835; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FfTXrqor9fybXgIsYLODrIRtOGBedk43M5gY+M5IHnw=;
        b=G4KW/x8alKKXmjgmMnpdwW/gNOm2VPB6vGH26v0EBu75AdpmlgoJY9STJvo9qIptOA
         DzjyNe200JTlRYsQ8F0JCsrT6rLSq69QgxvCnnOCPBZZhX51B9/CRjcakH/yxGNVLl3n
         rgHsSj4ujNwNo3q4ecYtwlBofeGRjlDIgqe+vVH45vIpKFnqtECztPG24+XJNg72pTAT
         3JL5tSiH7siLUK05Qe/Tfx9Zoc6AGiZ8RnWBQAwqewJhvYJvWAsveLFKsrnNXIkZTDUx
         i9FNmJtu1wVemnd7QG1+m/gp+iuAW/hhqd6z+KgThFouIDqisi8Y/L6XQCKQXaKaKiA+
         I1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378035; x=1739982835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfTXrqor9fybXgIsYLODrIRtOGBedk43M5gY+M5IHnw=;
        b=iWIvkUIEjcWo4ZOhZg6AGh7kehtjEDH2Llts0/3liUdFhCcBE9mmolHGoVH1rStnqX
         fqAQ328RahFrS2mNFC+hx/B9Qi/NDUXJK1ZlSTcqstsZdVD4x0orwHXpxtHnIhfFch92
         2oWQ3TtaquBqnT84ZmFvG5K2aIcKADm85TvhSiroj7jJoBNlprcbuI9bA59rRMbl8I8s
         zHEp1oDb6Z73wH9EmwIIXgnocunVYE65zAb+7QXTkcrIQy9YhfHhRpMAU/X7/BAVYSRm
         OWMwOnXQq2+BpmI0jbnFPYDfHlZ1gZcn16cODv6rH92JdGJnshgBDdTusxjP9bpsR/fU
         ByDw==
X-Forwarded-Encrypted: i=1; AJvYcCUB6bE8lNkKPUTGXvkk/kCf9mgaHaQi845tEtOZ2+ZVHRh5ZPH6qP8uAN/G5dWiHKC9ikkrdaeLNUAIbVijhaG8UOQ+@lists.openembedded.org, AJvYcCWe1qhqEpUjaq8sazFuhyzhfWQd/7JLv3Utl+HdXcPEOk6lJBvOjABF9kTfBq1y8ezO237/2gN4x0gxCz79//VrqWo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbuvqzDyhTeEeP7IbT4HoIsseN+UfTXTCa4BuwjOpU4JSWdEpS
	9XZJFYzVKBV+9CBsK1fWL6bsGNlZ0rRotl+U7e5AwofScQQMU7e2SVu5PRfJ5yNy0HgNKoC3pfK
	bHuQkmL6we2bSUlIOESDZ+F8owIM=
X-Gm-Gg: ASbGnctO7JPgFf7JywGxJ3U9/y/2tBw8beIrVNiT6W9VB/CDZwnqLQulJQ1OrKG4oMt
	MVFyrEJq6X41u2nJaIX5LqCMMHwABRLtpyWpCT2FMPYplxM4BTs5sHf0JPs42KaezuM1/G32O5p
	m5Kt43ns6iiiaQofu4RCr1OcQlL0YkQqs=
X-Google-Smtp-Source: AGHT+IG/kbaiJuSjVMrqfPh52K0yLQTINyyd3cU9Lzm9LPqUI2CDSkfHxJZnIId07IUsGMBN7MACuiRK7XEFxO55hKA=
X-Received: by 2002:a05:6870:4723:b0:29e:67cd:1a8f with SMTP id
 586e51a60fabf-2b8d683f818mr2169910fac.37.1739378034750; Wed, 12 Feb 2025
 08:33:54 -0800 (PST)
MIME-Version: 1.0
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
 <1739178095-26432-17-git-send-email-wangmy@fujitsu.com> <H0WKRS.6N3N2FQDS83Z@t-online.de>
In-Reply-To: <H0WKRS.6N3N2FQDS83Z@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Feb 2025 08:33:43 -0800
X-Gm-Features: AWEUYZlVFAixIhP_NtA78kVYRM1CUUyzebx1eLSu8KOjg2lLV5sWkJaGXrTPqVc
Message-ID: <CAMKF1srKTEMaNfCj4PG3OGj_yEQdm1AYongnVkgtx7xJSBhSkg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH 17/66] msgraph: upgrade 0.2.3 -> 0.3.3
To: Markus Volk <f_l_k@t-online.de>
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org, 
	"wangmy via lists.openembedded.org" <wangmy=fujitsu.com@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e440ef062df481e0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 16:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115449

--000000000000e440ef062df481e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 8:25=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:

> On Mo, Feb 10 2025 at 17:00:46 +08:00:00, wangmy via
> lists.openembedded.org <wangmy=3Dfujitsu.com@lists.openembedded.org> wrot=
e:
>
> msgraph
>
>
> The msgraph update breaks gvfs:
> | Run-time dependency msgraph-0.1 found: NO (tried pkgconfig)
> |
> | ../gvfs-1.56.1/meson.build:434:16: ERROR: Dependency "msgraph-0.1" not
> found, tried pkgconfig
>
> gvfs 1.57 will be a requirement to be able to use msgraph-0.2 and the
> update is problematic because it requires glib-2.0 update in oe-core
>
> I dont know if there is interest in getting the gnome 48 updates into
> oe-core before feature freeze, but if not, this update should be delayed
>

The dependency chain seems to be long let=E2=80=99s hold on until glib-2.0 =
gets
updated

>

--000000000000e440ef062df481e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12, 2025 at 8:25=E2=80=AFAM=
 Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-772529331=
698244385geary-body" dir=3D"auto">On Mo, Feb 10 2025 at 17:00:46 +08:00:00,=
 wangmy via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lis=
ts.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.op=
enembedded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt=
; wrote:<br><blockquote type=3D"cite"><div style=3D"white-space:break-space=
s">msgraph</div></blockquote><div><br></div><div>The msgraph update breaks =
gvfs:</div><div><div>| Run-time dependency msgraph-0.1 found: NO (tried pkg=
config)</div><div>|=C2=A0</div><div>| ../gvfs-1.56.1/meson.build:434:16: ER=
ROR: Dependency &quot;msgraph-0.1&quot; not found, tried pkgconfig</div></d=
iv><div><br></div><div>gvfs 1.57 will be a requirement to be able to use ms=
graph-0.2 and the update is problematic because it requires glib-2.0 update=
 in oe-core</div><div><br></div><div>I dont know if there is interest in ge=
tting the gnome 48 updates into oe-core before feature freeze, but if not, =
this update should be delayed</div></div></blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">The dependency chain seems to be long let=E2=80=99=
s hold on until glib-2.0 gets updated=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D"m_-772529331698244385geary-body" dir=3D"auto"><div dir=3D"a=
uto"></div></div></blockquote></div></div>

--000000000000e440ef062df481e0--

