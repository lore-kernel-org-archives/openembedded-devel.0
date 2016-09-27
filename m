Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 13E5C60119
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 21:10:01 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 192so955474vkl.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PNscQ0WH1qMK/J1yLhSffASVzA60/CHiW63Zmj/Vt74=;
	b=FQms3Ifb3qQje836aB/H/2gadZgyGDcKuTL22vcfmdkb9T1vXmFLoW2EXbVDfent60
	WaBX1i55Mm+DCQDjXUR9MDLTRUxmoY7moRO2MmGOdXo/2DT6mZQwrTU/5JKlnFBXO7TG
	29rZCrm1MriPzLEb+fLx6oYN8/VcUejOKk9nSitXcgOlvDE/V7OLWHwjLg6jHu0QRe3U
	lvCtjkiJQJS1vXtcEh+uBhPEoWLhwTL/3dICt/+8bN8/8zesmMEjrrR3V3pbNWKCPKKt
	e5q9bXmssCyubHcd6R31wpBqRj8cEEaK/0roAyxcwoobdOV0kxdJPqqeVFHPIouJx4M6
	Q8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PNscQ0WH1qMK/J1yLhSffASVzA60/CHiW63Zmj/Vt74=;
	b=FnrAI63C/Lr/AjirisGLJIwjfdTz1U9sxx4GVXEoir7sOhbHTAC7gRJZYUSJioe208
	bUBZlSjftsACyABv6KVkN9cuZ+LB8cTONPCFFiphqe2sohIBs16SjZiPoDKyeo4hSAwh
	tVYZaAH4svb7+C4MWPjBd3L3qwOQOGYGkDCp60DHcTCICoLyXAd8zCqmsZq/9KFC6o1b
	KzRVzqcXaxdAtI5lxuGGTJX2Aqiq1s39R2WwcrwYVL/6H/Qlj1vWJmcmVz5u1nY3QP7S
	9JmOk6914ivZRbshI+cb2Qjz1a5OLoCbvzw4nKF31YLnM4ScaU7A3dccYVhSswuOpFao
	V7Ig==
X-Gm-Message-State: AA6/9RnGaOww5lhHWHZSFZ3ISIFXfOkBb4zHUszm+D4Tk+nh4lZ97kucL0J4Q2s2txnHU8RWfimSh0B1NndsCA==
X-Received: by 10.31.244.9 with SMTP id s9mr14780484vkh.31.1475010602855; Tue,
	27 Sep 2016 14:10:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Tue, 27 Sep 2016 14:09:32 -0700 (PDT)
In-Reply-To: <1474906892-3842-1-git-send-email-liu.ming50@gmail.com>
References: <1474906892-3842-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2016 14:09:32 -0700
Message-ID: <CAMKF1so1SiYrOPACkPR8j8TZHnuf9xWD3PLhMqK1z7wTxB+F9g@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] atftp: fixes musl libc build
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
X-List-Received-Date: Tue, 27 Sep 2016 21:10:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 26, 2016 at 9:21 AM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> The patches derive from buildroot:
> https://git.busybox.net/buildroot/commit/?id=ef33c008e3c5048d1442f8b0f6336db2fa8d79a1
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  ...gz.h-fix-musl-compile-add-missing-defines.patch | 45 ++++++++++++++++++++++
>  ...-tftpd.h-fix-musl-compile-missing-include.patch | 43 +++++++++++++++++++++
>  meta-networking/recipes-daemons/atftp/atftp_git.bb |  4 ++
>  3 files changed, 92 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
>  create mode 100644 meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
>
> diff --git a/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch b/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
> new file mode 100644
> index 0000000..cfa8a73
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
> @@ -0,0 +1,45 @@
> +From 543e67919f5cacf309ac88ab091331e41af4224b Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Thu, 16 Apr 2015 22:41:57 +0200
> +Subject: [PATCH] argz.h: fix musl compile (add missing defines)
> +
> +Upstream-Status: Pending
> +
> +Add __THROW, __BEGIN_DECLS, __END_DECLS and __attribute_pure__ defines.
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> +---
> + argz.h | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/argz.h b/argz.h
> +index 582be55..bdf9f62 100644
> +--- a/argz.h
> ++++ b/argz.h
> +@@ -48,6 +48,22 @@
> + # define __const const
> + #endif
> +
> ++#ifndef __THROW
> ++# define __THROW
> ++#endif
> ++
> ++#ifndef __BEGIN_DECLS
> ++# define __BEGIN_DECLS
> ++#endif
> ++
> ++#ifndef __END_DECLS
> ++# define __END_DECLS
> ++#endif

These probably are not needed, you can just use

#ifdef __cplusplus
extern "C" {
#endif

and

#ifdef __cplusplus
}
#endif

read through. http://wiki.musl-libc.org/wiki/FAQ
for more details.



> ++
> ++#ifndef __attribute_pure__
> ++# define __attribute_pure__
> ++#endif
> ++
> + #ifndef __error_t_defined
> + typedef int error_t;
> + #endif
> +--
> +2.1.4
> +
> diff --git a/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch b/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
> new file mode 100644
> index 0000000..093054c
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
> @@ -0,0 +1,43 @@
> +From 77e399899d9d7297d23c321811b628febdf0fd92 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Thu, 16 Apr 2015 22:43:49 +0200
> +Subject: [PATCH] tftp.h/tftpd.h: fix musl compile (missing include)
> +
> +Upstream-Status: Pending
> +
> +Add sys/types.h include for u_char typedef.
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> +---
> + tftp.h  | 1 +
> + tftpd.h | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/tftp.h b/tftp.h
> +index 12bd6aa..32a3f63 100644
> +--- a/tftp.h
> ++++ b/tftp.h
> +@@ -19,6 +19,7 @@
> +
> + #include <sys/time.h>
> + #include <sys/times.h>
> ++#include <sys/types.h>
> + #include "tftp_def.h"
> + #include "config.h"
> +
> +diff --git a/tftpd.h b/tftpd.h
> +index 945065e..60d3a49 100644
> +--- a/tftpd.h
> ++++ b/tftpd.h
> +@@ -20,6 +20,7 @@
> + #include <pthread.h>
> + #include <arpa/tftp.h>
> + #include <arpa/inet.h>
> ++#include <sys/types.h>
> + #include "tftp_io.h"
> +
> + /*
> +--
> +2.1.4
> +
> diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> index b222c34..a9949d5 100644
> --- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
> +++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> @@ -15,6 +15,10 @@ SRC_URI = "git://git.code.sf.net/p/atftp/code \
>             file://atftpd.service \
>             file://atftp-0.7-sorcerers_apprentice.patch \
>  "
> +SRC_URI_append_libc-musl = " file://0001-argz.h-fix-musl-compile-add-missing-defines.patch \
> +                             file://0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch \
> +                           "
> +


Dont make them musl specific, they should be fine for glibc, if not
then fix them such that they are
>  S = "${WORKDIR}/git"
>
>  inherit autotools update-rc.d systemd
> --
> 1.9.1
>

