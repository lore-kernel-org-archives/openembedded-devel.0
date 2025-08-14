Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F89BCA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 21:35:05 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.33713.1755207301733867323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 14:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V10Zbuy7;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e931c85710aso1469954276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 14:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755207301; x=1755812101; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaQTVYgDxuZ0vWRzwyrJj/O2AFiitWQSBZDZMaDvWm0=;
        b=V10Zbuy7qqQ/IecCVUDy6q3kRAGCg1Ne/ZBjVXuM0IuJFIlQoon2eOssrIONeQeLwI
         JVcRU1EmWPrnIR9s+naHNQRr8lbC1PEnOleXdJdTDaJXSEp52b55Q5TBCCUMcz2MZdXP
         mm/mf899xQCQhdqG0VG45ayt4zZQzTqQuLO2ojlf49c7atkvEwF/XBz9MCVo0IQdwVFi
         5vvrFANCFyVGZ/czv5aq0XYuQUecti92Y8XoNwfbnXms00t1K/S2E+f1Vbrfwt/TQUEl
         FguwFLysZDxRIumCKA2qq1/BU/6ju9s+sp+ndIKfpSDev5UwM3M6rVi5Hcd/aIy/lOHz
         rxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755207301; x=1755812101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaQTVYgDxuZ0vWRzwyrJj/O2AFiitWQSBZDZMaDvWm0=;
        b=k8LApViwsZcqB8dhZUNWfb/kYd4uq1EHxO1qm4s5J7UV+KybaMqm/Jt1lKD3VDBY1p
         xkK/Pg7AobP1NKDAY7CkppTZpsXAbNALCtmOt/mGykIGM96Z/ESK8YNDM5F4aHOMI+Yl
         J/3M8tYMkX3Pw7TqzJKk/nzW3T1Y8PsKU/z7d+5lT7APU8UIU4hbcFd7sGOuOF0heGaM
         48sNqF4AW9bsbSJOG7CSh2M0gEX8LPErJavYJzzvwQB+cesBt/qdxPuk3JqH3Io5Xtoj
         4oPsYbXKYfH0aW4Jec5dc1qPNy7BgwwFMW5Dq5ToRn3R+DH9Yye3X7Cxv4zdKoXFBpiZ
         ouuQ==
X-Gm-Message-State: AOJu0Yx2aDUDJpunPT7PkBpqm/DHVNa1oxlX/ude+0y6vIa0E7NVzVGD
	IR+6MApJ/QD+VD7r0sW44dllJCRrnmNIAJKSbG1dLOhT+xSM/tO0JMChFOXAEGJrjMdaKapnl5C
	qZPKjPMyvjLbOU/cU3tWDmV7dH3xEkc4hvldY
X-Gm-Gg: ASbGncvWXpmexN07tVjW5B4mtw7aokW4qkiD/mbqKaZxVvYKVJv5gfhfZsMHgtFQaIX
	CHlmz7rLOklFcZpwIoKIMzF/PVaGX2AUjiFx3ViXQw/mqkn0ZivQc8TNgynJaHEv6+IuREZxn7q
	QBXyUtl3TUgvlh98WfUR/HawedPnEBUqNftC0vYBo96yOsVhVnVGlhnRps14M+uGtTf6YVT02O4
	FYxX/EiaWl0T7yNvl/l5uUss54j5yg6qD2x
X-Google-Smtp-Source: AGHT+IF8qSXnJ+rhjUkWLyfkrlnqro0jo37Re0e0Fx0489N2rytzdSYt1av+DAZRDKAd1afp4pfohccY3AyaWMmu/eQ=
X-Received: by 2002:a05:6902:6112:b0:e90:6ca9:d04a with SMTP id
 3f1490d57ef6-e931e51ba09mr5754464276.8.1755207300747; Thu, 14 Aug 2025
 14:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250814204603.2906352-1-peter.marko@siemens.com>
In-Reply-To: <20250814204603.2906352-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Aug 2025 14:34:34 -0700
X-Gm-Features: Ac12FXyOHx01XtOqz0h4CkBibgxSGAnb1LSWmf9E0KnoM0EDdJkRLcMa4Lk1qJY
Message-ID: <CAMKF1spkS-GLB=vrnOpMYwPB2HskT9p-2Yk8Xaf8xBjM4gL9NA@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] fcgi: upgrade 2.4.2 -> 2.4.6
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 21:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118949

On Thu, Aug 14, 2025 at 1:46=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Handles CVE-2025-23016 (in 2.4.5)
>
> Add tag to SRC_URI.
>
> License-Update: file was renamed without any text change
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-webserver/recipes-support/fcgi/fcgi_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webse=
rver/recipes-support/fcgi/fcgi_git.bb
> index 03425c53c9..0f18b8f018 100644
> --- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
> +++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
> @@ -1,12 +1,12 @@
>  DESCRIPTION =3D "FastCGI is a protocol for interfacing interactive progr=
ams with a web server."
>  HOMEPAGE =3D "http://www.fastcgi.com"
>  LICENSE =3D "OML"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.TERMS;md5=3De3aacac3a647af6e7e31f18=
1cda0a06a"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3aacac3a647af6e7e31f181cda0a=
06a"
>
> -SRCREV =3D "382aa2b0d53a87c27f2f647dfaf670375ba0b85f"
> -PV =3D "2.4.2"
> +SRCREV =3D "1ad48735cdf86d918936b53739348356daaa486d"
> +PV =3D "2.4.6"

It would be good to rename the recipe to reflect PV and remove it from here=
.

>
> -SRC_URI =3D "git://github.com/FastCGI-Archives/fcgi2.git;protocol=3Dhttp=
s;branch=3Dmaster \
> +SRC_URI =3D "git://github.com/FastCGI-Archives/fcgi2.git;protocol=3Dhttp=
s;branch=3Dmaster;tag=3D${PV} \
>            "
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118948): https://lists.openembedded.org/g/openembedde=
d-devel/message/118948
> Mute This Topic: https://lists.openembedded.org/mt/114707840/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

