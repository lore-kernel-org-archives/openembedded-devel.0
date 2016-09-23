Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 493376E64A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 18:37:54 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id u68so2193690uau.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 11:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=813HB3BvwV8/imEl6pA5Q5zTxrKr/7Y4CEtDRjdWFy0=;
	b=kbhFWFL5XvD62ZKldI1xyzaw5o73ZwWWrn9u38dpxVPZqWFvYo6+ndrJxx4Judgtr/
	Z0GhPj0VcbEE3wvv3YgQ9EJD32rtaO17BrGGCc/5zl/f2OybRxGRwdQIeikMaNNY+/yS
	0gviAZxKDxXrik7YqY6VNaDxuRmLQZhlWZ0iuvsMXI8gyx6guXFNET6QFtFQK9bTsvd1
	cxlpZhIpaZims1M4Nr7QuAqx0Es9B86u7idF3wSMG1NwuMfofAq9CZN7YC4Yrwni2NIM
	mpHesc3zbwxfVrVuyceJUeUdzhIMAcu3R2lvWGHX3Dj9KijGHG8MzwtMSHo2gqEqlepo
	3JfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=813HB3BvwV8/imEl6pA5Q5zTxrKr/7Y4CEtDRjdWFy0=;
	b=BQ9aSZAqgIMYC5jRhtJfWsmz7ERWqYKAr5N0//2cAbZ+lMdGJx5+FxvbYrDdkh+J4j
	aXuzRy1g4ioZT0OqV3VUefXGenxrhU0CqJIHJDu0QNQmw6Y8zJUl8cq5Nn0xNzILxx65
	xFinpP+WMwKPwzjx+PJ71CAjnjltx/0zFHqStuK34i2x45l+3eS7C/lJJZtBK9Xntds4
	ztj7bbHXtDkQjIvp71UlbmdkfRYcYdDumOQNAHPfSqCvM41fM53tXMiE09mwyNEWO+vm
	MuR/DE5lIKzT9sHRb/7Lu4IfbAaHBPNSYQ/2icmXytCv4xqUaLBMQX4/PYvuIR6mdPdF
	wYEQ==
X-Gm-Message-State: AA6/9Rl9/4DGgCwkzOKC0rP8KZ6FhePZ62pfqTno6fFu9xpQdxxRWe36TLM3MGXNthuxPY9UwbE8rykEhL2+RQ==
X-Received: by 10.176.2.73 with SMTP id 67mr5749029uas.40.1474655875913; Fri,
	23 Sep 2016 11:37:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Fri, 23 Sep 2016 11:37:25 -0700 (PDT)
In-Reply-To: <1474646333-26474-1-git-send-email-liu.ming50@gmail.com>
References: <1474646333-26474-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Sep 2016 11:37:25 -0700
Message-ID: <CAMKF1so8HK_vnZb4JP6+OOx1ZOMCwmcGKQmB4e5W1jEYvVv6AA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [meta-oe] [PATCH] rsyslog: fix building with musl libc
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
X-List-Received-Date: Fri, 23 Sep 2016 18:37:55 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 23, 2016 at 8:58 AM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> - struct timeval is defined in sys/time.h with a musl libc.
> - include fcntl.h without the conditional checking.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  .../rsyslog/rsyslog/fix_build_with_musl.patch      | 62 ++++++++++++++++++++++
>  meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb  |  2 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
> new file mode 100644
> index 0000000..206ef97
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
> @@ -0,0 +1,62 @@
> +From 51464a1c3522d738f340bef05ed7c68123b66aa5 Mon Sep 17 00:00:00 2001
> +From: Peter Liu <peter.x.liu@external.atlascopco.com>
> +Date: Fri, 23 Sep 2016 17:35:42 +0200
> +Subject: [PATCH] fix building with musl libc
> +
> +- struct timeval is defined in sys/time.h with a musl libc.
> +- include fcntl.h without the conditional checking.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
> +---
> + tests/msleep.c  | 2 +-
> + tools/omfile.c  | 4 +---
> + tools/pidfile.c | 2 --
> + 3 files changed, 2 insertions(+), 6 deletions(-)
> +
> +diff --git a/tests/msleep.c b/tests/msleep.c
> +index 36fa01b..ca818be 100644
> +--- a/tests/msleep.c
> ++++ b/tests/msleep.c
> +@@ -26,7 +26,7 @@
> + #include "config.h"
> + #include <stdio.h>
> + #include <stdlib.h>
> +-#include <time.h>
> ++#include <sys/time.h>
> +
> + int main(int argc, char *argv[])
> + {
> +diff --git a/tools/omfile.c b/tools/omfile.c
> +index 3335067..c20a015 100644
> +--- a/tools/omfile.c
> ++++ b/tools/omfile.c
> +@@ -48,9 +48,7 @@
> + #include <libgen.h>
> + #include <unistd.h>
> + #include <sys/file.h>
> +-#ifdef OS_SOLARIS
> +-#     include <fcntl.h>
> +-#endif
> ++#include <fcntl.h>
> + #ifdef HAVE_ATOMIC_BUILTINS
> + #     include <pthread.h>
> + #endif
> +diff --git a/tools/pidfile.c b/tools/pidfile.c
> +index 8298b94..188cca4 100644
> +--- a/tools/pidfile.c
> ++++ b/tools/pidfile.c
> +@@ -36,9 +36,7 @@
> + #include <string.h>
> + #include <errno.h>
> + #include <signal.h>
> +-#ifdef __sun
> + #include <fcntl.h>
> +-#endif
> +
> + #include "srUtils.h"
> +
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
> index c1d923c..48c1056 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
> @@ -30,6 +30,8 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
>             file://enable_tls_ptests.patch \
>  "
>
> +SRC_URI_append_libc-musl = " file://fix_build_with_musl.patch"

This should be applied unconditionally. Its not musl specific.

> +
>  SRC_URI[md5sum] = "093c462a5245012bd9e7b82dd8aedffb"
>  SRC_URI[sha256sum] = "357f089d866c351d5fe5b7139fa85b010223d77b3c21f29b2a1baa8688926111"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

