Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286FEC7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 17:58:35 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.2395.1684432706786703511
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 10:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Kl4JZC4b;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-54fd1a3b821so1012115eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684432706; x=1687024706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw4kgRoRfMRifo6aAr7MrJuvnH0mRYCOShi2bbeD1u8=;
        b=Kl4JZC4btqbMYH4/x/ukTH04WyO9uPwy8AiMUB+tke+o3M0esbRyNqEScjkims5RWz
         cSQpkVdLZgmZy9LB4KfB19yKU61FV75jQDJYc/OrV9UihbITQZewN8j2SLp1yKehF97h
         FlLj0wL6ITeQIUMwfw2ZxtI63wq7waPWnCffUqnRT+/zFm5NyxUAy1DPBYy9ii3E3ro4
         hHLkgKyN/XObir9bkqpcPEx58LgyahtS/m1J8RwzNooZUXO+DsRk5UWCSqMLuBw4yMCo
         moUW8KtnwDt2GJ+njgZ2EBSY3Mpc6jgxe/P/W9o/loJsn2M1XS4I+uTDNCfDM9ubwwgy
         x7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684432706; x=1687024706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gw4kgRoRfMRifo6aAr7MrJuvnH0mRYCOShi2bbeD1u8=;
        b=GHJkAt5alWedfzn/C3er8tYLYrywkMUhfhunUiq57gEwUiox5nxBQGX0TOKrpWpn2q
         g3vQemJ4YI4f3mLPBUuwG4RMOzIc8YynvtqHCsHxOqc4e+/dZXz/e6q5mx6BuQH20alW
         qZkYWketc8lsk0xSbWt76rJd65ARPErIjqiv0NCpM7547dcJOQH8UrJVVTTmfv1wuywT
         lybOP5hgmEmcHHzhEukftoI9c+NfsbL12CtGxgIDH8Py48iAxrNRBNJMcr6POs3qH4OZ
         Ta8qQ0OwrcJdka0B2aw3NToxNVcYDJSnG1nd9jq8qHYDtSHu9Xohf0Egxp0xIDJd5LgP
         5RzA==
X-Gm-Message-State: AC+VfDy7iSs7L6lFLSiUTHh0Josh9XNoPApOMTZRR5XgHq0O/neje/vs
	Djc7naJd0mogEDhyS+2nZxqC21fgg6lXgFn+2ak=
X-Google-Smtp-Source: ACHHUZ6tQL4Y+rah+tS7ZcG57qiVIhacfySiq8RyuAd1TicyQiEYni2j01UZ4WTOjDIInQrPop75BEp2e6eu9Hw6DW8=
X-Received: by 2002:a05:6808:182:b0:38b:d002:2744 with SMTP id
 w2-20020a056808018200b0038bd0022744mr1830672oic.16.1684432705734; Thu, 18 May
 2023 10:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230518101233.3885135-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230518101233.3885135-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 May 2023 10:57:59 -0700
Message-ID: <CAMKF1sprnCmnaNkFtrg0h3ek-b=42sXf0Z=qSCCdzLG9+uu3Cg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] networkmanager: enable vala only with GI_DATA_ENABLED
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 17:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102659

On Thu, May 18, 2023 at 3:12=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:
>
> * cannot be enabled without:
>   http://errors.yoctoproject.org/Errors/Details/704353/
>   NetworkManager-1.42.6/meson.build:816:4: ERROR: Assert failed: vala api=
 require GObject introspection. Use -Dvapi=3Dfalse to disable it
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../networkmanager/networkmanager_1.42.6.bb                    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.42.6.bb
> index 31687a30b9..2412775cf1 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
> @@ -70,11 +70,12 @@ do_compile:prepend() {
>      export GI_TYPELIB_PATH=3D"${B}}/src/libnm-client-impl${GI_TYPELIB_PA=
TH:+:$GI_TYPELIB_PATH}"
>  }
>
> -PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli vala \
> +PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.uti=
ls.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d=
)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', =
'', d)} \
> +    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)} \
>  "

I think vala support should be added via inheriting vala class. The
problem is still there when GI_DATA_ENABLED
is True.

>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102657): https://lists.openembedded.org/g/openembedde=
d-devel/message/102657
> Mute This Topic: https://lists.openembedded.org/mt/98988017/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

