Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F8CC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 15:05:19 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.24821.1706108718973829146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jan 2024 07:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOYuR7F8;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-21460195d11so1278235fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 07:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706108718; x=1706713518; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uO1MunM20GMWyYx1TDJinz9kBrGbsICtZprD+Jj2mD8=;
        b=JOYuR7F8X7n7jgbBUrhVX+7f+hkPxZX++1m4517SFnSpXXbGbUNJPdG5Hm5hqLBaqu
         n0ZxtfBMbEijJBuJvxjwLIWX8A7u2yhTPL73SQOPuTX7Z8hKe/U3y84QdVfSsX89raBv
         VPJUu4QZLLW7RLSwxGMFn+AWUdVMALuQn21YwzhWACgzpkSZvAsrNW7rx8mabDuhzR7G
         jANNgnBrK1v4PDpF66kDeUwqhxx476jok66Nvv9xM0GVOXEmZiY8MaQDbP84J7BzYGA0
         Q6YEhTtOhwbPxR0REv3cylm6H9f5fa9EzZDqc0aTkTIRSjq83d80HYYR+xPknfcneARv
         Z2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706108718; x=1706713518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uO1MunM20GMWyYx1TDJinz9kBrGbsICtZprD+Jj2mD8=;
        b=FRVzIGz7e1cK859nWtDWXJEM0bnVu+4jdebKF1IifefYOw2vsnfgQK4tQGKC/p+ckA
         Ruwbr0IR7gCn5eNUG76efaBTg7knan0LiN5a4rP6B1Gn5DGZ17lbLvf+/JYv7bBEGpvc
         6q2Gy4XHWRvav38nXVo0JYrIvpaWOcq+r7/2jsZTdkc29c4B/GxxhGArClbr2ulD9aVE
         nD7HuVphKsfCdVc/akwd0B4kndxRXalU4eUEc7PGywI94kxUrF9X4uC6z4RZZrnb0Cww
         bqBBKgKbFpz+tC92R0x1sjBZLpJgaeDqLBHi1+7s3FFfZiE4Ln8N3LObcdBb7pD2Q7TL
         IoTw==
X-Gm-Message-State: AOJu0YyqCLSXC/XQABjcZR7ire9QYXldMqUdZzFs8FlWffg7qG9sJeTS
	KGpB8c4iY+7J4e/Btv7lbqWkp6EjKz+rikO5qP0zDgwaSyRGpacpYijEiu4ogHHkFXwAdQFJY38
	m0CvDC/nGxKniJFPKydZ7/bO3h30=
X-Google-Smtp-Source: AGHT+IHvE9Voo5ZuNJOzbCrd2TqCHhqxg30AazH3LcFl9swFhD9SzS6evGCA+Ngq9uodfGjv80cEfjStWz4g0YYdQZY=
X-Received: by 2002:a05:6870:b48b:b0:203:c5ca:5333 with SMTP id
 y11-20020a056870b48b00b00203c5ca5333mr3519161oap.41.1706108718241; Wed, 24
 Jan 2024 07:05:18 -0800 (PST)
MIME-Version: 1.0
References: <3fcb8c36-55bc-4dcf-bb2a-cdb45da97113@gmail.com>
In-Reply-To: <3fcb8c36-55bc-4dcf-bb2a-cdb45da97113@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jan 2024 07:04:52 -0800
Message-ID: <CAMKF1srZWDWeWKGtc7sG5iO8MfugpSH0gsOf_PKH8SVPsJ-Hpg@mail.gmail.com>
Subject: Re: nanbield merge request: Jan 24th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 15:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108447

applied. Thanks Armin

On Wed, Jan 24, 2024 at 5:01=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 2da6e1b0e43a8993fd422fee3f83940100b59f=
4c:
>
>    poco: fix branch (2024-01-05 07:52:17 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded nanbield-next
>
> for you to fetch changes up to da9063bdfbe130f424ba487f167da68e0ce90e7d:
>
>    libssh: upgrade 0.10.5 -> 0.10.6 (2024-01-16 19:29:51 -0500)
>
> ----------------------------------------------------------------
> Changqing Li (2):
>        postgresql: upgrade 15.4 -> 15.5
>        redis: upgrade 6.2.13 -> 6.2.14
>
> Khem Raj (1):
>        webkitgtk3: upgrade 2.42.0 -> 2.42.1
>
> Meenali Gupta (1):
>        nginx: upgrade 1.25.2 -> 1.25.3
>
> Mingli Yu (1):
>        mariadb: Upgrade to 10.11.6
>
> Wang Mingyu (5):
>        strongswan: upgrade 5.9.12 -> 5.9.13
>        webkitgtk3: upgrade 2.42.1 -> 2.42.2
>        webkitgtk3: upgrade 2.42.2 -> 2.42.3
>        webkitgtk3: upgrade 2.42.3 -> 2.42.4
>        libssh: upgrade 0.10.5 -> 0.10.6
>
> Yi Zhao (1):
>        samba: upgrade 4.18.8 -> 4.18.9
>
>   .../samba/{samba_4.18.8.bb =3D> samba_4.18.9.bb} |  2 +-
>   .../strongswan/{strongswan_5.9.12.bb =3D> strongswan_5.9.13.bb} |  2 +-
>   .../{mariadb-native_10.11.5.bb =3D> mariadb-native_10.11.6.bb} |  0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 3 +-
>   meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch         | 68
> -----------------------------
>   .../mysql/{mariadb_10.11.5.bb =3D> mariadb_10.11.6.bb} |  0
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 8 ++-=
-
>   .../postgresql/{postgresql_15.4.bb =3D> postgresql_15.5.bb} |  2 +-
>   .../recipes-extended/redis/{redis_6.2.13.bb =3D> redis_6.2.14.bb} |  2 =
+-
>   ...1-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch | 10 ++=
---
>   ...1-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch | 10 ++=
---
>   .../libssh/{libssh_0.10.5.bb =3D> libssh_0.10.6.bb} |  2 +-
>   .../webkitgtk/{webkitgtk3_2.42.0.bb =3D> webkitgtk3_2.42.4.bb} |  2 +-
>   .../recipes-httpd/nginx/{nginx_1.25.2.bb =3D> nginx_1.25.3.bb} |  2 +-
>   14 files changed, 20 insertions(+), 93 deletions(-)
>   rename meta-networking/recipes-connectivity/samba/{samba_4.18.8.bb =3D>
> samba_4.18.9.bb} (99%)
>   rename
> meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb =3D>
> strongswan_5.9.13.bb} (99%)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.5.bb =3D>
> mariadb-native_10.11.6.bb} (100%)
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.pa=
tch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.5.bb =3D>
> mariadb_10.11.6.bb} (100%)
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_15.4.bb =3D>
> postgresql_15.5.bb} (86%)
>   rename meta-oe/recipes-extended/redis/{redis_6.2.13.bb =3D>
> redis_6.2.14.bb} (96%)
>   rename meta-oe/recipes-support/libssh/{libssh_0.10.5.bb =3D>
> libssh_0.10.6.bb} (96%)
>   rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.0.bb =3D>
> webkitgtk3_2.42.4.bb} (99%)
>   rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.2.bb =3D>
> nginx_1.25.3.bb} (51%)

