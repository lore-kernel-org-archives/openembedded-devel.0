Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8054DC0218D
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 17:07:57 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.13738.1737824869129534439
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 09:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TXLvFUCW;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5fa7301ae86so708358eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 09:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737824868; x=1738429668; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na89mjwDY2pNjOW4FDJWElfsUvNxrFg8JOH8Z4S3Q6k=;
        b=TXLvFUCWpBZ8NCzziEcrfjDe+ZwrBRxcABzj84fkzPGjcOK4vYTgP1TN96JYKpQW8U
         Q1x+RjmCKCmo7iTUpV6nEVzxMsa2ppNnU5er4qc8BHj3IiG/jEu6cg9CsRcB4v7vTaUw
         7Yuowxy3f7bAIw2SBlfRxphlSNEMHm6vax/bd+5K9GhySJ59en7ojw7wGCqB7matunJi
         7evzgXmsIeMY3B/jR551y2Knh6R/ib6UkRzXfL3CfSKCtv+QYHAiLLjJaME5DPxhxoHF
         bhrUQzebltPnK+t//rjdbwWCpLQNYT42ovZ2CgjutRKBYzoUa1cIeMUxZXzGbzSt9JC4
         0w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737824868; x=1738429668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Na89mjwDY2pNjOW4FDJWElfsUvNxrFg8JOH8Z4S3Q6k=;
        b=qJMzN/urPq1iSDqVlhlRLBx3I9hdgFUcr18Yk5KBmrNur62tVy9FGL806XE8bqQl5g
         Iu0jhzTq5yI+lJI3LNlqaUxEgDsaeIOeGQYgZofQAtUAPYdNYs1gXSapIjUuPEoWzfV5
         vXpHbSVbPPahB7d4ay1Ey8/E/GmRwx4yqQDSwS71fz9TWhmUx0laSOGCOycLOqVmVGjO
         dcBdv1ZhEM9lTunSQlpUZaTWgHTOMUSWD2qdXN3ixLxLmeskPHFB421U6pTaqeyLmzez
         fEOVRGacKpGgfC5BCB9Xd1ucPbVpRv2VhkY5cfBICSTHHwE+z9NOqEIZXsZEX3nD+VS2
         C3jw==
X-Gm-Message-State: AOJu0YwH4NtxGYkvG4H8CzuTnYT9NCU9TX8a55L01KL47s4NB0eRE0qT
	Am+l+sQTY6qITN14j0qP0adAmBQ5cqu7pMF7TmTxBkAmajUtzhv9V3zrsycdiaIdAeCQL2pUJMD
	T/HNyZfYZkm2NVMxadi16pSCksmk=
X-Gm-Gg: ASbGncsoQMA6xYG98dXqdmwrXU3x/NmaIQIMr7FRr59kmZO4gk3yhQ7nCAm/xo/VP21
	UPH4k/WfaoqwUTMtjFZ/iDXGg3fLiZ71ePef8CVtCma/VhBUfBnWbdIfPAdwOZF0433SuFTxKGP
	t0
X-Google-Smtp-Source: AGHT+IFq/nLtngTlRAH3s/u1nTCcJC6do36CgfxAek6afj96ZGpkaSx5UCGnUA1g2ONFOFHq9T7OigJgM0YC5bB205E=
X-Received: by 2002:a05:6870:71d6:b0:29e:49b4:92b2 with SMTP id
 586e51a60fabf-2b1c08bb12bmr19138108fac.12.1737824868266; Sat, 25 Jan 2025
 09:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20250125115543.7605-1-gavrosc.ref@yahoo.com> <20250125115543.7605-1-gavrosc@yahoo.com>
In-Reply-To: <20250125115543.7605-1-gavrosc@yahoo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Jan 2025 09:07:22 -0800
X-Gm-Features: AWEUYZmuqWxcgL7Rue1NEaLdcdoudz4BzVStZ2axN4aIj3b4aLROsq8-XePaVCg
Message-ID: <CAMKF1sosNH_RSMMdquqOth8fEkW7ySanb918bqBp_pTOtkoYzw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] net-snmp-native: dependency with libpci
To: gavrosc@yahoo.com
Cc: openembedded-devel@lists.openembedded.org, yoann.congal@smile.fr, 
	randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 17:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115081

if its a build time issue then shouldn't it be added to DEPENDS ?

On Sat, Jan 25, 2025 at 3:56=E2=80=AFAM Christos Gavros via
lists.openembedded.org <gavrosc=3Dyahoo.com@lists.openembedded.org>
wrote:
>
> Building of net-snmp-native aborted due to
> missing dependency with libpci-native.
> Fixed by changing the name to 'libpciaccess'
> which is recipe's name
>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> index 06decbe852..cde1c1dfe8 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> @@ -268,7 +268,7 @@ RDEPENDS:${PN}-server-snmpd +=3D "net-snmp-mibs"
>  RDEPENDS:${PN}-server-snmptrapd +=3D "net-snmp-server-snmpd ${PN}-lib-tr=
apd"
>  RDEPENDS:${PN}-server +=3D "net-snmp-server-snmpd net-snmp-server-snmptr=
apd"
>  RDEPENDS:${PN}-client +=3D "net-snmp-mibs net-snmp-libs"
> -RDEPENDS:${PN}-libs +=3D "libpci \
> +RDEPENDS:${PN}-libs +=3D "libpciaccess \
>                          ${PN}-lib-netsnmp \
>                          ${PN}-lib-agent \
>                          ${PN}-lib-helpers \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115077): https://lists.openembedded.org/g/openembedde=
d-devel/message/115077
> Mute This Topic: https://lists.openembedded.org/mt/110805858/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

