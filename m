Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 421806AA6F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 09:56:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6J9uB3J008938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 02:56:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 19 Jul 2013 02:56:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2013 17:56:09 +0800
Message-ID: <1374227769-18100-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Joe.macdonald@windriver.com
Subject: [meta-networking][PATCH] bridge-utils: BackPort three patches
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
X-List-Received-Date: Fri, 19 Jul 2013 09:56:10 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../recipes-support/bridge-utils/bridge-utils.inc  |    6 +-
 ...5-check-error-returns-from-write-to-sysfs.patch |   87 ++++++++++++++++++++
 ...5-fix-error-message-for-incorrect-command.patch |   33 ++++++++
 ...utils-1.5-fix-incorrect-command-in-manual.patch |   33 ++++++++
 4 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
index 271fc82..bd96c6a 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
@@ -5,7 +5,11 @@ LICENSE = "GPLv2"
 
 DEPENDS = "sysfsutils"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz \
+          file://bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch \
+          file://bridge-utils-1.5-fix-error-message-for-incorrect-command.patch \
+          file://bridge-utils-1.5-fix-incorrect-command-in-manual.patch \
+"
 
 inherit autotools
 
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch
new file mode 100644
index 0000000..d00af9c
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch
@@ -0,0 +1,87 @@
+Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-utils.git/diff/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch?id=b0d10717fd7cebf5d85eed3f941b409fa0384f08]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
+From bb9970a9df95837e39d680021b1f73d231e85406 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <shemminger@vyatta.com>
+Date: Tue, 3 May 2011 09:52:43 -0700
+Subject: [PATCH 3/3] Check error returns from write to sysfs
+
+Add helper function to check write to sysfs files.
+
+Signed-off-by: Petr Sabata <contyk@redhat.com>
+---
+ libbridge/libbridge_devif.c |   37 +++++++++++++++++++++++--------------
+ 1 files changed, 23 insertions(+), 14 deletions(-)
+
+diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
+index aa8bc36..1e83925 100644
+--- a/libbridge/libbridge_devif.c
++++ b/libbridge/libbridge_devif.c
+@@ -280,25 +280,38 @@ fallback:
+ 	return old_get_port_info(brname, port, info);
+ }
+ 
++static int set_sysfs(const char *path, unsigned long value)
++{
++	int fd, ret = 0, cc;
++	char buf[32];
++
++	fd = open(path, O_WRONLY);
++	if (fd < 0)
++		return -1;
++
++	cc = snprintf(buf, sizeof(buf), "%lu\n", value);
++	if (write(fd, buf, cc) < 0)
++		ret = -1;
++	close(fd);
++
++	return ret;
++}
++
+ 
+ static int br_set(const char *bridge, const char *name,
+ 		  unsigned long value, unsigned long oldcode)
+ {
+ 	int ret;
+ 	char path[SYSFS_PATH_MAX];
+-	FILE *f;
+ 
+-	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/%s", bridge, name);
++	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/bridge/%s",
++		 bridge, name);
+ 
+-	f = fopen(path, "w");
+-	if (f) {
+-		ret = fprintf(f, "%ld\n", value);
+-		fclose(f);
+-	} else {
++	if ((ret = set_sysfs(path, value)) < 0) {
+ 		/* fallback to old ioctl */
+ 		struct ifreq ifr;
+ 		unsigned long args[4] = { oldcode, value, 0, 0 };
+-		
++
+ 		strncpy(ifr.ifr_name, bridge, IFNAMSIZ);
+ 		ifr.ifr_data = (char *) &args;
+ 		ret = ioctl(br_socket_fd, SIOCDEVPRIVATE, &ifr);
+@@ -348,14 +361,10 @@ static int port_set(const char *bridge, const char *ifname,
+ {
+ 	int ret;
+ 	char path[SYSFS_PATH_MAX];
+-	FILE *f;
+ 
+ 	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/brport/%s", ifname, name);
+-	f = fopen(path, "w");
+-	if (f) {
+-		ret = fprintf(f, "%ld\n", value);
+-		fclose(f);
+-	} else {
++
++	if ((ret = set_sysfs(path, value)) < 0) {
+ 		int index = get_portno(bridge, ifname);
+ 
+ 		if (index < 0)
+-- 
+1.7.5.2
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch
new file mode 100644
index 0000000..2d0494e
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch
@@ -0,0 +1,33 @@
+Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-utils.git/diff/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch?id=b0d10717fd7cebf5d85eed3f941b409fa0384f08]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
+From c7ed0996ef58b497d3d30be802ab5ae6c37099b5 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <shemminger@vyatta.com>
+Date: Tue, 3 May 2011 09:49:57 -0700
+Subject: [PATCH 2/3] Fix error message for incorrect command
+
+Debian bug 406907
+Error message was refering to incorrect command argument.
+
+Signed-off-by: Petr Sabata <contyk@redhat.com>
+---
+ brctl/brctl.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/brctl/brctl.c b/brctl/brctl.c
+index 454b8dd..46ca352 100644
+--- a/brctl/brctl.c
++++ b/brctl/brctl.c
+@@ -69,7 +69,7 @@ int main(int argc, char *const* argv)
+ 	argc -= optind;
+ 	argv += optind;
+ 	if ((cmd = command_lookup(*argv)) == NULL) {
+-		fprintf(stderr, "never heard of command [%s]\n", argv[1]);
++		fprintf(stderr, "never heard of command [%s]\n", *argv);
+ 		goto help;
+ 	}
+ 	
+-- 
+1.7.5.2
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch
new file mode 100644
index 0000000..6f6d6d4
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch
@@ -0,0 +1,33 @@
+Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-utils.git/diff/bridge-utils-1.5-fix-incorrect-command-in-manual.patch?id=b0d10717fd7cebf5d85eed3f941b409fa0384f08]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
+From 8ef7b77562b636efcbd8b759eb324d6c069200f2 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <shemminger@vyatta.com>
+Date: Tue, 3 May 2011 09:48:40 -0700
+Subject: [PATCH 1/3] Fix incorrect command in manual
+
+Command is "setageing" not "setageingtime"; fix man page.
+Debian bug report.
+
+Signed-off-by: Petr Sabata <contyk@redhat.com>
+---
+ doc/brctl.8 |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/doc/brctl.8 b/doc/brctl.8
+index d904047..771f323 100644
+--- a/doc/brctl.8
++++ b/doc/brctl.8
+@@ -89,7 +89,7 @@ data. Machines can move to other ports, network cards can be replaced
+ .B brctl showmacs <brname>
+ shows a list of learned MAC addresses for this bridge.
+ 
+-.B brctl setageingtime <brname> <time>
++.B brctl setageing <brname> <time>
+ sets the ethernet (MAC) address ageing time, in seconds. After <time>
+ seconds of not having seen a frame coming from a certain address, the
+ bridge will time out (delete) that address from the Forwarding
+-- 
+1.7.5.2
+
-- 
1.7.10.4


