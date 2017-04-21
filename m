Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A264E62133
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 02:40:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3L2e9R7023104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 20 Apr 2017 19:40:09 -0700
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 20 Apr 2017 19:40:08 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1492509167-18312-1-git-send-email-Qi.Chen@windriver.com>
	<20170420070830.GA3059@jama>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <317fccf0-1cc6-f13d-a367-fbdfbd04aea8@windriver.com>
Date: Fri, 21 Apr 2017 10:41:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170420070830.GA3059@jama>
X-Originating-IP: [128.224.162.201]
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
X-List-Received-Date: Fri, 21 Apr 2017 02:40:11 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2017 03:08 PM, Martin Jansa wrote:
> On Tue, Apr 18, 2017 at 05:52:46PM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> If we enable 'cryptsetup' PACKAGECONFIG for systemd, there would be
>> circular dependency issue among 'systemd', 'cryptsetup' and 'lvm2'.
>>
>> cryptsetup only needs libdevmapper from lvm2. So we separte libdevmapper
>> into a new recipe to solve this circular dependency issue.
> Seems to break multipath-tools build:
> http://errors.yoctoproject.org/Errors/Details/140512/
>
> Also in one of my builds it failed to install with:
> | rm: cannot remove lvm2/2.02.166-r0/image/usr/lib/pkgconfig/devmapper.pc: No such file or directory
>
> because my lvm2 build didn't have "--enable-pkgconfig" option (we're
> using only small part of lvm2), maybe it would be better to use rm -f
> when removing devmapper files.

Thanks for pointing out these problem.
I'll fix them and send out a new patch series.

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../0001-Avoid-bashisms-in-init-scripts.patch      | 182 ++++++++++++
>>   ...001-implement-libc-specific-reopen_stream.patch |  79 +++++
>>   ...0002-Guard-use-of-mallinfo-with-__GLIBC__.patch |  30 ++
>>   ...cntl.h-for-O_-defines-and-fcntl-signature.patch |  30 ++
>>   ...0004-tweak-MODPROBE_CMD-for-cross-compile.patch |  38 +++
>>   meta-oe/recipes-support/lvm2/files/lvm.conf        | 326 +++++++++++++++++++++
>>   .../recipes-support/lvm2/libdevmapper_2.02.166.bb  |  31 ++
>>   meta-oe/recipes-support/lvm2/lvm2.inc              |  75 -----
>>   .../lvm2/0001-Avoid-bashisms-in-init-scripts.patch | 182 ------------
>>   ...001-implement-libc-specific-reopen_stream.patch |  79 -----
>>   ...0002-Guard-use-of-mallinfo-with-__GLIBC__.patch |  30 --
>>   ...cntl.h-for-O_-defines-and-fcntl-signature.patch |  30 --
>>   ...0004-tweak-MODPROBE_CMD-for-cross-compile.patch |  38 ---
>>   meta-oe/recipes-support/lvm2/lvm2/lvm.conf         | 326 ---------------------
>>   meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb      |  73 +++++
>>   15 files changed, 789 insertions(+), 760 deletions(-)
>>   create mode 100644 meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
>>   create mode 100644 meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
>>   create mode 100644 meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>>   create mode 100644 meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
>>   create mode 100644 meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
>>   create mode 100644 meta-oe/recipes-support/lvm2/files/lvm.conf
>>   create mode 100644 meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
>>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scripts.patch
>>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
>>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
>>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
>>   delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/lvm.conf
>>
>> diff --git a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
>> new file mode 100644
>> index 0000000..e86ab25
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
>> @@ -0,0 +1,182 @@
>> +From 916ea0c70fd063ab7b81f16fd917a75dc02edf4f Mon Sep 17 00:00:00 2001
>> +From: Peter Kjellerstedt <pkj@axis.com>
>> +Date: Fri, 17 Mar 2017 03:18:28 +0100
>> +Subject: [PATCH] Avoid bashisms in init scripts
>> +
>> +Upstream-Status: Inappropriate
>> +
>> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> +---
>> + scripts/blk_availability_init_red_hat.in      | 4 ++--
>> + scripts/clvmd_init_red_hat.in                 | 6 +++---
>> + scripts/cmirrord_init_red_hat.in              | 4 ++--
>> + scripts/lvm2_cluster_activation_red_hat.sh.in | 4 ++--
>> + scripts/lvm2_lvmetad_init_red_hat.in          | 4 ++--
>> + scripts/lvm2_lvmpolld_init_red_hat.in         | 4 ++--
>> + scripts/lvm2_monitoring_init_red_hat.in       | 4 ++--
>> + scripts/lvm2_monitoring_init_rhel4            | 4 ++--
>> + 8 files changed, 17 insertions(+), 17 deletions(-)
>> +
>> +diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_availability_init_red_hat.in
>> +index a84ffe7..6b855b7 100644
>> +--- a/scripts/blk_availability_init_red_hat.in
>> ++++ b/scripts/blk_availability_init_red_hat.in
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> + #
>> + # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
>> + #
>> +@@ -53,6 +53,6 @@ case "$1" in
>> +   status)
>> + 	;;
>> +   *)
>> +-	echo $"Usage: $0 {start|stop|status}"
>> ++	echo "Usage: $0 {start|stop|status}"
>> + 	;;
>> + esac
>> +diff --git a/scripts/clvmd_init_red_hat.in b/scripts/clvmd_init_red_hat.in
>> +index d7f3392..abc8011 100644
>> +--- a/scripts/clvmd_init_red_hat.in
>> ++++ b/scripts/clvmd_init_red_hat.in
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> + #
>> + # clvmd - Clustered LVM Daemon init script
>> + #
>> +@@ -161,7 +161,7 @@ restart() {
>> + 	fi
>> + }
>> +
>> +-[ "$EUID" != "0" ] && {
>> ++[ "$(id -u)" != "0" ] && {
>> + 	echo "clvmd init script can only be executed as root user"
>> + 	exit 4
>> + }
>> +@@ -206,7 +206,7 @@ case "$1" in
>> + 	;;
>> +
>> +   *)
>> +-	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
>> ++	echo "Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
>> + 	rtrn=2
>> + 	;;
>> + esac
>> +diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_red_hat.in
>> +index d4b7e37..d442cbc 100755
>> +--- a/scripts/cmirrord_init_red_hat.in
>> ++++ b/scripts/cmirrord_init_red_hat.in
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> + #
>> + # chkconfig: - 22 78
>> + # description: Starts and stops cmirrord
>> +@@ -101,7 +101,7 @@ case "$1" in
>> + 		;;
>> +
>> + 	*)
>> +-		echo $"Usage: $0 {start|stop|restart|status}"
>> ++		echo "Usage: $0 {start|stop|restart|status}"
>> + 		;;
>> + esac
>> +
>> +diff --git a/scripts/lvm2_cluster_activation_red_hat.sh.in b/scripts/lvm2_cluster_activation_red_hat.sh.in
>> +index abea026..d8cba2e 100644
>> +--- a/scripts/lvm2_cluster_activation_red_hat.sh.in
>> ++++ b/scripts/lvm2_cluster_activation_red_hat.sh.in
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> +
>> + sbindir=@sbindir@
>> +
>> +@@ -54,7 +54,7 @@ case "$1" in
>> + 	rtrn=$?
>> + 	;;
>> +   *)
>> +-	echo $"Usage: $0 {activate|deactivate}"
>> ++	echo "Usage: $0 {activate|deactivate}"
>> + 	rtrn=3
>> + 	;;
>> + esac
>> +diff --git a/scripts/lvm2_lvmetad_init_red_hat.in b/scripts/lvm2_lvmetad_init_red_hat.in
>> +index b2f5d50..96269a9 100644
>> +--- a/scripts/lvm2_lvmetad_init_red_hat.in
>> ++++ b/scripts/lvm2_lvmetad_init_red_hat.in
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> + #
>> + # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
>> + #
>> +@@ -105,7 +105,7 @@ case "$1" in
>> + 	;;
>> +
>> +   *)
>> +-	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
>> ++	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
>> + 	;;
>> + esac
>> +
>> +diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpolld_init_red_hat.in
>> +index c521955..cdbaece 100644
>> +--- a/scripts/lvm2_lvmpolld_init_red_hat.in
>> ++++ b/scripts/lvm2_lvmpolld_init_red_hat.in
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> + #
>> + # Copyright (C) 2015 Red Hat, Inc. All rights reserved.
>> + #
>> +@@ -107,7 +107,7 @@ case "$1" in
>> + 	;;
>> +
>> +   *)
>> +-	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
>> ++	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
>> + 	;;
>> + esac
>> +
>> +diff --git a/scripts/lvm2_monitoring_init_red_hat.in b/scripts/lvm2_monitoring_init_red_hat.in
>> +index de7ff0d..9ff6bb7 100644
>> +--- a/scripts/lvm2_monitoring_init_red_hat.in
>> ++++ b/scripts/lvm2_monitoring_init_red_hat.in
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> + #
>> + # Copyright (C) 2007-2009 Red Hat, Inc. All rights reserved.
>> + #
>> +@@ -128,7 +128,7 @@ case "$1" in
>> + 	;;
>> +
>> +   *)
>> +-	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
>> ++	echo "Usage: $0 {start|stop|restart|status|force-stop}"
>> + 	;;
>> + esac
>> +
>> +diff --git a/scripts/lvm2_monitoring_init_rhel4 b/scripts/lvm2_monitoring_init_rhel4
>> +index 8eb06c5..2e8d0f7 100644
>> +--- a/scripts/lvm2_monitoring_init_rhel4
>> ++++ b/scripts/lvm2_monitoring_init_rhel4
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> + #
>> + # Copyright (C) 2007 Red Hat, Inc. All rights reserved.
>> + #
>> +@@ -93,7 +93,7 @@ case "$1" in
>> + 	;;
>> +
>> +   *)
>> +-	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
>> ++	echo "Usage: $0 {start|stop|restart|status|force-stop}"
>> + 	;;
>> + esac
>> +
>> +--
>> +2.12.0
>> +
>> diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
>> new file mode 100644
>> index 0000000..5d72402
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
>> @@ -0,0 +1,79 @@
>> +From e3103459416616d3b8508e7176e897b0ae6c90f2 Mon Sep 17 00:00:00 2001
>> +From: Dengke Du <dengke.du@windriver.com>
>> +Date: Tue, 25 Oct 2016 11:49:40 +0000
>> +Subject: [PATCH] implement libc specific reopen_stream
>> +
>> +musl defines stdin/stdio/stderr as constant types which means
>> +we can not assign to them as we are doing here but works ok with glibc
>> +therefore abstract out the _reopen_stream definition depending upon if
>> +we are using glibc or otherwise
>> +
>> +Origin:
>> +http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> +
>> +---
>> + lib/log/log.c      | 6 ++++++
>> + tools/lvmcmdline.c | 6 +++---
>> + 2 files changed, 9 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/lib/log/log.c b/lib/log/log.c
>> +index c933154..3581084 100644
>> +--- a/lib/log/log.c
>> ++++ b/lib/log/log.c
>> +@@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
>> +  * Close and reopen standard stream on file descriptor fd.
>> +  */
>> + int reopen_standard_stream(FILE **stream, const char *mode)
>> ++#ifdef __GLIBC__
>> + {
>> + 	int fd, fd_copy, new_fd;
>> + 	const char *name;
>> +@@ -207,6 +208,11 @@ int reopen_standard_stream(FILE **stream, const char *mode)
>> + 	*stream = new_stream;
>> + 	return 1;
>> + }
>> ++#else
>> ++{
>> ++	return (freopen(NULL, mode, *stream) != NULL);
>> ++}
>> ++#endif
>> +
>> + void init_log_fn(lvm2_log_fn_t log_fn)
>> + {
>> +diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
>> +index 9a4deb7..f1f18e6 100644
>> +--- a/tools/lvmcmdline.c
>> ++++ b/tools/lvmcmdline.c
>> +@@ -1818,7 +1818,7 @@ static int _check_standard_fds(void)
>> + 	int err = is_valid_fd(STDERR_FILENO);
>> +
>> + 	if (!is_valid_fd(STDIN_FILENO) &&
>> +-	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
>> ++	    !freopen(_PATH_DEVNULL, "r", stdin)) {
>> + 		if (err)
>> + 			perror("stdin stream open");
>> + 		else
>> +@@ -1828,7 +1828,7 @@ static int _check_standard_fds(void)
>> + 	}
>> +
>> + 	if (!is_valid_fd(STDOUT_FILENO) &&
>> +-	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
>> ++	    !freopen(_PATH_DEVNULL, "w", stdout)) {
>> + 		if (err)
>> + 			perror("stdout stream open");
>> + 		/* else no stdout */
>> +@@ -1836,7 +1836,7 @@ static int _check_standard_fds(void)
>> + 	}
>> +
>> + 	if (!is_valid_fd(STDERR_FILENO) &&
>> +-	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
>> ++	    !freopen(_PATH_DEVNULL, "w", stderr)) {
>> + 		printf("stderr stream open: %s\n",
>> + 		       strerror(errno));
>> + 		return 0;
>> +--
>> +2.12.0
>> +
>> diff --git a/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>> new file mode 100644
>> index 0000000..95dcede
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>> @@ -0,0 +1,30 @@
>> +From 3ae9c0b607ec33fb07f32a41e9d28cc9068dd39a Mon Sep 17 00:00:00 2001
>> +From: Dengke Du <dengke.du@windriver.com>
>> +Date: Tue, 25 Oct 2016 11:52:44 +0000
>> +Subject: [PATCH] Guard use of mallinfo() with __GLIBC__
>> +
>> +This API is glibc-only
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> +
>> +---
>> + lib/mm/memlock.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
>> +index da90144..f34f890 100644
>> +--- a/lib/mm/memlock.c
>> ++++ b/lib/mm/memlock.c
>> +@@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
>> +
>> + static void _allocate_memory(void)
>> + {
>> +-#ifndef VALGRIND_POOL
>> ++#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
>> + 	void *stack_mem;
>> + 	struct rlimit limit;
>> + 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
>> +--
>> +2.12.0
>> +
>> diff --git a/meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch b/meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
>> new file mode 100644
>> index 0000000..9ab1c06
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
>> @@ -0,0 +1,30 @@
>> +From b1ad91a059d99afd1ce25823b7c0a8d3ac63d2fd Mon Sep 17 00:00:00 2001
>> +From: Dengke Du <dengke.du@windriver.com>
>> +Date: Tue, 25 Oct 2016 11:55:49 +0000
>> +Subject: [PATCH 3/4] include fcntl.h for O_* defines and fcntl() signature
>> +
>> +On glibc _somehow_ this header gets pulled in indirectly
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> +---
>> +Upstream-Status: Pending
>> +---
>> + libdaemon/server/daemon-server.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
>> +index 6af6de9..a9590e7 100644
>> +--- a/libdaemon/server/daemon-server.c
>> ++++ b/libdaemon/server/daemon-server.c
>> +@@ -18,6 +18,7 @@
>> + #include "daemon-server.h"
>> + #include "daemon-log.h"
>> +
>> ++#include <fcntl.h>
>> + #include <dlfcn.h>
>> + #include <errno.h>
>> + #include <pthread.h>
>> +--
>> +2.9.3
>> +
>> diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
>> new file mode 100644
>> index 0000000..aaeaa72
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
>> @@ -0,0 +1,38 @@
>> +From 0012ea63f6070a5d41fa380970f9c30b953237d2 Mon Sep 17 00:00:00 2001
>> +From: Dengke Du <dengke.du@windriver.com>
>> +Date: Tue, 25 Oct 2016 11:59:40 +0000
>> +Subject: [PATCH 4/4] tweak MODPROBE_CMD for cross compile
>> +
>> +Lvm uses variable MODPROBE_CMD at runtime, so build time detection of modprobe
>> +is incorrect.
>> +------
>> +|lvm lvcreate --thinpool wrl/pool00 --size 5556m --config  devices
>> +{ preferred_names=["^/dev/mapper/", "^/dev/md/", "^/dev/sd"]
>> +filter=["r|/loop1$|","r|/loop2$|","r|/loop3$|","r|/loop4$|","r|/loop5$|","r|/loop6$|","r|/loop7$|"] }
>> +|tmp/sysroots/x86_64-linux/usr/bin/modprobe: execvp failed: No such file or directory
>> +|tmp/sysroots/x86_64-linux/usr/bin/modprobe failed: 2
>> +------
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> +---
>> + configure.in | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/configure.in b/configure.in
>> +index cc77aab..a3579f2 100644
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -1853,7 +1853,6 @@ if test "$UDEV_SYNC" = yes; then
>> + fi
>> +
>> + ################################################################################
>> +-AC_PATH_TOOL(MODPROBE_CMD, modprobe)
>> +
>> + if test -n "$MODPROBE_CMD"; then
>> + 	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'modprobe', if available.])
>> +--
>> +2.9.3
>> +
>> diff --git a/meta-oe/recipes-support/lvm2/files/lvm.conf b/meta-oe/recipes-support/lvm2/files/lvm.conf
>> new file mode 100644
>> index 0000000..9e3b5fe
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lvm2/files/lvm.conf
>> @@ -0,0 +1,326 @@
>> +# This is an example configuration file for the LVM2 system.
>> +# It contains the default settings that would be used if there was no
>> +# /etc/lvm/lvm.conf file.
>> +#
>> +# Refer to 'man lvm.conf' for further information including the file layout.
>> +#
>> +# To put this file in a different directory and override /etc/lvm set
>> +# the environment variable LVM_SYSTEM_DIR before running the tools.
>> +
>> +
>> +# This section allows you to configure which block devices should
>> +# be used by the LVM system.
>> +devices {
>> +
>> +    # Where do you want your volume groups to appear ?
>> +    dir = "/dev"
>> +
>> +    # An array of directories that contain the device nodes you wish
>> +    # to use with LVM2.
>> +    scan = [ "/dev" ]
>> +
>> +    # A filter that tells LVM2 to only use a restricted set of devices.
>> +    # The filter consists of an array of regular expressions.  These
>> +    # expressions can be delimited by a character of your choice, and
>> +    # prefixed with either an 'a' (for accept) or 'r' (for reject).
>> +    # The first expression found to match a device name determines if
>> +    # the device will be accepted or rejected (ignored).  Devices that
>> +    # don't match any patterns are accepted.
>> +
>> +    # Be careful if there there are symbolic links or multiple filesystem
>> +    # entries for the same device as each name is checked separately against
>> +    # the list of patterns.  The effect is that if any name matches any 'a'
>> +    # pattern, the device is accepted; otherwise if any name matches any 'r'
>> +    # pattern it is rejected; otherwise it is accepted.
>> +
>> +    # Don't have more than one filter line active at once: only one gets used.
>> +
>> +    # Run vgscan after you change this parameter to ensure that
>> +    # the cache file gets regenerated (see below).
>> +    # If it doesn't do what you expect, check the output of 'vgscan -vvvv'.
>> +
>> +
>> +    # By default we accept every block device:
>> +    filter = [ "a/.*/" ]
>> +
>> +    # Exclude the cdrom drive
>> +    # filter = [ "r|/dev/cdrom|" ]
>> +
>> +    # When testing I like to work with just loopback devices:
>> +    # filter = [ "a/loop/", "r/.*/" ]
>> +
>> +    # Or maybe all loops and ide drives except hdc:
>> +    # filter =[ "a|loop|", "r|/dev/hdc|", "a|/dev/ide|", "r|.*|" ]
>> +
>> +    # Use anchors if you want to be really specific
>> +    # filter = [ "a|^/dev/hda8$|", "r/.*/" ]
>> +
>> +    # The results of the filtering are cached on disk to avoid
>> +    # rescanning dud devices (which can take a very long time).  By
>> +    # default this cache file is hidden in the /etc/lvm directory.
>> +    # It is safe to delete this file: the tools regenerate it.
>> +    cache = "/etc/lvm/.cache"
>> +
>> +    # You can turn off writing this cache file by setting this to 0.
>> +    write_cache_state = 1
>> +
>> +    # Advanced settings.
>> +
>> +    # List of pairs of additional acceptable block device types found
>> +    # in /proc/devices with maximum (non-zero) number of partitions.
>> +    # types = [ "fd", 16 ]
>> +
>> +    # If sysfs is mounted (2.6 kernels) restrict device scanning to
>> +    # the block devices it believes are valid.
>> +    # 1 enables; 0 disables.
>> +    sysfs_scan = 1	
>> +
>> +    # By default, LVM2 will ignore devices used as components of
>> +    # software RAID (md) devices by looking for md superblocks.
>> +    # 1 enables; 0 disables.
>> +    md_component_detection = 1
>> +}
>> +
>> +# This section that allows you to configure the nature of the
>> +# information that LVM2 reports.
>> +log {
>> +
>> +    # Controls the messages sent to stdout or stderr.
>> +    # There are three levels of verbosity, 3 being the most verbose.
>> +    verbose = 0
>> +
>> +    # Should we send log messages through syslog?
>> +    # 1 is yes; 0 is no.
>> +    syslog = 1
>> +
>> +    # Should we log error and debug messages to a file?
>> +    # By default there is no log file.
>> +    #file = "/var/log/lvm2.log"
>> +
>> +    # Should we overwrite the log file each time the program is run?
>> +    # By default we append.
>> +    overwrite = 0
>> +
>> +    # What level of log messages should we send to the log file and/or syslog?
>> +    # There are 6 syslog-like log levels currently in use - 2 to 7 inclusive.
>> +    # 7 is the most verbose (LOG_DEBUG).
>> +    level = 0
>> +
>> +    # Format of output messages
>> +    # Whether or not (1 or 0) to indent messages according to their severity
>> +    indent = 1
>> +
>> +    # Whether or not (1 or 0) to display the command name on each line output
>> +    command_names = 0
>> +
>> +    # A prefix to use before the message text (but after the command name,
>> +    # if selected).  Default is two spaces, so you can see/grep the severity
>> +    # of each message.
>> +    prefix = "  "
>> +
>> +    # To make the messages look similar to the original LVM tools use:
>> +    #   indent = 0
>> +    #   command_names = 1
>> +    #   prefix = " -- "
>> +
>> +    # Set this if you want log messages during activation.
>> +    # Don't use this in low memory situations (can deadlock).
>> +    # activation = 0
>> +}
>> +
>> +# Configuration of metadata backups and archiving.  In LVM2 when we
>> +# talk about a 'backup' we mean making a copy of the metadata for the
>> +# *current* system.  The 'archive' contains old metadata configurations.
>> +# Backups are stored in a human readeable text format.
>> +backup {
>> +
>> +    # Should we maintain a backup of the current metadata configuration ?
>> +    # Use 1 for Yes; 0 for No.
>> +    # Think very hard before turning this off!
>> +    backup = 1
>> +
>> +    # Where shall we keep it ?
>> +    # Remember to back up this directory regularly!
>> +    backup_dir = "/etc/lvm/backup"
>> +
>> +    # Should we maintain an archive of old metadata configurations.
>> +    # Use 1 for Yes; 0 for No.
>> +    # On by default.  Think very hard before turning this off.
>> +    archive = 1
>> +
>> +    # Where should archived files go ?
>> +    # Remember to back up this directory regularly!
>> +    archive_dir = "/etc/lvm/archive"
>> +
>> +    # What is the minimum number of archive files you wish to keep ?
>> +    retain_min = 10
>> +
>> +    # What is the minimum time you wish to keep an archive file for ?
>> +    retain_days = 30
>> +}
>> +
>> +# Settings for the running LVM2 in shell (readline) mode.
>> +shell {
>> +
>> +    # Number of lines of history to store in ~/.lvm_history
>> +    history_size = 100
>> +}
>> +
>> +
>> +# Miscellaneous global LVM2 settings
>> +global {
>> +
>> +    # The file creation mask for any files and directories created.
>> +    # Interpreted as octal if the first digit is zero.
>> +    umask = 077
>> +
>> +    # Allow other users to read the files
>> +    #umask = 022
>> +
>> +    # Enabling test mode means that no changes to the on disk metadata
>> +    # will be made.  Equivalent to having the -t option on every
>> +    # command.  Defaults to off.
>> +    test = 0
>> +
>> +    # Whether or not to communicate with the kernel device-mapper.
>> +    # Set to 0 if you want to use the tools to manipulate LVM metadata
>> +    # without activating any logical volumes.
>> +    # If the device-mapper kernel driver is not present in your kernel
>> +    # setting this to 0 should suppress the error messages.
>> +    activation = 1
>> +
>> +    # If we can't communicate with device-mapper, should we try running
>> +    # the LVM1 tools?
>> +    # This option only applies to 2.4 kernels and is provided to help you
>> +    # switch between device-mapper kernels and LVM1 kernels.
>> +    # The LVM1 tools need to be installed with .lvm1 suffices
>> +    # e.g. vgscan.lvm1 and they will stop working after you start using
>> +    # the new lvm2 on-disk metadata format.
>> +    # The default value is set when the tools are built.
>> +    # fallback_to_lvm1 = 0
>> +
>> +    # The default metadata format that commands should use - "lvm1" or "lvm2".
>> +    # The command line override is -M1 or -M2.
>> +    # Defaults to "lvm1" if compiled in, else "lvm2".
>> +    # format = "lvm1"
>> +
>> +    # Location of proc filesystem
>> +    proc = "/proc"
>> +
>> +    # Type of locking to use. Defaults to file-based locking (1).
>> +    # Turn locking off by setting to 0 (dangerous: risks metadata corruption
>> +    # if LVM2 commands get run concurrently).
>> +    locking_type = 1
>> +
>> +    # Local non-LV directory that holds file-based locks while commands are
>> +    # in progress.  A directory like /tmp that may get wiped on reboot is OK.
>> +    locking_dir = "/var/lock/lvm"
>> +
>> +    # Other entries can go here to allow you to load shared libraries
>> +    # e.g. if support for LVM1 metadata was compiled as a shared library use
>> +    #   format_libraries = "liblvm2format1.so"
>> +    # Full pathnames can be given.
>> +
>> +    # Search this directory first for shared libraries.
>> +    #   library_dir = "/lib"
>> +}
>> +
>> +activation {
>> +    # Device used in place of missing stripes if activating incomplete volume.
>> +    # For now, you need to set this up yourself first (e.g. with 'dmsetup')
>> +    # For example, you could make it return I/O errors using the 'error'
>> +    # target or make it return zeros.
>> +    missing_stripe_filler = "/dev/ioerror"
>> +
>> +    # Size (in KB) of each copy operation when mirroring
>> +    mirror_region_size = 512
>> +
>> +    # How much stack (in KB) to reserve for use while devices suspended
>> +    reserved_stack = 256
>> +
>> +    # How much memory (in KB) to reserve for use while devices suspended
>> +    reserved_memory = 8192
>> +
>> +    # Nice value used while devices suspended
>> +    process_priority = -18
>> +
>> +    # If volume_list is defined, each LV is only activated if there is a
>> +    # match against the list.
>> +    #   "vgname" and "vgname/lvname" are matched exactly.
>> +    #   "@tag" matches any tag set in the LV or VG.
>> +    #   "@*" matches if any tag defined on the host is also set in the LV or VG
>> +    #
>> +    # volume_list = [ "vg1", "vg2/lvol1", "@tag1", "@*" ]
>> +}
>> +
>> +
>> +####################
>> +# Advanced section #
>> +####################
>> +
>> +# Metadata settings
>> +#
>> +# metadata {
>> +    # Default number of copies of metadata to hold on each PV.  0, 1 or 2.
>> +    # You might want to override it from the command line with 0
>> +    # when running pvcreate on new PVs which are to be added to large VGs.
>> +
>> +    # pvmetadatacopies = 1
>> +
>> +    # Approximate default size of on-disk metadata areas in sectors.
>> +    # You should increase this if you have large volume groups or
>> +    # you want to retain a large on-disk history of your metadata changes.
>> +
>> +    # pvmetadatasize = 255
>> +
>> +    # List of directories holding live copies of text format metadata.
>> +    # These directories must not be on logical volumes!
>> +    # It's possible to use LVM2 with a couple of directories here,
>> +    # preferably on different (non-LV) filesystems, and with no other
>> +    # on-disk metadata (pvmetadatacopies = 0). Or this can be in
>> +    # addition to on-disk metadata areas.
>> +    # The feature was originally added to simplify testing and is not
>> +    # supported under low memory situations - the machine could lock up.
>> +    #
>> +    # Never edit any files in these directories by hand unless you
>> +    # you are absolutely sure you know what you are doing! Use
>> +    # the supplied toolset to make changes (e.g. vgcfgrestore).
>> +
>> +    # dirs = [ "/etc/lvm/metadata", "/mnt/disk2/lvm/metadata2" ]
>> +#}
>> +
>> +# Event daemon
>> +#
>> +dmeventd {
>> +    # mirror_library is the library used when monitoring a mirror device.
>> +    #
>> +    # "libdevmapper-event-lvm2mirror.so" attempts to recover from
>> +    # failures.  It removes failed devices from a volume group and
>> +    # reconfigures a mirror as necessary. If no mirror library is
>> +    # provided, mirrors are not monitored through dmeventd.
>> +
>> +    mirror_library = "@libdir@/device-mapper/libdevmapper-event-lvm2mirror.so"
>> +
>> +    # snapshot_library is the library used when monitoring a snapshot device.
>> +    #
>> +    # "libdevmapper-event-lvm2snapshot.so" monitors the filling of
>> +    # snapshots and emits a warning through syslog when the use of
>> +    # the snapshot exceeds 80%. The warning is repeated when 85%, 90% and
>> +    # 95% of the snapshot is filled.
>> +
>> +    snapshot_library = "@libdir@/device-mapper/libdevmapper-event-lvm2snapshot.so"
>> +
>> +    # thin_library is the library used when monitoring a thin device.
>> +    #
>> +    # "libdevmapper-event-lvm2thin.so" monitors the filling of
>> +    # pool and emits a warning through syslog when the use of
>> +    # the pool exceeds 80%. The warning is repeated when 85%, 90% and
>> +    # 95% of the pool is filled.
>> +
>> +    thin_library = "@libdir@/device-mapper/libdevmapper-event-lvm2thin.so"
>> +
>> +    # Full path of the dmeventd binary.
>> +    #
>> +    # executable = "@DMEVENTD_PATH@"
>> +}
>> +
>> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
>> new file mode 100644
>> index 0000000..462e8fb
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
>> @@ -0,0 +1,31 @@
>> +require lvm2.inc
>> +
>> +SRC_URI[md5sum] = "c5a54ee0b86703daaad6e856439e115a"
>> +SRC_URI[sha256sum] = "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655051b94"
>> +
>> +DEPENDS += "autoconf-archive-native"
>> +
>> +PACKAGECONFIG = ""
>> +
>> +# Unset user/group to unbreak install.
>> +EXTRA_OECONF = "--with-user= \
>> +                --with-group= \
>> +                --enable-pkgconfig \
>> +                --with-usrlibdir=${libdir} \
>> +"
>> +
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>> +do_install_append() {
>> +    # Remove things unrelated to libdevmapper
>> +    rm -rf ${D}${sysconfdir}
>> +    for i in `ls ${D}${sbindir}/*`; do
>> +	if [ $i != ${D}${sbindir}/dmsetup ]; then
>> +	    rm $i
>> +	fi
>> +    done
>> +    # Remove docs
>> +    rm -rf ${D}${datadir}
>> +}
>> +
>> +RRECOMMENDS_${PN} += "lvm2-udevrules"
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
>> index e295e20..cb5a9e0 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>> @@ -18,15 +18,6 @@ S = "${WORKDIR}/LVM2.${PV}"
>>   
>>   inherit autotools-brokensep pkgconfig systemd
>>   
>> -LVM2_PACKAGECONFIG = "dmeventd lvmetad"
>> -LVM2_PACKAGECONFIG_append_class-target = " \
>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
>> -    thin-provisioning-tools \
>> -    udev \
>> -"
>> -
>> -PACKAGECONFIG ??= "${LVM2_PACKAGECONFIG}"
>> -
>>   # odirect is always enabled because there currently is a bug in
>>   # lib/device/dev-io.c which prevents compiling without it. It is
>>   # better to stick to configurations that were actually tested by
>> @@ -40,69 +31,3 @@ PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
>>   PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
>>   PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
>>   PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev"
>> -
>> -# Unset user/group to unbreak install.
>> -EXTRA_OECONF = "--with-user= \
>> -                --with-group= \
>> -                --enable-realtime \
>> -                --enable-applib \
>> -                --enable-cmdlib \
>> -                --enable-pkgconfig \
>> -                --with-usrlibdir=${libdir} \
>> -                --with-systemdsystemunitdir=${systemd_system_unitdir} \
>> -                --disable-thin_check_needs_check \
>> -                --with-thin-check=${sbindir}/thin_check \
>> -                --with-thin-dump=${sbindir}/thin_dump \
>> -                --with-thin-repair=${sbindir}/thin_repair \
>> -                --with-thin-restore=${sbindir}/thin_restore \
>> -"
>> -
>> -CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
>> -
>> -do_install_append() {
>> -    # Install machine specific configuration file
>> -    install -d ${D}${sysconfdir}/lvm
>> -    install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
>> -    sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
>> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>> -        oe_runmake 'DESTDIR=${D}' install install_systemd_units
>> -        sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_system_unitdir}/blk-availability.service
>> -    else
>> -        oe_runmake 'DESTDIR=${D}' install install_initscripts
>> -        mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
>> -        rm -rf ${D}${sysconfdir}/rc.d
>> -    fi
>> -}
>> -
>> -PACKAGE_BEFORE_PN = "${PN}-scripts libdevmapper libdevmapper-dev"
>> -
>> -SYSTEMD_PACKAGES = "${PN}"
>> -SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
>> -                         ${@bb.utils.contains('PACKAGECONFIG', 'lvmetad', 'lvm2-lvmetad.socket lvm2-pvscan@.service', '', d)} \
>> -                         blk-availability.service"
>> -SYSTEMD_AUTO_ENABLE = "disable"
>> -
>> -TARGET_CC_ARCH += "${LDFLAGS}"
>> -
>> -FILES_${PN} += "${libdir}/device-mapper/*.so"
>> -FILES_${PN}-scripts = " \
>> -    ${sbindir}/blkdeactivate \
>> -    ${sbindir}/fsadm \
>> -    ${sbindir}/lvmconf \
>> -    ${sbindir}/lvmdump \
>> -"
>> -# Specified explicitly for the udev rules, just in case that it does not get picked
>> -# up automatically:
>> -RDEPENDS_${PN}_append_class-target = " libdevmapper"
>> -FILES_libdevmapper = "${sbindir}/dmsetup ${libdir}/libdevmapper.so.* ${nonarch_base_libdir}/udev/rules.d"
>> -FILES_libdevmapper-dev = " \
>> -    ${libdir}/libdevmapper.so \
>> -    ${libdir}/pkgconfig/devmapper.pc \
>> -    ${includedir}/libdevmapper.h \
>> -"
>> -
>> -RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
>> -RDEPENDS_libdevmapper-dev = "libdevmapper (= ${EXTENDPKGV})"
>> -RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
>> -
>> -CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scripts.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scripts.patch
>> deleted file mode 100644
>> index e86ab25..0000000
>> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scripts.patch
>> +++ /dev/null
>> @@ -1,182 +0,0 @@
>> -From 916ea0c70fd063ab7b81f16fd917a75dc02edf4f Mon Sep 17 00:00:00 2001
>> -From: Peter Kjellerstedt <pkj@axis.com>
>> -Date: Fri, 17 Mar 2017 03:18:28 +0100
>> -Subject: [PATCH] Avoid bashisms in init scripts
>> -
>> -Upstream-Status: Inappropriate
>> -
>> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> ----
>> - scripts/blk_availability_init_red_hat.in      | 4 ++--
>> - scripts/clvmd_init_red_hat.in                 | 6 +++---
>> - scripts/cmirrord_init_red_hat.in              | 4 ++--
>> - scripts/lvm2_cluster_activation_red_hat.sh.in | 4 ++--
>> - scripts/lvm2_lvmetad_init_red_hat.in          | 4 ++--
>> - scripts/lvm2_lvmpolld_init_red_hat.in         | 4 ++--
>> - scripts/lvm2_monitoring_init_red_hat.in       | 4 ++--
>> - scripts/lvm2_monitoring_init_rhel4            | 4 ++--
>> - 8 files changed, 17 insertions(+), 17 deletions(-)
>> -
>> -diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_availability_init_red_hat.in
>> -index a84ffe7..6b855b7 100644
>> ---- a/scripts/blk_availability_init_red_hat.in
>> -+++ b/scripts/blk_availability_init_red_hat.in
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> - #
>> - # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
>> - #
>> -@@ -53,6 +53,6 @@ case "$1" in
>> -   status)
>> - 	;;
>> -   *)
>> --	echo $"Usage: $0 {start|stop|status}"
>> -+	echo "Usage: $0 {start|stop|status}"
>> - 	;;
>> - esac
>> -diff --git a/scripts/clvmd_init_red_hat.in b/scripts/clvmd_init_red_hat.in
>> -index d7f3392..abc8011 100644
>> ---- a/scripts/clvmd_init_red_hat.in
>> -+++ b/scripts/clvmd_init_red_hat.in
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> - #
>> - # clvmd - Clustered LVM Daemon init script
>> - #
>> -@@ -161,7 +161,7 @@ restart() {
>> - 	fi
>> - }
>> -
>> --[ "$EUID" != "0" ] && {
>> -+[ "$(id -u)" != "0" ] && {
>> - 	echo "clvmd init script can only be executed as root user"
>> - 	exit 4
>> - }
>> -@@ -206,7 +206,7 @@ case "$1" in
>> - 	;;
>> -
>> -   *)
>> --	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
>> -+	echo "Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
>> - 	rtrn=2
>> - 	;;
>> - esac
>> -diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_red_hat.in
>> -index d4b7e37..d442cbc 100755
>> ---- a/scripts/cmirrord_init_red_hat.in
>> -+++ b/scripts/cmirrord_init_red_hat.in
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> - #
>> - # chkconfig: - 22 78
>> - # description: Starts and stops cmirrord
>> -@@ -101,7 +101,7 @@ case "$1" in
>> - 		;;
>> -
>> - 	*)
>> --		echo $"Usage: $0 {start|stop|restart|status}"
>> -+		echo "Usage: $0 {start|stop|restart|status}"
>> - 		;;
>> - esac
>> -
>> -diff --git a/scripts/lvm2_cluster_activation_red_hat.sh.in b/scripts/lvm2_cluster_activation_red_hat.sh.in
>> -index abea026..d8cba2e 100644
>> ---- a/scripts/lvm2_cluster_activation_red_hat.sh.in
>> -+++ b/scripts/lvm2_cluster_activation_red_hat.sh.in
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> -
>> - sbindir=@sbindir@
>> -
>> -@@ -54,7 +54,7 @@ case "$1" in
>> - 	rtrn=$?
>> - 	;;
>> -   *)
>> --	echo $"Usage: $0 {activate|deactivate}"
>> -+	echo "Usage: $0 {activate|deactivate}"
>> - 	rtrn=3
>> - 	;;
>> - esac
>> -diff --git a/scripts/lvm2_lvmetad_init_red_hat.in b/scripts/lvm2_lvmetad_init_red_hat.in
>> -index b2f5d50..96269a9 100644
>> ---- a/scripts/lvm2_lvmetad_init_red_hat.in
>> -+++ b/scripts/lvm2_lvmetad_init_red_hat.in
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> - #
>> - # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
>> - #
>> -@@ -105,7 +105,7 @@ case "$1" in
>> - 	;;
>> -
>> -   *)
>> --	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
>> -+	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
>> - 	;;
>> - esac
>> -
>> -diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpolld_init_red_hat.in
>> -index c521955..cdbaece 100644
>> ---- a/scripts/lvm2_lvmpolld_init_red_hat.in
>> -+++ b/scripts/lvm2_lvmpolld_init_red_hat.in
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> - #
>> - # Copyright (C) 2015 Red Hat, Inc. All rights reserved.
>> - #
>> -@@ -107,7 +107,7 @@ case "$1" in
>> - 	;;
>> -
>> -   *)
>> --	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
>> -+	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
>> - 	;;
>> - esac
>> -
>> -diff --git a/scripts/lvm2_monitoring_init_red_hat.in b/scripts/lvm2_monitoring_init_red_hat.in
>> -index de7ff0d..9ff6bb7 100644
>> ---- a/scripts/lvm2_monitoring_init_red_hat.in
>> -+++ b/scripts/lvm2_monitoring_init_red_hat.in
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> - #
>> - # Copyright (C) 2007-2009 Red Hat, Inc. All rights reserved.
>> - #
>> -@@ -128,7 +128,7 @@ case "$1" in
>> - 	;;
>> -
>> -   *)
>> --	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
>> -+	echo "Usage: $0 {start|stop|restart|status|force-stop}"
>> - 	;;
>> - esac
>> -
>> -diff --git a/scripts/lvm2_monitoring_init_rhel4 b/scripts/lvm2_monitoring_init_rhel4
>> -index 8eb06c5..2e8d0f7 100644
>> ---- a/scripts/lvm2_monitoring_init_rhel4
>> -+++ b/scripts/lvm2_monitoring_init_rhel4
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> - #
>> - # Copyright (C) 2007 Red Hat, Inc. All rights reserved.
>> - #
>> -@@ -93,7 +93,7 @@ case "$1" in
>> - 	;;
>> -
>> -   *)
>> --	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
>> -+	echo "Usage: $0 {start|stop|restart|status|force-stop}"
>> - 	;;
>> - esac
>> -
>> ---
>> -2.12.0
>> -
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
>> deleted file mode 100644
>> index 5d72402..0000000
>> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
>> +++ /dev/null
>> @@ -1,79 +0,0 @@
>> -From e3103459416616d3b8508e7176e897b0ae6c90f2 Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Tue, 25 Oct 2016 11:49:40 +0000
>> -Subject: [PATCH] implement libc specific reopen_stream
>> -
>> -musl defines stdin/stdio/stderr as constant types which means
>> -we can not assign to them as we are doing here but works ok with glibc
>> -therefore abstract out the _reopen_stream definition depending upon if
>> -we are using glibc or otherwise
>> -
>> -Origin:
>> -http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> -
>> ----
>> - lib/log/log.c      | 6 ++++++
>> - tools/lvmcmdline.c | 6 +++---
>> - 2 files changed, 9 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/lib/log/log.c b/lib/log/log.c
>> -index c933154..3581084 100644
>> ---- a/lib/log/log.c
>> -+++ b/lib/log/log.c
>> -@@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
>> -  * Close and reopen standard stream on file descriptor fd.
>> -  */
>> - int reopen_standard_stream(FILE **stream, const char *mode)
>> -+#ifdef __GLIBC__
>> - {
>> - 	int fd, fd_copy, new_fd;
>> - 	const char *name;
>> -@@ -207,6 +208,11 @@ int reopen_standard_stream(FILE **stream, const char *mode)
>> - 	*stream = new_stream;
>> - 	return 1;
>> - }
>> -+#else
>> -+{
>> -+	return (freopen(NULL, mode, *stream) != NULL);
>> -+}
>> -+#endif
>> -
>> - void init_log_fn(lvm2_log_fn_t log_fn)
>> - {
>> -diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
>> -index 9a4deb7..f1f18e6 100644
>> ---- a/tools/lvmcmdline.c
>> -+++ b/tools/lvmcmdline.c
>> -@@ -1818,7 +1818,7 @@ static int _check_standard_fds(void)
>> - 	int err = is_valid_fd(STDERR_FILENO);
>> -
>> - 	if (!is_valid_fd(STDIN_FILENO) &&
>> --	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
>> -+	    !freopen(_PATH_DEVNULL, "r", stdin)) {
>> - 		if (err)
>> - 			perror("stdin stream open");
>> - 		else
>> -@@ -1828,7 +1828,7 @@ static int _check_standard_fds(void)
>> - 	}
>> -
>> - 	if (!is_valid_fd(STDOUT_FILENO) &&
>> --	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
>> -+	    !freopen(_PATH_DEVNULL, "w", stdout)) {
>> - 		if (err)
>> - 			perror("stdout stream open");
>> - 		/* else no stdout */
>> -@@ -1836,7 +1836,7 @@ static int _check_standard_fds(void)
>> - 	}
>> -
>> - 	if (!is_valid_fd(STDERR_FILENO) &&
>> --	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
>> -+	    !freopen(_PATH_DEVNULL, "w", stderr)) {
>> - 		printf("stderr stream open: %s\n",
>> - 		       strerror(errno));
>> - 		return 0;
>> ---
>> -2.12.0
>> -
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>> deleted file mode 100644
>> index 95dcede..0000000
>> --- a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From 3ae9c0b607ec33fb07f32a41e9d28cc9068dd39a Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Tue, 25 Oct 2016 11:52:44 +0000
>> -Subject: [PATCH] Guard use of mallinfo() with __GLIBC__
>> -
>> -This API is glibc-only
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> -
>> ----
>> - lib/mm/memlock.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
>> -index da90144..f34f890 100644
>> ---- a/lib/mm/memlock.c
>> -+++ b/lib/mm/memlock.c
>> -@@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
>> -
>> - static void _allocate_memory(void)
>> - {
>> --#ifndef VALGRIND_POOL
>> -+#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
>> - 	void *stack_mem;
>> - 	struct rlimit limit;
>> - 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
>> ---
>> -2.12.0
>> -
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch b/meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
>> deleted file mode 100644
>> index 9ab1c06..0000000
>> --- a/meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From b1ad91a059d99afd1ce25823b7c0a8d3ac63d2fd Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Tue, 25 Oct 2016 11:55:49 +0000
>> -Subject: [PATCH 3/4] include fcntl.h for O_* defines and fcntl() signature
>> -
>> -On glibc _somehow_ this header gets pulled in indirectly
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> -Upstream-Status: Pending
>> ----
>> - libdaemon/server/daemon-server.c | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
>> -index 6af6de9..a9590e7 100644
>> ---- a/libdaemon/server/daemon-server.c
>> -+++ b/libdaemon/server/daemon-server.c
>> -@@ -18,6 +18,7 @@
>> - #include "daemon-server.h"
>> - #include "daemon-log.h"
>> -
>> -+#include <fcntl.h>
>> - #include <dlfcn.h>
>> - #include <errno.h>
>> - #include <pthread.h>
>> ---
>> -2.9.3
>> -
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
>> deleted file mode 100644
>> index aaeaa72..0000000
>> --- a/meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From 0012ea63f6070a5d41fa380970f9c30b953237d2 Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Tue, 25 Oct 2016 11:59:40 +0000
>> -Subject: [PATCH 4/4] tweak MODPROBE_CMD for cross compile
>> -
>> -Lvm uses variable MODPROBE_CMD at runtime, so build time detection of modprobe
>> -is incorrect.
>> -------
>> -|lvm lvcreate --thinpool wrl/pool00 --size 5556m --config  devices
>> -{ preferred_names=["^/dev/mapper/", "^/dev/md/", "^/dev/sd"]
>> -filter=["r|/loop1$|","r|/loop2$|","r|/loop3$|","r|/loop4$|","r|/loop5$|","r|/loop6$|","r|/loop7$|"] }
>> -|tmp/sysroots/x86_64-linux/usr/bin/modprobe: execvp failed: No such file or directory
>> -|tmp/sysroots/x86_64-linux/usr/bin/modprobe failed: 2
>> -------
>> -
>> -Upstream-Status: Inappropriate [oe specific]
>> -
>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> - configure.in | 1 -
>> - 1 file changed, 1 deletion(-)
>> -
>> -diff --git a/configure.in b/configure.in
>> -index cc77aab..a3579f2 100644
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -1853,7 +1853,6 @@ if test "$UDEV_SYNC" = yes; then
>> - fi
>> -
>> - ################################################################################
>> --AC_PATH_TOOL(MODPROBE_CMD, modprobe)
>> -
>> - if test -n "$MODPROBE_CMD"; then
>> - 	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'modprobe', if available.])
>> ---
>> -2.9.3
>> -
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/lvm.conf b/meta-oe/recipes-support/lvm2/lvm2/lvm.conf
>> deleted file mode 100644
>> index 9e3b5fe..0000000
>> --- a/meta-oe/recipes-support/lvm2/lvm2/lvm.conf
>> +++ /dev/null
>> @@ -1,326 +0,0 @@
>> -# This is an example configuration file for the LVM2 system.
>> -# It contains the default settings that would be used if there was no
>> -# /etc/lvm/lvm.conf file.
>> -#
>> -# Refer to 'man lvm.conf' for further information including the file layout.
>> -#
>> -# To put this file in a different directory and override /etc/lvm set
>> -# the environment variable LVM_SYSTEM_DIR before running the tools.
>> -
>> -
>> -# This section allows you to configure which block devices should
>> -# be used by the LVM system.
>> -devices {
>> -
>> -    # Where do you want your volume groups to appear ?
>> -    dir = "/dev"
>> -
>> -    # An array of directories that contain the device nodes you wish
>> -    # to use with LVM2.
>> -    scan = [ "/dev" ]
>> -
>> -    # A filter that tells LVM2 to only use a restricted set of devices.
>> -    # The filter consists of an array of regular expressions.  These
>> -    # expressions can be delimited by a character of your choice, and
>> -    # prefixed with either an 'a' (for accept) or 'r' (for reject).
>> -    # The first expression found to match a device name determines if
>> -    # the device will be accepted or rejected (ignored).  Devices that
>> -    # don't match any patterns are accepted.
>> -
>> -    # Be careful if there there are symbolic links or multiple filesystem
>> -    # entries for the same device as each name is checked separately against
>> -    # the list of patterns.  The effect is that if any name matches any 'a'
>> -    # pattern, the device is accepted; otherwise if any name matches any 'r'
>> -    # pattern it is rejected; otherwise it is accepted.
>> -
>> -    # Don't have more than one filter line active at once: only one gets used.
>> -
>> -    # Run vgscan after you change this parameter to ensure that
>> -    # the cache file gets regenerated (see below).
>> -    # If it doesn't do what you expect, check the output of 'vgscan -vvvv'.
>> -
>> -
>> -    # By default we accept every block device:
>> -    filter = [ "a/.*/" ]
>> -
>> -    # Exclude the cdrom drive
>> -    # filter = [ "r|/dev/cdrom|" ]
>> -
>> -    # When testing I like to work with just loopback devices:
>> -    # filter = [ "a/loop/", "r/.*/" ]
>> -
>> -    # Or maybe all loops and ide drives except hdc:
>> -    # filter =[ "a|loop|", "r|/dev/hdc|", "a|/dev/ide|", "r|.*|" ]
>> -
>> -    # Use anchors if you want to be really specific
>> -    # filter = [ "a|^/dev/hda8$|", "r/.*/" ]
>> -
>> -    # The results of the filtering are cached on disk to avoid
>> -    # rescanning dud devices (which can take a very long time).  By
>> -    # default this cache file is hidden in the /etc/lvm directory.
>> -    # It is safe to delete this file: the tools regenerate it.
>> -    cache = "/etc/lvm/.cache"
>> -
>> -    # You can turn off writing this cache file by setting this to 0.
>> -    write_cache_state = 1
>> -
>> -    # Advanced settings.
>> -
>> -    # List of pairs of additional acceptable block device types found
>> -    # in /proc/devices with maximum (non-zero) number of partitions.
>> -    # types = [ "fd", 16 ]
>> -
>> -    # If sysfs is mounted (2.6 kernels) restrict device scanning to
>> -    # the block devices it believes are valid.
>> -    # 1 enables; 0 disables.
>> -    sysfs_scan = 1	
>> -
>> -    # By default, LVM2 will ignore devices used as components of
>> -    # software RAID (md) devices by looking for md superblocks.
>> -    # 1 enables; 0 disables.
>> -    md_component_detection = 1
>> -}
>> -
>> -# This section that allows you to configure the nature of the
>> -# information that LVM2 reports.
>> -log {
>> -
>> -    # Controls the messages sent to stdout or stderr.
>> -    # There are three levels of verbosity, 3 being the most verbose.
>> -    verbose = 0
>> -
>> -    # Should we send log messages through syslog?
>> -    # 1 is yes; 0 is no.
>> -    syslog = 1
>> -
>> -    # Should we log error and debug messages to a file?
>> -    # By default there is no log file.
>> -    #file = "/var/log/lvm2.log"
>> -
>> -    # Should we overwrite the log file each time the program is run?
>> -    # By default we append.
>> -    overwrite = 0
>> -
>> -    # What level of log messages should we send to the log file and/or syslog?
>> -    # There are 6 syslog-like log levels currently in use - 2 to 7 inclusive.
>> -    # 7 is the most verbose (LOG_DEBUG).
>> -    level = 0
>> -
>> -    # Format of output messages
>> -    # Whether or not (1 or 0) to indent messages according to their severity
>> -    indent = 1
>> -
>> -    # Whether or not (1 or 0) to display the command name on each line output
>> -    command_names = 0
>> -
>> -    # A prefix to use before the message text (but after the command name,
>> -    # if selected).  Default is two spaces, so you can see/grep the severity
>> -    # of each message.
>> -    prefix = "  "
>> -
>> -    # To make the messages look similar to the original LVM tools use:
>> -    #   indent = 0
>> -    #   command_names = 1
>> -    #   prefix = " -- "
>> -
>> -    # Set this if you want log messages during activation.
>> -    # Don't use this in low memory situations (can deadlock).
>> -    # activation = 0
>> -}
>> -
>> -# Configuration of metadata backups and archiving.  In LVM2 when we
>> -# talk about a 'backup' we mean making a copy of the metadata for the
>> -# *current* system.  The 'archive' contains old metadata configurations.
>> -# Backups are stored in a human readeable text format.
>> -backup {
>> -
>> -    # Should we maintain a backup of the current metadata configuration ?
>> -    # Use 1 for Yes; 0 for No.
>> -    # Think very hard before turning this off!
>> -    backup = 1
>> -
>> -    # Where shall we keep it ?
>> -    # Remember to back up this directory regularly!
>> -    backup_dir = "/etc/lvm/backup"
>> -
>> -    # Should we maintain an archive of old metadata configurations.
>> -    # Use 1 for Yes; 0 for No.
>> -    # On by default.  Think very hard before turning this off.
>> -    archive = 1
>> -
>> -    # Where should archived files go ?
>> -    # Remember to back up this directory regularly!
>> -    archive_dir = "/etc/lvm/archive"
>> -
>> -    # What is the minimum number of archive files you wish to keep ?
>> -    retain_min = 10
>> -
>> -    # What is the minimum time you wish to keep an archive file for ?
>> -    retain_days = 30
>> -}
>> -
>> -# Settings for the running LVM2 in shell (readline) mode.
>> -shell {
>> -
>> -    # Number of lines of history to store in ~/.lvm_history
>> -    history_size = 100
>> -}
>> -
>> -
>> -# Miscellaneous global LVM2 settings
>> -global {
>> -
>> -    # The file creation mask for any files and directories created.
>> -    # Interpreted as octal if the first digit is zero.
>> -    umask = 077
>> -
>> -    # Allow other users to read the files
>> -    #umask = 022
>> -
>> -    # Enabling test mode means that no changes to the on disk metadata
>> -    # will be made.  Equivalent to having the -t option on every
>> -    # command.  Defaults to off.
>> -    test = 0
>> -
>> -    # Whether or not to communicate with the kernel device-mapper.
>> -    # Set to 0 if you want to use the tools to manipulate LVM metadata
>> -    # without activating any logical volumes.
>> -    # If the device-mapper kernel driver is not present in your kernel
>> -    # setting this to 0 should suppress the error messages.
>> -    activation = 1
>> -
>> -    # If we can't communicate with device-mapper, should we try running
>> -    # the LVM1 tools?
>> -    # This option only applies to 2.4 kernels and is provided to help you
>> -    # switch between device-mapper kernels and LVM1 kernels.
>> -    # The LVM1 tools need to be installed with .lvm1 suffices
>> -    # e.g. vgscan.lvm1 and they will stop working after you start using
>> -    # the new lvm2 on-disk metadata format.
>> -    # The default value is set when the tools are built.
>> -    # fallback_to_lvm1 = 0
>> -
>> -    # The default metadata format that commands should use - "lvm1" or "lvm2".
>> -    # The command line override is -M1 or -M2.
>> -    # Defaults to "lvm1" if compiled in, else "lvm2".
>> -    # format = "lvm1"
>> -
>> -    # Location of proc filesystem
>> -    proc = "/proc"
>> -
>> -    # Type of locking to use. Defaults to file-based locking (1).
>> -    # Turn locking off by setting to 0 (dangerous: risks metadata corruption
>> -    # if LVM2 commands get run concurrently).
>> -    locking_type = 1
>> -
>> -    # Local non-LV directory that holds file-based locks while commands are
>> -    # in progress.  A directory like /tmp that may get wiped on reboot is OK.
>> -    locking_dir = "/var/lock/lvm"
>> -
>> -    # Other entries can go here to allow you to load shared libraries
>> -    # e.g. if support for LVM1 metadata was compiled as a shared library use
>> -    #   format_libraries = "liblvm2format1.so"
>> -    # Full pathnames can be given.
>> -
>> -    # Search this directory first for shared libraries.
>> -    #   library_dir = "/lib"
>> -}
>> -
>> -activation {
>> -    # Device used in place of missing stripes if activating incomplete volume.
>> -    # For now, you need to set this up yourself first (e.g. with 'dmsetup')
>> -    # For example, you could make it return I/O errors using the 'error'
>> -    # target or make it return zeros.
>> -    missing_stripe_filler = "/dev/ioerror"
>> -
>> -    # Size (in KB) of each copy operation when mirroring
>> -    mirror_region_size = 512
>> -
>> -    # How much stack (in KB) to reserve for use while devices suspended
>> -    reserved_stack = 256
>> -
>> -    # How much memory (in KB) to reserve for use while devices suspended
>> -    reserved_memory = 8192
>> -
>> -    # Nice value used while devices suspended
>> -    process_priority = -18
>> -
>> -    # If volume_list is defined, each LV is only activated if there is a
>> -    # match against the list.
>> -    #   "vgname" and "vgname/lvname" are matched exactly.
>> -    #   "@tag" matches any tag set in the LV or VG.
>> -    #   "@*" matches if any tag defined on the host is also set in the LV or VG
>> -    #
>> -    # volume_list = [ "vg1", "vg2/lvol1", "@tag1", "@*" ]
>> -}
>> -
>> -
>> -####################
>> -# Advanced section #
>> -####################
>> -
>> -# Metadata settings
>> -#
>> -# metadata {
>> -    # Default number of copies of metadata to hold on each PV.  0, 1 or 2.
>> -    # You might want to override it from the command line with 0
>> -    # when running pvcreate on new PVs which are to be added to large VGs.
>> -
>> -    # pvmetadatacopies = 1
>> -
>> -    # Approximate default size of on-disk metadata areas in sectors.
>> -    # You should increase this if you have large volume groups or
>> -    # you want to retain a large on-disk history of your metadata changes.
>> -
>> -    # pvmetadatasize = 255
>> -
>> -    # List of directories holding live copies of text format metadata.
>> -    # These directories must not be on logical volumes!
>> -    # It's possible to use LVM2 with a couple of directories here,
>> -    # preferably on different (non-LV) filesystems, and with no other
>> -    # on-disk metadata (pvmetadatacopies = 0). Or this can be in
>> -    # addition to on-disk metadata areas.
>> -    # The feature was originally added to simplify testing and is not
>> -    # supported under low memory situations - the machine could lock up.
>> -    #
>> -    # Never edit any files in these directories by hand unless you
>> -    # you are absolutely sure you know what you are doing! Use
>> -    # the supplied toolset to make changes (e.g. vgcfgrestore).
>> -
>> -    # dirs = [ "/etc/lvm/metadata", "/mnt/disk2/lvm/metadata2" ]
>> -#}
>> -
>> -# Event daemon
>> -#
>> -dmeventd {
>> -    # mirror_library is the library used when monitoring a mirror device.
>> -    #
>> -    # "libdevmapper-event-lvm2mirror.so" attempts to recover from
>> -    # failures.  It removes failed devices from a volume group and
>> -    # reconfigures a mirror as necessary. If no mirror library is
>> -    # provided, mirrors are not monitored through dmeventd.
>> -
>> -    mirror_library = "@libdir@/device-mapper/libdevmapper-event-lvm2mirror.so"
>> -
>> -    # snapshot_library is the library used when monitoring a snapshot device.
>> -    #
>> -    # "libdevmapper-event-lvm2snapshot.so" monitors the filling of
>> -    # snapshots and emits a warning through syslog when the use of
>> -    # the snapshot exceeds 80%. The warning is repeated when 85%, 90% and
>> -    # 95% of the snapshot is filled.
>> -
>> -    snapshot_library = "@libdir@/device-mapper/libdevmapper-event-lvm2snapshot.so"
>> -
>> -    # thin_library is the library used when monitoring a thin device.
>> -    #
>> -    # "libdevmapper-event-lvm2thin.so" monitors the filling of
>> -    # pool and emits a warning through syslog when the use of
>> -    # the pool exceeds 80%. The warning is repeated when 85%, 90% and
>> -    # 95% of the pool is filled.
>> -
>> -    thin_library = "@libdir@/device-mapper/libdevmapper-event-lvm2thin.so"
>> -
>> -    # Full path of the dmeventd binary.
>> -    #
>> -    # executable = "@DMEVENTD_PATH@"
>> -}
>> -
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
>> index c81faa7..c196e63 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
>> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
>> @@ -5,4 +5,77 @@ SRC_URI[sha256sum] = "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655
>>   
>>   DEPENDS += "autoconf-archive-native"
>>   
>> +LVM2_PACKAGECONFIG = "dmeventd lvmetad"
>> +LVM2_PACKAGECONFIG_append_class-target = " \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
>> +    thin-provisioning-tools \
>> +    udev \
>> +"
>> +
>> +PACKAGECONFIG ??= "${LVM2_PACKAGECONFIG}"
>> +
>> +# Unset user/group to unbreak install.
>> +EXTRA_OECONF = "--with-user= \
>> +                --with-group= \
>> +                --enable-realtime \
>> +                --enable-applib \
>> +                --enable-cmdlib \
>> +                --enable-pkgconfig \
>> +                --with-usrlibdir=${libdir} \
>> +                --with-systemdsystemunitdir=${systemd_system_unitdir} \
>> +                --disable-thin_check_needs_check \
>> +                --with-thin-check=${sbindir}/thin_check \
>> +                --with-thin-dump=${sbindir}/thin_dump \
>> +                --with-thin-repair=${sbindir}/thin_repair \
>> +                --with-thin-restore=${sbindir}/thin_restore \
>> +"
>> +
>> +CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
>> +
>> +do_install_append() {
>> +    # Install machine specific configuration file
>> +    install -d ${D}${sysconfdir}/lvm
>> +    install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
>> +    sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
>> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>> +        oe_runmake 'DESTDIR=${D}' install install_systemd_units
>> +        sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_system_unitdir}/blk-availability.service
>> +    else
>> +        oe_runmake 'DESTDIR=${D}' install install_initscripts
>> +        mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
>> +        rm -rf ${D}${sysconfdir}/rc.d
>> +    fi
>> +    # Remove things related to libdevmapper
>> +    rm ${D}${sbindir}/dmsetup
>> +    rm ${D}${libdir}/libdevmapper.so.*
>> +    rm ${D}${libdir}/libdevmapper.so ${D}${libdir}/pkgconfig/devmapper.pc ${D}${includedir}/libdevmapper.h
>> +}
>> +
>> +PACKAGE_BEFORE_PN = "${PN}-scripts ${PN}-udevrules"
>> +
>> +SYSTEMD_PACKAGES = "${PN}"
>> +SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
>> +                         ${@bb.utils.contains('PACKAGECONFIG', 'lvmetad', 'lvm2-lvmetad.socket lvm2-pvscan@.service', '', d)} \
>> +                         blk-availability.service"
>> +SYSTEMD_AUTO_ENABLE = "disable"
>> +
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>> +FILES_${PN} += "${libdir}/device-mapper/*.so"
>> +FILES_${PN}-scripts = " \
>> +    ${sbindir}/blkdeactivate \
>> +    ${sbindir}/fsadm \
>> +    ${sbindir}/lvmconf \
>> +    ${sbindir}/lvmdump \
>> +"
>> +# Specified explicitly for the udev rules, just in case that it does not get picked
>> +# up automatically:
>> +FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
>> +RDEPENDS_${PN}_append_class-target = " libdevmapper"
>> +
>> +RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
>> +RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
>> +
>> +CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



