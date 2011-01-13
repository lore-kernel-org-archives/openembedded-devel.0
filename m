Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PdNUt-0002n4-8O
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 14:45:51 +0100
Received: (qmail 13205 invoked by uid 503); 13 Jan 2011 14:19:53 -0000
Received: from b9.ovh.net (HELO mail173.ha.ovh.net) (213.186.33.59)
	by 31.mail-out.ovh.net with SMTP; 13 Jan 2011 14:19:53 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Jan 2011 15:45:20 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Jan 2011 15:45:18 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 14:45:04 +0100
Message-Id: <1294926304-22239-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <4D2E9269.2020409@gmail.com>
References: <4D2E9269.2020409@gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 139048638718324041
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH v2] strace: add patch allowing compilation with kernel headers >= 2.6.32
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
X-List-Received-Date: Thu, 13 Jan 2011 13:45:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

tested with kernel headers 2.6.31 & 2.6.37 : both compile fine.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
v2 : with the patch this time ;-)

 .../strace/strace-4.5.14/strace-linux-2.6.32.patch |   13 +++++++++++++
 recipes/strace/strace_4.5.14.bb                    |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch

diff --git a/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch b/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
new file mode 100644
index 0000000..cb0ffbf
--- /dev/null
+++ b/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
@@ -0,0 +1,13 @@
+diff --git a/configure.ac b/configure.ac
+index 03069c0..7a134bd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -194,7 +194,7 @@ fi
+ AC_CHECK_FUNCS(sigaction strerror strsignal pread sys_siglist _sys_siglist getdents mctl prctl sendmsg inet_ntop if_indextoname)
+ AC_CHECK_HEADERS([sys/reg.h sys/filio.h sys/acl.h sys/asynch.h sys/door.h stropts.h sys/conf.h sys/stream.h sys/tihdr.h sys/tiuser.h sys/sysconfig.h ioctls.h sys/ioctl.h sys/ptrace.h termio.h linux/ptrace.h asm/reg.h sys/uio.h sys/aio.h  poll.h sys/poll.h sys/vfs.h asm/sysmips.h linux/utsname.h sys/nscsys.h mqueue.h sys/epoll.h libaio.h], [], [])
+ AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
+-                 [], [], [#include <linux/socket.h>])
++                 [], [], [#include <sys/socket.h>])
+ AC_CHECK_HEADERS([asm/sigcontext.h], [], [], [#include <signal.h>])
+ AC_CHECK_HEADERS([netinet/tcp.h netinet/udp.h],,, [#include <netinet/in.h>])
+ 
diff --git a/recipes/strace/strace_4.5.14.bb b/recipes/strace/strace_4.5.14.bb
index 33a44ad..395e4ee 100644
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
+           file://strace-linux-2.6.32.patch \
           "
 
 # The strace-4.5.14-avr32.patch conflicts with some other patches.
-- 
1.6.3.3



