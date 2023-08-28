Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAA9C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:05:31 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.857.1693242329533962405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Aug 2023 10:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RNW71blP;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a7aedc57ffso2495445b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693242329; x=1693847129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fEZCgSUOmfHQgCv1fCKHoORlLyAVUEPbuoiVeHVsJo=;
        b=RNW71blPrel35Ajri9bAsTE4g0OfV81oOR+C0kiAQ9++j6/0wEVB1obnge/bDMVaF/
         nIYogVr6sdB66lyRpJH3YSJGn0RC5eyXwI+AvF7DkoUPY+mG13RnXjPJw0DaeTwlxH1G
         faeO9VI/nlQnPw+LUrtQqxolOnl0GUw8hMRVWrtxghPmakXR/sXOZT/bcvFq5m43cTKi
         dAE0Hutj4/gB0qof8lJ4SHp+H7eutKLp06MRzn7PPcUO0/yxl+3/C93JaFlDWRZ+jK94
         FdICsI5VjV8PBY3eR7moWgVTqO6Qc4qtVl10ggtgyusKnSFk3AIEwd7Mj6r/N8m+ULAf
         96Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693242329; x=1693847129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fEZCgSUOmfHQgCv1fCKHoORlLyAVUEPbuoiVeHVsJo=;
        b=YeREcAp7jBsjvYD+a2IXsO1/55MgUZvjZfd5hnJns59q8r66WHM6u8gTQtk8UCWpDW
         c9VL+hRNevSoIk3wAVXncDgOp161Z2ZE+GTGvhL2CzJUCdAs9QWnZTwh49mnosRGl/Du
         dtrM+OoTHkme/qnm2HbM5w+J8ajR72WinzbyJ3S2rNRm2AiwfPGEBZhOj97uJbvPha5q
         mkg2zRgcVRlY/IeW8pfKW4U61qs11mNhdwZArXjudmubxW+XYM9VukB3kLlhyXGhIRlt
         ehT/s5eHWIpAetIVowkChGqITKU6HFJsDrqB9h9xd50JZm67hZkkuEHzLxJXiaCPvVyS
         4KMg==
X-Gm-Message-State: AOJu0YxpGqvXYMiMSzA7VDIW48esZvSUXvILsODSqMThiU/P2AmsRahv
	exdVX7pmVcxVlcHM0brNIOpFhFIwVtSvHvxhYbU+uXXpszY=
X-Google-Smtp-Source: AGHT+IGaKHASRku+j482qnJZ7v5+yArguZAnmIIaXs4yMYA/XGTdvqZr+EomVknOmoeLZdPil4D33CyifIjDKAEt+Vk=
X-Received: by 2002:a05:6808:218a:b0:3a7:4f8:eb76 with SMTP id
 be10-20020a056808218a00b003a704f8eb76mr16173607oib.24.1693242328761; Mon, 28
 Aug 2023 10:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230828104918.471061-1-yi.zhao@windriver.com>
In-Reply-To: <20230828104918.471061-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2023 10:05:02 -0700
Message-ID: <CAMKF1sozTDfumsfEF0pOuJG5UTy4VVr38+iUo4eg2gmN6PAi-g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH][master][mickledore] frr: Security
 fix CVE-2023-3748
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 17:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104634

does this also apply to master? if so then it should be routed through mast=
er

On Mon, Aug 28, 2023 at 3:49=E2=80=AFAM Yi Zhao <yi.zhao@eng.windriver.com>=
 wrote:
>
> CVE-2023-3748:
> A flaw was found in FRRouting when parsing certain babeld unicast hello
> messages that are intended to be ignored. This issue may allow an
> attacker to send specially crafted hello messages with the unicast flag
> set, the interval field set to 0, or any TLV that contains a sub-TLV
> with the Mandatory flag set to enter an infinite loop and cause a denial
> of service.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2023-3748
>
> Patch from:
> https://github.com/FRRouting/frr/commit/ae1e0e1fed77716bc06f181ad68c4433f=
b5523d0
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../frr/frr/CVE-2023-3748.patch               | 54 +++++++++++++++++++
>  .../recipes-protocols/frr/frr_8.4.4.bb        |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-37=
48.patch
>
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patc=
h b/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
> new file mode 100644
> index 000000000..4a8a7e1af
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
> @@ -0,0 +1,54 @@
> +From e61593f2ded104c4c7f01eb93e2b404e93e0c560 Mon Sep 17 00:00:00 2001
> +From: harryreps <harryreps@gmail.com>
> +Date: Fri, 3 Mar 2023 23:17:14 +0000
> +Subject: [PATCH] babeld: fix #11808 to avoid infinite loops
> +
> +Replacing continue in loops to goto done so that index of packet buffer
> +increases.
> +
> +Signed-off-by: harryreps <harryreps@gmail.com>
> +
> +CVE: CVE-2023-3748
> +
> +Upstream-Status: Backport
> +[https://github.com/FRRouting/frr/commit/ae1e0e1fed77716bc06f181ad68c443=
3fb5523d0]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + babeld/message.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/babeld/message.c b/babeld/message.c
> +index 7d45d91bf..2bf233796 100644
> +--- a/babeld/message.c
> ++++ b/babeld/message.c
> +@@ -439,7 +439,7 @@ parse_packet(const unsigned char *from, struct inter=
face *ifp,
> +                       debugf(BABEL_DEBUG_COMMON,
> +                              "Received Hello from %s on %s that does no=
t have all 0's in the unused section of flags, ignoring",
> +                              format_address(from), ifp->name);
> +-                      continue;
> ++                      goto done;
> +               }
> +
> +               /*
> +@@ -451,7 +451,7 @@ parse_packet(const unsigned char *from, struct inter=
face *ifp,
> +                       debugf(BABEL_DEBUG_COMMON,
> +                              "Received Unicast Hello from %s on %s that=
 FRR is not prepared to understand yet",
> +                              format_address(from), ifp->name);
> +-                      continue;
> ++                      goto done;
> +               }
> +
> +               DO_NTOHS(seqno, message + 4);
> +@@ -469,7 +469,7 @@ parse_packet(const unsigned char *from, struct inter=
face *ifp,
> +                       debugf(BABEL_DEBUG_COMMON,
> +                              "Received hello from %s on %s should be ig=
nored as that this version of FRR does not know how to properly handle inte=
rval =3D=3D 0",
> +                              format_address(from), ifp->name);
> +-                      continue;
> ++                      goto done;
> +               }
> +
> +               changed =3D update_neighbour(neigh, seqno, interval);
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb b/meta-ne=
tworking/recipes-protocols/frr/frr_8.4.4.bb
> index b87c3e78b..f32b52f33 100644
> --- a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
>  SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=
=3Dstable/8.4 \
>             file://frr.pam \
>             file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not=
-py.patch \
> +           file://CVE-2023-3748.patch \
>             "
>
>  SRCREV =3D "45e36c0c00a517ad1606135b18c5753e210cfc0d"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104632): https://lists.openembedded.org/g/openembedde=
d-devel/message/104632
> Mute This Topic: https://lists.openembedded.org/mt/101007225/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

