Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6017CEC4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 15:29:43 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a48so17519053qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 07:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OwAO/Dp6GexOTdXmSMe6nDoGQvLZaMkUdybtNUk3Tlw=;
	b=qm1ShCXutQLeiRcc5zs6JWGYd9uoK+ypVxDQwj1xwQwbBivJQM4qaeK6iquK+AE3Kd
	/d3pXu6xs4cEoLHTuasa5GrradoVOzatrRCbJBVlcq7REn/L5MxODMHcPvq0+L75GEMj
	gybtQ5p2ZjTZF3b7xvYAJ5ugx/FrSG8NUKP+qN6/ICTeONyXpX6XZ1i1L2Eid9TGp+at
	MzlKnj+3d/OoECN4mUSnC9zHvYJj+ZwLVYlOCxiby+QPZQdzxn8BpHaZZEsRayM/7RAk
	fHUCqSgIvXv7P8UCXQ9mpt/XG745+zQ/hqrlxfpt/JWTrUDDgkoV/gL3/kql0hmj6hHg
	rz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OwAO/Dp6GexOTdXmSMe6nDoGQvLZaMkUdybtNUk3Tlw=;
	b=qJxwxPcusn/WStv9NIo2DQVH6TL2wfO+3jnqUKhd7tJoLqF7jnXu8uZBd66xE3LCRA
	OZAdtc1wuRCG3Q6y4vQ87WewAch3GWSddRmmGhVQxqavReaQZYC9IOhLbxWj3/eHoXAD
	cah3hVgd8TQrPuzQ3cZzo+J57XvyGlu74wR1SKGuHNwOlEiPjRHTfZTzOPEhegFudcN2
	RaJTGRkNW+iTeVKM3E+4b3dLGDRRGUNS1BFy8KmgNk1fbA654LMT8ecdNodxcSdLEGTI
	KJmCs+efdeM9vyKw7OvTxzAAnZdqWcqagWEutTAfULWNHtRl3VOwYa/9H1f3nEUBSYF0
	XY1A==
X-Gm-Message-State: APjAAAWrxv6Do//l2OqWPNfa50b8tMuwxVNZHk82RsDLJzbxJ1zznwwa
	FDUtNWeXB8+RuYG3yi1H4tKyj9CoXnT5Zi/q6mY=
X-Google-Smtp-Source: APXvYqzl45tqylUyPBfy7dtvbmQESV5l3hqVYZGyuqRooV4TsjsM51ANHZdmNskjHKxcQQWxQ5TS53yO2BadnNe/IFM=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr10824442qtn.253.1551972584814; 
	Thu, 07 Mar 2019 07:29:44 -0800 (PST)
MIME-Version: 1.0
References: <20190306091258.59600-1-mingli.yu@windriver.com>
In-Reply-To: <20190306091258.59600-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2019 07:29:19 -0800
Message-ID: <CAMKF1soBAMksYZCBgzhoWsmgz7EpG8G2_VXHqJgV3GPyi1Z5NA@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mysql-python: fix compilation with MariaDB 10.3.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2019 15:29:44 -0000
Content-Type: text/plain; charset="UTF-8"

Applying patch 0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
patching file _mysql.c
Hunk #1 FAILED at 2002 (different line endings).
1 out of 1 hunk FAILED -- saving rejects to file _mysql.c.rej

On Wed, Mar 6, 2019 at 1:12 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Use standard API function MYSQL_OPT_RECONNECT
> instead of direct modification of internal structures
> which does not work for MariaDB to fix below compile
> issue.
> | _mysql.c: In function '_mysql_ConnectionObject_ping':
> | _mysql.c:2005:41: error: 'MYSQL' {aka 'struct st_mysql'} has no member named 'reconnect'
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...ompilation-with-MariaDB-with-10.3.13.patch | 39 +++++++++++++++++++
>  .../recipes-dbs/mysql/mysql-python_1.2.5.bb   |  4 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
>
> diff --git a/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch b/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
> new file mode 100644
> index 000000000..b816618c7
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
> @@ -0,0 +1,39 @@
> +From 45436592aa64308b2ab46f84c6107c6d7de0a3ec Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 6 Mar 2019 00:16:17 -0800
> +Subject: [PATCH] _mysql.c: fix compilation with MariaDB 10.3.13
> +
> +Use standard API function MYSQL_OPT_RECONNECT
> +instead of direct modification of internal structures
> +which does not work for MariaDB.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + _mysql.c | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/_mysql.c b/_mysql.c
> +index f081346..2262e9e 100644
> +--- a/_mysql.c
> ++++ b/_mysql.c
> +@@ -2002,7 +2002,14 @@ _mysql_ConnectionObject_ping(
> +       int r, reconnect = -1;
> +       if (!PyArg_ParseTuple(args, "|I", &reconnect)) return NULL;
> +       check_connection(self);
> +-      if ( reconnect != -1 ) self->connection.reconnect = reconnect;
> ++      if ( reconnect != -1 ) {
> ++             #if MYSQL_VERSION_ID >= 50013
> ++               my_bool recon = reconnect;
> ++               mysql_options(&self->connection, MYSQL_OPT_RECONNECT, &recon);
> ++             #else
> ++                 self->connection.reconnect = reconnect;
> ++             #endif
> ++        }
> +       Py_BEGIN_ALLOW_THREADS
> +       r = mysql_ping(&(self->connection));
> +       Py_END_ALLOW_THREADS
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> index ac0df4f06..f2faec1c1 100644
> --- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> +++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> @@ -8,7 +8,9 @@ DEPENDS = "mysql5"
>
>  SRCNAME = "MySQL-python"
>
> -SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip"
> +SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip \
> +           file://0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch \
> +"
>  SRC_URI[md5sum] = "654f75b302db6ed8dc5a898c625e030c"
>  SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e140c74"
>
> --
> 2.17.1
>

