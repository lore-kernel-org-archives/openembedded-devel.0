Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE6DE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:40:26 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.138372.1734640825609642845
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:40:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MDSEseHu;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-71e1b1767b3so572430a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 12:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734640825; x=1735245625; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4PpnYDNv/HikuIfPNbXNjSTtOHZZqzfmklRenK4/e4=;
        b=MDSEseHuigrrHjmaj8a9DwC+hQHGk3uWGSuYgt3baONO6K6hwtCsz3ZFJ3wspDlAKA
         taSoVjYk1xONIkS4/4NLMdtGZeh0Tg/CiOwr49DSbwmE8Dmygeh6jNfXIv/6zjnTE9AW
         Fn1ml2t8CauFMRVbSYRWjDHXtghAW6AX2X5EeGf7SNUwarA1lYp+l7DoOnahIvkSU4pP
         FXJ9yqMOPMIjRLyw5g31qOBFuU/95egWsILrtdtWkAyYwV8XXVfupYz3GOudv/AgGf8C
         Y54ysXc2RrLtJXCkvhGaqkjkBnpulqa4yRTlX3WYVSY+SYusTLUiqSACZ3c+tCTLNXh4
         OrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734640825; x=1735245625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4PpnYDNv/HikuIfPNbXNjSTtOHZZqzfmklRenK4/e4=;
        b=wpIgojhEVv5HQVGQnzQIGKiaPcKzAtxPdPK+l9sk8Kzs/rDXeRT3P6rw3Y8Rd4M9xJ
         PbrzWomXuE+U53FUexrmLkhQX0/J0y8g1P5cDNQEzxmKI2U57OZhSUqehlt+sjnwE+XW
         kA3VSULic/yozvFl+Mx6HmQkoPA+VWG7ULU/0N2Kuh0eeVt2rMh4zpiCyF1Zx/YZf7BN
         /pOQRsL/iFSaKfY/eyBBNkWb36DUw6pI1ZVrmhCmM3Xa8iUj0aoP4DpFdiCvII+QqrBO
         tZEqR2/IMx1IFx2Lw9/1Bl9wNecTO4GDoRQ86d+YYUofh+Tfnq6HyQprCSnuuC3230js
         cmkQ==
X-Gm-Message-State: AOJu0YyfgyrABOKgpffojDWuSundqRsRecB0zyv4ZB77WrxdkXa/PEoJ
	/6bfKTEhYbrPk7kOavmC9tCf2oBJkOZ29BJslp7QHsBDtXjANlhBWtWjCJLEakT/ic0VnYSIzeL
	rNr1oLrNvQj9PddQiXsOkUuQsYWs=
X-Gm-Gg: ASbGncscEIpDpeQzphB7rlANp9lMlsqNqr80GWZ8IURK54Jl5+x/7HbvlOk+uM/HtGC
	DfVGCVsEiBMql3HGuXXp4KJj1yocu9xtNh6ue
X-Google-Smtp-Source: AGHT+IFHYLaIaE5d9Zv4X6b272UNtN+PdVTBlCFscVmQpeNUV5SS/3rHGlaO1PH9cpjjwKTg5ADCW2BylzhKqmTTct0=
X-Received: by 2002:a05:6808:199b:b0:3eb:778a:4127 with SMTP id
 5614622812f47-3ed88f88051mr98995b6e.16.1734640824820; Thu, 19 Dec 2024
 12:40:24 -0800 (PST)
MIME-Version: 1.0
References: <20241219202738.346121-1-peter.marko@siemens.com> <20241219202738.346121-2-peter.marko@siemens.com>
In-Reply-To: <20241219202738.346121-2-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Dec 2024 12:39:59 -0800
Message-ID: <CAMKF1sqaw7-tFFzK33JdLrEQQQ++GxDb47eStx5wb6zhyrAwWA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 01/12] ace: ignore CVE-2009-1147
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114414

Can you rebase this series on top of master-next ?

On Thu, Dec 19, 2024 at 12:28=E2=80=AFPM Peter Marko via
lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> This CVE is for vmware ace.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-connectivity/ace/ace_8.0.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb b/meta-oe/reci=
pes-connectivity/ace/ace_8.0.1.bb
> index c79fba323c..88df9ae5df 100644
> --- a/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
> +++ b/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
> @@ -16,6 +16,8 @@ SRC_URI[sha256sum] =3D "8d379f37d56db33f3ae447725b632d4=
8b1c13e887593547ac3568e3b42
>  UPSTREAM_CHECK_URI =3D "https://github.com/DOCGroup/ACE_TAO/releases"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
>
> +CVE_STATUS[CVE-2009-1147] =3D "cpe-incorrect: this CVE is for vmware ace=
"
> +
>  COMPATIBLE_HOST:libc-musl =3D "null"
>
>  S =3D "${WORKDIR}/ACE_wrappers"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114402): https://lists.openembedded.org/g/openembedde=
d-devel/message/114402
> Mute This Topic: https://lists.openembedded.org/mt/110204618/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

