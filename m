Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922BBEE49A6
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 19:57:34 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.704.1692647852944229955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 12:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sWzB76sH;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1c11d53221cso2432736fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 12:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692647852; x=1693252652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBiOYTjNBLWWOYdqAvZVPkzDlm2hs/jjKnYGcvrf800=;
        b=sWzB76sHV8dRHiutMulywGoi73RhVO5jWxBxRfTJ8G0vCK+mcQECzTikwUruqQimlu
         ZQ5gEYbeQu+0sjf6NdkS0CDllerSTFFtOTKA3nSwNFINARHcGQaDDNRMQJoKhms1M8Po
         qbz+SAxZg0ku6yrt762ebYaFSBqNoFJPiNdpN7jfb7+mlyGgyQ3x6/Ds/TRLgIwsEGnM
         seXjqcr1CTgP0Afd9+x1kn+aZeiYdU0ALyIfIuEe848KlSGYPpSBgqvv9I76+81w13Rp
         R/f7hDPpfCz2KBCkJOFHItfzi5X8aHnylDxdRLcTlac3PFNRbnwv9f3l5Lt8RAVQunHc
         92mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692647852; x=1693252652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBiOYTjNBLWWOYdqAvZVPkzDlm2hs/jjKnYGcvrf800=;
        b=VsqtCvx5+KrKZDb2uw3H0cwzib7ckEsRarhUErTJI+a3D6j33o5tAgsmkEtPmqYAfz
         SmwNif3cpWVHUJ4qIDeukDEwtQ2jeifRYrfO+t3ASeeFsVt/Zi/x8VktBc/t5vsjxt6q
         m/sWqa3Ai1yQbN5zh5KZ4vd1Ay28YhJYQLjUjzOdN7XKgyTUvQlqS9k+Lxrp/pX/u7Ve
         WP+FDlaDLUtu496+NgXc0Wp6jp/WcnHSZElCKv9oy3U3MwgzCGhQk9+mm9KiJ60QH083
         CzQfZaKaubJWHc8LFubjORU0n7//yNbj41cqSPZSVYT7yyhp+RQ9f8aX2be1rERqtB3W
         1aVg==
X-Gm-Message-State: AOJu0Yw7UmU1UaMexBgwdb0lNpiRAKEllily+Q3TaZgDOE7Gsqv0QAag
	2SthsUCCP5gIRkPEqgDyw87QcD160dj9EYhW1AbvV9uPUllgdA==
X-Google-Smtp-Source: AGHT+IH2UNMWz4T2eCcZHzwJ6L/eQ18HRHmOtnRBHJh/Abgseh4yXRXlk0/ZGLlC5i9S4Bi2nwRlyWS5cJNgtdbMV5o=
X-Received: by 2002:a05:6870:9722:b0:1b7:4521:14b6 with SMTP id
 n34-20020a056870972200b001b7452114b6mr10204648oaq.5.1692647852090; Mon, 21
 Aug 2023 12:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <0e8818ab-ca4e-796a-3956-3677a42c631c@kernel.crashing.org>
In-Reply-To: <0e8818ab-ca4e-796a-3956-3677a42c631c@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Aug 2023 12:57:05 -0700
Message-ID: <CAMKF1soycuYCSc76XUAWnCsW6RtMDWiGQMFYD+8NxM=AC5g_tg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] kconfig-frontends recipe
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 19:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104514

On Mon, Aug 21, 2023 at 12:46=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> I was trying to build the kconfig-frontends recipe locally the other day =
and ran
> into a problem where it reported unsafe "/usr/include" path.
>
> This seems to have been triggered because I actually had a /usr/include/n=
cursesw
> on one of my host systems.  Other systems I had didn't have this director=
y and
> no issue was reported.
>
>
> I tracked this down to
>
> https://gitlab.com/ymorin/kconfig-frontends/-/blob/master/configure.ac?re=
f_type=3Dheads#L349
>
> Lines 349 and 350.  I changed to them to
> '-I=3D...' in both cases and it appears to have solved the problem I was =
having.
>
>
> Has anyone else seen this issue, and is my possible fix above reasonable =
in this
> case?  If so I'll generate a patch to do just that and send it to the lis=
t.

I have not seen this exact issue but similar issues have been spotted
in many packages, usually
just removing the absolute path has helped in some cases. Changing to
=3D/include/path works
with sysroot enabled compilers and may not work with old compilers or
sysroot disabled configurations
maybe using includedir autoconf variable could be more portable IDK.

>
> --Mark
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104513): https://lists.openembedded.org/g/openembedde=
d-devel/message/104513
> Mute This Topic: https://lists.openembedded.org/mt/100880280/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

