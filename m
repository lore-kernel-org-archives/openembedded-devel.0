Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PV6B6-0002ov-9J
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 18:39:12 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmAFAMd0EE1bdWOb/2dsb2JhbACDY5INjwywBYM7AY10gSCDNXQEiwI
X-IronPort-AV: E=Sophos;i="4.60,208,1291590000"; d="scan'208";a="313825973"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 21 Dec 2010 18:39:07 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PV6B1-0006GY-5r
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 18:39:07 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PV6B1-0000fm-1d
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 18:39:07 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PV6B0-0005x2-Gu
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 18:39:06 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 18:39:06 +0100
Message-Id: <1292953146-22849-1-git-send-email-vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.2.3
MIME-Version: 1.0
Subject: [RFC] strace: add netlink/netlink-compat.h in configure.ac
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Dec 2010 17:39:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I found, compiling an console-image for omap4330-panda machine, that strace
compilation broke because the netlink.h wasn't included. It was not included
because the AC_CHECK_HEADERS failed. If failed because sa_family_t wasn't
defined, even though linux/socket.h is supposed to define it.

This patch modifies the configure.ac in order to include
netlink/netlink-compat.h in the AC_CHECK_HEADER macro, so the header is
detected correctly.

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 recipes/strace/strace-4.5.14/netlink.patch |   16 ++++++++++++++++
 recipes/strace/strace_4.5.14.bb            |    3 ++-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 recipes/strace/strace-4.5.14/netlink.patch

diff --git a/recipes/strace/strace-4.5.14/netlink.patch b/recipes/strace/strace-4.5.14/netlink.patch
new file mode 100644
index 0000000..ba89a10
--- /dev/null
+++ b/recipes/strace/strace-4.5.14/netlink.patch
@@ -0,0 +1,16 @@
+Index: strace-4.5.14/configure.ac
+===================================================================
+--- strace-4.5.14.orig/configure.ac
++++ strace-4.5.14/configure.ac
+@@ -194,7 +194,10 @@ fi
+ AC_CHECK_FUNCS(sigaction strerror strsignal pread sys_siglist _sys_siglist getdents mctl prctl sendmsg inet_ntop if_indextoname)
+ AC_CHECK_HEADERS([sys/reg.h sys/filio.h sys/acl.h sys/asynch.h sys/door.h stropts.h sys/conf.h sys/stream.h sys/tihdr.h sys/tiuser.h sys/sysconfig.h ioctls.h sys/ioctl.h sys/ptrace.h termio.h linux/ptrace.h asm/reg.h sys/uio.h sys/aio.h  poll.h sys/poll.h sys/vfs.h asm/sysmips.h linux/utsname.h sys/nscsys.h mqueue.h sys/epoll.h libaio.h], [], [])
+ AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
+-                 [], [], [#include <linux/socket.h>])
++                 [], [], [
++#include <netlink/netlink-compat.h>
++#include <linux/socket.h>
++])
+ AC_CHECK_HEADERS([asm/sigcontext.h], [], [], [#include <signal.h>])
+ AC_CHECK_HEADERS([netinet/tcp.h netinet/udp.h],,, [#include <netinet/in.h>])
+ 
diff --git a/recipes/strace/strace_4.5.14.bb b/recipes/strace/strace_4.5.14.bb
index 33a44ad..a4a0981 100644
--- a/recipes/strace/strace_4.5.14.bb
+++ b/recipes/strace/strace_4.5.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "strace is a system call tracing tool."
 SECTION = "console/utils"
 LICENSE = "BSD"
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
            file://glibc-2.5.patch \
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
            file://strace-arm-no-cachectl.patch \
            file://strace-dont-include-linux-dirent-h.patch \
            file://mips-sigcontext.patch \
+           file://netlink.patch \
           "
 
 # The strace-4.5.14-avr32.patch conflicts with some other patches.
-- 
1.7.2.3



