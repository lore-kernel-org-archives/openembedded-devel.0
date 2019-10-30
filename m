Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 11A2C7F977
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 06:54:47 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e14so1875117qto.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gkZLdqY8XTlNKzSVzopBAQOHffHnEu77YgLWhY25xPQ=;
	b=SalXe/t60lE98qYLKq3Pfv+9d0PI5MMLSn+Y3L5Ww+sGoOcWQQcWLYFGKNFAO5ZaFN
	F2+s7vgOWRtMoFHNo90wIvlTfCihxcZMyaia25OAWAtIoSl7QIxqJDpMb1O4ncnDawBd
	CclGiJvGEYkqJM75JX/OTttmLTu/KgNWUhurYVFw6kbdu3gL0zB5mKmpXvR8D/aD/3Fn
	BtaHAVkiIyPX9q2eSm2FW3ifmVh9oF+A+bUDgA5mt+vqD5ph+UGhNEbwr0IKp4GTE1VW
	EPfiR0GBbjDoZYp6aQq6IAJXeUrmnxdfPyrzhZg0F9t40NHfmQg43JP6oHBHZL3hPJ3p
	l+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gkZLdqY8XTlNKzSVzopBAQOHffHnEu77YgLWhY25xPQ=;
	b=bLZSp8EklD0HY4GbcU+EjNlZnmDsunvF+yXIBwG+XGN9E1lY3m5wQz4Om/Jrh6M7v0
	eCHAnd2hOPnueRd70MXp4URTlaQqV4zvu0v1eIrzAIWfUWRkpLI0KCM9DnOvboK2izrz
	/iymMiN1aQ7uEm+3u9lWuQgMb+Fslla0pWdUy8YYR2veyDQ92TnyvDMX19rxa+ySoznD
	gKaZcMwWnReGRJtCyXIyWjyREZUksCY7UvLK3VP5RmfpmV/rxp2sGNKBDLAR4wYnmJYi
	iHUujfRBnXGTlJwQedxQwdYyksciEVYukL2dPIolSjZXj4NLTZpegdJdY/Qkg30lP3/6
	neiA==
X-Gm-Message-State: APjAAAW588f6FokSH64t6VLiuzMXaSbXzKZcVO8eelNXLIqZ7XPdlMh2
	fyyATVgvbnc+O8GDFuiswhqjQ0D0KhYDiupUH5km9j2bM9euvw==
X-Google-Smtp-Source: APXvYqx12tW/9/ZLeto1ieTBHHIRlgGICELKLGd6QsxD3KbW1V9SzCr9xGIJx5GbO5NrK5vSAamKPksdVjI46TSU/J8=
X-Received: by 2002:ad4:45b1:: with SMTP id y17mr25272153qvu.55.1572418488455; 
	Tue, 29 Oct 2019 23:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191029090657.30771-1-bunk@stusta.de>
In-Reply-To: <20191029090657.30771-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2019 07:54:22 +0100
Message-ID: <CAMKF1sp2cs11WhP-YBCQhKP5Ac+D8ZcfqMfkq6r0hzxd5urhWg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] lftp: Remove no longer needed patch
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
X-List-Received-Date: Wed, 30 Oct 2019 06:54:48 -0000
Content-Type: text/plain; charset="UTF-8"

it still fails on musl with signbin conflicts so we still need that
patch or maybe help configure by defining it something like pass
gl_cv_func_signbit=yes via EXTRA_OECONF


see error
https://errors.yoctoproject.org/Errors/Details/274949/

On Tue, Oct 29, 2019 at 10:07 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> The root cause has already been fixed in glibc.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../files/fix-gcc-6-conflicts-signbit.patch   | 44 -------------------
>  .../recipes-connectivity/lftp/lftp_4.8.4.bb   |  1 -
>  2 files changed, 45 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
>
> diff --git a/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch b/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
> deleted file mode 100644
> index 952232b7a..000000000
> --- a/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> ---- lftp-4.6.3a/src/NetAccess.cc.orig  2016-06-18 10:25:51.063358981 -0400
> -+++ lftp-4.6.3a/src/NetAccess.cc       2016-06-18 10:26:04.143359209 -0400
> -@@ -21,7 +21,7 @@
> -
> - #include <errno.h>
> - #include <assert.h>
> --#include <math.h>
> -+#include <cmath>
> - #include <sys/types.h>
> -
> - #include "NetAccess.h"
> ---- lftp-4.6.3a/src/Speedometer.cc.orig        2016-06-18 10:24:58.895358073 -0400
> -+++ lftp-4.6.3a/src/Speedometer.cc     2016-06-18 10:25:10.879358281 -0400
> -@@ -18,7 +18,7 @@
> -  */
> -
> - #include <config.h>
> --#include <math.h>
> -+#include <cmath>
> - #include <stdlib.h>
> - #include "Speedometer.h"
> - #include "misc.h"
> ---- lftp-4.6.3a/src/FileCopy.cc.orig   2016-06-18 10:24:15.939357325 -0400
> -+++ lftp-4.6.3a/src/FileCopy.cc        2016-06-18 10:24:24.583357475 -0400
> -@@ -36,7 +36,7 @@
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include <fcntl.h>
> --#include <math.h>
> -+#include <cmath>
> - #include <stddef.h>
> - #include "FileCopy.h"
> - #include "url.h"
> ---- lftp-4.6.3a/src/ResMgr.cc.orig     2016-06-18 10:23:31.387356549 -0400
> -+++ lftp-4.6.3a/src/ResMgr.cc  2016-06-18 10:23:41.771356729 -0400
> -@@ -23,7 +23,7 @@
> - #include <ctype.h>
> - #include <unistd.h>
> - #include <stdlib.h>
> --#include <math.h>
> -+#include <cmath>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include <errno.h>
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
> index bf793d91d..ce669eb4f 100644
> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
> @@ -7,7 +7,6 @@ LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>  SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
> -           file://fix-gcc-6-conflicts-signbit.patch \
>            "
>  SRC_URI[md5sum] = "a56b5047dbfda052df4c1dfd197aa092"
>  SRC_URI[sha256sum] = "a853edbd075b008c315679c7882b6dcc6821ed2365d2ed843a412acd3d40da0e"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

