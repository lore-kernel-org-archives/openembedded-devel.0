Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3036022E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:36:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 133so12456836wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 23:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6ajqW68gRfpA0m5ir4G1JmKZIHondDQW2do/zFcKv9s=;
	b=tKEw+qxTOtcVv+7bmPC/4/r0mV7biaOvrJDgsRqFlL2Z0Vi2z+GOSwQyz2I1a3Ejx1
	B1PSx6Q2MdoMF2VGCu/Xav2boQE5BL4VG0QZXaruYjAYbcBrsLd9Jx8XscB+IrZUzzAU
	mGhV5PBh/PZ9pXgTEUKFcWB5QYgZRXh4MDVUPUAAoddnOOB7TvUE7kpeyzzgy9S4g3f8
	+IgSXbvGpvAvnW/2A+qEXhbQq/PmrLsan/JQd+k3cBY1uyhKj1FM2k9dCrPiKrYFIQ6f
	FV0cL0hdJ3nJCHuwyZPqI85dIIE/o3Lx/zM3XzEMS9GsjwLdqzHnOCcvvvaqUBOwZRN2
	XB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6ajqW68gRfpA0m5ir4G1JmKZIHondDQW2do/zFcKv9s=;
	b=W6b0sTstR3z2EVLIRAC2rSzDAwmP3hdRGXikIcELZkC0rIpgCI+kq01vc0MnoKX2D6
	r4baH58dKprFxWs36V5ZyWtzRnt/Zzl2Xa0LJ3sHjIwGFPU6SUeRnRYLrDo6mIF2Zu7h
	uXzO3lNaPqeSNH15Sh+JImpjanZj64XbzpIgAN4touBk0uhMAzZCudSwpuYo5b2bJKtz
	+lnY48JnjeTc0xEZc7XZ27Nk9+D5w8mm04OAK57FiX9t5aeA+M5I0RtZSwPWtpmjOLtd
	oNiAC3sadnOUMZPi8SC1NaP2wC4PzGg5z9pH8kii+sy10swlIe6QUeEQQoQyq2zg0Dlh
	BqDg==
X-Gm-Message-State: AA6/9RkqZBT+Ffn+XfUcfwC4b2SC2NriUA503fYqXsw4J0W4ancln0sCycKutxQKZQY/ZA==
X-Received: by 10.28.152.135 with SMTP id a129mr12235774wme.66.1474871820038; 
	Sun, 25 Sep 2016 23:37:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	n131sm9473338wmd.3.2016.09.25.23.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Sep 2016 23:36:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Sep 2016 08:37:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160926063704.GB2631@jama>
References: <1474646333-26474-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1474646333-26474-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
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
X-List-Received-Date: Mon, 26 Sep 2016 06:37:01 -0000
X-Groupsio-MsgNum: 63283
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline

--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2016 at 05:58:53PM +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>=20
> - struct timeval is defined in sys/time.h with a musl libc.
> - include fcntl.h without the conditional checking.

Please rebase,retest and resend if needed with newer version as well:


OE @ ~/meta-openembedded $ pwam 132237
2016-09-26 08:35:27 URL:https://patchwork.openembedded.org/patch/132237/mbo=
x/ [3351] -> "pw-am-132237.patch" [1]
Applying: rsyslog: fix building with musl libc
=2Egit/rebase-apply/patch:40: trailing whitespace.
=20
=2Egit/rebase-apply/patch:69: trailing whitespace.
=20
=2Egit/rebase-apply/patch:71: trailing whitespace.
=20
=2Egit/rebase-apply/patch:72: trailing whitespace.
--=20
=2Egit/rebase-apply/patch:74: new blank line at EOF.
+
error: meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb: does not exist in=
 index
Patch failed at 0001 rsyslog: fix building with musl libc
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

OE @ ~/meta-openembedded $ git log --pretty=3Dfuller meta-oe/recipes-extend=
ed/rsyslog/=20
commit b2d3dacc5e56de23195a98929cb21e5abf1e2812
Author:     Wenzong Fan <wenzong.fan@windriver.com>
AuthorDate: Tue Sep 20 01:57:25 2016 -0400
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Mon Sep 26 08:29:13 2016 +0200

    rsyslog: upgrade to 7.6.7


>=20
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  .../rsyslog/rsyslog/fix_build_with_musl.patch      | 62 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb  |  2 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_wi=
th_musl.patch
>=20
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl=
=2Epatch b/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.pat=
ch
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
> +=20
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
> +-#	include <fcntl.h>
> +-#endif
> ++#include <fcntl.h>
> + #ifdef HAVE_ATOMIC_BUILTINS
> + #	include <pthread.h>
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
> +=20
> + #include "srUtils.h"
> +=20
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/=
recipes-extended/rsyslog/rsyslog_7.6.1.bb
> index c1d923c..48c1056 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
> @@ -30,6 +30,8 @@ SRC_URI =3D "http://www.rsyslog.com/download/files/down=
load/rsyslog/${BPN}-${PV}.t
>             file://enable_tls_ptests.patch \
>  "
> =20
> +SRC_URI_append_libc-musl =3D " file://fix_build_with_musl.patch"
> +
>  SRC_URI[md5sum] =3D "093c462a5245012bd9e7b82dd8aedffb"
>  SRC_URI[sha256sum] =3D "357f089d866c351d5fe5b7139fa85b010223d77b3c21f29b=
2a1baa8688926111"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfowgQACgkQN1Ujt2V2gBx9wgCeJhSs3LZh6g7zvzL12dtUC4+4
QEMAoIGE7K7xR09zQ+8lsMyQJ/756+6e
=iwU0
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
