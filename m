Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D66071984
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 07:08:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so8923774wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qXKRqrCh4OOQHgFMfJKRmLGxPwJwwpMIxJ7KDgoWf4c=;
	b=mOrNodXya12+4YjHi9Oa5DDwKWEi4BkQ3LrSg2mf8qNd9Q2+fB77gl5+0Vn5O1fg6X
	6ZrS+vs0hBohnb/w3bLBRGguMy77rOAYJlD4tOtqy/K6GFteIW8q7+GLofnixW4depsN
	djQh8FaPilcU+C34BrXYr97FsCXpcNNZkpOCl4hArKSeAzyeeafT5yHUO4Vdoq3nZwKF
	Kg2g2WtweLq8hiQm0TmIH4FfeUjCeIeVqh6SVuxBWVn9Taklqx5gGQ0VFX9xUenqYkCL
	lAVBFjMmHtVkz4+FoCZMtC8A8l3cszSPLCCZB4xERkCB+TdhHotUBGjoor+dsonsy4va
	kdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qXKRqrCh4OOQHgFMfJKRmLGxPwJwwpMIxJ7KDgoWf4c=;
	b=earP5MwihrXuhJROjdrth6FP5qgZ9ldgFUAnfaqXUb8ZVr7x5XUVn6kL0pU4pN6ZrM
	Zr1eJtZgt19QD6/tdTpx+jVH6d1+deXGcuKJ0qgOZ+DgMdSE+YMOIZzBvg1leFkje7+i
	0sMlYI7MwPzBp3jt7vdY44YpSAB+joh73Whc1FJ0m+c6D4BGjKxSTw5p9Ve8gGK5FQOG
	rb3w6rSi9SU3xdyw4WCsmu9VHNjpHpkSoxBVBb630dJYjWRa0pQxI56xZFJeU/aN2Uj/
	Q/SWZX3vN66MoI1hd6Ct47MbS8uiVCZRi8MYUAMe3GxqEYnyJhwAeJpIFnYNhjZ8zw5g
	mZdw==
X-Gm-Message-State: AN3rC/77sjRcz9w9p/hXSZ6woOrg3LWKUcqk9O+uY/F7LUwzAtWF+yL4
	D342IDZE4DYFXg==
X-Received: by 10.28.173.66 with SMTP id w63mr1662649wme.76.1492672104925;
	Thu, 20 Apr 2017 00:08:24 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g11sm6409981wrd.11.2017.04.20.00.08.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Apr 2017 00:08:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Apr 2017 09:08:30 +0200
To: Qi.Chen@windriver.com
Message-ID: <20170420070830.GA3059@jama>
References: <1492509167-18312-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1492509167-18312-1-git-send-email-Qi.Chen@windriver.com>
User-Agent: Mutt/1.8.1 (2017-04-11)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] lvm2: separate libdevmapper to avoid circular dependency
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
X-List-Received-Date: Thu, 20 Apr 2017 07:08:28 -0000
X-Groupsio-MsgNum: 66398
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 05:52:46PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> If we enable 'cryptsetup' PACKAGECONFIG for systemd, there would be
> circular dependency issue among 'systemd', 'cryptsetup' and 'lvm2'.
>=20
> cryptsetup only needs libdevmapper from lvm2. So we separte libdevmapper
> into a new recipe to solve this circular dependency issue.

Seems to break multipath-tools build:
http://errors.yoctoproject.org/Errors/Details/140512/

Also in one of my builds it failed to install with:
| rm: cannot remove lvm2/2.02.166-r0/image/usr/lib/pkgconfig/devmapper.pc: =
No such file or directory

because my lvm2 build didn't have "--enable-pkgconfig" option (we're
using only small part of lvm2), maybe it would be better to use rm -f
when removing devmapper files.

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../0001-Avoid-bashisms-in-init-scripts.patch      | 182 ++++++++++++
>  ...001-implement-libc-specific-reopen_stream.patch |  79 +++++
>  ...0002-Guard-use-of-mallinfo-with-__GLIBC__.patch |  30 ++
>  ...cntl.h-for-O_-defines-and-fcntl-signature.patch |  30 ++
>  ...0004-tweak-MODPROBE_CMD-for-cross-compile.patch |  38 +++
>  meta-oe/recipes-support/lvm2/files/lvm.conf        | 326 +++++++++++++++=
++++++
>  .../recipes-support/lvm2/libdevmapper_2.02.166.bb  |  31 ++
>  meta-oe/recipes-support/lvm2/lvm2.inc              |  75 -----
>  .../lvm2/0001-Avoid-bashisms-in-init-scripts.patch | 182 ------------
>  ...001-implement-libc-specific-reopen_stream.patch |  79 -----
>  ...0002-Guard-use-of-mallinfo-with-__GLIBC__.patch |  30 --
>  ...cntl.h-for-O_-defines-and-fcntl-signature.patch |  30 --
>  ...0004-tweak-MODPROBE_CMD-for-cross-compile.patch |  38 ---
>  meta-oe/recipes-support/lvm2/lvm2/lvm.conf         | 326 ---------------=
------
>  meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb      |  73 +++++
>  15 files changed, 789 insertions(+), 760 deletions(-)
>  create mode 100644 meta-oe/recipes-support/lvm2/files/0001-Avoid-bashism=
s-in-init-scripts.patch
>  create mode 100644 meta-oe/recipes-support/lvm2/files/0001-implement-lib=
c-specific-reopen_stream.patch
>  create mode 100644 meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-=
mallinfo-with-__GLIBC__.patch
>  create mode 100644 meta-oe/recipes-support/lvm2/files/0003-include-fcntl=
=2Eh-for-O_-defines-and-fcntl-signature.patch
>  create mode 100644 meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROB=
E_CMD-for-cross-compile.patch
>  create mode 100644 meta-oe/recipes-support/lvm2/files/lvm.conf
>  create mode 100644 meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
>  delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms=
-in-init-scripts.patch
>  delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc=
-specific-reopen_stream.patch
>  delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-m=
allinfo-with-__GLIBC__.patch
>  delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.=
h-for-O_-defines-and-fcntl-signature.patch
>  delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE=
_CMD-for-cross-compile.patch
>  delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/lvm.conf
>=20
> diff --git a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-in=
it-scripts.patch b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-i=
n-init-scripts.patch
> new file mode 100644
> index 0000000..e86ab25
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scri=
pts.patch
> @@ -0,0 +1,182 @@
> +From 916ea0c70fd063ab7b81f16fd917a75dc02edf4f Mon Sep 17 00:00:00 2001
> +From: Peter Kjellerstedt <pkj@axis.com>
> +Date: Fri, 17 Mar 2017 03:18:28 +0100
> +Subject: [PATCH] Avoid bashisms in init scripts
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +---
> + scripts/blk_availability_init_red_hat.in      | 4 ++--
> + scripts/clvmd_init_red_hat.in                 | 6 +++---
> + scripts/cmirrord_init_red_hat.in              | 4 ++--
> + scripts/lvm2_cluster_activation_red_hat.sh.in | 4 ++--
> + scripts/lvm2_lvmetad_init_red_hat.in          | 4 ++--
> + scripts/lvm2_lvmpolld_init_red_hat.in         | 4 ++--
> + scripts/lvm2_monitoring_init_red_hat.in       | 4 ++--
> + scripts/lvm2_monitoring_init_rhel4            | 4 ++--
> + 8 files changed, 17 insertions(+), 17 deletions(-)
> +
> +diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_avai=
lability_init_red_hat.in
> +index a84ffe7..6b855b7 100644
> +--- a/scripts/blk_availability_init_red_hat.in
> ++++ b/scripts/blk_availability_init_red_hat.in
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
> + #
> +@@ -53,6 +53,6 @@ case "$1" in
> +   status)
> + 	;;
> +   *)
> +-	echo $"Usage: $0 {start|stop|status}"
> ++	echo "Usage: $0 {start|stop|status}"
> + 	;;
> + esac
> +diff --git a/scripts/clvmd_init_red_hat.in b/scripts/clvmd_init_red_hat.=
in
> +index d7f3392..abc8011 100644
> +--- a/scripts/clvmd_init_red_hat.in
> ++++ b/scripts/clvmd_init_red_hat.in
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # clvmd - Clustered LVM Daemon init script
> + #
> +@@ -161,7 +161,7 @@ restart() {
> + 	fi
> + }
> +=20
> +-[ "$EUID" !=3D "0" ] && {
> ++[ "$(id -u)" !=3D "0" ] && {
> + 	echo "clvmd init script can only be executed as root user"
> + 	exit 4
> + }
> +@@ -206,7 +206,7 @@ case "$1" in
> + 	;;
> +=20
> +   *)
> +-	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|re=
load|force-reload}"
> ++	echo "Usage: $0 {start|stop|status|restart|condrestart|try-restart|rel=
oad|force-reload}"
> + 	rtrn=3D2
> + 	;;
> + esac
> +diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_re=
d_hat.in
> +index d4b7e37..d442cbc 100755
> +--- a/scripts/cmirrord_init_red_hat.in
> ++++ b/scripts/cmirrord_init_red_hat.in
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # chkconfig: - 22 78
> + # description: Starts and stops cmirrord
> +@@ -101,7 +101,7 @@ case "$1" in
> + 		;;
> +=20
> + 	*)
> +-		echo $"Usage: $0 {start|stop|restart|status}"
> ++		echo "Usage: $0 {start|stop|restart|status}"
> + 		;;
> + esac
> +=20
> +diff --git a/scripts/lvm2_cluster_activation_red_hat.sh.in b/scripts/lvm=
2_cluster_activation_red_hat.sh.in
> +index abea026..d8cba2e 100644
> +--- a/scripts/lvm2_cluster_activation_red_hat.sh.in
> ++++ b/scripts/lvm2_cluster_activation_red_hat.sh.in
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> +=20
> + sbindir=3D@sbindir@
> +=20
> +@@ -54,7 +54,7 @@ case "$1" in
> + 	rtrn=3D$?
> + 	;;
> +   *)
> +-	echo $"Usage: $0 {activate|deactivate}"
> ++	echo "Usage: $0 {activate|deactivate}"
> + 	rtrn=3D3
> + 	;;
> + esac
> +diff --git a/scripts/lvm2_lvmetad_init_red_hat.in b/scripts/lvm2_lvmetad=
_init_red_hat.in
> +index b2f5d50..96269a9 100644
> +--- a/scripts/lvm2_lvmetad_init_red_hat.in
> ++++ b/scripts/lvm2_lvmetad_init_red_hat.in
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
> + #
> +@@ -105,7 +105,7 @@ case "$1" in
> + 	;;
> +=20
> +   *)
> +-	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restar=
t|status}"
> ++	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart=
|status}"
> + 	;;
> + esac
> +=20
> +diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpol=
ld_init_red_hat.in
> +index c521955..cdbaece 100644
> +--- a/scripts/lvm2_lvmpolld_init_red_hat.in
> ++++ b/scripts/lvm2_lvmpolld_init_red_hat.in
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # Copyright (C) 2015 Red Hat, Inc. All rights reserved.
> + #
> +@@ -107,7 +107,7 @@ case "$1" in
> + 	;;
> +=20
> +   *)
> +-	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restar=
t|status}"
> ++	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart=
|status}"
> + 	;;
> + esac
> +=20
> +diff --git a/scripts/lvm2_monitoring_init_red_hat.in b/scripts/lvm2_moni=
toring_init_red_hat.in
> +index de7ff0d..9ff6bb7 100644
> +--- a/scripts/lvm2_monitoring_init_red_hat.in
> ++++ b/scripts/lvm2_monitoring_init_red_hat.in
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # Copyright (C) 2007-2009 Red Hat, Inc. All rights reserved.
> + #
> +@@ -128,7 +128,7 @@ case "$1" in
> + 	;;
> +=20
> +   *)
> +-	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
> ++	echo "Usage: $0 {start|stop|restart|status|force-stop}"
> + 	;;
> + esac
> +=20
> +diff --git a/scripts/lvm2_monitoring_init_rhel4 b/scripts/lvm2_monitorin=
g_init_rhel4
> +index 8eb06c5..2e8d0f7 100644
> +--- a/scripts/lvm2_monitoring_init_rhel4
> ++++ b/scripts/lvm2_monitoring_init_rhel4
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # Copyright (C) 2007 Red Hat, Inc. All rights reserved.
> + #
> +@@ -93,7 +93,7 @@ case "$1" in
> + 	;;
> +=20
> +   *)
> +-	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
> ++	echo "Usage: $0 {start|stop|restart|status|force-stop}"
> + 	;;
> + esac
> +=20
> +--=20
> +2.12.0
> +
> diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-speci=
fic-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement=
-libc-specific-reopen_stream.patch
> new file mode 100644
> index 0000000..5d72402
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reo=
pen_stream.patch
> @@ -0,0 +1,79 @@
> +From e3103459416616d3b8508e7176e897b0ae6c90f2 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Tue, 25 Oct 2016 11:49:40 +0000
> +Subject: [PATCH] implement libc specific reopen_stream
> +
> +musl defines stdin/stdio/stderr as constant types which means
> +we can not assign to them as we are doing here but works ok with glibc
> +therefore abstract out the _reopen_stream definition depending upon if
> +we are using glibc or otherwise
> +
> +Origin:
> +http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.pa=
tch
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +
> +---
> + lib/log/log.c      | 6 ++++++
> + tools/lvmcmdline.c | 6 +++---
> + 2 files changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/log/log.c b/lib/log/log.c
> +index c933154..3581084 100644
> +--- a/lib/log/log.c
> ++++ b/lib/log/log.c
> +@@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(=
FILE *old_stream, FILE *new_
> +  * Close and reopen standard stream on file descriptor fd.
> +  */
> + int reopen_standard_stream(FILE **stream, const char *mode)
> ++#ifdef __GLIBC__
> + {
> + 	int fd, fd_copy, new_fd;
> + 	const char *name;
> +@@ -207,6 +208,11 @@ int reopen_standard_stream(FILE **stream, const cha=
r *mode)
> + 	*stream =3D new_stream;
> + 	return 1;
> + }
> ++#else
> ++{
> ++	return (freopen(NULL, mode, *stream) !=3D NULL);
> ++}
> ++#endif
> +=20
> + void init_log_fn(lvm2_log_fn_t log_fn)
> + {
> +diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
> +index 9a4deb7..f1f18e6 100644
> +--- a/tools/lvmcmdline.c
> ++++ b/tools/lvmcmdline.c
> +@@ -1818,7 +1818,7 @@ static int _check_standard_fds(void)
> + 	int err =3D is_valid_fd(STDERR_FILENO);
> +=20
> + 	if (!is_valid_fd(STDIN_FILENO) &&
> +-	    !(stdin =3D fopen(_PATH_DEVNULL, "r"))) {
> ++	    !freopen(_PATH_DEVNULL, "r", stdin)) {
> + 		if (err)
> + 			perror("stdin stream open");
> + 		else
> +@@ -1828,7 +1828,7 @@ static int _check_standard_fds(void)
> + 	}
> +=20
> + 	if (!is_valid_fd(STDOUT_FILENO) &&
> +-	    !(stdout =3D fopen(_PATH_DEVNULL, "w"))) {
> ++	    !freopen(_PATH_DEVNULL, "w", stdout)) {
> + 		if (err)
> + 			perror("stdout stream open");
> + 		/* else no stdout */
> +@@ -1836,7 +1836,7 @@ static int _check_standard_fds(void)
> + 	}
> +=20
> + 	if (!is_valid_fd(STDERR_FILENO) &&
> +-	    !(stderr =3D fopen(_PATH_DEVNULL, "w"))) {
> ++	    !freopen(_PATH_DEVNULL, "w", stderr)) {
> + 		printf("stderr stream open: %s\n",
> + 		       strerror(errno));
> + 		return 0;
> +--=20
> +2.12.0
> +
> diff --git a/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinf=
o-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-=
of-mallinfo-with-__GLIBC__.patch
> new file mode 100644
> index 0000000..95dcede
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-=
__GLIBC__.patch
> @@ -0,0 +1,30 @@
> +From 3ae9c0b607ec33fb07f32a41e9d28cc9068dd39a Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Tue, 25 Oct 2016 11:52:44 +0000
> +Subject: [PATCH] Guard use of mallinfo() with __GLIBC__
> +
> +This API is glibc-only
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +
> +---
> + lib/mm/memlock.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
> +index da90144..f34f890 100644
> +--- a/lib/mm/memlock.c
> ++++ b/lib/mm/memlock.c
> +@@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
> +=20
> + static void _allocate_memory(void)
> + {
> +-#ifndef VALGRIND_POOL
> ++#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
> + 	void *stack_mem;
> + 	struct rlimit limit;
> + 	int i, area =3D 0, missing =3D _size_malloc_tmp, max_areas =3D 32, hbl=
ks;
> +--=20
> +2.12.0
> +
> diff --git a/meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-=
O_-defines-and-fcntl-signature.patch b/meta-oe/recipes-support/lvm2/files/0=
003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
> new file mode 100644
> index 0000000..9ab1c06
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defi=
nes-and-fcntl-signature.patch
> @@ -0,0 +1,30 @@
> +From b1ad91a059d99afd1ce25823b7c0a8d3ac63d2fd Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Tue, 25 Oct 2016 11:55:49 +0000
> +Subject: [PATCH 3/4] include fcntl.h for O_* defines and fcntl() signatu=
re
> +
> +On glibc _somehow_ this header gets pulled in indirectly
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> +Upstream-Status: Pending
> +---
> + libdaemon/server/daemon-server.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-=
server.c
> +index 6af6de9..a9590e7 100644
> +--- a/libdaemon/server/daemon-server.c
> ++++ b/libdaemon/server/daemon-server.c
> +@@ -18,6 +18,7 @@
> + #include "daemon-server.h"
> + #include "daemon-log.h"
> +=20
> ++#include <fcntl.h>
> + #include <dlfcn.h>
> + #include <errno.h>
> + #include <pthread.h>
> +--=20
> +2.9.3
> +
> diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-f=
or-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODP=
ROBE_CMD-for-cross-compile.patch
> new file mode 100644
> index 0000000..aaeaa72
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cros=
s-compile.patch
> @@ -0,0 +1,38 @@
> +From 0012ea63f6070a5d41fa380970f9c30b953237d2 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Tue, 25 Oct 2016 11:59:40 +0000
> +Subject: [PATCH 4/4] tweak MODPROBE_CMD for cross compile
> +
> +Lvm uses variable MODPROBE_CMD at runtime, so build time detection of mo=
dprobe
> +is incorrect.
> +------
> +|lvm lvcreate --thinpool wrl/pool00 --size 5556m --config  devices
> +{ preferred_names=3D["^/dev/mapper/", "^/dev/md/", "^/dev/sd"]
> +filter=3D["r|/loop1$|","r|/loop2$|","r|/loop3$|","r|/loop4$|","r|/loop5$=
|","r|/loop6$|","r|/loop7$|"] }
> +|tmp/sysroots/x86_64-linux/usr/bin/modprobe: execvp failed: No such file=
 or directory
> +|tmp/sysroots/x86_64-linux/usr/bin/modprobe failed: 2
> +------
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + configure.in | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/configure.in b/configure.in
> +index cc77aab..a3579f2 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1853,7 +1853,6 @@ if test "$UDEV_SYNC" =3D yes; then
> + fi
> +=20
> + #######################################################################=
#########
> +-AC_PATH_TOOL(MODPROBE_CMD, modprobe)
> +=20
> + if test -n "$MODPROBE_CMD"; then
> + 	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'mo=
dprobe', if available.])
> +--=20
> +2.9.3
> +
> diff --git a/meta-oe/recipes-support/lvm2/files/lvm.conf b/meta-oe/recipe=
s-support/lvm2/files/lvm.conf
> new file mode 100644
> index 0000000..9e3b5fe
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/files/lvm.conf
> @@ -0,0 +1,326 @@
> +# This is an example configuration file for the LVM2 system.
> +# It contains the default settings that would be used if there was no
> +# /etc/lvm/lvm.conf file.
> +#
> +# Refer to 'man lvm.conf' for further information including the file lay=
out.
> +#
> +# To put this file in a different directory and override /etc/lvm set
> +# the environment variable LVM_SYSTEM_DIR before running the tools.
> +
> +
> +# This section allows you to configure which block devices should
> +# be used by the LVM system.
> +devices {
> +
> +    # Where do you want your volume groups to appear ?
> +    dir =3D "/dev"
> +
> +    # An array of directories that contain the device nodes you wish
> +    # to use with LVM2.
> +    scan =3D [ "/dev" ]
> +
> +    # A filter that tells LVM2 to only use a restricted set of devices.
> +    # The filter consists of an array of regular expressions.  These
> +    # expressions can be delimited by a character of your choice, and
> +    # prefixed with either an 'a' (for accept) or 'r' (for reject).
> +    # The first expression found to match a device name determines if
> +    # the device will be accepted or rejected (ignored).  Devices that
> +    # don't match any patterns are accepted.
> +
> +    # Be careful if there there are symbolic links or multiple filesyste=
m=20
> +    # entries for the same device as each name is checked separately aga=
inst
> +    # the list of patterns.  The effect is that if any name matches any =
'a'
> +    # pattern, the device is accepted; otherwise if any name matches any=
 'r'
> +    # pattern it is rejected; otherwise it is accepted.
> +
> +    # Don't have more than one filter line active at once: only one gets=
 used.
> +
> +    # Run vgscan after you change this parameter to ensure that
> +    # the cache file gets regenerated (see below).
> +    # If it doesn't do what you expect, check the output of 'vgscan -vvv=
v'.
> +
> +
> +    # By default we accept every block device:
> +    filter =3D [ "a/.*/" ]
> +
> +    # Exclude the cdrom drive
> +    # filter =3D [ "r|/dev/cdrom|" ]
> +
> +    # When testing I like to work with just loopback devices:
> +    # filter =3D [ "a/loop/", "r/.*/" ]
> +
> +    # Or maybe all loops and ide drives except hdc:
> +    # filter =3D[ "a|loop|", "r|/dev/hdc|", "a|/dev/ide|", "r|.*|" ]
> +
> +    # Use anchors if you want to be really specific
> +    # filter =3D [ "a|^/dev/hda8$|", "r/.*/" ]
> +
> +    # The results of the filtering are cached on disk to avoid
> +    # rescanning dud devices (which can take a very long time).  By
> +    # default this cache file is hidden in the /etc/lvm directory.
> +    # It is safe to delete this file: the tools regenerate it.
> +    cache =3D "/etc/lvm/.cache"
> +
> +    # You can turn off writing this cache file by setting this to 0.
> +    write_cache_state =3D 1
> +
> +    # Advanced settings.
> +
> +    # List of pairs of additional acceptable block device types found=20
> +    # in /proc/devices with maximum (non-zero) number of partitions.
> +    # types =3D [ "fd", 16 ]
> +
> +    # If sysfs is mounted (2.6 kernels) restrict device scanning to=20
> +    # the block devices it believes are valid.
> +    # 1 enables; 0 disables.
> +    sysfs_scan =3D 1=09
> +
> +    # By default, LVM2 will ignore devices used as components of
> +    # software RAID (md) devices by looking for md superblocks.
> +    # 1 enables; 0 disables.
> +    md_component_detection =3D 1
> +}
> +
> +# This section that allows you to configure the nature of the
> +# information that LVM2 reports.
> +log {
> +
> +    # Controls the messages sent to stdout or stderr.
> +    # There are three levels of verbosity, 3 being the most verbose.
> +    verbose =3D 0
> +
> +    # Should we send log messages through syslog?
> +    # 1 is yes; 0 is no.
> +    syslog =3D 1
> +
> +    # Should we log error and debug messages to a file?
> +    # By default there is no log file.
> +    #file =3D "/var/log/lvm2.log"
> +
> +    # Should we overwrite the log file each time the program is run?
> +    # By default we append.
> +    overwrite =3D 0
> +
> +    # What level of log messages should we send to the log file and/or s=
yslog?
> +    # There are 6 syslog-like log levels currently in use - 2 to 7 inclu=
sive.
> +    # 7 is the most verbose (LOG_DEBUG).
> +    level =3D 0
> +   =20
> +    # Format of output messages
> +    # Whether or not (1 or 0) to indent messages according to their seve=
rity
> +    indent =3D 1
> +
> +    # Whether or not (1 or 0) to display the command name on each line o=
utput
> +    command_names =3D 0
> +
> +    # A prefix to use before the message text (but after the command nam=
e,
> +    # if selected).  Default is two spaces, so you can see/grep the seve=
rity
> +    # of each message.
> +    prefix =3D "  "
> +
> +    # To make the messages look similar to the original LVM tools use:
> +    #   indent =3D 0
> +    #   command_names =3D 1
> +    #   prefix =3D " -- "
> +
> +    # Set this if you want log messages during activation.
> +    # Don't use this in low memory situations (can deadlock).
> +    # activation =3D 0
> +}
> +
> +# Configuration of metadata backups and archiving.  In LVM2 when we
> +# talk about a 'backup' we mean making a copy of the metadata for the
> +# *current* system.  The 'archive' contains old metadata configurations.
> +# Backups are stored in a human readeable text format.
> +backup {
> +
> +    # Should we maintain a backup of the current metadata configuration ?
> +    # Use 1 for Yes; 0 for No.
> +    # Think very hard before turning this off!
> +    backup =3D 1
> +
> +    # Where shall we keep it ?
> +    # Remember to back up this directory regularly!
> +    backup_dir =3D "/etc/lvm/backup"
> +
> +    # Should we maintain an archive of old metadata configurations.
> +    # Use 1 for Yes; 0 for No.
> +    # On by default.  Think very hard before turning this off.
> +    archive =3D 1
> +
> +    # Where should archived files go ?
> +    # Remember to back up this directory regularly!
> +    archive_dir =3D "/etc/lvm/archive"
> +   =20
> +    # What is the minimum number of archive files you wish to keep ?
> +    retain_min =3D 10
> +
> +    # What is the minimum time you wish to keep an archive file for ?
> +    retain_days =3D 30
> +}
> +
> +# Settings for the running LVM2 in shell (readline) mode.
> +shell {
> +
> +    # Number of lines of history to store in ~/.lvm_history
> +    history_size =3D 100
> +}
> +
> +
> +# Miscellaneous global LVM2 settings
> +global {
> +   =20
> +    # The file creation mask for any files and directories created.
> +    # Interpreted as octal if the first digit is zero.
> +    umask =3D 077
> +
> +    # Allow other users to read the files
> +    #umask =3D 022
> +
> +    # Enabling test mode means that no changes to the on disk metadata
> +    # will be made.  Equivalent to having the -t option on every
> +    # command.  Defaults to off.
> +    test =3D 0
> +
> +    # Whether or not to communicate with the kernel device-mapper.
> +    # Set to 0 if you want to use the tools to manipulate LVM metadata=
=20
> +    # without activating any logical volumes.
> +    # If the device-mapper kernel driver is not present in your kernel
> +    # setting this to 0 should suppress the error messages.
> +    activation =3D 1
> +
> +    # If we can't communicate with device-mapper, should we try running=
=20
> +    # the LVM1 tools?
> +    # This option only applies to 2.4 kernels and is provided to help you
> +    # switch between device-mapper kernels and LVM1 kernels.
> +    # The LVM1 tools need to be installed with .lvm1 suffices
> +    # e.g. vgscan.lvm1 and they will stop working after you start using
> +    # the new lvm2 on-disk metadata format.
> +    # The default value is set when the tools are built.
> +    # fallback_to_lvm1 =3D 0
> +
> +    # The default metadata format that commands should use - "lvm1" or "=
lvm2".
> +    # The command line override is -M1 or -M2.
> +    # Defaults to "lvm1" if compiled in, else "lvm2".
> +    # format =3D "lvm1"
> +
> +    # Location of proc filesystem
> +    proc =3D "/proc"
> +
> +    # Type of locking to use. Defaults to file-based locking (1).
> +    # Turn locking off by setting to 0 (dangerous: risks metadata corrup=
tion
> +    # if LVM2 commands get run concurrently).
> +    locking_type =3D 1
> +
> +    # Local non-LV directory that holds file-based locks while commands =
are
> +    # in progress.  A directory like /tmp that may get wiped on reboot i=
s OK.
> +    locking_dir =3D "/var/lock/lvm"
> +
> +    # Other entries can go here to allow you to load shared libraries
> +    # e.g. if support for LVM1 metadata was compiled as a shared library=
 use
> +    #   format_libraries =3D "liblvm2format1.so"=20
> +    # Full pathnames can be given.
> +
> +    # Search this directory first for shared libraries.
> +    #   library_dir =3D "/lib"
> +}
> +
> +activation {
> +    # Device used in place of missing stripes if activating incomplete v=
olume.
> +    # For now, you need to set this up yourself first (e.g. with 'dmsetu=
p')
> +    # For example, you could make it return I/O errors using the 'error'=
=20
> +    # target or make it return zeros.
> +    missing_stripe_filler =3D "/dev/ioerror"
> +
> +    # Size (in KB) of each copy operation when mirroring
> +    mirror_region_size =3D 512
> +
> +    # How much stack (in KB) to reserve for use while devices suspended
> +    reserved_stack =3D 256
> +
> +    # How much memory (in KB) to reserve for use while devices suspended
> +    reserved_memory =3D 8192
> +
> +    # Nice value used while devices suspended
> +    process_priority =3D -18
> +
> +    # If volume_list is defined, each LV is only activated if there is a
> +    # match against the list.
> +    #   "vgname" and "vgname/lvname" are matched exactly.
> +    #   "@tag" matches any tag set in the LV or VG.
> +    #   "@*" matches if any tag defined on the host is also set in the L=
V or VG
> +    #
> +    # volume_list =3D [ "vg1", "vg2/lvol1", "@tag1", "@*" ]
> +}
> +
> +
> +####################
> +# Advanced section #
> +####################
> +
> +# Metadata settings
> +#
> +# metadata {
> +    # Default number of copies of metadata to hold on each PV.  0, 1 or =
2.
> +    # You might want to override it from the command line with 0=20
> +    # when running pvcreate on new PVs which are to be added to large VG=
s.
> +
> +    # pvmetadatacopies =3D 1
> +
> +    # Approximate default size of on-disk metadata areas in sectors.
> +    # You should increase this if you have large volume groups or
> +    # you want to retain a large on-disk history of your metadata change=
s.
> +
> +    # pvmetadatasize =3D 255
> +
> +    # List of directories holding live copies of text format metadata.
> +    # These directories must not be on logical volumes!
> +    # It's possible to use LVM2 with a couple of directories here,
> +    # preferably on different (non-LV) filesystems, and with no other=20
> +    # on-disk metadata (pvmetadatacopies =3D 0). Or this can be in
> +    # addition to on-disk metadata areas.
> +    # The feature was originally added to simplify testing and is not
> +    # supported under low memory situations - the machine could lock up.
> +    #
> +    # Never edit any files in these directories by hand unless you
> +    # you are absolutely sure you know what you are doing! Use
> +    # the supplied toolset to make changes (e.g. vgcfgrestore).
> +
> +    # dirs =3D [ "/etc/lvm/metadata", "/mnt/disk2/lvm/metadata2" ]
> +#}
> +
> +# Event daemon
> +#
> +dmeventd {
> +    # mirror_library is the library used when monitoring a mirror device.
> +    #
> +    # "libdevmapper-event-lvm2mirror.so" attempts to recover from
> +    # failures.  It removes failed devices from a volume group and
> +    # reconfigures a mirror as necessary. If no mirror library is
> +    # provided, mirrors are not monitored through dmeventd.
> +
> +    mirror_library =3D "@libdir@/device-mapper/libdevmapper-event-lvm2mi=
rror.so"
> +
> +    # snapshot_library is the library used when monitoring a snapshot de=
vice.
> +    #
> +    # "libdevmapper-event-lvm2snapshot.so" monitors the filling of
> +    # snapshots and emits a warning through syslog when the use of
> +    # the snapshot exceeds 80%. The warning is repeated when 85%, 90% and
> +    # 95% of the snapshot is filled.
> +
> +    snapshot_library =3D "@libdir@/device-mapper/libdevmapper-event-lvm2=
snapshot.so"
> +
> +    # thin_library is the library used when monitoring a thin device.
> +    #
> +    # "libdevmapper-event-lvm2thin.so" monitors the filling of
> +    # pool and emits a warning through syslog when the use of
> +    # the pool exceeds 80%. The warning is repeated when 85%, 90% and
> +    # 95% of the pool is filled.
> +
> +    thin_library =3D "@libdir@/device-mapper/libdevmapper-event-lvm2thin=
=2Eso"
> +
> +    # Full path of the dmeventd binary.
> +    #
> +    # executable =3D "@DMEVENTD_PATH@"
> +}
> +
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb b/meta=
-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> new file mode 100644
> index 0000000..462e8fb
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> @@ -0,0 +1,31 @@
> +require lvm2.inc
> +
> +SRC_URI[md5sum] =3D "c5a54ee0b86703daaad6e856439e115a"
> +SRC_URI[sha256sum] =3D "e120b066b85b224552efda40204488c5123de068725676fd=
6e5c8bc655051b94"
> +
> +DEPENDS +=3D "autoconf-archive-native"
> +
> +PACKAGECONFIG =3D ""
> +
> +# Unset user/group to unbreak install.
> +EXTRA_OECONF =3D "--with-user=3D \
> +                --with-group=3D \
> +                --enable-pkgconfig \
> +                --with-usrlibdir=3D${libdir} \
> +"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +do_install_append() {
> +    # Remove things unrelated to libdevmapper
> +    rm -rf ${D}${sysconfdir}
> +    for i in `ls ${D}${sbindir}/*`; do
> +	if [ $i !=3D ${D}${sbindir}/dmsetup ]; then
> +	    rm $i
> +	fi
> +    done
> +    # Remove docs
> +    rm -rf ${D}${datadir}
> +}
> +
> +RRECOMMENDS_${PN} +=3D "lvm2-udevrules"
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index e295e20..cb5a9e0 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -18,15 +18,6 @@ S =3D "${WORKDIR}/LVM2.${PV}"
> =20
>  inherit autotools-brokensep pkgconfig systemd
> =20
> -LVM2_PACKAGECONFIG =3D "dmeventd lvmetad"
> -LVM2_PACKAGECONFIG_append_class-target =3D " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> -    thin-provisioning-tools \
> -    udev \
> -"
> -
> -PACKAGECONFIG ??=3D "${LVM2_PACKAGECONFIG}"
> -
>  # odirect is always enabled because there currently is a bug in
>  # lib/device/dev-io.c which prevents compiling without it. It is
>  # better to stick to configurations that were actually tested by
> @@ -40,69 +31,3 @@ PACKAGECONFIG[readline] =3D "--enable-readline,--disab=
le-readline,readline"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x"
>  PACKAGECONFIG[thin-provisioning-tools] =3D "--with-thin=3Dinternal,--wit=
h-thin=3Dnone,,thin-provisioning-tools"
>  PACKAGECONFIG[udev] =3D "--enable-udev_sync --enable-udev_rules --with-u=
devdir=3D${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-=
udev_rules,udev"
> -
> -# Unset user/group to unbreak install.
> -EXTRA_OECONF =3D "--with-user=3D \
> -                --with-group=3D \
> -                --enable-realtime \
> -                --enable-applib \
> -                --enable-cmdlib \
> -                --enable-pkgconfig \
> -                --with-usrlibdir=3D${libdir} \
> -                --with-systemdsystemunitdir=3D${systemd_system_unitdir} \
> -                --disable-thin_check_needs_check \
> -                --with-thin-check=3D${sbindir}/thin_check \
> -                --with-thin-dump=3D${sbindir}/thin_dump \
> -                --with-thin-repair=3D${sbindir}/thin_repair \
> -                --with-thin-restore=3D${sbindir}/thin_restore \
> -"
> -
> -CACHED_CONFIGUREVARS +=3D "MODPROBE_CMD=3D${base_sbindir}/modprobe"
> -
> -do_install_append() {
> -    # Install machine specific configuration file
> -    install -d ${D}${sysconfdir}/lvm
> -    install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
> -    sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}; then
> -        oe_runmake 'DESTDIR=3D${D}' install install_systemd_units
> -        sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_=
system_unitdir}/blk-availability.service
> -    else
> -        oe_runmake 'DESTDIR=3D${D}' install install_initscripts
> -        mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
> -        rm -rf ${D}${sysconfdir}/rc.d
> -    fi
> -}
> -
> -PACKAGE_BEFORE_PN =3D "${PN}-scripts libdevmapper libdevmapper-dev"
> -
> -SYSTEMD_PACKAGES =3D "${PN}"
> -SYSTEMD_SERVICE_${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'dmeven=
td', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
> -                         ${@bb.utils.contains('PACKAGECONFIG', 'lvmetad'=
, 'lvm2-lvmetad.socket lvm2-pvscan@.service', '', d)} \
> -                         blk-availability.service"
> -SYSTEMD_AUTO_ENABLE =3D "disable"
> -
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> -
> -FILES_${PN} +=3D "${libdir}/device-mapper/*.so"
> -FILES_${PN}-scripts =3D " \
> -    ${sbindir}/blkdeactivate \
> -    ${sbindir}/fsadm \
> -    ${sbindir}/lvmconf \
> -    ${sbindir}/lvmdump \
> -"
> -# Specified explicitly for the udev rules, just in case that it does not=
 get picked
> -# up automatically:
> -RDEPENDS_${PN}_append_class-target =3D " libdevmapper"
> -FILES_libdevmapper =3D "${sbindir}/dmsetup ${libdir}/libdevmapper.so.* $=
{nonarch_base_libdir}/udev/rules.d"
> -FILES_libdevmapper-dev =3D " \
> -    ${libdir}/libdevmapper.so \
> -    ${libdir}/pkgconfig/devmapper.pc \
> -    ${includedir}/libdevmapper.h \
> -"
> -
> -RDEPENDS_${PN}-scripts =3D "${PN} (=3D ${EXTENDPKGV}) bash"
> -RDEPENDS_libdevmapper-dev =3D "libdevmapper (=3D ${EXTENDPKGV})"
> -RRECOMMENDS_${PN}_class-target =3D "${PN}-scripts (=3D ${EXTENDPKGV})"
> -
> -CONFFILES_${PN} +=3D "${sysconfdir}/lvm/lvm.conf"
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-ini=
t-scripts.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-=
init-scripts.patch
> deleted file mode 100644
> index e86ab25..0000000
> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scrip=
ts.patch
> +++ /dev/null
> @@ -1,182 +0,0 @@
> -From 916ea0c70fd063ab7b81f16fd917a75dc02edf4f Mon Sep 17 00:00:00 2001
> -From: Peter Kjellerstedt <pkj@axis.com>
> -Date: Fri, 17 Mar 2017 03:18:28 +0100
> -Subject: [PATCH] Avoid bashisms in init scripts
> -
> -Upstream-Status: Inappropriate
> -
> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ----
> - scripts/blk_availability_init_red_hat.in      | 4 ++--
> - scripts/clvmd_init_red_hat.in                 | 6 +++---
> - scripts/cmirrord_init_red_hat.in              | 4 ++--
> - scripts/lvm2_cluster_activation_red_hat.sh.in | 4 ++--
> - scripts/lvm2_lvmetad_init_red_hat.in          | 4 ++--
> - scripts/lvm2_lvmpolld_init_red_hat.in         | 4 ++--
> - scripts/lvm2_monitoring_init_red_hat.in       | 4 ++--
> - scripts/lvm2_monitoring_init_rhel4            | 4 ++--
> - 8 files changed, 17 insertions(+), 17 deletions(-)
> -
> -diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_avai=
lability_init_red_hat.in
> -index a84ffe7..6b855b7 100644
> ---- a/scripts/blk_availability_init_red_hat.in
> -+++ b/scripts/blk_availability_init_red_hat.in
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - #
> - # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
> - #
> -@@ -53,6 +53,6 @@ case "$1" in
> -   status)
> - 	;;
> -   *)
> --	echo $"Usage: $0 {start|stop|status}"
> -+	echo "Usage: $0 {start|stop|status}"
> - 	;;
> - esac
> -diff --git a/scripts/clvmd_init_red_hat.in b/scripts/clvmd_init_red_hat.=
in
> -index d7f3392..abc8011 100644
> ---- a/scripts/clvmd_init_red_hat.in
> -+++ b/scripts/clvmd_init_red_hat.in
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - #
> - # clvmd - Clustered LVM Daemon init script
> - #
> -@@ -161,7 +161,7 @@ restart() {
> - 	fi
> - }
> -=20
> --[ "$EUID" !=3D "0" ] && {
> -+[ "$(id -u)" !=3D "0" ] && {
> - 	echo "clvmd init script can only be executed as root user"
> - 	exit 4
> - }
> -@@ -206,7 +206,7 @@ case "$1" in
> - 	;;
> -=20
> -   *)
> --	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|re=
load|force-reload}"
> -+	echo "Usage: $0 {start|stop|status|restart|condrestart|try-restart|rel=
oad|force-reload}"
> - 	rtrn=3D2
> - 	;;
> - esac
> -diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_re=
d_hat.in
> -index d4b7e37..d442cbc 100755
> ---- a/scripts/cmirrord_init_red_hat.in
> -+++ b/scripts/cmirrord_init_red_hat.in
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - #
> - # chkconfig: - 22 78
> - # description: Starts and stops cmirrord
> -@@ -101,7 +101,7 @@ case "$1" in
> - 		;;
> -=20
> - 	*)
> --		echo $"Usage: $0 {start|stop|restart|status}"
> -+		echo "Usage: $0 {start|stop|restart|status}"
> - 		;;
> - esac
> -=20
> -diff --git a/scripts/lvm2_cluster_activation_red_hat.sh.in b/scripts/lvm=
2_cluster_activation_red_hat.sh.in
> -index abea026..d8cba2e 100644
> ---- a/scripts/lvm2_cluster_activation_red_hat.sh.in
> -+++ b/scripts/lvm2_cluster_activation_red_hat.sh.in
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> -=20
> - sbindir=3D@sbindir@
> -=20
> -@@ -54,7 +54,7 @@ case "$1" in
> - 	rtrn=3D$?
> - 	;;
> -   *)
> --	echo $"Usage: $0 {activate|deactivate}"
> -+	echo "Usage: $0 {activate|deactivate}"
> - 	rtrn=3D3
> - 	;;
> - esac
> -diff --git a/scripts/lvm2_lvmetad_init_red_hat.in b/scripts/lvm2_lvmetad=
_init_red_hat.in
> -index b2f5d50..96269a9 100644
> ---- a/scripts/lvm2_lvmetad_init_red_hat.in
> -+++ b/scripts/lvm2_lvmetad_init_red_hat.in
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - #
> - # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
> - #
> -@@ -105,7 +105,7 @@ case "$1" in
> - 	;;
> -=20
> -   *)
> --	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restar=
t|status}"
> -+	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart=
|status}"
> - 	;;
> - esac
> -=20
> -diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpol=
ld_init_red_hat.in
> -index c521955..cdbaece 100644
> ---- a/scripts/lvm2_lvmpolld_init_red_hat.in
> -+++ b/scripts/lvm2_lvmpolld_init_red_hat.in
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - #
> - # Copyright (C) 2015 Red Hat, Inc. All rights reserved.
> - #
> -@@ -107,7 +107,7 @@ case "$1" in
> - 	;;
> -=20
> -   *)
> --	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restar=
t|status}"
> -+	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart=
|status}"
> - 	;;
> - esac
> -=20
> -diff --git a/scripts/lvm2_monitoring_init_red_hat.in b/scripts/lvm2_moni=
toring_init_red_hat.in
> -index de7ff0d..9ff6bb7 100644
> ---- a/scripts/lvm2_monitoring_init_red_hat.in
> -+++ b/scripts/lvm2_monitoring_init_red_hat.in
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - #
> - # Copyright (C) 2007-2009 Red Hat, Inc. All rights reserved.
> - #
> -@@ -128,7 +128,7 @@ case "$1" in
> - 	;;
> -=20
> -   *)
> --	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
> -+	echo "Usage: $0 {start|stop|restart|status|force-stop}"
> - 	;;
> - esac
> -=20
> -diff --git a/scripts/lvm2_monitoring_init_rhel4 b/scripts/lvm2_monitorin=
g_init_rhel4
> -index 8eb06c5..2e8d0f7 100644
> ---- a/scripts/lvm2_monitoring_init_rhel4
> -+++ b/scripts/lvm2_monitoring_init_rhel4
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - #
> - # Copyright (C) 2007 Red Hat, Inc. All rights reserved.
> - #
> -@@ -93,7 +93,7 @@ case "$1" in
> - 	;;
> -=20
> -   *)
> --	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
> -+	echo "Usage: $0 {start|stop|restart|status|force-stop}"
> - 	;;
> - esac
> -=20
> ---=20
> -2.12.0
> -
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specif=
ic-reopen_stream.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-l=
ibc-specific-reopen_stream.patch
> deleted file mode 100644
> index 5d72402..0000000
> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reop=
en_stream.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -From e3103459416616d3b8508e7176e897b0ae6c90f2 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Tue, 25 Oct 2016 11:49:40 +0000
> -Subject: [PATCH] implement libc specific reopen_stream
> -
> -musl defines stdin/stdio/stderr as constant types which means
> -we can not assign to them as we are doing here but works ok with glibc
> -therefore abstract out the _reopen_stream definition depending upon if
> -we are using glibc or otherwise
> -
> -Origin:
> -http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.pa=
tch
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> -
> ----
> - lib/log/log.c      | 6 ++++++
> - tools/lvmcmdline.c | 6 +++---
> - 2 files changed, 9 insertions(+), 3 deletions(-)
> -
> -diff --git a/lib/log/log.c b/lib/log/log.c
> -index c933154..3581084 100644
> ---- a/lib/log/log.c
> -+++ b/lib/log/log.c
> -@@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(=
FILE *old_stream, FILE *new_
> -  * Close and reopen standard stream on file descriptor fd.
> -  */
> - int reopen_standard_stream(FILE **stream, const char *mode)
> -+#ifdef __GLIBC__
> - {
> - 	int fd, fd_copy, new_fd;
> - 	const char *name;
> -@@ -207,6 +208,11 @@ int reopen_standard_stream(FILE **stream, const cha=
r *mode)
> - 	*stream =3D new_stream;
> - 	return 1;
> - }
> -+#else
> -+{
> -+	return (freopen(NULL, mode, *stream) !=3D NULL);
> -+}
> -+#endif
> -=20
> - void init_log_fn(lvm2_log_fn_t log_fn)
> - {
> -diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
> -index 9a4deb7..f1f18e6 100644
> ---- a/tools/lvmcmdline.c
> -+++ b/tools/lvmcmdline.c
> -@@ -1818,7 +1818,7 @@ static int _check_standard_fds(void)
> - 	int err =3D is_valid_fd(STDERR_FILENO);
> -=20
> - 	if (!is_valid_fd(STDIN_FILENO) &&
> --	    !(stdin =3D fopen(_PATH_DEVNULL, "r"))) {
> -+	    !freopen(_PATH_DEVNULL, "r", stdin)) {
> - 		if (err)
> - 			perror("stdin stream open");
> - 		else
> -@@ -1828,7 +1828,7 @@ static int _check_standard_fds(void)
> - 	}
> -=20
> - 	if (!is_valid_fd(STDOUT_FILENO) &&
> --	    !(stdout =3D fopen(_PATH_DEVNULL, "w"))) {
> -+	    !freopen(_PATH_DEVNULL, "w", stdout)) {
> - 		if (err)
> - 			perror("stdout stream open");
> - 		/* else no stdout */
> -@@ -1836,7 +1836,7 @@ static int _check_standard_fds(void)
> - 	}
> -=20
> - 	if (!is_valid_fd(STDERR_FILENO) &&
> --	    !(stderr =3D fopen(_PATH_DEVNULL, "w"))) {
> -+	    !freopen(_PATH_DEVNULL, "w", stderr)) {
> - 		printf("stderr stream open: %s\n",
> - 		       strerror(errno));
> - 		return 0;
> ---=20
> -2.12.0
> -
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo=
-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of=
-mallinfo-with-__GLIBC__.patch
> deleted file mode 100644
> index 95dcede..0000000
> --- a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-_=
_GLIBC__.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 3ae9c0b607ec33fb07f32a41e9d28cc9068dd39a Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Tue, 25 Oct 2016 11:52:44 +0000
> -Subject: [PATCH] Guard use of mallinfo() with __GLIBC__
> -
> -This API is glibc-only
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> -
> ----
> - lib/mm/memlock.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
> -index da90144..f34f890 100644
> ---- a/lib/mm/memlock.c
> -+++ b/lib/mm/memlock.c
> -@@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
> -=20
> - static void _allocate_memory(void)
> - {
> --#ifndef VALGRIND_POOL
> -+#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
> - 	void *stack_mem;
> - 	struct rlimit limit;
> - 	int i, area =3D 0, missing =3D _size_malloc_tmp, max_areas =3D 32, hbl=
ks;
> ---=20
> -2.12.0
> -
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O=
_-defines-and-fcntl-signature.patch b/meta-oe/recipes-support/lvm2/lvm2/000=
3-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
> deleted file mode 100644
> index 9ab1c06..0000000
> --- a/meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O_-defin=
es-and-fcntl-signature.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From b1ad91a059d99afd1ce25823b7c0a8d3ac63d2fd Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Tue, 25 Oct 2016 11:55:49 +0000
> -Subject: [PATCH 3/4] include fcntl.h for O_* defines and fcntl() signatu=
re
> -
> -On glibc _somehow_ this header gets pulled in indirectly
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> -Upstream-Status: Pending
> ----
> - libdaemon/server/daemon-server.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-=
server.c
> -index 6af6de9..a9590e7 100644
> ---- a/libdaemon/server/daemon-server.c
> -+++ b/libdaemon/server/daemon-server.c
> -@@ -18,6 +18,7 @@
> - #include "daemon-server.h"
> - #include "daemon-log.h"
> -=20
> -+#include <fcntl.h>
> - #include <dlfcn.h>
> - #include <errno.h>
> - #include <pthread.h>
> ---=20
> -2.9.3
> -
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-fo=
r-cross-compile.patch b/meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPRO=
BE_CMD-for-cross-compile.patch
> deleted file mode 100644
> index aaeaa72..0000000
> --- a/meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-for-cross=
-compile.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 0012ea63f6070a5d41fa380970f9c30b953237d2 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Tue, 25 Oct 2016 11:59:40 +0000
> -Subject: [PATCH 4/4] tweak MODPROBE_CMD for cross compile
> -
> -Lvm uses variable MODPROBE_CMD at runtime, so build time detection of mo=
dprobe
> -is incorrect.
> -------
> -|lvm lvcreate --thinpool wrl/pool00 --size 5556m --config  devices
> -{ preferred_names=3D["^/dev/mapper/", "^/dev/md/", "^/dev/sd"]
> -filter=3D["r|/loop1$|","r|/loop2$|","r|/loop3$|","r|/loop4$|","r|/loop5$=
|","r|/loop6$|","r|/loop7$|"] }
> -|tmp/sysroots/x86_64-linux/usr/bin/modprobe: execvp failed: No such file=
 or directory
> -|tmp/sysroots/x86_64-linux/usr/bin/modprobe failed: 2
> -------
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - configure.in | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/configure.in b/configure.in
> -index cc77aab..a3579f2 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1853,7 +1853,6 @@ if test "$UDEV_SYNC" =3D yes; then
> - fi
> -=20
> - #######################################################################=
#########
> --AC_PATH_TOOL(MODPROBE_CMD, modprobe)
> -=20
> - if test -n "$MODPROBE_CMD"; then
> - 	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'mo=
dprobe', if available.])
> ---=20
> -2.9.3
> -
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/lvm.conf b/meta-oe/recipes=
-support/lvm2/lvm2/lvm.conf
> deleted file mode 100644
> index 9e3b5fe..0000000
> --- a/meta-oe/recipes-support/lvm2/lvm2/lvm.conf
> +++ /dev/null
> @@ -1,326 +0,0 @@
> -# This is an example configuration file for the LVM2 system.
> -# It contains the default settings that would be used if there was no
> -# /etc/lvm/lvm.conf file.
> -#
> -# Refer to 'man lvm.conf' for further information including the file lay=
out.
> -#
> -# To put this file in a different directory and override /etc/lvm set
> -# the environment variable LVM_SYSTEM_DIR before running the tools.
> -
> -
> -# This section allows you to configure which block devices should
> -# be used by the LVM system.
> -devices {
> -
> -    # Where do you want your volume groups to appear ?
> -    dir =3D "/dev"
> -
> -    # An array of directories that contain the device nodes you wish
> -    # to use with LVM2.
> -    scan =3D [ "/dev" ]
> -
> -    # A filter that tells LVM2 to only use a restricted set of devices.
> -    # The filter consists of an array of regular expressions.  These
> -    # expressions can be delimited by a character of your choice, and
> -    # prefixed with either an 'a' (for accept) or 'r' (for reject).
> -    # The first expression found to match a device name determines if
> -    # the device will be accepted or rejected (ignored).  Devices that
> -    # don't match any patterns are accepted.
> -
> -    # Be careful if there there are symbolic links or multiple filesyste=
m=20
> -    # entries for the same device as each name is checked separately aga=
inst
> -    # the list of patterns.  The effect is that if any name matches any =
'a'
> -    # pattern, the device is accepted; otherwise if any name matches any=
 'r'
> -    # pattern it is rejected; otherwise it is accepted.
> -
> -    # Don't have more than one filter line active at once: only one gets=
 used.
> -
> -    # Run vgscan after you change this parameter to ensure that
> -    # the cache file gets regenerated (see below).
> -    # If it doesn't do what you expect, check the output of 'vgscan -vvv=
v'.
> -
> -
> -    # By default we accept every block device:
> -    filter =3D [ "a/.*/" ]
> -
> -    # Exclude the cdrom drive
> -    # filter =3D [ "r|/dev/cdrom|" ]
> -
> -    # When testing I like to work with just loopback devices:
> -    # filter =3D [ "a/loop/", "r/.*/" ]
> -
> -    # Or maybe all loops and ide drives except hdc:
> -    # filter =3D[ "a|loop|", "r|/dev/hdc|", "a|/dev/ide|", "r|.*|" ]
> -
> -    # Use anchors if you want to be really specific
> -    # filter =3D [ "a|^/dev/hda8$|", "r/.*/" ]
> -
> -    # The results of the filtering are cached on disk to avoid
> -    # rescanning dud devices (which can take a very long time).  By
> -    # default this cache file is hidden in the /etc/lvm directory.
> -    # It is safe to delete this file: the tools regenerate it.
> -    cache =3D "/etc/lvm/.cache"
> -
> -    # You can turn off writing this cache file by setting this to 0.
> -    write_cache_state =3D 1
> -
> -    # Advanced settings.
> -
> -    # List of pairs of additional acceptable block device types found=20
> -    # in /proc/devices with maximum (non-zero) number of partitions.
> -    # types =3D [ "fd", 16 ]
> -
> -    # If sysfs is mounted (2.6 kernels) restrict device scanning to=20
> -    # the block devices it believes are valid.
> -    # 1 enables; 0 disables.
> -    sysfs_scan =3D 1=09
> -
> -    # By default, LVM2 will ignore devices used as components of
> -    # software RAID (md) devices by looking for md superblocks.
> -    # 1 enables; 0 disables.
> -    md_component_detection =3D 1
> -}
> -
> -# This section that allows you to configure the nature of the
> -# information that LVM2 reports.
> -log {
> -
> -    # Controls the messages sent to stdout or stderr.
> -    # There are three levels of verbosity, 3 being the most verbose.
> -    verbose =3D 0
> -
> -    # Should we send log messages through syslog?
> -    # 1 is yes; 0 is no.
> -    syslog =3D 1
> -
> -    # Should we log error and debug messages to a file?
> -    # By default there is no log file.
> -    #file =3D "/var/log/lvm2.log"
> -
> -    # Should we overwrite the log file each time the program is run?
> -    # By default we append.
> -    overwrite =3D 0
> -
> -    # What level of log messages should we send to the log file and/or s=
yslog?
> -    # There are 6 syslog-like log levels currently in use - 2 to 7 inclu=
sive.
> -    # 7 is the most verbose (LOG_DEBUG).
> -    level =3D 0
> -   =20
> -    # Format of output messages
> -    # Whether or not (1 or 0) to indent messages according to their seve=
rity
> -    indent =3D 1
> -
> -    # Whether or not (1 or 0) to display the command name on each line o=
utput
> -    command_names =3D 0
> -
> -    # A prefix to use before the message text (but after the command nam=
e,
> -    # if selected).  Default is two spaces, so you can see/grep the seve=
rity
> -    # of each message.
> -    prefix =3D "  "
> -
> -    # To make the messages look similar to the original LVM tools use:
> -    #   indent =3D 0
> -    #   command_names =3D 1
> -    #   prefix =3D " -- "
> -
> -    # Set this if you want log messages during activation.
> -    # Don't use this in low memory situations (can deadlock).
> -    # activation =3D 0
> -}
> -
> -# Configuration of metadata backups and archiving.  In LVM2 when we
> -# talk about a 'backup' we mean making a copy of the metadata for the
> -# *current* system.  The 'archive' contains old metadata configurations.
> -# Backups are stored in a human readeable text format.
> -backup {
> -
> -    # Should we maintain a backup of the current metadata configuration ?
> -    # Use 1 for Yes; 0 for No.
> -    # Think very hard before turning this off!
> -    backup =3D 1
> -
> -    # Where shall we keep it ?
> -    # Remember to back up this directory regularly!
> -    backup_dir =3D "/etc/lvm/backup"
> -
> -    # Should we maintain an archive of old metadata configurations.
> -    # Use 1 for Yes; 0 for No.
> -    # On by default.  Think very hard before turning this off.
> -    archive =3D 1
> -
> -    # Where should archived files go ?
> -    # Remember to back up this directory regularly!
> -    archive_dir =3D "/etc/lvm/archive"
> -   =20
> -    # What is the minimum number of archive files you wish to keep ?
> -    retain_min =3D 10
> -
> -    # What is the minimum time you wish to keep an archive file for ?
> -    retain_days =3D 30
> -}
> -
> -# Settings for the running LVM2 in shell (readline) mode.
> -shell {
> -
> -    # Number of lines of history to store in ~/.lvm_history
> -    history_size =3D 100
> -}
> -
> -
> -# Miscellaneous global LVM2 settings
> -global {
> -   =20
> -    # The file creation mask for any files and directories created.
> -    # Interpreted as octal if the first digit is zero.
> -    umask =3D 077
> -
> -    # Allow other users to read the files
> -    #umask =3D 022
> -
> -    # Enabling test mode means that no changes to the on disk metadata
> -    # will be made.  Equivalent to having the -t option on every
> -    # command.  Defaults to off.
> -    test =3D 0
> -
> -    # Whether or not to communicate with the kernel device-mapper.
> -    # Set to 0 if you want to use the tools to manipulate LVM metadata=
=20
> -    # without activating any logical volumes.
> -    # If the device-mapper kernel driver is not present in your kernel
> -    # setting this to 0 should suppress the error messages.
> -    activation =3D 1
> -
> -    # If we can't communicate with device-mapper, should we try running=
=20
> -    # the LVM1 tools?
> -    # This option only applies to 2.4 kernels and is provided to help you
> -    # switch between device-mapper kernels and LVM1 kernels.
> -    # The LVM1 tools need to be installed with .lvm1 suffices
> -    # e.g. vgscan.lvm1 and they will stop working after you start using
> -    # the new lvm2 on-disk metadata format.
> -    # The default value is set when the tools are built.
> -    # fallback_to_lvm1 =3D 0
> -
> -    # The default metadata format that commands should use - "lvm1" or "=
lvm2".
> -    # The command line override is -M1 or -M2.
> -    # Defaults to "lvm1" if compiled in, else "lvm2".
> -    # format =3D "lvm1"
> -
> -    # Location of proc filesystem
> -    proc =3D "/proc"
> -
> -    # Type of locking to use. Defaults to file-based locking (1).
> -    # Turn locking off by setting to 0 (dangerous: risks metadata corrup=
tion
> -    # if LVM2 commands get run concurrently).
> -    locking_type =3D 1
> -
> -    # Local non-LV directory that holds file-based locks while commands =
are
> -    # in progress.  A directory like /tmp that may get wiped on reboot i=
s OK.
> -    locking_dir =3D "/var/lock/lvm"
> -
> -    # Other entries can go here to allow you to load shared libraries
> -    # e.g. if support for LVM1 metadata was compiled as a shared library=
 use
> -    #   format_libraries =3D "liblvm2format1.so"=20
> -    # Full pathnames can be given.
> -
> -    # Search this directory first for shared libraries.
> -    #   library_dir =3D "/lib"
> -}
> -
> -activation {
> -    # Device used in place of missing stripes if activating incomplete v=
olume.
> -    # For now, you need to set this up yourself first (e.g. with 'dmsetu=
p')
> -    # For example, you could make it return I/O errors using the 'error'=
=20
> -    # target or make it return zeros.
> -    missing_stripe_filler =3D "/dev/ioerror"
> -
> -    # Size (in KB) of each copy operation when mirroring
> -    mirror_region_size =3D 512
> -
> -    # How much stack (in KB) to reserve for use while devices suspended
> -    reserved_stack =3D 256
> -
> -    # How much memory (in KB) to reserve for use while devices suspended
> -    reserved_memory =3D 8192
> -
> -    # Nice value used while devices suspended
> -    process_priority =3D -18
> -
> -    # If volume_list is defined, each LV is only activated if there is a
> -    # match against the list.
> -    #   "vgname" and "vgname/lvname" are matched exactly.
> -    #   "@tag" matches any tag set in the LV or VG.
> -    #   "@*" matches if any tag defined on the host is also set in the L=
V or VG
> -    #
> -    # volume_list =3D [ "vg1", "vg2/lvol1", "@tag1", "@*" ]
> -}
> -
> -
> -####################
> -# Advanced section #
> -####################
> -
> -# Metadata settings
> -#
> -# metadata {
> -    # Default number of copies of metadata to hold on each PV.  0, 1 or =
2.
> -    # You might want to override it from the command line with 0=20
> -    # when running pvcreate on new PVs which are to be added to large VG=
s.
> -
> -    # pvmetadatacopies =3D 1
> -
> -    # Approximate default size of on-disk metadata areas in sectors.
> -    # You should increase this if you have large volume groups or
> -    # you want to retain a large on-disk history of your metadata change=
s.
> -
> -    # pvmetadatasize =3D 255
> -
> -    # List of directories holding live copies of text format metadata.
> -    # These directories must not be on logical volumes!
> -    # It's possible to use LVM2 with a couple of directories here,
> -    # preferably on different (non-LV) filesystems, and with no other=20
> -    # on-disk metadata (pvmetadatacopies =3D 0). Or this can be in
> -    # addition to on-disk metadata areas.
> -    # The feature was originally added to simplify testing and is not
> -    # supported under low memory situations - the machine could lock up.
> -    #
> -    # Never edit any files in these directories by hand unless you
> -    # you are absolutely sure you know what you are doing! Use
> -    # the supplied toolset to make changes (e.g. vgcfgrestore).
> -
> -    # dirs =3D [ "/etc/lvm/metadata", "/mnt/disk2/lvm/metadata2" ]
> -#}
> -
> -# Event daemon
> -#
> -dmeventd {
> -    # mirror_library is the library used when monitoring a mirror device.
> -    #
> -    # "libdevmapper-event-lvm2mirror.so" attempts to recover from
> -    # failures.  It removes failed devices from a volume group and
> -    # reconfigures a mirror as necessary. If no mirror library is
> -    # provided, mirrors are not monitored through dmeventd.
> -
> -    mirror_library =3D "@libdir@/device-mapper/libdevmapper-event-lvm2mi=
rror.so"
> -
> -    # snapshot_library is the library used when monitoring a snapshot de=
vice.
> -    #
> -    # "libdevmapper-event-lvm2snapshot.so" monitors the filling of
> -    # snapshots and emits a warning through syslog when the use of
> -    # the snapshot exceeds 80%. The warning is repeated when 85%, 90% and
> -    # 95% of the snapshot is filled.
> -
> -    snapshot_library =3D "@libdir@/device-mapper/libdevmapper-event-lvm2=
snapshot.so"
> -
> -    # thin_library is the library used when monitoring a thin device.
> -    #
> -    # "libdevmapper-event-lvm2thin.so" monitors the filling of
> -    # pool and emits a warning through syslog when the use of
> -    # the pool exceeds 80%. The warning is repeated when 85%, 90% and
> -    # 95% of the pool is filled.
> -
> -    thin_library =3D "@libdir@/device-mapper/libdevmapper-event-lvm2thin=
=2Eso"
> -
> -    # Full path of the dmeventd binary.
> -    #
> -    # executable =3D "@DMEVENTD_PATH@"
> -}
> -
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb b/meta-oe/reci=
pes-support/lvm2/lvm2_2.02.166.bb
> index c81faa7..c196e63 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
> @@ -5,4 +5,77 @@ SRC_URI[sha256sum] =3D "e120b066b85b224552efda40204488c5=
123de068725676fd6e5c8bc655
> =20
>  DEPENDS +=3D "autoconf-archive-native"
> =20
> +LVM2_PACKAGECONFIG =3D "dmeventd lvmetad"
> +LVM2_PACKAGECONFIG_append_class-target =3D " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> +    thin-provisioning-tools \
> +    udev \
> +"
> +
> +PACKAGECONFIG ??=3D "${LVM2_PACKAGECONFIG}"
> +
> +# Unset user/group to unbreak install.
> +EXTRA_OECONF =3D "--with-user=3D \
> +                --with-group=3D \
> +                --enable-realtime \
> +                --enable-applib \
> +                --enable-cmdlib \
> +                --enable-pkgconfig \
> +                --with-usrlibdir=3D${libdir} \
> +                --with-systemdsystemunitdir=3D${systemd_system_unitdir} \
> +                --disable-thin_check_needs_check \
> +                --with-thin-check=3D${sbindir}/thin_check \
> +                --with-thin-dump=3D${sbindir}/thin_dump \
> +                --with-thin-repair=3D${sbindir}/thin_repair \
> +                --with-thin-restore=3D${sbindir}/thin_restore \
> +"
> +
> +CACHED_CONFIGUREVARS +=3D "MODPROBE_CMD=3D${base_sbindir}/modprobe"
> +
> +do_install_append() {
> +    # Install machine specific configuration file
> +    install -d ${D}${sysconfdir}/lvm
> +    install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
> +    sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}; then
> +        oe_runmake 'DESTDIR=3D${D}' install install_systemd_units
> +        sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_=
system_unitdir}/blk-availability.service
> +    else
> +        oe_runmake 'DESTDIR=3D${D}' install install_initscripts
> +        mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
> +        rm -rf ${D}${sysconfdir}/rc.d
> +    fi
> +    # Remove things related to libdevmapper
> +    rm ${D}${sbindir}/dmsetup
> +    rm ${D}${libdir}/libdevmapper.so.*
> +    rm ${D}${libdir}/libdevmapper.so ${D}${libdir}/pkgconfig/devmapper.p=
c ${D}${includedir}/libdevmapper.h
> +}
> +
> +PACKAGE_BEFORE_PN =3D "${PN}-scripts ${PN}-udevrules"
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'dmeven=
td', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
> +                         ${@bb.utils.contains('PACKAGECONFIG', 'lvmetad'=
, 'lvm2-lvmetad.socket lvm2-pvscan@.service', '', d)} \
> +                         blk-availability.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +FILES_${PN} +=3D "${libdir}/device-mapper/*.so"
> +FILES_${PN}-scripts =3D " \
> +    ${sbindir}/blkdeactivate \
> +    ${sbindir}/fsadm \
> +    ${sbindir}/lvmconf \
> +    ${sbindir}/lvmdump \
> +"
> +# Specified explicitly for the udev rules, just in case that it does not=
 get picked
> +# up automatically:
> +FILES_${PN}-udevrules =3D "${nonarch_base_libdir}/udev/rules.d"
> +RDEPENDS_${PN}_append_class-target =3D " libdevmapper"
> +
> +RDEPENDS_${PN}-scripts =3D "${PN} (=3D ${EXTENDPKGV}) bash"
> +RRECOMMENDS_${PN}_class-target =3D "${PN}-scripts (=3D ${EXTENDPKGV})"
> +
> +CONFFILES_${PN} +=3D "${sysconfdir}/lvm/lvm.conf"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
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

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWPhebgAKCRA3VSO3ZXaA
HHWgAKCwR4pyeKriTrYHMorJZlyhkhIyPgCfQWkudKbjbfJU9DoeoirSqh9dCc8=
=xNSK
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
