Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF1171A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 10:52:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w04AqErJ021602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jan 2018 02:52:15 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 4 Jan 2018 02:52:14 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jan 2018 02:52:14 -0800
Message-ID: <20180104105214.101327-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] iscsi-initiator-utils: CVE-2017-17840
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
X-List-Received-Date: Thu, 04 Jan 2018 10:52:14 -0000
Content-Type: text/plain

Backport CVE patches from the github upstream:
https://github.com/open-iscsi/open-iscsi
commit as follows:
e313bd648a4c8a9526421e270eb597a5de1e0c7f
b9c33683bdc0aed28ffe31c3f3d50bf5cdf519ea
be58eed849f5457bb49b79e94aa6a26971ba6deb
5504053cc08df38d8d85032fa1691e363dfcfb92
85f647c4300a888bb6cbc27f33138549cab617e3
a7a96131bd2ea342f6def0e46be514baf8037ae8
59ede2cf4eee8729a4221000a5d1ecdd312a31ac

https://nvd.nist.gov/vuln/detail/CVE-2017-17840

A local attacker can cause the iscsiuio server to abort or potentially
execute code by sending messages with incorrect lengths, which (due to
lack of checking) can lead to buffer overflows, and result in aborts
(with overflow checking enabled) or code execution.
The process_iscsid_broadcast function in iscsiuio/src/unix/iscsid_ipc.c
does not validate the payload length before a write operation

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...Check-for-root-peer-user-for-iscsiuio-IPC.patch | 135 +++++++++++++++++++++
 ...ould-ignore-bogus-iscsid-broadcast-packet.patch |  39 ++++++
 ...l-fields-in-iscsiuio-IPC-response-are-set.patch |  34 ++++++
 ...ot-double-close-IPC-file-stream-to-iscsid.patch |  62 ++++++++++
 ...re-strings-from-peer-are-copied-correctly.patch |  78 ++++++++++++
 ...-useless-strcopy-and-validate-CIDR-length.patch |  44 +++++++
 ...ck-iscsiuio-ping-data-length-for-validity.patch |  64 ++++++++++
 .../iscsi-initiator-utils_2.0.874.bb               |   7 ++
 8 files changed, 463 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0005-Ensure-strings-from-peer-are-copied-correctly.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0006-Skip-useless-strcopy-and-validate-CIDR-length.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0007-Check-iscsiuio-ping-data-length-for-validity.patch

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch
new file mode 100644
index 000000000..2fd5c08a1
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch
@@ -0,0 +1,135 @@
+From eb516ac5f9dddc80564f6becee08a0011e7aa58b Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Fri, 15 Dec 2017 10:36:11 -0800
+Subject: [PATCH 1/7] Check for root peer user for iscsiuio IPC
+
+This fixes a possible vulnerability where a non-root
+process could connect with iscsiuio. Fouund by Qualsys.
+
+CVE: CVE-2017-17840
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ iscsiuio/src/unix/Makefile.am  |  3 ++-
+ iscsiuio/src/unix/iscsid_ipc.c | 47 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+
+diff --git a/iscsiuio/src/unix/Makefile.am b/iscsiuio/src/unix/Makefile.am
+index 71d5463..a989ef0 100644
+--- a/iscsiuio/src/unix/Makefile.am
++++ b/iscsiuio/src/unix/Makefile.am
+@@ -20,7 +20,8 @@ iscsiuio_SOURCES =	build_date.c		\
+ 			nic_utils.c		\
+ 			packet.c		\
+ 			iscsid_ipc.c		\
+-			ping.c
++			ping.c			\
++			${top_srcdir}/../utils/sysdeps/sysdeps.c
+ 
+ iscsiuio_CFLAGS = 	$(AM_CFLAGS)		\
+ 			$(LIBNL_CFLAGS)		\
+diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
+index a2a59a8..08e49e5 100644
+--- a/iscsiuio/src/unix/iscsid_ipc.c
++++ b/iscsiuio/src/unix/iscsid_ipc.c
+@@ -37,6 +37,8 @@
+  *
+  */
+ 
++#define _GNU_SOURCE
++
+ #include <errno.h>
+ #include <pthread.h>
+ #include <signal.h>
+@@ -47,6 +49,8 @@
+ #include <sys/socket.h>
+ #include <sys/time.h>
+ #include <sys/un.h>
++#include <sys/types.h>
++#include <pwd.h>
+ 
+ #define PFX "iscsi_ipc "
+ 
+@@ -61,6 +65,7 @@
+ #include "iscsid_ipc.h"
+ #include "uip.h"
+ #include "uip_mgmt_ipc.h"
++#include "sysdeps.h"
+ 
+ #include "logger.h"
+ #include "uip.h"
+@@ -102,6 +107,7 @@ struct iface_rec_decode {
+ 	uint16_t		mtu;
+ };
+ 
++#define PEERUSER_MAX	64
+ 
+ /******************************************************************************
+  *  iscsid_ipc Constants
+@@ -1029,6 +1035,40 @@ static void iscsid_loop_close(void *arg)
+ 	LOG_INFO(PFX "iSCSI daemon socket closed");
+ }
+ 
++/*
++ * check that the peer user is privilidged
++ *
++ * return 1 if peer is ok else 0
++ *
++ * XXX: this function is copied from iscsid_ipc.c and should be
++ * moved into a common library
++ */
++static int
++mgmt_peeruser(int sock, char *user)
++{
++	struct ucred peercred;
++	socklen_t so_len = sizeof(peercred);
++	struct passwd *pass;
++
++	errno = 0;
++	if (getsockopt(sock, SOL_SOCKET, SO_PEERCRED, &peercred,
++		&so_len) != 0 || so_len != sizeof(peercred)) {
++		/* We didn't get a valid credentials struct. */
++		LOG_ERR(PFX "peeruser_unux: error receiving credentials: %m");
++		return 0;
++	}
++
++	pass = getpwuid(peercred.uid);
++	if (pass == NULL) {
++		LOG_ERR(PFX "peeruser_unix: unknown local user with uid %d",
++				(int) peercred.uid);
++		return 0;
++	}
++
++	strlcpy(user, pass->pw_name, PEERUSER_MAX);
++	return 1;
++}
++
+ /**
+  *  iscsid_loop() - This is the function which will process the broadcast
+  *                  messages from iscsid
+@@ -1038,6 +1078,7 @@ static void *iscsid_loop(void *arg)
+ {
+ 	int rc;
+ 	sigset_t set;
++	char user[PEERUSER_MAX];
+ 
+ 	pthread_cleanup_push(iscsid_loop_close, arg);
+ 
+@@ -1077,6 +1118,12 @@ static void *iscsid_loop(void *arg)
+ 			continue;
+ 		}
+ 
++		if (!mgmt_peeruser(iscsid_opts.fd, user) || strncmp(user, "root", PEERUSER_MAX)) {
++			close(s2);
++			LOG_ERR(PFX "Access error: non-administrative connection rejected");
++			break;
++		}
++
+ 		process_iscsid_broadcast(s2);
+ 		close(s2);
+ 	}
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch
new file mode 100644
index 000000000..1f5202ec0
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch
@@ -0,0 +1,39 @@
+From 035bb16845537351e1bccb16d38981754fd53129 Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Fri, 15 Dec 2017 10:37:56 -0800
+Subject: [PATCH 2/7] iscsiuio should ignore bogus iscsid broadcast packets
+
+When iscsiuio is receiving broadcast packets from iscsid,
+if the 'payload_len', carried in the packet, is too
+large then ignore the packet and print a message.
+Found by Qualsys.
+
+CVE: CVE-2017-17840
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ iscsiuio/src/unix/iscsid_ipc.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
+index 08e49e5..dfdae63 100644
+--- a/iscsiuio/src/unix/iscsid_ipc.c
++++ b/iscsiuio/src/unix/iscsid_ipc.c
+@@ -950,6 +950,12 @@ int process_iscsid_broadcast(int s2)
+ 
+ 	cmd = data->header.command;
+ 	payload_len = data->header.payload_len;
++	if (payload_len > sizeof(data->u)) {
++		LOG_ERR(PFX "Data payload length too large (%d). Corrupt payload?",
++				payload_len);
++		rc = -EINVAL;
++		goto error;
++	}
+ 
+ 	LOG_DEBUG(PFX "recv iscsid request: cmd: %d, payload_len: %d",
+ 		  cmd, payload_len);
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch
new file mode 100644
index 000000000..825083b74
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch
@@ -0,0 +1,34 @@
+From 81d3106cf8f09c79fe20ad7d234d7e1dda27bddb Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Fri, 15 Dec 2017 11:11:17 -0800
+Subject: [PATCH 3/7] Ensure all fields in iscsiuio IPC response are set
+
+Make sure all fields in the response strcuture are set,
+or info from the stack can be leaked to our caller.
+Found by Qualsys.
+
+CVE: CVE-2017-17840
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ iscsiuio/src/unix/iscsid_ipc.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
+index dfdae63..61e96cc 100644
+--- a/iscsiuio/src/unix/iscsid_ipc.c
++++ b/iscsiuio/src/unix/iscsid_ipc.c
+@@ -960,6 +960,8 @@ int process_iscsid_broadcast(int s2)
+ 	LOG_DEBUG(PFX "recv iscsid request: cmd: %d, payload_len: %d",
+ 		  cmd, payload_len);
+ 
++	memset(&rsp, 0, sizeof(rsp));
++
+ 	switch (cmd) {
+ 	case ISCSID_UIP_IPC_GET_IFACE:
+ 		size = fread(&data->u.iface_rec, payload_len, 1, fd);
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch
new file mode 100644
index 000000000..274722c23
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch
@@ -0,0 +1,62 @@
+From 8167e5ce99682f64918a20966ce393cd33ac67ef Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Fri, 15 Dec 2017 11:13:29 -0800
+Subject: [PATCH 4/7] Do not double-close IPC file stream to iscsid
+
+A double-close of a file descriptor and its associated FILE stream
+can be an issue in multi-threaded cases. Found by Qualsys.
+
+CVE: CVE-2017-17840
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ iscsiuio/src/unix/iscsid_ipc.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
+index 61e96cc..bde8d66 100644
+--- a/iscsiuio/src/unix/iscsid_ipc.c
++++ b/iscsiuio/src/unix/iscsid_ipc.c
+@@ -913,6 +913,9 @@ early_exit:
+ /**
+  *  process_iscsid_broadcast() - This function is used to process the
+  *                               broadcast messages from iscsid
++ *
++ *                               s2 is an open file descriptor, which
++ *                               must not be left open upon return
+  */
+ int process_iscsid_broadcast(int s2)
+ {
+@@ -928,6 +931,7 @@ int process_iscsid_broadcast(int s2)
+ 	if (fd == NULL) {
+ 		LOG_ERR(PFX "Couldn't open file descriptor: %d(%s)",
+ 			errno, strerror(errno));
++		close(s2);
+ 		return -EIO;
+ 	}
+ 
+@@ -1030,7 +1034,8 @@ int process_iscsid_broadcast(int s2)
+ 	}
+ 
+ error:
+-	free(data);
++	if (data)
++		free(data);
+ 	fclose(fd);
+ 
+ 	return rc;
+@@ -1132,8 +1137,8 @@ static void *iscsid_loop(void *arg)
+ 			break;
+ 		}
+ 
++		/* this closes the file descriptor s2 */
+ 		process_iscsid_broadcast(s2);
+-		close(s2);
+ 	}
+ 
+ 	pthread_cleanup_pop(0);
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0005-Ensure-strings-from-peer-are-copied-correctly.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0005-Ensure-strings-from-peer-are-copied-correctly.patch
new file mode 100644
index 000000000..b73b01120
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0005-Ensure-strings-from-peer-are-copied-correctly.patch
@@ -0,0 +1,78 @@
+From c9fc86a50459776d9a7abb609f6503c57d69e034 Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Fri, 15 Dec 2017 11:15:26 -0800
+Subject: [PATCH 5/7] Ensure strings from peer are copied correctly.
+
+The method of using strlen() and strcpy()/strncpy() has
+a couple of holes. Do not try to measure the length of
+strings supplied from peer, and ensure copied strings are
+NULL-terminated. Use the new strlcpy() instead.
+Found by Qualsys.
+
+CVE: CVE-2017-17840
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ iscsiuio/src/unix/iscsid_ipc.c | 24 ++++++------------------
+ 1 file changed, 6 insertions(+), 18 deletions(-)
+
+diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
+index bde8d66..52ae8c6 100644
+--- a/iscsiuio/src/unix/iscsid_ipc.c
++++ b/iscsiuio/src/unix/iscsid_ipc.c
+@@ -152,10 +152,7 @@ static int decode_cidr(char *in_ipaddr_str, struct iface_rec_decode *ird)
+ 	struct in_addr ia;
+ 	struct in6_addr ia6;
+ 
+-	if (strlen(in_ipaddr_str) > NI_MAXHOST)
+-		strncpy(ipaddr_str, in_ipaddr_str, NI_MAXHOST);
+-	else
+-		strcpy(ipaddr_str, in_ipaddr_str);
++	strlcpy(ipaddr_str, in_ipaddr_str, NI_MAXHOST);
+ 
+ 	/* Find the CIDR if any */
+ 	tmp = strchr(ipaddr_str, '/');
+@@ -287,22 +284,16 @@ static int decode_iface(struct iface_rec_decode *ird, struct iface_rec *rec)
+ 
+ 			/* For LL on, ignore the IPv6 addr in the iface */
+ 			if (ird->linklocal_autocfg == IPV6_LL_AUTOCFG_OFF) {
+-				if (strlen(rec->ipv6_linklocal) > NI_MAXHOST)
+-					strncpy(ipaddr_str, rec->ipv6_linklocal,
+-						NI_MAXHOST);
+-				else
+-					strcpy(ipaddr_str, rec->ipv6_linklocal);
++				strlcpy(ipaddr_str, rec->ipv6_linklocal,
++					NI_MAXHOST);
+ 				inet_pton(AF_INET6, ipaddr_str,
+ 					  &ird->ipv6_linklocal);
+ 			}
+ 
+ 			/* For RTR on, ignore the IPv6 addr in the iface */
+ 			if (ird->router_autocfg == IPV6_RTR_AUTOCFG_OFF) {
+-				if (strlen(rec->ipv6_router) > NI_MAXHOST)
+-					strncpy(ipaddr_str, rec->ipv6_router,
+-						NI_MAXHOST);
+-				else
+-					strcpy(ipaddr_str, rec->ipv6_router);
++				strlcpy(ipaddr_str, rec->ipv6_router,
++					NI_MAXHOST);
+ 				inet_pton(AF_INET6, ipaddr_str,
+ 					  &ird->ipv6_router);
+ 			}
+@@ -316,10 +307,7 @@ static int decode_iface(struct iface_rec_decode *ird, struct iface_rec *rec)
+ 					calculate_default_netmask(
+ 							ird->ipv4_addr.s_addr);
+ 
+-			if (strlen(rec->gateway) > NI_MAXHOST)
+-				strncpy(ipaddr_str, rec->gateway, NI_MAXHOST);
+-			else
+-				strcpy(ipaddr_str, rec->gateway);
++			strlcpy(ipaddr_str, rec->gateway, NI_MAXHOST);
+ 			inet_pton(AF_INET, ipaddr_str, &ird->ipv4_gateway);
+ 		}
+ 	} else {
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0006-Skip-useless-strcopy-and-validate-CIDR-length.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0006-Skip-useless-strcopy-and-validate-CIDR-length.patch
new file mode 100644
index 000000000..0fa24cd10
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0006-Skip-useless-strcopy-and-validate-CIDR-length.patch
@@ -0,0 +1,44 @@
+From a6efed7601c890ac051ad1425582ec67dbd3f5ff Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Fri, 15 Dec 2017 11:18:35 -0800
+Subject: [PATCH 6/7] Skip useless strcopy, and validate CIDR length
+
+Remove a useless strcpy() that copies a string onto itself,
+and ensure the CIDR length "keepbits" is not negative.
+Found by Qualsys.
+
+CVE: CVE-2017-17840
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ iscsiuio/src/unix/iscsid_ipc.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
+index 52ae8c6..85742da 100644
+--- a/iscsiuio/src/unix/iscsid_ipc.c
++++ b/iscsiuio/src/unix/iscsid_ipc.c
+@@ -148,7 +148,7 @@ static int decode_cidr(char *in_ipaddr_str, struct iface_rec_decode *ird)
+ 	char *tmp, *tok;
+ 	char ipaddr_str[NI_MAXHOST];
+ 	char str[INET6_ADDRSTRLEN];
+-	int keepbits = 0;
++	unsigned long keepbits = 0;
+ 	struct in_addr ia;
+ 	struct in6_addr ia6;
+ 
+@@ -161,8 +161,7 @@ static int decode_cidr(char *in_ipaddr_str, struct iface_rec_decode *ird)
+ 		tmp = ipaddr_str;
+ 		tok = strsep(&tmp, "/");
+ 		LOG_INFO(PFX "in cidr: bitmask '%s' ip '%s'", tmp, tok);
+-		keepbits = atoi(tmp);
+-		strcpy(ipaddr_str, tok);
++		keepbits = strtoull(tmp, NULL, 10);
+ 	}
+ 
+ 	/*  Determine if the IP address passed from the iface file is
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0007-Check-iscsiuio-ping-data-length-for-validity.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0007-Check-iscsiuio-ping-data-length-for-validity.patch
new file mode 100644
index 000000000..c63c0a8d5
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0007-Check-iscsiuio-ping-data-length-for-validity.patch
@@ -0,0 +1,64 @@
+From 5df60ad8b22194391af34c1a7e54776b0372ffed Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Fri, 15 Dec 2017 11:21:15 -0800
+Subject: [PATCH 7/7] Check iscsiuio ping data length for validity
+
+We do not trust that the received ping packet data length
+is correct, so sanity check it. Found by Qualsys.
+
+CVE: CVE-2017-17840
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ iscsiuio/src/unix/iscsid_ipc.c | 5 +++++
+ iscsiuio/src/unix/packet.c     | 2 +-
+ iscsiuio/src/unix/packet.h     | 2 ++
+ 3 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
+index 85742da..a2caacc 100644
+--- a/iscsiuio/src/unix/iscsid_ipc.c
++++ b/iscsiuio/src/unix/iscsid_ipc.c
+@@ -333,6 +333,11 @@ static void *perform_ping(void *arg)
+ 
+ 	data = (iscsid_uip_broadcast_t *)png_c->data;
+ 	datalen = data->u.ping_rec.datalen;
++	if ((datalen > STD_MTU_SIZE) || (datalen < 0)) {
++		LOG_ERR(PFX "Ping datalen invalid: %d", datalen);
++		rc = -EINVAL;
++		goto ping_done;
++	}
+ 
+ 	memset(dst_addr, 0, sizeof(uip_ip6addr_t));
+ 	if (nic_iface->protocol == AF_INET) {
+diff --git a/iscsiuio/src/unix/packet.c b/iscsiuio/src/unix/packet.c
+index ecea09b..3ce2c6b 100644
+--- a/iscsiuio/src/unix/packet.c
++++ b/iscsiuio/src/unix/packet.c
+@@ -112,7 +112,7 @@ int alloc_free_queue(nic_t *nic, size_t num_of_packets)
+ 	for (i = 0; i < num_of_packets; i++) {
+ 		packet_t *pkt;
+ 
+-		pkt = alloc_packet(1500, 1500);
++		pkt = alloc_packet(STD_MTU_SIZE, STD_MTU_SIZE);
+ 		if (pkt == NULL) {
+ 			goto done;
+ 		}
+diff --git a/iscsiuio/src/unix/packet.h b/iscsiuio/src/unix/packet.h
+index b63d688..19d1db9 100644
+--- a/iscsiuio/src/unix/packet.h
++++ b/iscsiuio/src/unix/packet.h
+@@ -43,6 +43,8 @@
+ 
+ #include "nic.h"
+ 
++#define	STD_MTU_SIZE	1500
++
+ struct nic;
+ struct nic_interface;
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
index 16ac19992..d35ea5501 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
@@ -22,6 +22,13 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi \
     file://iscsi-initiator.service \
     file://iscsi-initiator-targets.service \
     file://set_initiatorname \
+    file://0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch \
+    file://0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch \
+    file://0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch \
+    file://0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch \
+    file://0005-Ensure-strings-from-peer-are-copied-correctly.patch \
+    file://0006-Skip-useless-strcopy-and-validate-CIDR-length.patch \
+    file://0007-Check-iscsiuio-ping-data-length-for-validity.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


