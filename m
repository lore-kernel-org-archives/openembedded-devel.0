Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DFAC76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 23:56:52 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.53199.1679961409716808843
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 16:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQ8Qmpu5;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17aeb49429eso11086735fac.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 16:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679961409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/V6D0prwgimBRVZAXDKaCHGpqbhWf7rpGqRXll8IUI=;
        b=cQ8Qmpu5GiBsk+NVZVH7gcK9A4wvz4SSELRgCU1QTvPC2VHKZYGM4UmzkapoWWFbnC
         LmK+ysoMqkbQUU1hBUtrSq4/E8xda0p63sxqsz7PSLHkzxDABpFDxrhUOCT2jT3oPCcx
         uwWZkFfLHhBlyQBBEm6hSge/74IEMne/oMngMRTYjjQspL+dE+lC0Zr1RM0fAqFfWzzY
         Z1DIgrrnRAXskWRey6V1TyfNs+pyD0DHS/NYQW9TTDlkbYPtEaSRBO9AaV3/5QfkRQjb
         6C6Dp2DZi21lUizx45RwBxL9BzG3BoLaBMNVMs5ADoG7/drZkk9o6MBTW/Oms4uF4pGF
         oklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679961409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/V6D0prwgimBRVZAXDKaCHGpqbhWf7rpGqRXll8IUI=;
        b=uRI+w0W2z2ls5tQdXXnIfQi1taJScaTdawSDR48RtOBMAFST+1xa0RwvYr0rJCHy2k
         kBpHF/g7TeFIRjnuuOl1lT4ro0yRAsMKKkK6GWYJu8AknbjibbXlo3mMTlXQR7D5gvNu
         iCmWfewXM+yxK4p2d17GlcEjm6YhddbgzOdp9QNS7YJg5MPBphLsSXMOAtNOe6XJFoAX
         DbvCfIlxxBOANMOqXi9CBkZC5m82yDZjQooWgkqVa1o4jWqoxXJW4cK8UjohAnuxIdbM
         NQN3+h+l2xtOmwfKXLQwVHGYnDreXnoD2TM/N0KTI9XxdrK+3yA0kuEshTcvjNh7dnmI
         SHlQ==
X-Gm-Message-State: AAQBX9ew11rIvyqnWnMuuV3aD9QOiTEzseKkeN3hG5H9xSIHYexNgV1M
	KB3jAXOLHwnYSPyGgCPA6HSP7nZrXhnYarvVy/yOc+n5
X-Google-Smtp-Source: AKy350Yei600ASGike2lMuz1z7bPmJUptXhLXUhv20UwKg8bH1RrvHMmVxei1p7H08z18VTBhtBGRKuobBHikAuzfbI=
X-Received: by 2002:a05:6870:1215:b0:17e:915c:84a2 with SMTP id
 21-20020a056870121500b0017e915c84a2mr4575081oan.4.1679961408792; Mon, 27 Mar
 2023 16:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230327072939.2419804-1-manojsingh.saun@windriver.com>
In-Reply-To: <20230327072939.2419804-1-manojsingh.saun@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Mar 2023 16:56:22 -0700
Message-ID: <CAMKF1sqjGdBVnL6nBAxjCb982zuxNA4Z214WR1n6Xbek4Sdd9g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH V2 1/1] postgresql: fix ptest failure of
 sysviews test
To: Manoj Saun <manojsingh.saun@windriver.com>
Cc: openembedded-devel@lists.openembedded.org, narpat.mali@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 23:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101793

There was a patch fuzz detected in this patch, I have fixed it this
time and pushed a refreshed patch to master-next, please check and
also make sure
to check this next time around.

On Mon, Mar 27, 2023 at 3:31=E2=80=AFAM Manoj Saun
<manojsingh.saun@windriver.com> wrote:
>
> In postgresql sysview ptest are failing due to hidden build info in pg_co=
nfig table.
> The information is hidden due to existing patch 0001-config_info.c-not-ex=
pose-build-info.patch
> So for passing the test we need to reduce the row count in the sysviews t=
est.
> Also for test results to be shown as pass we need to reduce the row count=
 for
> the expected count in the sysviews.out file.
>
> Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
> ---
>  ...gresql-fix-ptest-failure-of-sysviews.patch | 45 +++++++++++++++++++
>  .../recipes-dbs/postgresql/postgresql_15.2.bb |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-postgresql-=
fix-ptest-failure-of-sysviews.patch
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-pte=
st-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0001-po=
stgresql-fix-ptest-failure-of-sysviews.patch
> new file mode 100644
> index 000000000..8abea7ff4
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-fail=
ure-of-sysviews.patch
> @@ -0,0 +1,45 @@
> +From 9f81377dddfe32d950844d7053020a36b40fce08 Mon Sep 17 00:00:00 2001
> +From: Manoj Saun <manojsingh.saun@windriver.com>
> +Date: Wed, 22 Mar 2023 08:07:26 +0000
> +Subject: [PATCH] postgresql: fix ptest failure of sysviews
> +
> +The patch "0001-config_info.c-not-expose-build-info.patch" hides the deb=
ug info
> +in pg_config table which reduces the count of rows from pg_config and le=
ads to
> +sysviews test failure.
> +To fix it we need to reduce the count of parameters in sysviews test.
> +Also we need to reduce the row count in expected result of sysview test
> +to make the test output shown as pass.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
> +---
> + src/test/regress/expected/sysviews.out | 2 +-
> + src/test/regress/sql/sysviews.sql      | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/e=
xpected/sysviews.out
> +index 579b861..3bfc31f 100644
> +--- a/src/test/regress/expected/sysviews.out
> ++++ b/src/test/regress/expected/sysviews.out
> +@@ -29,7 +29,7 @@ select name, ident, parent, level, total_bytes >=3D fr=
ee_bytes
> + (1 row)
> +
> + -- At introduction, pg_config had 23 entries; it may grow
> +-select count(*) > 20 as ok from pg_config;
> ++select count(*) > 13 as ok from pg_config;
> +  ok
> + ----
> +  t
> +diff --git a/src/test/regress/sql/sysviews.sql b/src/test/regress/sql/sy=
sviews.sql
> +index 351e469..84c113e 100644
> +--- a/src/test/regress/sql/sysviews.sql
> ++++ b/src/test/regress/sql/sysviews.sql
> +@@ -18,7 +18,7 @@ select name, ident, parent, level, total_bytes >=3D fr=
ee_bytes
> +   from pg_backend_memory_contexts where level =3D 0;
> +
> + -- At introduction, pg_config had 23 entries; it may grow
> +-select count(*) > 20 as ok from pg_config;
> ++select count(*) > 13 as ok from pg_config;
> +
> + -- We expect no cursors in this test; see also portals.sql
> + select count(*) =3D 0 as ok from pg_cursors;
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb b/meta-oe/=
recipes-dbs/postgresql/postgresql_15.2.bb
> index befb0caec..5c95e4da3 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
> @@ -8,6 +8,7 @@ SRC_URI +=3D "\
>     file://0001-Improve-reproducibility.patch \
>     file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
>     file://0001-config_info.c-not-expose-build-info.patch \
> +   file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
>  "
>
>  SRC_URI[sha256sum] =3D "99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805de=
f23941ed2b8468c7"
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101778): https://lists.openembedded.org/g/openembedde=
d-devel/message/101778
> Mute This Topic: https://lists.openembedded.org/mt/97878908/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

