Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D76CC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 14:13:54 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.13918.1741184025309383061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 06:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WiGAJM/u;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2addd5053c0so3087329fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741184024; x=1741788824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeB0AIoPyP02jmVilK55CsKP8bOv79B9AUhCtfQfaDo=;
        b=WiGAJM/u4D/wz00/acy1Au9KqY4h40issi7o4RJxVds31Oiu2k99/G64e9CRMCbgPV
         6RVt9sZfTwJRjVrc8W+JiQOruHE0/BFMi7S9qhQQryCMw8oZ71FWRZDyGpm9Dxis+hvT
         Ii8ofH2Y8WoQRJRO6ocQRfGCJTieEYLKqNdPivYoO+P4juqysaVrTFNaXLOWf0730NYS
         cJHPSpI1nXcUE0hjuPVfd3Bm5fqk/eOUTXJzK2Bgxrd90dXz+pffjflKLPgQ2dK9P3+j
         FNpwI1J9CoUsAaC03XTAG36wkt8tSjerL7/d50IEc0QLy9z05NmRCgF14S2w869Q0ZUO
         hp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184024; x=1741788824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeB0AIoPyP02jmVilK55CsKP8bOv79B9AUhCtfQfaDo=;
        b=g5Nh8T5xGBFbRvHqyGc/IyBBULT17xy7m4IUFH8TyHJv1f5oFJ/wWYNahkHD/H5Kp2
         xHuIJuhTRcAIWTyNqjwI5/+/slk/58oZ47b57Ox0Ajuz/Caic26fhF3wMWUp1LEXirlx
         g0xJ2/nnx+yUm/BMUYj590NYWOniNgSzY4C2HsvctDm/vmnE5dYH/APgH8Ph+6SYTiyP
         DGui8E9MNC6IKv3D1GTZ8726WhNqHQesmKF0SaaCjqanqId+QuwdXi8+EsNOhCfMsdET
         4ZNAAk/lrH6nKOKWIvfyTeuKk2pEihebtn8WWHbl7iRN1F+OOYOhFqK4cg0SJSb/AeRD
         +N3g==
X-Gm-Message-State: AOJu0YzmJeM+hNRzMiPTn0U7HV2UL4LVRWUdX7FtTTe2dc2WerYTyioc
	dlgBsals/FfwItbCFEGBH918MvtMFYd9FixUu5zTzpbO7qHLcv28QCDvLlgCTuwlpe1X6vweygQ
	KPelcXfecC7RCeNfPOnEGsf2DoNE=
X-Gm-Gg: ASbGncsWIwm3I/xFPdhKLfQtjimtIBSmVhq9QH5br4N1rudQHjKNuJML/NjCzLcsJsn
	fYcEwWsoWiE6eZLHxVvBlathyiYAafXNGdjrWcH9h/VS2FpPDT5GM6zxRgmU2HbQRIrEzKKHMd+
	99V/GbCj1itP15TzUl6mtcDPt84cQtyyomWsHQi1iTOgCxylPC+QfejKHL
X-Google-Smtp-Source: AGHT+IEp2pC7e7blR/eo0bzoVTk6xd5ekJWXeUn+vt8lMehh/w7Fv4BoV0rZCEcxxVUT0+vw1Pjltq+BpVes4ce61I4=
X-Received: by 2002:a05:6871:4198:b0:2b7:f58d:6dcf with SMTP id
 586e51a60fabf-2c21c998e2dmr1704650fac.18.1741184024497; Wed, 05 Mar 2025
 06:13:44 -0800 (PST)
MIME-Version: 1.0
References: <wUYw.1741172173148394856.1XeG@lists.openembedded.org>
In-Reply-To: <wUYw.1741172173148394856.1XeG@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Mar 2025 09:13:18 -0500
X-Gm-Features: AQ5f1JoYi5pDICa0kXrmq-clEKLa36q3akBSbkuVVTUggPeKO9q_OCYtn9V94wQ
Message-ID: <CAMKF1sqNo4mdhDxWSeyKc6DKhDWKjX2G+XMgW7K2rphyJcorOw@mail.gmail.com>
Subject: Re: [oe] Problems adding cppzmq to Target-SDK
To: lukas.weiss@janitza.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 14:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115755

On Wed, Mar 5, 2025 at 5:56=E2=80=AFAM Lukas Wei=C3=9F via lists.openembedd=
ed.org
<lukas.weiss=3Djanitza.de@lists.openembedded.org> wrote:
>
> Hi together,
> i am just trying to add cppzmq to my Target-SDK (from meta-openembedded L=
ayer). To do that, ive added them do RDEPENDS of my App-Recipe:
>
> RDEPENDS:${PN} +=3D "cppzmq"
>

Its a dev headers package and only generated dev output package so
rdep on PN is going to fail because no such package is generated.
Add DEPENDS +=3D "cppzmq" to your app recipe this hopefully helps with
target build.

> This does neither work for target nor for target-sdk:
>
> ERROR: Nothing RPROVIDES 'cppzmq' (but calc-server_latest.bb RDEPENDS on =
or otherwise requires it)
>
>
> Adding cppzmq-dev works for Target-SDK, but not for Target-Build:
>
> ERROR: calc-server-latest-r0 do_package_qa: QA Issue: calc-server rdepend=
s on cppzmq-dev [dev-deps]
>
>
> I fixed this by adding the cppzmq-dev to RDEPENDS of packagegroup-core-st=
andalone-sdk-target to add the dependency only direct to Target-SDK, but th=
ats a bad hack.
>
> Any ideas how to fix this? As far as i know cppzmq is a Header-Only Proje=
ct...
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115749): https://lists.openembedded.org/g/openembedde=
d-devel/message/115749
> Mute This Topic: https://lists.openembedded.org/mt/111525960/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

