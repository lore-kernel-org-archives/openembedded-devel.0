Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E583CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 04:51:26 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.44044.1758516681273389750
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 21:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDV6mgUD;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-34112cbfc85so479127fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 21:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758516680; x=1759121480; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLSvmZsnEm2VQ8xazSlSCwRi3EvHcGcpRIZSwI4PtDI=;
        b=nDV6mgUDY2dqfOnkJay7wfFeq4f6++FFPeV70EJBtVadYH05bPNHq+uOZU2EH1Saaa
         x2EReB96LtpR0ZD8/J5IcIITGaR7iMjCoutjkMOuqd3WURha5RPYqTZ4jYG8F71EuLju
         RYThsEw4RraIn7V33c+dqbU1o4tuhmUK68dQ23eVL6GgG2b+3XnCgUBBpMqKX4Sf5Dlw
         cYszTegD13peuLPZ178IaB6ASAjvJ18l/lmnfoiEXQVgLkHA/xHBmDjfOy2EI/ifHijC
         G2zdgoarg4AQmj6AwNyuT0zVsmFRo6+cDDhueRFWeU4Rc/o4ojBK62fJrZS2VGR3101u
         abTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758516680; x=1759121480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLSvmZsnEm2VQ8xazSlSCwRi3EvHcGcpRIZSwI4PtDI=;
        b=JRicC7PQzsyWeGU077FxhVCrgfs60H5SNMIm5KS/2NMELSgmO2ASeA7Q6Y22v9Xqi0
         h03Qtduzi1+kaVLmIxmh13K/C0Lv1EuFA9oZGdNuh25yHd4amm0P8FoBBaWGaSV7CWL8
         RNRazAoArnI9Pe8zSxkRMH4j/yXDrV3Aa7ff0x4Fo1oJdMAxHUG+dOGrkQfHjJ12//A/
         FOV106uK+t3wk/8whHVGnjh7aep5IByLGBZAxz0ElkW0d0QdSdJ5K95seupoHNCVG32a
         6IMWbGJ5l/p+xCsbBBTsgblM/1cxTnjxdWez5UygG1hqSfS9618oK6Fzh5JHEBlKpU8W
         utsA==
X-Gm-Message-State: AOJu0YzXVtTjE5vqGnxwxyWX9PJR3Q3NosVngfSsaLlAWpNLwxu+20A/
	dHg781KXh85Kc653c3asibdjyl3WD6/DjPPy68rY9EzkviKUlgomx5NpFvKV4eU9mMMSh/a7Tk/
	Pq1IJIbONn3IeV40D1uy1GNucNEUBWuM=
X-Gm-Gg: ASbGncuMXCfXqdCxeI6PSgDS4TT/9uQ4CsSN1VBTmwLEBtp2Tcy7I4yiwVk1jS50vb5
	xxOd80MEO9NvrWPqqOvYZTTE5bGFHoH+K1WqpvneE/pypCY+rrd8r5T3VrjUrIw3aMsJTyKgy4w
	U5+gHjVfD4/bLNn9ZF8udGv7WfgNabmUEBgX2n4HT/XdAupwXVKXQsRGqN/zeMDgSFqPydbq8sL
	zFHPtEUIg==
X-Google-Smtp-Source: AGHT+IHlB8Pbfy/3iBaidjTN2LHohPlqabBR82nIpZGttvu6utNn8Yr+DT2xQrXCJCO/tLKbMBu/cepOeI8CAWDiQZo=
X-Received: by 2002:a05:6871:d3c2:b0:328:d4ef:941d with SMTP id
 586e51a60fabf-33bb69ef2fdmr6480165fac.45.1758516680473; Sun, 21 Sep 2025
 21:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250922035802.3288-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250922035802.3288-1-liuyd.fnst@fujitsu.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 22 Sep 2025 16:51:08 +1200
X-Gm-Features: AS18NWDbol5RPvIYd-AGtf0stn7CI6jfzHCQUR_Dk93Q85gBhis0jnxevNu5bxw
Message-ID: <CADySD0Gh+_CGuJuBQQgMyLy3s9Kab2i0j8hT3CGGop0tLnuOaQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] freeradius: Fix service start error
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 04:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119639

This patch will also be a good improvement for the walnascar branch too.

On Mon, Sep 22, 2025 at 3:59=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:
>
> Following error occurred while starting this service.
>  Error: tls: (TLS) Failed reading certificate file "/etc/raddb/certs/serv=
er.pem"
>  Error: tls: (TLS) error:03000072:digital envelope routines::decode error
>  Error: tls: (TLS) error:0A00018F:SSL routines::ee key too small
>  Error: rlm_eap_tls: Failed initializing SSL context
>  Error: rlm_eap (EAP): Failed to initialise rlm_eap_tls
>  Error: /etc/raddb/mods-enabled/eap[14]: Instantiation failed for module =
"eap"
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../files/0018-Fix-Service-start-error.patch  | 33 +++++++++++++++++++
>  .../freeradius/freeradius_3.2.7.bb            |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/freeradius/files=
/0018-Fix-Service-start-error.patch
>
> diff --git a/meta-networking/recipes-connectivity/freeradius/files/0018-F=
ix-Service-start-error.patch b/meta-networking/recipes-connectivity/freerad=
ius/files/0018-Fix-Service-start-error.patch
> new file mode 100644
> index 0000000000..c5bcfe718e
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Serv=
ice-start-error.patch
> @@ -0,0 +1,33 @@
> +From e97ffc1f820beff12bb8084e6337168a1cd27540 Mon Sep 17 00:00:00 2001
> +From: Liu Yiding <liuyd.fnst@fujitsu.com>
> +Date: Sat, 20 Sep 2025 06:50:17 +0000
> +Subject: [PATCH] Fix Service start error
> +
> +change "fips=3Dno" to "-fips"
> +based on discussions with the OpenSSL developers in
> +https://github.com/FreeRADIUS/freeradius-server/issues/5631
> +
> +Upstream-Status: Backport
> +https://github.com/FreeRADIUS/freeradius-server/commit/59e262f1134fef8d5=
3d15ae963885a08c9ea8315
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + src/main/tls.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/main/tls.c b/src/main/tls.c
> +index 2a348eb9bb..02a4c24f70 100644
> +--- a/src/main/tls.c
> ++++ b/src/main/tls.c
> +@@ -3644,7 +3644,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TL=
S_UNUSED bool check)
> +       CONF_modules_load_file(NULL, NULL, 0);
> +
> + #if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
> +-      EVP_set_default_properties(NULL, "fips=3Dno");
> ++      EVP_set_default_properties(NULL, "-fips");
> + #endif
> +
> +       /*
> +--
> +2.43.0
> +
> diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3=
.2.7.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.=
bb
> index fea4d858ed..181d9e5d18 100644
> --- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
> +++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
> @@ -35,6 +35,7 @@ SRC_URI =3D "git://github.com/FreeRADIUS/freeradius-ser=
ver.git;branch=3Dv3.2.x;lfs=3D0
>      file://0015-bootstrap-check-commands-of-openssl-exist.patch \
>      file://0016-version.c-don-t-print-build-flags.patch \
>      file://0017-Add-acinclude.m4-to-include-required-macros.patch \
> +    file://0018-Fix-Service-start-error.patch \
>  "
>
>  raddbdir =3D "${sysconfdir}/${MLPREFIX}raddb"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119638): https://lists.openembedded.org/g/openembedde=
d-devel/message/119638
> Mute This Topic: https://lists.openembedded.org/mt/115370570/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

