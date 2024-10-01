Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F05CEB2E6
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:40:07 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.74142.1727757604514653078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YY5b7Q2I;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2870f8bd2bbso1638027fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 21:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727757604; x=1728362404; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mytk7UCfIUXQkYnFdY7x2BDvWvoDgyYzkdYC0eolzjE=;
        b=YY5b7Q2ICW+nyHSuWDvXw8KqzL+8TrNEJacgT8Flhc4PXAyX1V/ST8gNmRFuLlKwsH
         a/gvZzttQkdpYxLtgE49i1AY2sCZIkFqW2Q2jOJwRGdLBOXz8YBXYE7ux8HEdP3iW3o3
         YdOPG3y0Ep72o2V0mc3vrFx0p0SR7GYWZX/eIhBVKO+gXgtqqiE2U6Vp+pRSmjUWcOC/
         Dsi4Cu4SxfqEKxsdY9ue8OqMNznI/r4hzuEhFO9SDTcF5pK9npMNVCdOGV91XVNd5k8F
         pcL25pkMfuo6q5xFzpxgWW4wSZ8qja/21ZNTfohy6QF0vZV5prCdN49KxcBcHir1slVL
         92Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727757604; x=1728362404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mytk7UCfIUXQkYnFdY7x2BDvWvoDgyYzkdYC0eolzjE=;
        b=ooXY4IWDK0FXrCIjmDmGy61LMRQGj4htCpj3h2vgUNSfs7yjXXSQF+Bkgs5MtiQ69A
         pCjy005X5JXaPzn0aSjwslWc0z6tgNNC8cV13PczOiu29hmPqD1rtStBQoqawT1Y8ZfW
         jupD83h3Pz/jYr5sltuE5ye+ywYsIk2NlZhfZmAtSuuNwNEvciPZb0+yk7eD0c4lGAhl
         cf1BOg6I1drhCXogsQ+JMwnggO1w98a85CWZiqFGM+XSGk5/KwtFZ0oDl6SEbUI37QnG
         loO/MN6/gQEVRW5NyYWdzjMcuXc+SqSVuLJBralgZYbf5SUBJWlk89eZL/S9K8a2WT40
         oupQ==
X-Gm-Message-State: AOJu0YzWvDNUD5zxrGxFMG6qnG2NjKEtT3jePrHQyXwkLZUfQ8PBtvEg
	pNG0RISKQ7o6XY164PbTySrC8lJCW2NWFLiN/QKipv0RYt9KGP/ybrAquJ1sNSnxgKStoCw9NU4
	K6wH2bvb2MDeeG5cPK+j/O0ull7DESYKl
X-Google-Smtp-Source: AGHT+IFd74lnugfG0gKRB9vQACJdnIwhYo9FsG8cc6GBsGx6yyjnuV/OyB5VmLmHzVA00wPAm79CoPuW20zPDJCgfSI=
X-Received: by 2002:a05:6870:8dc3:b0:278:64e:c5ef with SMTP id
 586e51a60fabf-28710bd0778mr9342225fac.37.1727757603666; Mon, 30 Sep 2024
 21:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241001042429.3651-1-niko.mauno@vaisala.com>
In-Reply-To: <20241001042429.3651-1-niko.mauno@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Sep 2024 21:39:37 -0700
Message-ID: <CAMKF1sqsU_Chwagt6mt4YcYaHMQf=xrTW-b-xwhJEQYO5Rb_JQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCHv3 1/4] mysql-python: Remove obsolete recipe
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112623

I can't apply this v3 series

Applying: mysql-python: Remove obsolete recipe
Patch failed at 0001 mysql-python: Remove obsolete recipe
error: patch failed:
meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-M=
ariaDB-with-10.3.13.patch:1
error: meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation=
-with-MariaDB-with-10.3.13.patch:
patch does not apply

Can you please rebase it on top of the master-next branch to make it a
bit easier ?

On Mon, Sep 30, 2024 at 9:25=E2=80=AFPM Niko Mauno <niko.mauno@vaisala.com>=
 wrote:
>
> This recipe depends on meta-python2, master branch of which has not
> been updated sine February 2022, see
> https://git.openembedded.org/meta-python2/log/?h=3Dmaster
>
> Also, master branch of the associated source code repository has not
> been updated since January 2014, see
> https://github.com/farcepest/MySQLdb1/commits/master/
>
> Thus, remove the obsolete recipe, along with associated packagegroup
> declarations/references.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  6 ----
>  ...ompilation-with-MariaDB-with-10.3.13.patch | 34 -------------------
>  .../recipes-dbs/mysql/mysql-python_1.2.5.bb   | 26 --------------
>  3 files changed, 66 deletions(-)
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-=
fix-compilation-with-MariaDB-with-10.3.13.patch
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 6f31283fb..9523e78dd 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -13,7 +13,6 @@ PACKAGES =3D "\
>      packagegroup-meta-oe-crypto \
>      packagegroup-meta-oe-bsp \
>      packagegroup-meta-oe-dbs \
> -    packagegroup-meta-oe-dbs-python2 \
>      packagegroup-meta-oe-devtools \
>      packagegroup-meta-oe-extended \
>      packagegroup-meta-oe-extended-python2 \
> @@ -40,7 +39,6 @@ RDEPENDS:packagegroup-meta-oe =3D "\
>      packagegroup-meta-oe-core \
>      packagegroup-meta-oe-crypto \
>      packagegroup-meta-oe-dbs \
> -    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packageg=
roup-meta-oe-dbs-python2", "", d)} \
>      packagegroup-meta-oe-devtools \
>      packagegroup-meta-oe-extended \
>      ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packageg=
roup-meta-oe-extended-python2", "", d)} \
> @@ -225,10 +223,6 @@ RDEPENDS:packagegroup-meta-oe-dbs =3D"\
>  "
>  RDEPENDS:packagegroup-meta-oe-dbs:remove:libc-musl:powerpc =3D "rocksdb"
>
> -RDEPENDS:packagegroup-meta-oe-dbs-python2 =3D"\
> -    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.=
contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'mysql-python', '', d), ""=
, d)} \
> -"
> -
>  RDEPENDS:packagegroup-meta-oe-devtools =3D"\
>      abseil-cpp \
>      apitrace \
> diff --git a/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-com=
pilation-with-MariaDB-with-10.3.13.patch b/meta-oe/recipes-dbs/mysql/mysql-=
python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
> deleted file mode 100644
> index 173241ea5..000000000
> --- a/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilatio=
n-with-MariaDB-with-10.3.13.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 45436592aa64308b2ab46f84c6107c6d7de0a3ec Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Wed, 6 Mar 2019 00:16:17 -0800
> -Subject: [PATCH] _mysql.c: fix compilation with MariaDB 10.3.13
> -
> -Use standard API function MYSQL_OPT_RECONNECT
> -instead of direct modification of internal structures
> -which does not work for MariaDB.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - _mysql.c | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> ---- a/_mysql.c
> -+++ b/_mysql.c
> -@@ -2002,7 +2002,14 @@ _mysql_ConnectionObject_ping(
> -       int r, reconnect =3D -1;
> -       if (!PyArg_ParseTuple(args, "|I", &reconnect)) return NULL;
> -       check_connection(self);
> --      if ( reconnect !=3D -1 ) self->connection.reconnect =3D reconnect=
;
> -+      if ( reconnect !=3D -1 ) {
> -+#if MYSQL_VERSION_ID >=3D 50013
> -+              my_bool recon =3D reconnect;
> -+              mysql_options(&self->connection, MYSQL_OPT_RECONNECT, &re=
con);
> -+#else
> -+              self->connection.reconnect =3D reconnect;
> -+#endif
> -+        }
> -       Py_BEGIN_ALLOW_THREADS
> -       r =3D mysql_ping(&(self->connection));
> -       Py_END_ALLOW_THREADS
> diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/re=
cipes-dbs/mysql/mysql-python_1.2.5.bb
> deleted file mode 100644
> index 15f6b6fb9..000000000
> --- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -SUMMARY =3D "Python interface to MySQL"
> -HOMEPAGE =3D "https://github.com/farcepest/MySQLdb1"
> -SECTION =3D "devel/python"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://GPL-2.0;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -
> -DEPENDS =3D "mysql5"
> -
> -SRCNAME =3D "MySQL-python"
> -
> -SRC_URI =3D "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCN=
AME}-${PV}.zip \
> -           file://0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.1=
3.patch \
> -"
> -SRC_URI[md5sum] =3D "654f75b302db6ed8dc5a898c625e030c"
> -SRC_URI[sha256sum] =3D "811040b647e5d5686f84db415efd697e6250008b112b6909=
ba77ac059e140c74"
> -
> -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -SKIP_RECIPE[mysql-python] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE=
_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read htt=
ps://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and =
if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_=
PYTHON3 to "yes"', d)}"
> -
> -inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setu=
ptools", "", d)}
> -
> -python() {
> -    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
> -        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.'=
)
> -}
> --
> 2.39.2
>

