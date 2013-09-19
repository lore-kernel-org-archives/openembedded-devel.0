Return-Path: <eric@eukrea.com>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id C6F0D61013
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 20:56:23 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 2E1B84C80C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 22:56:20 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Sep 2013 22:56:22 +0200
Message-Id: <1379624182-10388-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1379624182-10388-1-git-send-email-eric@eukrea.com>
References: <1379624182-10388-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] canutils: update recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Sep 2013 20:56:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- use git hash instead of tag
- backport "candump: Add error frame's handling"

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 ...nutils-candump-Add-error-frame-s-handling.patch | 94 ++++++++++++++++++++++
 .../recipes-extended/socketcan/canutils_4.0.6.bb   |  5 +-
 2 files changed, 97 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/canutils/0001-canutils-candump-Add-error-frame-s-handling.patch

diff --git a/meta-oe/recipes-extended/socketcan/canutils/0001-canutils-candump-Add-error-frame-s-handling.patch b/meta-oe/recipes-extended/socketcan/canutils/0001-canutils-candump-Add-error-frame-s-handling.patch
new file mode 100644
index 0000000..fcc38e0
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/canutils/0001-canutils-candump-Add-error-frame-s-handling.patch
@@ -0,0 +1,94 @@
+From bab595e38295dcafcfc17a011d3d51f2df1618e6 Mon Sep 17 00:00:00 2001
+From: AnilKumar Ch <anilkumar@ti.com>
+Date: Tue, 10 Jan 2012 18:55:11 +0530
+Subject: [PATCH] canutils: candump: Add error frame's handling
+
+This patch adds the error handling capability to candump utility
+by adding error flags for displaying all kind of error frames
+like tx_timeout, lost arbitration, controller problems, buserrors,
+bus warnings etc.
+
+Usage of candump for error frame display on console:
+candump [<can-interface>] [Options]
+Ex: candump can0 --error
+
+This patch is created on top of canutils-4.0.6 tag from
+http://git.pengutronix.de/?p=tools/canutils.git
+
+Signed-off-by: AnilKumar Ch <anilkumar@ti.com>
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+---
+Upstream-Status: Backport
+
+ src/candump.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/src/candump.c b/src/candump.c
+index 259d442..c16425b 100644
+--- a/src/candump.c
++++ b/src/candump.c
+@@ -20,6 +20,7 @@
+ 
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
++#include <linux/can/error.h>
+ 
+ extern int optind, opterr, optopt;
+ 
+@@ -40,6 +41,7 @@ static void print_usage(char *prg)
+ 		" -p, --protocol=PROTO\t"	"CAN protocol (default CAN_RAW = %d)\n"
+ 		"     --filter=id:mask[:id:mask]...\n"
+ 		"\t\t\t"			"apply filter\n"
++		" -e, --error\t\t"		"dump error frames along with data frames\n"
+ 		" -h, --help\t\t"		"this help\n"
+ 		" -o <filename>\t\t"		"output into filename\n"
+ 		" -d\t\t\t"			"daemonize\n"
+@@ -86,6 +88,11 @@ int main(int argc, char **argv)
+ 	int nbytes, i;
+ 	int opt, optdaemon = 0;
+ 	uint32_t id, mask;
++	int error = 0;
++	can_err_mask_t err_mask = (CAN_ERR_TX_TIMEOUT | CAN_ERR_LOSTARB |
++					CAN_ERR_CRTL | CAN_ERR_PROT |
++					CAN_ERR_TRX | CAN_ERR_ACK | CAN_ERR_BUSOFF |
++					CAN_ERR_BUSERROR);
+ 
+ 	signal(SIGPIPE, SIG_IGN);
+ 
+@@ -95,6 +102,7 @@ int main(int argc, char **argv)
+ 		{ "protocol", required_argument, 0, 'p' },
+ 		{ "type", required_argument, 0, 't' },
+ 		{ "filter", required_argument, 0, FILTER_OPTION },
++		{ "error", no_argument, 0, 'e' },
+ 		{ "version", no_argument, 0, VERSION_OPTION},
+ 		{ 0, 0, 0, 0},
+ 	};
+@@ -121,6 +129,10 @@ int main(int argc, char **argv)
+ 			proto = strtoul(optarg, NULL, 0);
+ 			break;
+ 
++		case 'e':
++			error = 1;
++			break;
++
+ 		case 'o':
+ 			optout = optarg;
+ 			break;
+@@ -186,6 +198,14 @@ int main(int argc, char **argv)
+ 		}
+ 	}
+ 
++	if (error) {
++		if (setsockopt(s, SOL_CAN_RAW, CAN_RAW_ERR_FILTER, &err_mask,
++			       sizeof(err_mask)) != 0) {
++			perror("setsockopt");
++			exit(1);
++		}
++	}
++
+ 	if (optdaemon)
+ 		daemon(1, 0);
+ 	else {
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index 3bc2f93..504c510 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libsocketcan"
 
-TAG = "canutils-${PV}"
-SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;tag=${TAG} \
+SRCREV = "299dff7f5322bf0348dcdd60071958ebedf5f09d"
+SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git \
+    file://0001-canutils-candump-Add-error-frame-s-handling.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.8.4.rc3


