Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB25AC54E71
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 04:08:41 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.1605.1748059714738485253
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 21:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AquFOCWy;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6065251725bso372317eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 21:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748059714; x=1748664514; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zn9rm7ss+6o5BwMi84EAQFyUhyugCiK7RnvED31CI/o=;
        b=AquFOCWyfTdnsbT2iW23gOPeCRdRYLJpcvP3xjUlSP+RMsaDtK94MsG9anWhkrRMAg
         LGPWiqERx7t9DJBXzJB1p6UY615QEBfF7/ni3nc+pnRGjnOv7fnuerH1ZF7tK3oZshIg
         5rGRiXMdAC11Cxc4R9paSTNBApAACayv/3Qi/R8BJLqaPGlxQ3Igr6wU32J4I4kv7Pz0
         vUKBo31bBHntUHRHLy/4rN+mdFomoRVnPWohAg0rkOcegBLlD3uN7w07FMaw5I/x9z98
         33xbK6gCbf+D9uC4oEy65lBGFoXhFDPV2D6cDIchOKkpkX3TZ8C/lPdfxfXkf/n2s9Ey
         Edyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748059714; x=1748664514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zn9rm7ss+6o5BwMi84EAQFyUhyugCiK7RnvED31CI/o=;
        b=xBYYmHQbJBgXi5JB1PM3DFehI0fxLwC+SAijlhExQR3ROW4inQ9NSbxhq1vTqiLSjZ
         19gUp1E9hMphSUkYD2S8cQ6f0seIDVZGLbTsEY+hDY7A1gpzHS0j43yBAxp/RTfEi/mD
         E10n8T29ghJbCZJPPG7qhD0PaYGerZtZSwAMN1VW7HE+VfhqmZKYdfqoc7zitbtcsFSI
         zyW/xPPlCX7U3jQX1w+10BZdJp9yvc88xmAJ48QOBDLYpxZIaPnELXpSjAufkba/DPFA
         +ZSL303YVb13yHg5b9X2b4AlUQyT4VZK5e9i5YQqBHcC/j/ZnHVq2RO7LKb9x3cdh4Ax
         mq3Q==
X-Gm-Message-State: AOJu0YzDKE4KqPqPwjCaPtGob88cDcEysHgpWy4iPAnXdUhbONrDxlhh
	TlaTqeFv42WhgWi5x1zP4e3fUbtMMWE4+wPzEAX5fCCuTU4Yvp+6IrhDzSEoWWuLfNf6PtyyHbB
	EUpNBtoFBerV01CzTPlhwIEfIdWiih7Y=
X-Gm-Gg: ASbGncurEqsK0CBlaNWAo/zz2FXxYIya3TMZwldojalfEJNs/sHuZUfDvsW9i/bxFcZ
	hC5XImvETETDmuZSo0MRlm3I10POnCYbBmqQwCVmdipDZKUTtGYpFYQikVlE0mT3aKunZn2Z60H
	Hycglu3m/JqzlSQx/42FkZY1yQLBz3jBoRxsTIXyaamd4=
X-Google-Smtp-Source: AGHT+IFnEpwYH+TO4PHI2tMNAI898wSHTblfWUGQmY6yEBxGJo02Cf3aB6Uigt6UxaLXMU596MXqY1U5N+Gs6+ii2Ck=
X-Received: by 2002:a05:6820:2709:b0:60b:9d5b:ea0b with SMTP id
 006d021491bc7-60b9fb539d9mr1109479eaf.3.1748059713901; Fri, 23 May 2025
 21:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <18423E67C86AEF70.8857@lists.openembedded.org> <CADGVJSL4munjKAe7UETxf7PReoC22PSCw+68CK8JANs=5UFxLw@mail.gmail.com>
In-Reply-To: <CADGVJSL4munjKAe7UETxf7PReoC22PSCw+68CK8JANs=5UFxLw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 May 2025 21:08:08 -0700
X-Gm-Features: AX0GCFu4ElVNclzWNPq7yqztAep0osSdRdnxtd_qQJNIZSYx18Xnb2Cn1ov6M7A
Message-ID: <CAMKF1sox4hG=VMvp1tCiN9_bP3ZNcTJ_HEpy1CL8gwLOLm-ipg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] bvi: add new package
To: Dimitrios Siganos <dimitris@siganos.org>
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 May 2025 04:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117614

I have accepted v2, So if you have changes between v2 and v3, then
rebase your patch on top of later master or master-next branch and
send the delta.

On Fri, May 23, 2025 at 12:46=E2=80=AFPM Dimitrios Siganos <dimitris@sigano=
s.org> wrote:
>
> Hi Yoann, Raj,
>
> I took your feedback and created a 3rd version of the bvi recipe.
> I made the following changes:
>
> 1) I fixed the license which is actually GPLv3-or-later and not GPLv3-onl=
y that I had initially set it as.
>
> 2) I changed SRC_URI to: ${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz, a=
s per your suggestion.
>
> 3) As per your suggestion, I removed the compiler flag "-std=3Dgnu17" and=
 replaced it with a patch file that fixes the C23 problem. The patchfile wa=
s actually made available by the debian devs who had the same problem.
>
> Finally, it is true that the project is not very actively maintained but =
has been going for almost 30 years and has stood the test of time.
> This editor is designed for small footprint and console access and it is =
an ideal editor to have in an embedded system and I think it should be part=
 of yocto.
>
> The bvi editor is included in all the major linux distros, so yocto will =
not be alone in maintaining it. In fact, in this case, the debian guys fixe=
d the C23 problem for us.
> See the list of distros that include it here:
> https://repology.org/project/bvi/versions
>
> Regards,
> Dimitrios Siganos
>

