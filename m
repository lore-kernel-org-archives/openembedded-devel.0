Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F732C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 14:09:51 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.42777.1717769387946540008
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 07:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OZSyoZVS;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24c9f628e71so1029555fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717769387; x=1718374187; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLSyQXaOeygEXvFuU+taDV06jXNZiEr3JY/C0jq7PnM=;
        b=OZSyoZVSu9B7SD7RRMxxPpTVQLkfMG5jtlgMVb14K/Z11XaIJbvi9fvDPNrWMQPHd7
         HigSNJ2z71MqlGMIA/z2GrT8EH2FrbBLvogrEYHlnYVJbQkcX9cPcl8A6wRPka2QFqBE
         aI6ZMlZZWWjuQOAvBwZkJBFoXVvW7+ZGVmETmnKf9cPFf7oVTlVzybyBZCNPWHzFG9iy
         UOIqcshlvBOKcD46tnF1K2fPjPWYaZ0Jkt7H7ANxhWTKVJS+W9Xd/shQA0IESaRvXRRg
         tiJs+2Ca+duiWPUynIgbGZQPySQPTfddwhZcedCdMC4y74hb3wkNUKJJEPmtsjkQNX2j
         Q6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717769387; x=1718374187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLSyQXaOeygEXvFuU+taDV06jXNZiEr3JY/C0jq7PnM=;
        b=uJzXhlR9rwk9k31JrqIVF25BDdHuzebAdD9XSMQJtEY+Ri4XfWCpVUnkf0P+g4yDCJ
         NtgLmnhQzKno79DySanIGpHVqzUlE5c+yWasATROC091gh7OK7W/d8xxyabgzfmIEyRd
         JhZF00S/pc/OqW/Ait9xcVMbISZuRroLJ/4uEF9sevRu0CoJmMnpQ2are5UFK3uNERJ9
         sQlJ5Gj57YXBpeXT2zddkfcmwobcGxzbJUGER0yNFjg6xX/xe4GDPJMWMnhHASJG9S+7
         oB8vYf/seg6dr5DbKMXSIqCMMKTyfPO9OtXLHB7GzDicr7zSXiAgAy4cD9GoStsO2Ezl
         eT3g==
X-Gm-Message-State: AOJu0Yy7PHl4e8Sbfa7dr/TjfbX62hhHFBpB5wMCXm/+f6oko2+isYV7
	CUTLgcVdL68KpGL9QP4VHPADp4hNB0MBlS8J+Su4DMCe9J0sAbZN4sSetiWMw8j8Yy9SgIqh1dy
	YHN7vTEZcHXGZzohXSfbRvXVNhybL6w==
X-Google-Smtp-Source: AGHT+IEsgLQIMZx17Inq/EicFNqYgCRMDh8D5pNgIChzmp9AKeGtKr736lNtkuceWAmkTl43MOSXRSQlsjGQK7enQpI=
X-Received: by 2002:a05:6871:3a14:b0:254:71a1:545c with SMTP id
 586e51a60fabf-25471a158femr1445350fac.15.1717769386773; Fri, 07 Jun 2024
 07:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240607124219.3646766-1-soumya.sambu@windriver.com>
In-Reply-To: <20240607124219.3646766-1-soumya.sambu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jun 2024 07:09:20 -0700
Message-ID: <CAMKF1sph3bXbBuATDfaq1jUzUmrXT0K45zi3MVtKuB5cW4NQkg@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] unixodbc: Fix CVE-2024-1013
To: soumya.sambu@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 14:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110768

On Fri, Jun 7, 2024 at 5:42=E2=80=AFAM Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> An out-of-bounds stack write flaw was found in unixODBC on 64-bit
> architectures where the caller has 4 bytes and callee writes 8 bytes.
> This issue may go unnoticed on little-endian architectures, while
> big-endian architectures can be broken.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2024-1013
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../unixodbc/files/CVE-2024-1013.patch        | 53 +++++++++++++++++++
>  .../unixodbc/unixodbc_2.3.12.bb               |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.=
patch
>

This seems applicable to master branch as well. If that's the case
then test and send patches for the master branch first.
and then send a backport patch for release branches.

> diff --git a/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch b=
/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
> new file mode 100644
> index 000000000..688446545
> --- /dev/null
> +++ b/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
> @@ -0,0 +1,53 @@
> +From 76beb0938ef14276123996bfd99df23b0c7f0982 Mon Sep 17 00:00:00 2001
> +From: Soumya Sambu <soumya.sambu@windriver.com>
> +Date: Fri, 7 Jun 2024 11:10:46 +0000
> +Subject: [PATCH] PostgreSQL driver: Fix incompatible pointer-to-integer =
types
> +
> +These result in out-of-bounds stack writes on 64-bit architectures
> +(caller has 4 bytes, callee writes 8 bytes), and seem to have gone
> +unnoticed on little-endian architectures (although big-endian
> +architectures must be broken).
> +
> +This change is required to avoid a build failure with GCC 14.
> +
> +CVE: CVE-2024-1013
> +
> +Upstream-Status: Backport [https://github.com/lurcher/unixODBC/commit/45=
f501e1be2db6b017cc242c79bfb9de32b332a1]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + Drivers/Postgre7.1/info.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Drivers/Postgre7.1/info.c b/Drivers/Postgre7.1/info.c
> +index 63ac91f..2216ecd 100644
> +--- a/Drivers/Postgre7.1/info.c
> ++++ b/Drivers/Postgre7.1/info.c
> +@@ -1779,14 +1779,14 @@ char *table_name;
> + char index_name[MAX_INFO_STRING];
> + short fields_vector[8];
> + char isunique[10], isclustered[10];
> +-SDWORD index_name_len, fields_vector_len;
> ++SQLLEN index_name_len, fields_vector_len;
> + TupleNode *row;
> + int i;
> + HSTMT hcol_stmt;
> + StatementClass *col_stmt, *indx_stmt;
> + char column_name[MAX_INFO_STRING], relhasrules[MAX_INFO_STRING];
> + char **column_names =3D 0;
> +-Int4 column_name_len;
> ++SQLLEN column_name_len;
> + int total_columns =3D 0;
> + char error =3D TRUE;
> + ConnInfo *ci;
> +@@ -2136,7 +2136,7 @@ HSTMT htbl_stmt;
> + StatementClass *tbl_stmt;
> + char tables_query[STD_STATEMENT_LEN];
> + char attname[MAX_INFO_STRING];
> +-SDWORD attname_len;
> ++SQLLEN attname_len;
> + char pktab[MAX_TABLE_LEN + 1];
> + Int2 result_cols;
> +
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-o=
e/recipes-support/unixodbc/unixodbc_2.3.12.bb
> index 7819387c3..dfad833e0 100644
> --- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
> +++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
> @@ -11,6 +11,7 @@ DEPENDS =3D "libtool readline"
>  SRC_URI =3D "https://www.unixodbc.org/unixODBC-${PV}.tar.gz \
>             file://do-not-use-libltdl-source-directory.patch \
>             file://0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_co=
nfi.patch \
> +           file://CVE-2024-1013.patch \
>  "
>  SRC_URI[sha256sum] =3D "f210501445ce21bf607ba51ef8c125e10e22dffdffec3776=
46462df5f01915ec"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110766): https://lists.openembedded.org/g/openembedde=
d-devel/message/110766
> Mute This Topic: https://lists.openembedded.org/mt/106541920/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

