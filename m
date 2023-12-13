Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BEAC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 18:49:34 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.44527.1702493367745433923
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 10:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ct1h/D4w;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1f060e059a3so5411367fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 10:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702493367; x=1703098167; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pp06zmztX0kWWmcO3HXjOqpchHO2qojhFob68+j3o+A=;
        b=Ct1h/D4wPl9JfkcSsT2rgR6x21xA2KtdwDF0j7xsvq6JAVDbqsHBDkCYJfhatZ6JbX
         LW7PpWWDWnutho4ZZlQukXRfKWokR4YgSRBumRNnT3F8D8rNH6SbzxXYBPOIqPyHvltt
         5/Cvw7u3CMQWTyKOXFUwCskjaYKLHscp8HKV8AQGcNVj5xHwrJ+2GlvRHx2O0KAiWE3j
         oP5uyw6SW5TJZIXZ4Dm3XDV7rga+cB8Q/gpXx3W6K0N2LJ7tw2C3EObPmixl+lEwX2QG
         m9tMW4O3uKNnAMdCeysobN8gVLINzLOfTk45T3dhVDW8nV/Ba3jk5LYsiPAHoP+d3adq
         O3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493367; x=1703098167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pp06zmztX0kWWmcO3HXjOqpchHO2qojhFob68+j3o+A=;
        b=iZTwBznZg+vgC/5xGCgbpGY4DDTyDNga0/DYX2R8WyMAg0dFZFEz3XXnSq9xle2anT
         PjqXU5FnfkPft5li3R1b6TSRyrZlkyDp3t/0XO+M4b/Qii2mCuSSTBlCcaDRUnVqJLUx
         JOyKRPFYrT2HPX+1XEa7pmSpMrQOUTZc9Hbb8B9FX+w0MjkSwch4/8Ky/SLU+4LxED9i
         gR4mp6xIMHmV9vUJMX204p0sWKlV1zm3BArBClI77IEt35Ovto5YWCTSwNvTSwn4OFQb
         jGFTLiVbk2dweo1gXPqCjFkzeaTIb9Som1mvU+z7sP2yB2tkBBVIl1TLHO+uDamSZI5w
         fPog==
X-Gm-Message-State: AOJu0YwDwDMLRrkvCCEnu+lxMGCzQKwxuF75ECTjS1iJJ99DiAhsxl6/
	8qcpZuUwFJgzdGb5LJnh8jqW4/m2Wk/HeqN+FkNAIRAf
X-Google-Smtp-Source: AGHT+IE+yij87NSyoC8aLKxWRWZs9ZNFGE0XHG6QeeT6JLnUaDUrY2PSIHlAdR4MvHHBYhNUROUx2FRgFOvRtHNnJ0I=
X-Received: by 2002:a05:6870:2305:b0:1fb:335e:a4b6 with SMTP id
 w5-20020a056870230500b001fb335ea4b6mr11073410oao.14.1702493366886; Wed, 13
 Dec 2023 10:49:26 -0800 (PST)
MIME-Version: 1.0
References: <70658be6-8b04-4cfa-9682-ab87086c274e@gmail.com>
In-Reply-To: <70658be6-8b04-4cfa-9682-ab87086c274e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Dec 2023 10:49:00 -0800
Message-ID: <CAMKF1sqpAqk3qMgokvTfeysEbmo2Eag=Y45eDanU78WitvMatg@mail.gmail.com>
Subject: Re: kirkstone merge request: Dec 13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 18:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107397

Applied
Thanks Armin.

On Wed, Dec 13, 2023 at 10:40=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1=
e4:
>
>    nginx: upgrade to 1.24.0 release (2023-11-18 10:03:19 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 402affcc073db39f782c1ebfd718edd5f11eed4c:
>
>    squid: fix CVE-2023-46847 Denial of Service in HTTP Digest
> Authentication (2023-12-13 13:35:51 -0500)
>
> ----------------------------------------------------------------
> Archana Polampalli (1):
>        samba: fix CVE-2023-4091
>
> Christian Eggers (1):
>        python3-gcovr: switch to main branch
>
> Jasper Orschulko (1):
>        nginx: Mitigate HTTP/2 Stream Resets Flood impact
>
> Narpat Mali (1):
>        frr: Fix for multiple CVE's
>
> Poonam Jadhav (1):
>        sdbus-c++: Update ptest path
>
> Yogita Urade (1):
>        postgresql: fix CVE-2023-5868 CVE-2023-5869 CVE-2023-5870
>
> vkumbhar (1):
>        squid: fix CVE-2023-46847 Denial of Service in HTTP Digest
> Authentication
>
>   .../recipes-connectivity/samba/samba/CVE-2023-4091-0001.patch   | 193
> ++++++++++++++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-4091-0002.patch   | 59
> ++++++
>   meta-networking/recipes-connectivity/samba/samba_4.14.14.bb     | 2 +
>   .../recipes-daemons/squid/files/CVE-2023-46847.patch            | 47 ++=
+++
>   meta-networking/recipes-daemons/squid/squid_4.15.bb             | 1 +
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-38406.patch  | 42 ++=
++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-38407.patch  | 63
> ++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch  | 127
> ++++++++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch  | 119
> +++++++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch  | 98
> ++++++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch  | 114
> +++++++++++
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 6 +
>   meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb               | 7 +-
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch        | 125
> ++++++++++++
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch        | 294
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch        | 108
> ++++++++++
>   meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb               | 3 +
>   meta-python/recipes-devtools/python/python3-gcovr_5.1.bb        | 2 +-
>   .../files/0001-HTTP-2-per-iteration-stream-handling-limit.patch | 92
> +++++++++
>   meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb              | 1 +
>   meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb              | 2 +
>   21 files changed, 1503 insertions(+), 2 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0001.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0002.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-38406.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-38407.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-iteration-stream=
-handling-limit.patch
>

