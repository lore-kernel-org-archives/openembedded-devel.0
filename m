Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.8011.1588935379488569494
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 03:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=N+iEXZM7;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rc5n=6w=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49JS1W5fX5z5w;
	Fri,  8 May 2020 12:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588935376;
	bh=cwWJVLc/CBjXyhyzGaIqKyCMBEsBsTV79+zumweMuJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+iEXZM78k/UjeTrN7RV+uIA5y/Gg13xx1M+uJqnKu2KDL9eOh5feaGrpkWytY3qB
	 CKjhUxWF1rABMYFMSAjLgt7Y9Rbz9i3nSaj7kRduVKfjyfu5zJmx8O7kkXUBRaCIHA
	 l3zqqKyvg3aKDgfAszbrlpDrhFR1SVfZ6bCm8eANsHdfHwBWG7uN+OHhgvQna1IrIy
	 3cPGmx0Q4l7asNp/GPKuyAOHElOcWb4WRdntGVh+7xdP7HNvyEibBNdd30/3Vveo0M
	 qEJPjiSK4EWycMuP37Gbfs2d/HpsU5vyD2qn0zKsI5Cz5pFa9jqo8OzmIfwTbgJRh5
	 PplvHgfYfWDiNc/V7Cnfvfy090VUC7fWEr4CAVX4JOsgmGSFhWeVpHtSGLtX5ee4/9
	 maGtETNL4mPqIHAN/1lB9g+MM46/pA30ewtR39hvpcdWvn2MRwL84LktIgEAgseiWZ
	 nKr7j/GA+tNKQwZW8Rg5nDCdBa5oPkzIYj4StNQfnbdzUw26lhTPCC1skMfSqhiPkv
	 iLZY59KMULXMCKzpqj777xlb69vdnn4RLsShHIY+mVb/tWlx7+bpAPoIV6VaQry2ta
	 JfmOg2wrtfuKvCnvfc3IEBFoTpAn+MxIF+p1+A1AKQg2RocKQFX8UU+QsHwkpoc2sS
	 t4t1unxxcakebdPBMeWEa2hw=
Date: Fri, 8 May 2020 13:56:10 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Claude Bing <cbing@cybernetics.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
Message-ID: <20200508105610.GA8452@localhost>
References: <20200507142806.48643a47@cy-rd-cb>
MIME-Version: 1.0
In-Reply-To: <20200507142806.48643a47@cy-rd-cb>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 07, 2020 at 02:28:06PM -0400, Claude Bing wrote:
> Explicitly specifying -lrt is required for opcache to be linked against
> the proper dependencies.  Additionally, PHP disables libdl when it
> detects a cross-compilation environment for some reason.  In order to
> load any type of extension, re-enabling libdl is required.
>...
> +# link against librt (libc) if opcache is specified in order to avoid the
> +# following error:
> +# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
> +LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"

Is this actually a bug in 0001-opcache-config.m4-enable-opcache.patch
and should instead be fixed there?

-    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
-    AC_MSG_RESULT([yes])
-    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
+  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])

I would guess re-adding the PHP_CHECK_LIBRARY fixes your problem?

> +# Adding these flags enables dynamic library support, which is disabled by
> +# default when cross compiling
> +# See https://bugs.php.net/bug.php?id=60109
> +CFLAGS += " -DHAVE_LIBDL "
> +LDFLAGS += " -ldl "
> +
>...

The linked PHP bug was closed in 2018 due to lack of feedback.

cu
Adrian
