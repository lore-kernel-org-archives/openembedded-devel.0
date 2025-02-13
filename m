Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1971C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 22:08:44 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.6671.1739484516459243120
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 14:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hK6vrpys;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72707750de0so211174a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 14:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739484515; x=1740089315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cxlg96ahnp7xkoW7eksHlPUFDZwfYJ3Cvt5giIJmxMA=;
        b=hK6vrpysnv8pLe6NPhM6lqTmWbKuJTK+/mtppiTCspAvRXo77NyQoTs0cl6fMtMCYk
         NIL/bQBdEqFsZCHs28eYOAjx8E0p+v1NxWnFU3MkcDmHkpN/m6YBzoP+fwFgY/5y2iAH
         FpMAEEHLNpUsSJTf2n7q9mMLO2KOMj8lGkmykH06DIe7JUg36BpWrKoNniS37EeJVjQL
         fHSK8BdtKT7BixlXiMkxx1iyhAabNC0ntUtANidBEyr+5iTMu4B3YzPpIjvuLiQ0CMBS
         X92iPilxmm28q/Q+jC5wXvUf74/U1H9M79WFoxCEuU3KHOdk/JgzfbOdLriULhryx0jR
         4TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484515; x=1740089315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cxlg96ahnp7xkoW7eksHlPUFDZwfYJ3Cvt5giIJmxMA=;
        b=b7Ow+sut541A59MkXvpVy2ixGWMnSNZsFkSjSXHLOvsUhMVCbslcj9nK6cnvbKKKj3
         sGy5NrqqNhrFlUdKj3vOhcWX7Zzr/NrA6JmDfCaqDq6wMJxErtAt4JW22gR4tr184oYF
         fvUgSgL2jXFibEKmps1wklSOxNV3lpsavdK643XfYFUd4iw9a2Hi1LEdlQEHwlxHQWSp
         4Cdi9/d0vIwD+kdncUyDIazZE1SXt4XhMC1C0LqGGSI2O14/3547g1GihSU0YRkHsyJw
         g6DNk+vDuIp0B4cTY7e/1ry7yXYkDLSW0hyywInKRZCsc4Oh+UQjZkyJx6h8dhmLEp2F
         iRdw==
X-Gm-Message-State: AOJu0YxFWGIdqUI/7jvS+Lu8FKqANc6sfI9/P1lUIsJRovxCt/MNabsa
	dQwdmb1FechibKD9R99WhPdKqs6BfBFIDLPqqUnSbiWAlG5wkq+m8N+sMQDTnopvYd6e2DUaSq3
	PmzzDrdgDwq4B0rivhZs6lNQcOFw=
X-Gm-Gg: ASbGnctsTlp5GSb+qIOq9nA9G/urwkAFn8IRPXdxasn5rDjBHdGUGbL/gQkwpfvA59E
	cfBgQse98MS7q0WEQcXzZbJMl9H3WIB/hIZFeCsqhs8LrTjA5q1orlSpQMoo0RgFwhFiGOa/dgU
	c20pafWz9gwPnbn1Q5l1HICmZYUQ==
X-Google-Smtp-Source: AGHT+IEBUKlljhWT3f02eOoKjNiU1CGhJh/vOiTUBRInfTPsYOkTobo+CPyktQgr2cD5FjoJO8nZY4PCK1lXiQULaQA=
X-Received: by 2002:a05:6870:b9cf:b0:29e:67cd:1a8f with SMTP id
 586e51a60fabf-2b8f8e8da02mr2186026fac.37.1739484515547; Thu, 13 Feb 2025
 14:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20250213215039.108265-1-gavrosc.ref@yahoo.com> <20250213215039.108265-1-gavrosc@yahoo.com>
In-Reply-To: <20250213215039.108265-1-gavrosc@yahoo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2025 14:08:09 -0800
X-Gm-Features: AWEUYZmdmFhiqd8LDGj1X3DQhb8i7WvUujHkrH_zeQp8jeFXTiNqtU-XPh1XlXM
Message-ID: <CAMKF1soyUgrg50gFZhYoacssSaqb6Jf-EfC-Yzh0c3SmU1MwYg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] corosync: reproducibility issue
To: gavrosc@yahoo.com
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>, Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 22:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115472

On Thu, Feb 13, 2025 at 1:51=E2=80=AFPM Christos Gavros via
lists.openembedded.org <gavrosc=3Dyahoo.com@lists.openembedded.org>
wrote:
>
> Corosync is not reproducible due to change of value
> in NETSNMP_SYS_CONTACT which is set in net-snmp:
> NETSNMP_SYS_CONTACT =3D "$ME@$LOC"
> $ME =3D whoami
> $LOC assigned domain name from /etc/resolv.conf
>
> Use build in'--with-sys-contact' to overwrite it
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/30/ste=
ps/28/logs/stdio
>
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> index d4945e482d..b364edc065 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> @@ -63,6 +63,7 @@ EXTRA_OECONF =3D " \
>      --with-persistent-directory=3D${localstatedir}/lib/net-snmp \
>      --with-endianness=3D${@oe.utils.conditional('SITEINFO_ENDIANNESS', '=
le', 'little', 'big', d)} \
>      --with-mib-modules=3D'${MIB_MODULES}' \
> +    --with-sys-contact=3D'no-contact-set@example.com' \

I wonder if it could be made configurable by distros ?

>  "
>
>  MIB_MODULES =3D ""
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115471): https://lists.openembedded.org/g/openembedde=
d-devel/message/115471
> Mute This Topic: https://lists.openembedded.org/mt/111171727/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

