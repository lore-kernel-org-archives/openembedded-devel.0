Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FAFCD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:19:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46712.1778494758261807529
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 03:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Tj0qyOCx;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0046078so34225745e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778494757; x=1779099557; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUYVpuV2xv7DYC4zRafZ9uS/Yy+25H8odHYqXUDaEOQ=;
        b=Tj0qyOCxofsUnmZeC/2yMjh0OoTmVZYt7/QRAu1rUa/25QAZBD892NroIA2TjxzdEu
         S6ddo4YhIndcHX7wzdGYfzZk55BLFiUR+AipDRp1oPn557OCBk4TlLWsSTnEE2sLWSwA
         Mtip1zfHrRseI5TPqnXnMK3fdwamtXV0J/rYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494757; x=1779099557;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUYVpuV2xv7DYC4zRafZ9uS/Yy+25H8odHYqXUDaEOQ=;
        b=OcctHce0Mw7MbV7azMbadpy6+aaLgpSZk10XwIvUNLQDis4TOYV8WiDgnJ+QQTt5lL
         VGPVRISR0+WBWK0Qbp/P9ov9POQE2B9V4TO4uvHkMqA6rn9AwZEgojSCyvjPyprXFxmD
         iXOSfqMWEUyVlWw4L1a2TftseFcVJwtWf1M+qDOgaB5aZD9paiZi8vN/GVSm7pPrY5B8
         yr0KpKfGBK0viqZBRseRuK0MQ5E2CBHgrdJmNTsOCpswRs9OnCuaHqMHyqLa05sgDSEt
         NecA7AdGNDxnaNCQMNFKPqkB4/ttpMxIWHcc0vtniIp8m7mgnTNOP79H4q9d1nOVUo0w
         RcLA==
X-Forwarded-Encrypted: i=1; AFNElJ97bbbfdaRaEK5bT/JhTHZnt5Q6+2o2B09ZX51ockUDkvRepeuFr8e/2K7JYDfxgmJpwtQgz3MtSCH2iXWNM2D11Zk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyoKQ3qHktm3W27XjwDUJLlCU/I6SJGYd1wgaaxhMJU+EUjFTzv
	r0EhC12xeeB+Uc4zukcKN79IN4KxycXtfD84yPNmNrogPG0HtYktKla/Wdc8OF8WW7E=
X-Gm-Gg: Acq92OEATY9xCuLDXdD79G1qBsMJcLsn3W8n7CcHAKotJZ/MYAYT3ILXXpKcKDamf3d
	JXlc9iO0UbYnbt9AqIS0APzOacxDhogJMMb972Ay1nLEJgA/i2iIa5ZtHVlNAcaqKwDDCCGfsr1
	IvFJ/jN4gouIg7za3I6Ula/z0WKxMAw7YfUuVi4lvAsdDI8v3KAcpBXYy9RRQI8W5vF2vV8rgma
	ye2eDE9C2g0Ze+n/Pk048siOxb3NaBwNR9t/zEJPch82FCoHAd3tmYX4ZwD5tYXFQ89ND2ccNYg
	luGGDxS5icXVJDSUzlsGXm/fzn6fWKYAl3VK8XamgErJ+LzOSska0TOt3WAF2aTEK6jbSmITMdh
	CrDjlV1gUGA/UDi3gBd+0z5/gQFUUvjpu3vFeYE43siDPY2jqb9PX9UBo2iCFBd1InSTt/02ca/
	X5Jru3gIPBkp474u9Wx83UO47Q3/d0AqSBtFOHucXuhGHoOV8VtgzjcSeMm9LqiwMUkYQXMnzgR
	/cQJ4Cdnoo=
X-Received: by 2002:a05:600c:46ca:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48e70687eb6mr147369025e9.4.1778494756348;
        Mon, 11 May 2026 03:19:16 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8d6963sm60176705e9.4.2026.05.11.03.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:19:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 12:19:15 +0200
Message-Id: <DIFRRVJB4CS3.23NBKWDDVT9ZB@smile.fr>
To: <zhixiong.chi@windriver.com>,
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][PATH] Rename static-{group,passwd}-meta* file to
 static-{group,passwd}
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260511091724.1342957-1-zhixiong.chi@windriver.com>
In-Reply-To: <20260511091724.1342957-1-zhixiong.chi@windriver.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 10:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126841

On Mon May 11, 2026 at 11:17 AM CEST, Zhixiong Chi via lists.openembedded.o=
rg wrote:
> The config variables were defined in the reproducible.py in oe-core
> https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftes=
t/cases/reproducible.py#n243
> as follows:
>   USERADDEXTENSION =3D "useradd-staticids"
>   USERADD_ERROR_DYNAMIC =3D "skip"
>   USERADD_UID_TABLES +=3D "files/static-passwd"
>   USERADD_GID_TABLES +=3D "files/static-group"
>
> We can see the help document in oe-core/meta/conf/documentation.conf:
>>USERADDEXTENSION[doc] =3D "When set to 'useradd-staticids', causes the
>  OpenEmbedded build system to base all user and group additions on
>  files listed in USERADD_UID_TABLES and USERADD_GID_TABLES."
>
> In the useradd-staticids.bbclass all static-{group,passwd} files in
> BBPATH will be searched and merged.
>
> All static-{group,passwd}-meta* file in this layer won't be parsered,
> finally when we run the following oe-selftest command with the setting
> 'OEQA_REPRODUCIBLE_TEST_TARGET =3D "mariadb",
>>$ oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds"
> we will encounter the following error:
> $timestamps - oe-selftest - INFO -       ERROR: Nothing PROVIDES 'mariadb=
'
> $timestamps - oe-selftest - INFO -       mariadb was skipped: Recipe mari=
adb, package mariadb-setupdb:
> system username "mysql" does not have a static ID defined. Add mysql to o=
ne of these files: /yocto
> /openembedded-core/build-st/meta-selftest/files/static-passwd
>
> The similiar error for postgresql can also been seen.
>
> Here we rename all static-{group,passwd}-meta* to static-{group,passwd}.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../files/{static-passwd-meta-filesystems =3D> static-passwd}       | 0
>  meta-gnome/files/{static-passwd-meta-gnome =3D> static-passwd}      | 0
>  .../files/{static-group-meta-multimedia =3D> static-group}          | 0
>  .../files/{static-passwd-meta-multimedia =3D> static-passwd}        | 0
>  .../files/{static-group-meta-networking =3D> static-group}          | 0
>  .../files/{static-passwd-meta-networking =3D> static-passwd}        | 0
>  meta-oe/files/{static-group-meta-oe =3D> static-group}              | 0
>  meta-oe/files/{static-passwd-meta-oe =3D> static-passwd}            | 0
>  meta-perl/files/{static-group-meta-perl =3D> static-group}          | 0
>  meta-perl/files/{static-passwd-meta-perl =3D> static-passwd}        | 0
>  .../files/{static-group-meta-webserver =3D> static-group}           | 0
>  .../files/{static-passwd-meta-webserver =3D> static-passwd}         | 0
>  12 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-filesystems/files/{static-passwd-meta-filesystems =3D> stati=
c-passwd} (100%)
>  rename meta-gnome/files/{static-passwd-meta-gnome =3D> static-passwd} (1=
00%)
>  rename meta-multimedia/files/{static-group-meta-multimedia =3D> static-g=
roup} (100%)
>  rename meta-multimedia/files/{static-passwd-meta-multimedia =3D> static-=
passwd} (100%)
>  rename meta-networking/files/{static-group-meta-networking =3D> static-g=
roup} (100%)
>  rename meta-networking/files/{static-passwd-meta-networking =3D> static-=
passwd} (100%)
>  rename meta-oe/files/{static-group-meta-oe =3D> static-group} (100%)
>  rename meta-oe/files/{static-passwd-meta-oe =3D> static-passwd} (100%)
>  rename meta-perl/files/{static-group-meta-perl =3D> static-group} (100%)
>  rename meta-perl/files/{static-passwd-meta-perl =3D> static-passwd} (100=
%)
>  rename meta-webserver/files/{static-group-meta-webserver =3D> static-gro=
up} (100%)
>  rename meta-webserver/files/{static-passwd-meta-webserver =3D> static-pa=
sswd} (100%)

Hello,

Initially we had to use different names because we want to use multiple
static-* files in the same build.

On the autobuilder (project CI) [0], we use:
	USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-gnome'
	USERADD_GID_TABLES:append =3D ' files/static-group-meta-networking'
	USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-networking'
	USERADD_GID_TABLES:append =3D ' files/static-group-meta-oe'
	USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-oe'

[0]: https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json=
#n330

Would that work for you?

>
> diff --git a/meta-filesystems/files/static-passwd-meta-filesystems b/meta=
-filesystems/files/static-passwd
> similarity index 100%
> rename from meta-filesystems/files/static-passwd-meta-filesystems
> rename to meta-filesystems/files/static-passwd
> diff --git a/meta-gnome/files/static-passwd-meta-gnome b/meta-gnome/files=
/static-passwd
> similarity index 100%
> rename from meta-gnome/files/static-passwd-meta-gnome
> rename to meta-gnome/files/static-passwd
> diff --git a/meta-multimedia/files/static-group-meta-multimedia b/meta-mu=
ltimedia/files/static-group
> similarity index 100%
> rename from meta-multimedia/files/static-group-meta-multimedia
> rename to meta-multimedia/files/static-group
> diff --git a/meta-multimedia/files/static-passwd-meta-multimedia b/meta-m=
ultimedia/files/static-passwd
> similarity index 100%
> rename from meta-multimedia/files/static-passwd-meta-multimedia
> rename to meta-multimedia/files/static-passwd
> diff --git a/meta-networking/files/static-group-meta-networking b/meta-ne=
tworking/files/static-group
> similarity index 100%
> rename from meta-networking/files/static-group-meta-networking
> rename to meta-networking/files/static-group
> diff --git a/meta-networking/files/static-passwd-meta-networking b/meta-n=
etworking/files/static-passwd
> similarity index 100%
> rename from meta-networking/files/static-passwd-meta-networking
> rename to meta-networking/files/static-passwd
> diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-gr=
oup
> similarity index 100%
> rename from meta-oe/files/static-group-meta-oe
> rename to meta-oe/files/static-group
> diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-p=
asswd
> similarity index 100%
> rename from meta-oe/files/static-passwd-meta-oe
> rename to meta-oe/files/static-passwd
> diff --git a/meta-perl/files/static-group-meta-perl b/meta-perl/files/sta=
tic-group
> similarity index 100%
> rename from meta-perl/files/static-group-meta-perl
> rename to meta-perl/files/static-group
> diff --git a/meta-perl/files/static-passwd-meta-perl b/meta-perl/files/st=
atic-passwd
> similarity index 100%
> rename from meta-perl/files/static-passwd-meta-perl
> rename to meta-perl/files/static-passwd
> diff --git a/meta-webserver/files/static-group-meta-webserver b/meta-webs=
erver/files/static-group
> similarity index 100%
> rename from meta-webserver/files/static-group-meta-webserver
> rename to meta-webserver/files/static-group
> diff --git a/meta-webserver/files/static-passwd-meta-webserver b/meta-web=
server/files/static-passwd
> similarity index 100%
> rename from meta-webserver/files/static-passwd-meta-webserver
> rename to meta-webserver/files/static-passwd


--=20
Yoann Congal
Smile ECS


