Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QLsc6-0007If-Fz
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 09:53:14 +0200
Received: from zemeckis.mikrofyn.local ([10.115.0.50]) by mail.mikrofyn.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 16 May 2011 09:55:22 +0200
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 09:50:43 +0200
Message-Id: <1305532243-7690-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <201105160936.51355.sgh@sgh.dk>
References: <201105160936.51355.sgh@sgh.dk>
X-OriginalArrivalTime: 16 May 2011 07:55:22.0750 (UTC)
	FILETIME=[9BDB41E0:01CC139E]
Subject: [PATCH] acpid: Make 1.0.10 compile.
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
X-List-Received-Date: Mon, 16 May 2011 07:53:14 -0000

Patch is tested on i686.
Compilation failed with the following error :

ERROR: Logfile of failure stored in: /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/acpid-1.0.10-r5.1/temp/log.do_compile.14235
Log data follows:
| ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/acpid-1.0.10-r5.1/temp/log.do_compile.14235 for further information)
| + cd /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/acpid-1.0.10-r5.1/acpid-1.0.10
| + do_compile
| + oe_runmake 'CC=i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=i686-angstrom-linux-
| + oenote make -j 8 'CC=i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=i686-angstrom-linux-
| + echo NOTE: 'make -j 8 CC=i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux CROSS=i686-angstrom-linux-'
| NOTE: make -j 8 CC=i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux CROSS=i686-angstrom-linux-
| + make -j 8 'CC=i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=i686-angstrom-linux-
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
acpid.o acpid.c
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
acpi_ids.o acpi_ids.c
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
connection_list.o connection_list.c
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
event.o event.c
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
input_layer.o input_layer.c
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
libnetlink.o libnetlink.c
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
netlink.o netlink.c
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
proc.o proc.c
| i686-angstrom-linux-gcc -march=pentiumpro --sysroot=/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g -DVERSION="\"1.0.10\""   -c -o
sock.o sock.c
| cc1: warnings being treated as errors
| libnetlink.c: In function 'addraw_l':
| libnetlink.c:521:56: error: comparison between signed and unsigned integer expressions
| make: *** [libnetlink.o] Error 1
| make: *** Waiting for unfinished jobs....
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package acpid-1.0.10-r5.1: task do_compile: Failed
---
 recipes/acpid/acpid-1.0.10/libnetlink.diff |   15 +++++++++++++++
 recipes/acpid/acpid_1.0.10.bb              |    1 +
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/acpid/acpid-1.0.10/libnetlink.diff

diff --git a/recipes/acpid/acpid-1.0.10/libnetlink.diff b/recipes/acpid/acpid-1.0.10/libnetlink.diff
new file mode 100644
index 0000000..59ab951
--- /dev/null
+++ b/recipes/acpid/acpid-1.0.10/libnetlink.diff
@@ -0,0 +1,15 @@
+diff --git a/libnetlink.c b/libnetlink.c
+index 6f1ceea..d34dfe4 100644
+--- a/libnetlink.c
++++ b/libnetlink.c
+@@ -518,8 +518,8 @@ int addattr_l(struct nlmsghdr *n, int maxlen, int type, const void *data,
+ 
+ int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int len)
+ {
+-	if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(len) > maxlen) {
+-		fprintf(stderr, "addraw_l ERROR: message exceeded bound of %d\n",maxlen);
++	if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_ALIGN(len) > maxlen) {
++	fprintf(stderr, "addraw_l ERROR: message exceeded bound of %d\n",maxlen);
+ 		return -1;
+ 	}
+ 
diff --git a/recipes/acpid/acpid_1.0.10.bb b/recipes/acpid/acpid_1.0.10.bb
index 9d3170d..f0a6049 100644
--- a/recipes/acpid/acpid_1.0.10.bb
+++ b/recipes/acpid/acpid_1.0.10.bb
@@ -2,6 +2,7 @@ require acpid.inc
 
 SRC_URI_append = " file://event.c.diff \
                    file://netlink.diff \
+                   file://libnetlink.diff \
                    file://gcc44.diff \
                    file://acpid-sys-stat.patch \
                  "
-- 
1.7.4.1



