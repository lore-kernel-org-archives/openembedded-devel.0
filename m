Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5EDC2BA1A
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 18:58:38 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.65649.1718650717224949300
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 11:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQKHVU6f;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-254a9b89be2so2374303fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718650716; x=1719255516; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbyHET+91jOJImLvjZPGEwn3oRN8oWWYclLhc/5Pik4=;
        b=iQKHVU6fTzJJM5tlxzLzeJNTAons18eH8uvivIg8BXej7PpCJ1UY/5lGZwzoqqr9Co
         pri0xWKnPR9TcLjR6Gt4oJ4w6GSWORym8PwDfes49xFSFWwdFLSoovz2O4pFGwNUpgl5
         7mijEFHEwtv+/bJL7ZYnrXhz+6cb8sZB4/Gl9YmVJJHnZJDV1Ts1PqR0+5IVkMSeMVN5
         bGEHQ6aUtYlJuegYOxM16OFpWNHaxcwoWbg+G0m+LXq72MeJUb9KJ9C9NspUYKpvqEN0
         51SlIylA5+SnhzTuY3ntNy5+R+qyIT8iXyo96G42+VVbbrs0pPWN6DnJBVKR56fUGCHA
         r7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718650716; x=1719255516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbyHET+91jOJImLvjZPGEwn3oRN8oWWYclLhc/5Pik4=;
        b=hbiEgnhSNwPwEmaGaAcANTtOl+9fPKDhk1/KL6hrCssoQOlrMEdWiCtjg01lBC0mSM
         tt4msU3wE1mKYzx7gtB57w2kP8o/vvK0ddopGuTkbclU4Zm9msW3Qz6g/6M15rImR+im
         UXCtQnq9E5so03psKsZxiElVvjjtV4CItdi4ivYGDLmRmG+sMTt2FcnN8WsQumxRzlwo
         AfX9gYQzqNZilY+/Kl7iSL5Bc+c+tipB2DyaRwreDWZTosOU+BVGtN0bJmNbeWBGjmMG
         Cl3iPqIxXmCvWMUN/nfGbEyeo9hkn3YbnChIF6chC4XrxdljtVBYofmCovPjSyJe3Tnw
         34Gw==
X-Gm-Message-State: AOJu0Ywx0zsk1QF7ngZuxRHn90bVO2jHKca/nXoVLj0mZ3I/B73y0bQS
	G5499JoZZg7k+hnA4+ZC1yo3SaGzz/McFnwYZGWSm3iv4Ed8mKsp73MkeEPdLu38Zu+LgMtTQ4D
	NXIPEV5lLnhkgaLuuZJR53H83g1A=
X-Google-Smtp-Source: AGHT+IEAxyKZiYtujD2TlFrtxbrYuAlpEz3mn+ETL1gLvXqhUE9i9/BL/thY403FtTOEbok15LXvd8ESz94UZpfDIL8=
X-Received: by 2002:a05:6870:41ce:b0:254:84c4:8800 with SMTP id
 586e51a60fabf-258429850a8mr12405328fac.25.1718650716415; Mon, 17 Jun 2024
 11:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <c7be294f-d3dd-4596-8fd0-76c4410c5778@gmail.com>
In-Reply-To: <c7be294f-d3dd-4596-8fd0-76c4410c5778@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jun 2024 11:58:05 -0700
Message-ID: <CAMKF1srNqKOTEPJ+mH5U7oNvD85KyfQpddHcxL2QMKQXZ+ADJQ@mail.gmail.com>
Subject: Re: kirkstone merge request: June 17th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 18:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110942

merged now, thanks Armin.

On Mon, Jun 17, 2024 at 5:22=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 0560b848996a0feb410a8cd8ca07c60fe2f3b5=
bc:
>
>    ITS#10094 libldap/OpenSSL: fix setting ciphersuites (2024-05-28
> 06:17:26 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 8e297cdc841c6cad34097f00a6903ba25edfc153:
>
>    nginx: Remove obsolete patch (2024-06-02 15:16:32 -0400)
>
> ----------------------------------------------------------------
> Archana Polampalli (3):
>        nodejs: fix CVE-2024-22019
>        nodejs: fix CVE-2024-22025
>        nodejs: fix CVE-2023-46809
>
> Jasper Orschulko (1):
>        nginx: Remove obsolete patch
>
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch     | 625
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch     | 556
> +++++++++++++++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch     | 148
> +++++++
>   meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb               | 3 +
>   .../files/0001-HTTP-2-per-iteration-stream-handling-limit.patch | 92 --=
--
>   5 files changed, 1332 insertions(+), 92 deletions(-)
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch
>   delete mode 100644
> meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-iteration-stream=
-handling-limit.patch
>

