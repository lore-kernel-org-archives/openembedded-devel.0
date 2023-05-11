Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8F5C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:50:49 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.12140.1683849041916742478
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 16:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IzgoyjiL;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-549f0b45ac6so2931908eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 16:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683849041; x=1686441041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONRVC1gjWtpBbVdjANAm2srp5WME8FRaJddmTm56IJo=;
        b=IzgoyjiLQ4J75+Vc+PnMHkE9dCzFQt7puPn4AjVpYwCAtJ6TpUi53zz0165IoikMk2
         uZgVIdtfjwzg9LWWYjAsKWUDUcqFMlhvZPmLDX+/6qf6xDcy7Yl8h92oyWj1etUXiNpQ
         fEJNXotKghJe2sSlvI55GjcFViY8iqs59ZjQG8pGARYYHR6HXLjdMk98Kmoh6k5xLnuM
         0t4ZPxQVzjThrxfBSqto2Yp+XPJ2WtB/rE2hDoy8rA07szqc3SniWnZrqqiJDn7ZMbU4
         XN9O6SWAEXgICeTtOoUym1IUb73FMlMSRyo56JRxJLDExIp4aFg4NT7BpenaX7/e9zwp
         Z7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683849041; x=1686441041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONRVC1gjWtpBbVdjANAm2srp5WME8FRaJddmTm56IJo=;
        b=jUcw2PU1UI/PQgQJ2o3B4orZrnKvMEjsZNmBDnoagDPloYTJb6NYeVsgkoVG3orNzC
         gBc5rL3NamY8If5PgRpuKEnr/y/8zqTjAf8hs4Zd1SFJ/lbtIg2GT5Jlrq4FkuTRM8x5
         A6eJ7IlWu1OZYW9p4BEviIUMQVyXuVOgDu7ycJweEZxltDqAOCKtnl1t5WHVOPRoR1DY
         lQLRaZbGAiTJYWom6faJvze03WDELKU7wUCTfoS4Pb1DQU2sNtAecl3P725xQqyInZ+3
         lGfwwUy5tzOJRrRA4v57rA6/xDiq28RGrVcKSCfK2/skn97TXg/tlX2GTXj6I3QTxINN
         FFEA==
X-Gm-Message-State: AC+VfDxRmPnJ3lB0J7tXqpgxsq1q7Ai0xbLX3CNh8URjXSU7/1340sfB
	TehAukQSO9klx4iRr1HmJ7UYcVqh0YGAg/uSd1o+HyWzzGQ=
X-Google-Smtp-Source: ACHHUZ74Mf28w2HiKkEahHuYN4EbHuKwZz4nPBO9x0/yN6/2LwDBm2kvgSxqtk7pI7WYMIbxFwql3SaGC04LwkI4YhA=
X-Received: by 2002:a05:6870:e2c7:b0:187:bc38:cfb0 with SMTP id
 w7-20020a056870e2c700b00187bc38cfb0mr10814458oad.29.1683849040623; Thu, 11
 May 2023 16:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367859735163870EE76A95A981749@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB367859735163870EE76A95A981749@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 May 2023 16:50:14 -0700
Message-ID: <CAMKF1so6bpy_c1jrnbXH4Wvf0k9uBYmvyvXHGTOYDk9b_MWYTw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] openfortivpn: add new recipe
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 23:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102552

Fails to configure -

checking for /sbin/resolvconf... configure: error: cannot check for
file existence when cross compiling


https://errors.yoctoproject.org/Errors/Details/703717/

On Thu, May 11, 2023 at 9:33=E2=80=AFAM Petr Gotthard
<petr.gotthard@advantech.cz> wrote:
>
> A client for PPP+SSL VPN tunnel services, compatible with Fortinet VPNs.
> https://github.com/adrienverge/openfortivpn
>
> Signed-off-by: Petr Gotthard <petr.gotthard@advantech.cz>
> ---
>  .../openfortivpn/openfortivpn_1.20.3.bb          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/openfortivpn/ope=
nfortivpn_1.20.3.bb
>
> diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortiv=
pn_1.20.3.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortiv=
pn_1.20.3.bb
> new file mode 100644
> index 0000000000..84ef8f80d4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.20=
.3.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Client for PPP+SSL VPN tunnel services"
> +LICENSE =3D "GPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3d575262a651a6f1a17210ce41bf9=
07d"
> +
> +SRC_URI =3D "git://github.com/adrienverge/openfortivpn.git;protocol=3Dht=
tps;branch=3Dmaster"
> +SRCREV =3D "45cb8e0f9984f1d54b648e499bda637d96568908"
> +
> +DEPENDS =3D "openssl"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--with-pppd=3D${sbindir}/pppd --disable-proc"
> +
> +RDEPENDS:${PN} =3D "ppp"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102547): https://lists.openembedded.org/g/openembedde=
d-devel/message/102547
> Mute This Topic: https://lists.openembedded.org/mt/98831514/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

