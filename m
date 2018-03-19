Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 65FCF78915
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:17 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id k22-v6so8798180pls.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2MKlGyIp/G2Ct5kp7GNnnN0ikZ3j5Uc4ukhXKiYC2oE=;
	b=hcrhZWRaQ9bmo2jO6VPuHcJZXE6Zs4dnnVNMqOqAOuE+opqWsmvl0Vg1aYXPMVvBQn
	lGi0tXYHDeQMywl6LiUgIpZgM4CFr/RGVT9rMcyQOBumig9McfN4GSYj4KPn6FkC6MHQ
	4586VCu7eZ79Xf2jJ3//3MiM3QuUhDJQ0epTyJVa5Sc+1kbphk3/bC/a5xqlqjgcQZtK
	mwH6cdVrw2vQR9nO2EtHSCzbv8VgN7urQYES1rD7GG+92Ubk6ptAk1XKKoGcexmqhU1f
	z+kusO6fOMO3sFUcIFnxTc2wZBSrhR4sKnyPA1sSrUDzAvHY9dp/rZ6PC8vmMJKQaHqd
	eaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2MKlGyIp/G2Ct5kp7GNnnN0ikZ3j5Uc4ukhXKiYC2oE=;
	b=kM/R5esoMjTQ6idwdYv6Er5u3/WqEADpAxf8EYtLC0xcoxU0hlc4MrWvM7Y0NcECM2
	BztAlKkpg5AqUNB9wAcm5xwKCRE5Zw6U0UrrMtxTJcGS8oQ7yqSELefJh9N2jBCGB25t
	UMar8shrj1TIfH2OGzI9wRf5ArAFUeJVigVsQ3EdJ3Yl8WgbCXKUIZxPdZ0PcDEGdsO/
	9SiWxDZxLkK53vgn0BTvHFpVX8zQMKb5cnuImClQfYbs/bSToclxhhj8CzLZrKnFF7bS
	xh0+mBBCwXH3cZvmyVx4vsy0SAYGOmDhBOrpw7H9SjiYOeYCy11MPAjY8gpzRIl+qUKh
	M8IQ==
X-Gm-Message-State: AElRT7F6VdgvIwtc8oI0lQ1Q1RbuGbshpR8pm0xXkh9KxwXHN7R0qvoh
	9IqR3yzxNJ6baNluGR6wnqRsrw==
X-Google-Smtp-Source: AG47ELsrTafdTto/6bW/GV5Rvgl9G3qGs6BSejIiwQfJ1kbPm9cB1wRLCnxEQbY3AJ/nr6i8PbsbEg==
X-Received: by 2002:a17:902:760e:: with SMTP id
	k14-v6mr457506pll.292.1521439397952; 
	Sun, 18 Mar 2018 23:03:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:46 -0700
Message-Id: <20180319060300.5366-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 04/18] iscsi-initiator-utils: Upgrade to 2.0.876
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:17 -0000

Fix build with musl along the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Check-for-root-peer-user-for-iscsiuio-IPC.patch | 135 ---------------------
 ...openiscsiusr-Include-limit.h-for-PATH_MAX.patch |  25 ++++
 ...001-qedi.c-Removed-unused-linux-ethtool.h.patch |  25 ++++
 ...ude-fcnl.h-for-O_RDWR-and-O_CREAT-definit.patch |  25 ++++
 ...ould-ignore-bogus-iscsid-broadcast-packet.patch |  39 ------
 ...openiscsiusr-Add-CFLAGS-to-linker-cmdline.patch |  29 +++++
 ...l-fields-in-iscsiuio-IPC-response-are-set.patch |  34 ------
 ...rder-the-includes-to-avoid-duplicate-defi.patch |  49 ++++++++
 ...ot-double-close-IPC-file-stream-to-iscsid.patch |  62 ----------
 ...04-fwparam_ppc.c-Do-not-use-__compar_fn_t.patch |  28 +++++
 ...re-strings-from-peer-are-copied-correctly.patch |  78 ------------
 ...-useless-strcopy-and-validate-CIDR-length.patch |  44 -------
 ...ck-iscsiuio-ping-data-length-for-validity.patch |  64 ----------
 ...nitiator-utils-Do-not-clean-kernel-source.patch |  44 -------
 ...text-add-include-for-NI_MAXHOST-definiton.patch |  35 ------
 ...2.0.874.bb => iscsi-initiator-utils_2.0.876.bb} |  32 ++---
 16 files changed, 191 insertions(+), 557 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Include-limit.h-for-PATH_MAX.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-qedi.c-Removed-unused-linux-ethtool.h.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-idbm.c-Include-fcnl.h-for-O_RDWR-and-O_CREAT-definit.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-libopeniscsiusr-Add-CFLAGS-to-linker-cmdline.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-bnx2x.c-Reorder-the-includes-to-avoid-duplicate-defi.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-fwparam_ppc.c-Do-not-use-__compar_fn_t.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0005-Ensure-strings-from-peer-are-copied-correctly.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0006-Skip-useless-strcopy-and-validate-CIDR-length.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0007-Check-iscsiuio-ping-data-length-for-validity.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-Do-not-clean-kernel-source.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.0.874.bb => iscsi-initiator-utils_2.0.876.bb} (78%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch
deleted file mode 100644
index 2fd5c08a1..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From eb516ac5f9dddc80564f6becee08a0011e7aa58b Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Fri, 15 Dec 2017 10:36:11 -0800
-Subject: [PATCH 1/7] Check for root peer user for iscsiuio IPC
-
-This fixes a possible vulnerability where a non-root
-process could connect with iscsiuio. Fouund by Qualsys.
-
-CVE: CVE-2017-17840
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- iscsiuio/src/unix/Makefile.am  |  3 ++-
- iscsiuio/src/unix/iscsid_ipc.c | 47 ++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 49 insertions(+), 1 deletion(-)
-
-diff --git a/iscsiuio/src/unix/Makefile.am b/iscsiuio/src/unix/Makefile.am
-index 71d5463..a989ef0 100644
---- a/iscsiuio/src/unix/Makefile.am
-+++ b/iscsiuio/src/unix/Makefile.am
-@@ -20,7 +20,8 @@ iscsiuio_SOURCES =	build_date.c		\
- 			nic_utils.c		\
- 			packet.c		\
- 			iscsid_ipc.c		\
--			ping.c
-+			ping.c			\
-+			${top_srcdir}/../utils/sysdeps/sysdeps.c
- 
- iscsiuio_CFLAGS = 	$(AM_CFLAGS)		\
- 			$(LIBNL_CFLAGS)		\
-diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
-index a2a59a8..08e49e5 100644
---- a/iscsiuio/src/unix/iscsid_ipc.c
-+++ b/iscsiuio/src/unix/iscsid_ipc.c
-@@ -37,6 +37,8 @@
-  *
-  */
- 
-+#define _GNU_SOURCE
-+
- #include <errno.h>
- #include <pthread.h>
- #include <signal.h>
-@@ -47,6 +49,8 @@
- #include <sys/socket.h>
- #include <sys/time.h>
- #include <sys/un.h>
-+#include <sys/types.h>
-+#include <pwd.h>
- 
- #define PFX "iscsi_ipc "
- 
-@@ -61,6 +65,7 @@
- #include "iscsid_ipc.h"
- #include "uip.h"
- #include "uip_mgmt_ipc.h"
-+#include "sysdeps.h"
- 
- #include "logger.h"
- #include "uip.h"
-@@ -102,6 +107,7 @@ struct iface_rec_decode {
- 	uint16_t		mtu;
- };
- 
-+#define PEERUSER_MAX	64
- 
- /******************************************************************************
-  *  iscsid_ipc Constants
-@@ -1029,6 +1035,40 @@ static void iscsid_loop_close(void *arg)
- 	LOG_INFO(PFX "iSCSI daemon socket closed");
- }
- 
-+/*
-+ * check that the peer user is privilidged
-+ *
-+ * return 1 if peer is ok else 0
-+ *
-+ * XXX: this function is copied from iscsid_ipc.c and should be
-+ * moved into a common library
-+ */
-+static int
-+mgmt_peeruser(int sock, char *user)
-+{
-+	struct ucred peercred;
-+	socklen_t so_len = sizeof(peercred);
-+	struct passwd *pass;
-+
-+	errno = 0;
-+	if (getsockopt(sock, SOL_SOCKET, SO_PEERCRED, &peercred,
-+		&so_len) != 0 || so_len != sizeof(peercred)) {
-+		/* We didn't get a valid credentials struct. */
-+		LOG_ERR(PFX "peeruser_unux: error receiving credentials: %m");
-+		return 0;
-+	}
-+
-+	pass = getpwuid(peercred.uid);
-+	if (pass == NULL) {
-+		LOG_ERR(PFX "peeruser_unix: unknown local user with uid %d",
-+				(int) peercred.uid);
-+		return 0;
-+	}
-+
-+	strlcpy(user, pass->pw_name, PEERUSER_MAX);
-+	return 1;
-+}
-+
- /**
-  *  iscsid_loop() - This is the function which will process the broadcast
-  *                  messages from iscsid
-@@ -1038,6 +1078,7 @@ static void *iscsid_loop(void *arg)
- {
- 	int rc;
- 	sigset_t set;
-+	char user[PEERUSER_MAX];
- 
- 	pthread_cleanup_push(iscsid_loop_close, arg);
- 
-@@ -1077,6 +1118,12 @@ static void *iscsid_loop(void *arg)
- 			continue;
- 		}
- 
-+		if (!mgmt_peeruser(iscsid_opts.fd, user) || strncmp(user, "root", PEERUSER_MAX)) {
-+			close(s2);
-+			LOG_ERR(PFX "Access error: non-administrative connection rejected");
-+			break;
-+		}
-+
- 		process_iscsid_broadcast(s2);
- 		close(s2);
- 	}
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Include-limit.h-for-PATH_MAX.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Include-limit.h-for-PATH_MAX.patch
new file mode 100644
index 000000000..f5e1bec8a
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Include-limit.h-for-PATH_MAX.patch
@@ -0,0 +1,25 @@
+From cfee58d5863a535b61aa54690ae205b876f57944 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Feb 2018 22:53:29 -0800
+Subject: [PATCH 1/2] libopeniscsiusr: Include limit.h for PATH_MAX
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libopeniscsiusr/iface.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libopeniscsiusr/iface.c b/libopeniscsiusr/iface.c
+index 79898df..a48ef36 100644
+--- a/libopeniscsiusr/iface.c
++++ b/libopeniscsiusr/iface.c
+@@ -30,6 +30,7 @@
+ #include <netdb.h>
+ #include <assert.h>
+ #include <inttypes.h>
++#include <limits.h>
+ 
+ #include "libopeniscsiusr/libopeniscsiusr.h"
+ #include "misc.h"
+-- 
+2.16.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-qedi.c-Removed-unused-linux-ethtool.h.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-qedi.c-Removed-unused-linux-ethtool.h.patch
new file mode 100644
index 000000000..174aa50d2
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-qedi.c-Removed-unused-linux-ethtool.h.patch
@@ -0,0 +1,25 @@
+From 197713ad7e3e944102bbd792e1ab9ec4a67100c0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Feb 2018 23:25:21 -0800
+Subject: [PATCH 1/4] qedi.c: Removed unused linux/ethtool.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ iscsiuio/src/unix/libs/qedi.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/iscsiuio/src/unix/libs/qedi.c b/iscsiuio/src/unix/libs/qedi.c
+index b81fecd..24cb89a 100644
+--- a/iscsiuio/src/unix/libs/qedi.c
++++ b/iscsiuio/src/unix/libs/qedi.c
+@@ -49,7 +49,6 @@
+ #include <arpa/inet.h>
+ #include <linux/types.h>
+ #include <linux/sockios.h>
+-#include <linux/ethtool.h>
+ #include <linux/netlink.h>
+ #include <sys/mman.h>
+ #include <sys/ioctl.h>
+-- 
+2.16.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-idbm.c-Include-fcnl.h-for-O_RDWR-and-O_CREAT-definit.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-idbm.c-Include-fcnl.h-for-O_RDWR-and-O_CREAT-definit.patch
new file mode 100644
index 000000000..aecede6ee
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-idbm.c-Include-fcnl.h-for-O_RDWR-and-O_CREAT-definit.patch
@@ -0,0 +1,25 @@
+From 2b39f85dcf020647544002cb0b0e734748391dfb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Feb 2018 23:27:25 -0800
+Subject: [PATCH 2/4] idbm.c: Include fcnl.h for O_RDWR and O_CREAT definitions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/idbm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/usr/idbm.c b/usr/idbm.c
+index 5532202..0a51b85 100644
+--- a/usr/idbm.c
++++ b/usr/idbm.c
+@@ -27,6 +27,7 @@
+ #include <errno.h>
+ #include <dirent.h>
+ #include <limits.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
+ 
+-- 
+2.16.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch
deleted file mode 100644
index 1f5202ec0..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 035bb16845537351e1bccb16d38981754fd53129 Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Fri, 15 Dec 2017 10:37:56 -0800
-Subject: [PATCH 2/7] iscsiuio should ignore bogus iscsid broadcast packets
-
-When iscsiuio is receiving broadcast packets from iscsid,
-if the 'payload_len', carried in the packet, is too
-large then ignore the packet and print a message.
-Found by Qualsys.
-
-CVE: CVE-2017-17840
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- iscsiuio/src/unix/iscsid_ipc.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
-index 08e49e5..dfdae63 100644
---- a/iscsiuio/src/unix/iscsid_ipc.c
-+++ b/iscsiuio/src/unix/iscsid_ipc.c
-@@ -950,6 +950,12 @@ int process_iscsid_broadcast(int s2)
- 
- 	cmd = data->header.command;
- 	payload_len = data->header.payload_len;
-+	if (payload_len > sizeof(data->u)) {
-+		LOG_ERR(PFX "Data payload length too large (%d). Corrupt payload?",
-+				payload_len);
-+		rc = -EINVAL;
-+		goto error;
-+	}
- 
- 	LOG_DEBUG(PFX "recv iscsid request: cmd: %d, payload_len: %d",
- 		  cmd, payload_len);
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-libopeniscsiusr-Add-CFLAGS-to-linker-cmdline.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-libopeniscsiusr-Add-CFLAGS-to-linker-cmdline.patch
new file mode 100644
index 000000000..836ed6048
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-libopeniscsiusr-Add-CFLAGS-to-linker-cmdline.patch
@@ -0,0 +1,29 @@
+From 29571f71692e28ce9a17d1450097a98492f3b465 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Feb 2018 22:54:04 -0800
+Subject: [PATCH 2/2] libopeniscsiusr: Add CFLAGS to linker cmdline
+
+This will ensure that -fPIC is passed to linker as
+well
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libopeniscsiusr/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libopeniscsiusr/Makefile b/libopeniscsiusr/Makefile
+index 8b9b523..4f1d0d6 100644
+--- a/libopeniscsiusr/Makefile
++++ b/libopeniscsiusr/Makefile
+@@ -49,7 +49,7 @@ LIBADD =
+ all: $(LIBS) $(LIBS_MAJOR) $(TESTS) doc
+ 
+ $(LIBS): $(OBJS)
+-	$(CC) $(LDFLAGS) -shared -Wl,-soname=$@ -o $@ $(OBJS) $(LIBADD)
++	$(CC) $(CFLAGS) $(LDFLAGS) -shared -Wl,-soname=$@ -o $@ $(OBJS) $(LIBADD)
+ 	ln -sf $@ $(DEVLIB)
+ 
+ $(LIBS_MAJOR): $(LIBS)
+-- 
+2.16.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch
deleted file mode 100644
index 825083b74..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 81d3106cf8f09c79fe20ad7d234d7e1dda27bddb Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Fri, 15 Dec 2017 11:11:17 -0800
-Subject: [PATCH 3/7] Ensure all fields in iscsiuio IPC response are set
-
-Make sure all fields in the response strcuture are set,
-or info from the stack can be leaked to our caller.
-Found by Qualsys.
-
-CVE: CVE-2017-17840
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- iscsiuio/src/unix/iscsid_ipc.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
-index dfdae63..61e96cc 100644
---- a/iscsiuio/src/unix/iscsid_ipc.c
-+++ b/iscsiuio/src/unix/iscsid_ipc.c
-@@ -960,6 +960,8 @@ int process_iscsid_broadcast(int s2)
- 	LOG_DEBUG(PFX "recv iscsid request: cmd: %d, payload_len: %d",
- 		  cmd, payload_len);
- 
-+	memset(&rsp, 0, sizeof(rsp));
-+
- 	switch (cmd) {
- 	case ISCSID_UIP_IPC_GET_IFACE:
- 		size = fread(&data->u.iface_rec, payload_len, 1, fd);
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-bnx2x.c-Reorder-the-includes-to-avoid-duplicate-defi.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-bnx2x.c-Reorder-the-includes-to-avoid-duplicate-defi.patch
new file mode 100644
index 000000000..0ce155f7a
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0003-bnx2x.c-Reorder-the-includes-to-avoid-duplicate-defi.patch
@@ -0,0 +1,49 @@
+From 9b7a32903b56ce4d41f264a345ca59a0b00d53b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Feb 2018 23:28:33 -0800
+Subject: [PATCH 3/4] bnx2x.c: Reorder the includes to avoid duplicate defines
+ with musl
+
+including nic.h before linux/ethtool.h avoids redefinitions of
+eth structs
+
+/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-musleabi/iscsi-initiator-utils/2.0.876-r0/recipe-sysroot/
+usr/include/netinet/if_ether.h:104:8: error: redefinition of 'struct ethhdr'
+ struct ethhdr {
+        ^~~~~~
+In file included from /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-musleabi/iscsi-initiator-utils/2.0.
+876-r0/recipe-sysroot/usr/include/linux/ethtool.h:19:0,
+                 from qedi.c:52:
+/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-musleabi/iscsi-initiator-utils/2.0.876-r0/recipe-sysroot/
+usr/include/linux/if_ether.h:154:8: note: originally defined here
+ struct ethhdr {
+        ^~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ iscsiuio/src/unix/libs/bnx2x.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iscsiuio/src/unix/libs/bnx2x.c b/iscsiuio/src/unix/libs/bnx2x.c
+index 3df6d5f..62530d1 100644
+--- a/iscsiuio/src/unix/libs/bnx2x.c
++++ b/iscsiuio/src/unix/libs/bnx2x.c
+@@ -36,6 +36,7 @@
+  * bnx2x.c - bnx2x user space driver
+  *
+  */
++#include "nic.h"
+ #include <errno.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -58,7 +59,6 @@
+ #include "bnx2x.h"
+ #include "cnic.h"
+ #include "logger.h"
+-#include "nic.h"
+ #include "nic_id.h"
+ #include "nic_utils.h"
+ #include "options.h"
+-- 
+2.16.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch
deleted file mode 100644
index 274722c23..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 8167e5ce99682f64918a20966ce393cd33ac67ef Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Fri, 15 Dec 2017 11:13:29 -0800
-Subject: [PATCH 4/7] Do not double-close IPC file stream to iscsid
-
-A double-close of a file descriptor and its associated FILE stream
-can be an issue in multi-threaded cases. Found by Qualsys.
-
-CVE: CVE-2017-17840
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- iscsiuio/src/unix/iscsid_ipc.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
-index 61e96cc..bde8d66 100644
---- a/iscsiuio/src/unix/iscsid_ipc.c
-+++ b/iscsiuio/src/unix/iscsid_ipc.c
-@@ -913,6 +913,9 @@ early_exit:
- /**
-  *  process_iscsid_broadcast() - This function is used to process the
-  *                               broadcast messages from iscsid
-+ *
-+ *                               s2 is an open file descriptor, which
-+ *                               must not be left open upon return
-  */
- int process_iscsid_broadcast(int s2)
- {
-@@ -928,6 +931,7 @@ int process_iscsid_broadcast(int s2)
- 	if (fd == NULL) {
- 		LOG_ERR(PFX "Couldn't open file descriptor: %d(%s)",
- 			errno, strerror(errno));
-+		close(s2);
- 		return -EIO;
- 	}
- 
-@@ -1030,7 +1034,8 @@ int process_iscsid_broadcast(int s2)
- 	}
- 
- error:
--	free(data);
-+	if (data)
-+		free(data);
- 	fclose(fd);
- 
- 	return rc;
-@@ -1132,8 +1137,8 @@ static void *iscsid_loop(void *arg)
- 			break;
- 		}
- 
-+		/* this closes the file descriptor s2 */
- 		process_iscsid_broadcast(s2);
--		close(s2);
- 	}
- 
- 	pthread_cleanup_pop(0);
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-fwparam_ppc.c-Do-not-use-__compar_fn_t.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-fwparam_ppc.c-Do-not-use-__compar_fn_t.patch
new file mode 100644
index 000000000..57bdc8cb6
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0004-fwparam_ppc.c-Do-not-use-__compar_fn_t.patch
@@ -0,0 +1,28 @@
+From 6f9c1a04d250388d1574cfaf20a1ff66a64beb48 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Feb 2018 23:42:12 -0800
+Subject: [PATCH 4/4] fwparam_ppc.c: Do not use __compar_fn_t
+
+__compar_fn_t is not defined in musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/fwparam_ibft/fwparam_ppc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/fwparam_ibft/fwparam_ppc.c b/utils/fwparam_ibft/fwparam_ppc.c
+index c298b8c..391faa2 100644
+--- a/utils/fwparam_ibft/fwparam_ppc.c
++++ b/utils/fwparam_ibft/fwparam_ppc.c
+@@ -356,7 +356,7 @@ static int loop_devs(const char *devtree)
+ 	 * Sort the nics into "natural" order.	The proc fs
+ 	 * device-tree has them in somewhat random, or reversed order.
+ 	 */
+-	qsort(niclist, nic_count, sizeof(char *), (__compar_fn_t)nic_cmp);
++	qsort(niclist, nic_count, sizeof(char *), nic_cmp);
+ 
+ 	snprintf(prefix, sizeof(prefix), "%s/%s", devtree, "aliases");
+ 	dev_count = 0;
+-- 
+2.16.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0005-Ensure-strings-from-peer-are-copied-correctly.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0005-Ensure-strings-from-peer-are-copied-correctly.patch
deleted file mode 100644
index b73b01120..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0005-Ensure-strings-from-peer-are-copied-correctly.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From c9fc86a50459776d9a7abb609f6503c57d69e034 Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Fri, 15 Dec 2017 11:15:26 -0800
-Subject: [PATCH 5/7] Ensure strings from peer are copied correctly.
-
-The method of using strlen() and strcpy()/strncpy() has
-a couple of holes. Do not try to measure the length of
-strings supplied from peer, and ensure copied strings are
-NULL-terminated. Use the new strlcpy() instead.
-Found by Qualsys.
-
-CVE: CVE-2017-17840
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- iscsiuio/src/unix/iscsid_ipc.c | 24 ++++++------------------
- 1 file changed, 6 insertions(+), 18 deletions(-)
-
-diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
-index bde8d66..52ae8c6 100644
---- a/iscsiuio/src/unix/iscsid_ipc.c
-+++ b/iscsiuio/src/unix/iscsid_ipc.c
-@@ -152,10 +152,7 @@ static int decode_cidr(char *in_ipaddr_str, struct iface_rec_decode *ird)
- 	struct in_addr ia;
- 	struct in6_addr ia6;
- 
--	if (strlen(in_ipaddr_str) > NI_MAXHOST)
--		strncpy(ipaddr_str, in_ipaddr_str, NI_MAXHOST);
--	else
--		strcpy(ipaddr_str, in_ipaddr_str);
-+	strlcpy(ipaddr_str, in_ipaddr_str, NI_MAXHOST);
- 
- 	/* Find the CIDR if any */
- 	tmp = strchr(ipaddr_str, '/');
-@@ -287,22 +284,16 @@ static int decode_iface(struct iface_rec_decode *ird, struct iface_rec *rec)
- 
- 			/* For LL on, ignore the IPv6 addr in the iface */
- 			if (ird->linklocal_autocfg == IPV6_LL_AUTOCFG_OFF) {
--				if (strlen(rec->ipv6_linklocal) > NI_MAXHOST)
--					strncpy(ipaddr_str, rec->ipv6_linklocal,
--						NI_MAXHOST);
--				else
--					strcpy(ipaddr_str, rec->ipv6_linklocal);
-+				strlcpy(ipaddr_str, rec->ipv6_linklocal,
-+					NI_MAXHOST);
- 				inet_pton(AF_INET6, ipaddr_str,
- 					  &ird->ipv6_linklocal);
- 			}
- 
- 			/* For RTR on, ignore the IPv6 addr in the iface */
- 			if (ird->router_autocfg == IPV6_RTR_AUTOCFG_OFF) {
--				if (strlen(rec->ipv6_router) > NI_MAXHOST)
--					strncpy(ipaddr_str, rec->ipv6_router,
--						NI_MAXHOST);
--				else
--					strcpy(ipaddr_str, rec->ipv6_router);
-+				strlcpy(ipaddr_str, rec->ipv6_router,
-+					NI_MAXHOST);
- 				inet_pton(AF_INET6, ipaddr_str,
- 					  &ird->ipv6_router);
- 			}
-@@ -316,10 +307,7 @@ static int decode_iface(struct iface_rec_decode *ird, struct iface_rec *rec)
- 					calculate_default_netmask(
- 							ird->ipv4_addr.s_addr);
- 
--			if (strlen(rec->gateway) > NI_MAXHOST)
--				strncpy(ipaddr_str, rec->gateway, NI_MAXHOST);
--			else
--				strcpy(ipaddr_str, rec->gateway);
-+			strlcpy(ipaddr_str, rec->gateway, NI_MAXHOST);
- 			inet_pton(AF_INET, ipaddr_str, &ird->ipv4_gateway);
- 		}
- 	} else {
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0006-Skip-useless-strcopy-and-validate-CIDR-length.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0006-Skip-useless-strcopy-and-validate-CIDR-length.patch
deleted file mode 100644
index 0fa24cd10..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0006-Skip-useless-strcopy-and-validate-CIDR-length.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a6efed7601c890ac051ad1425582ec67dbd3f5ff Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Fri, 15 Dec 2017 11:18:35 -0800
-Subject: [PATCH 6/7] Skip useless strcopy, and validate CIDR length
-
-Remove a useless strcpy() that copies a string onto itself,
-and ensure the CIDR length "keepbits" is not negative.
-Found by Qualsys.
-
-CVE: CVE-2017-17840
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- iscsiuio/src/unix/iscsid_ipc.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
-index 52ae8c6..85742da 100644
---- a/iscsiuio/src/unix/iscsid_ipc.c
-+++ b/iscsiuio/src/unix/iscsid_ipc.c
-@@ -148,7 +148,7 @@ static int decode_cidr(char *in_ipaddr_str, struct iface_rec_decode *ird)
- 	char *tmp, *tok;
- 	char ipaddr_str[NI_MAXHOST];
- 	char str[INET6_ADDRSTRLEN];
--	int keepbits = 0;
-+	unsigned long keepbits = 0;
- 	struct in_addr ia;
- 	struct in6_addr ia6;
- 
-@@ -161,8 +161,7 @@ static int decode_cidr(char *in_ipaddr_str, struct iface_rec_decode *ird)
- 		tmp = ipaddr_str;
- 		tok = strsep(&tmp, "/");
- 		LOG_INFO(PFX "in cidr: bitmask '%s' ip '%s'", tmp, tok);
--		keepbits = atoi(tmp);
--		strcpy(ipaddr_str, tok);
-+		keepbits = strtoull(tmp, NULL, 10);
- 	}
- 
- 	/*  Determine if the IP address passed from the iface file is
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0007-Check-iscsiuio-ping-data-length-for-validity.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0007-Check-iscsiuio-ping-data-length-for-validity.patch
deleted file mode 100644
index c63c0a8d5..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0007-Check-iscsiuio-ping-data-length-for-validity.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 5df60ad8b22194391af34c1a7e54776b0372ffed Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Fri, 15 Dec 2017 11:21:15 -0800
-Subject: [PATCH 7/7] Check iscsiuio ping data length for validity
-
-We do not trust that the received ping packet data length
-is correct, so sanity check it. Found by Qualsys.
-
-CVE: CVE-2017-17840
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- iscsiuio/src/unix/iscsid_ipc.c | 5 +++++
- iscsiuio/src/unix/packet.c     | 2 +-
- iscsiuio/src/unix/packet.h     | 2 ++
- 3 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
-index 85742da..a2caacc 100644
---- a/iscsiuio/src/unix/iscsid_ipc.c
-+++ b/iscsiuio/src/unix/iscsid_ipc.c
-@@ -333,6 +333,11 @@ static void *perform_ping(void *arg)
- 
- 	data = (iscsid_uip_broadcast_t *)png_c->data;
- 	datalen = data->u.ping_rec.datalen;
-+	if ((datalen > STD_MTU_SIZE) || (datalen < 0)) {
-+		LOG_ERR(PFX "Ping datalen invalid: %d", datalen);
-+		rc = -EINVAL;
-+		goto ping_done;
-+	}
- 
- 	memset(dst_addr, 0, sizeof(uip_ip6addr_t));
- 	if (nic_iface->protocol == AF_INET) {
-diff --git a/iscsiuio/src/unix/packet.c b/iscsiuio/src/unix/packet.c
-index ecea09b..3ce2c6b 100644
---- a/iscsiuio/src/unix/packet.c
-+++ b/iscsiuio/src/unix/packet.c
-@@ -112,7 +112,7 @@ int alloc_free_queue(nic_t *nic, size_t num_of_packets)
- 	for (i = 0; i < num_of_packets; i++) {
- 		packet_t *pkt;
- 
--		pkt = alloc_packet(1500, 1500);
-+		pkt = alloc_packet(STD_MTU_SIZE, STD_MTU_SIZE);
- 		if (pkt == NULL) {
- 			goto done;
- 		}
-diff --git a/iscsiuio/src/unix/packet.h b/iscsiuio/src/unix/packet.h
-index b63d688..19d1db9 100644
---- a/iscsiuio/src/unix/packet.h
-+++ b/iscsiuio/src/unix/packet.h
-@@ -43,6 +43,8 @@
- 
- #include "nic.h"
- 
-+#define	STD_MTU_SIZE	1500
-+
- struct nic;
- struct nic_interface;
- 
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-Do-not-clean-kernel-source.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-Do-not-clean-kernel-source.patch
deleted file mode 100644
index 2c466119c..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-Do-not-clean-kernel-source.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4ebab8add4a549c16ab8b124137546c0a7b46a9b Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Tue, 15 Nov 2016 11:11:30 -0500
-Subject: [PATCH] Do not clean kernel source
-
-The default behaviour should not be to attempt to clean the kernel source
-tree when building userspace.  When not cross-compiling, however, this action is
-harmless, but when attempting to build within the sysroot and since this package
-is purely userspace, the clean step will fail.
-
-Removing the clean step eliminates an unnecessary dependency on the kernel build
-infrastructure.
-
-Upstream-status: Inappropriate (embedded specific)
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
----
- Makefile | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c8cd00e..9576bba 100644
---- a/Makefile
-+++ b/Makefile
-@@ -37,7 +37,7 @@ endif
- 
- all: user
- 
--user: iscsiuio/Makefile
-+user:
- 	$(MAKE) -C utils/sysdeps
- 	$(MAKE) -C utils/fwparam_ibft
- 	$(MAKE) -C usr
-@@ -75,7 +75,6 @@ clean:
- 	$(MAKE) -C utils/fwparam_ibft clean
- 	$(MAKE) -C utils clean
- 	$(MAKE) -C usr clean
--	$(MAKE) -C kernel clean
- 	[ ! -f iscsiuio/Makefile ] || $(MAKE) -C iscsiuio clean
- 	[ ! -f iscsiuio/Makefile ] || $(MAKE) -C iscsiuio distclean
- 
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch
deleted file mode 100644
index 37d695f49..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 79bea58a554205dd185509fbc4e76b5fc40f9038 Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Tue, 15 Nov 2016 12:36:45 -0500
-Subject: [PATCH] fw_context: add include for NI_MAXHOST definiton
-
-This appears to build successfully with gcc 4.x but fails on gcc 5+, though it's
-not immediately clear why NI_MAXHOST isn't being defined from the include
-chain.  Currently engaging with the upstream devs to determine the best course
-of action, but this is an adequate workaround.
-
-Upstream-status: Pending
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
----
- include/fw_context.h | 4 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/fw_context.h b/include/fw_context.h
-index 44053d8..0b05cea 100644
---- a/include/fw_context.h
-+++ b/include/fw_context.h
-@@ -21,6 +21,10 @@
- #ifndef FWPARAM_CONTEXT_H_
- #define FWPARAM_CONTEXT_H_
- 
-+#include <sys/socket.h>
-+#ifndef NI_MAXHOST
-+#define NI_MAXHOST 1025
-+#endif
- #include <netdb.h>
- #include <net/if.h>
- 
--- 
-2.1.4
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
similarity index 78%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
index 6c4a867b5..823227c46 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
@@ -11,26 +11,22 @@ DEPENDS = "openssl flex-native bison-native open-isns util-linux"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-SRCREV ?= "8db9717e73d32d2c5131da4f9ad86dfd9065f74b"
+SRCREV ?= "24580adc4c174bbc5dde3ae7594a46d57635e906"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
-    file://iscsi-initiator-utils-Do-not-clean-kernel-source.patch \
-    file://iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch \
     file://initd.debian \
     file://99_iscsi-initiator-utils \
     file://iscsi-initiator \
     file://iscsi-initiator.service \
     file://iscsi-initiator-targets.service \
     file://set_initiatorname \
-    file://0001-Check-for-root-peer-user-for-iscsiuio-IPC.patch \
-    file://0002-iscsiuio-should-ignore-bogus-iscsid-broadcast-packet.patch \
-    file://0003-Ensure-all-fields-in-iscsiuio-IPC-response-are-set.patch \
-    file://0004-Do-not-double-close-IPC-file-stream-to-iscsid.patch \
-    file://0005-Ensure-strings-from-peer-are-copied-correctly.patch \
-    file://0006-Skip-useless-strcopy-and-validate-CIDR-length.patch \
-    file://0007-Check-iscsiuio-ping-data-length-for-validity.patch \
+    file://0001-libopeniscsiusr-Include-limit.h-for-PATH_MAX.patch \
+    file://0002-libopeniscsiusr-Add-CFLAGS-to-linker-cmdline.patch \
+    file://0001-qedi.c-Removed-unused-linux-ethtool.h.patch \
+    file://0002-idbm.c-Include-fcnl.h-for-O_RDWR-and-O_CREAT-definit.patch \
+    file://0003-bnx2x.c-Reorder-the-includes-to-avoid-duplicate-defi.patch \
+    file://0004-fwparam_ppc.c-Do-not-use-__compar_fn_t.patch \
 "
-
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
@@ -39,25 +35,15 @@ inherit update-rc.d systemd autotools
 EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
     --host=${BUILD_SYS} \
-    --prefix=${prefix} \
-    --libdir=${libdir} \
 "
 
 EXTRA_OEMAKE = ' \
-    CC="${CC}" \
-    AR="${AR}" \
-    RANLIB="${RANLIB}" \
-    CFLAGS="${CFLAGS} ${CPPFLAGS} -D_GNU_SOURCE -I. -I../include -I../../include -I../usr -I../../usr" \
-    LDFLAGS="${LDFLAGS}" \
-    LD="${LD}" \
     OS="${TARGET_SYS}" \
     TARGET="${TARGET_OS}" \
     BASE="${prefix}" \
     MANDIR="${mandir}" \
 '
 
-TARGET_CC_ARCH += "${LDFLAGS}"
-
 do_configure () {
     cd ${S}/iscsiuio ; autoreconf --install; ./configure ${EXTRA_OECONF}
 }
@@ -81,12 +67,14 @@ do_install () {
         ${D}${localstatedir}/lib/iscsi/isns \
         ${D}${localstatedir}/lib/iscsi/slp \
         ${D}${localstatedir}/lib/iscsi/ifaces \
-        ${D}/${mandir}/man8
+        ${D}${libdir} \
+        ${D}${mandir}/man8
 
     install -p -m 755 ${S}/usr/iscsid ${S}/usr/iscsiadm \
         ${S}/utils/iscsi-iname \
         ${S}/usr/iscsistart ${D}/${sbindir}
 
+    cp -dR ${S}/libopeniscsiusr/libopeniscsiusr.so* ${D}${libdir}
     install -p -m 644 ${S}/doc/iscsiadm.8 ${S}/doc/iscsid.8 ${D}/${mandir}/man8
     install -p -m 644 ${S}/etc/iscsid.conf ${D}${sysconfdir}/iscsi
     install -p -m 755 ${WORKDIR}/initd.debian ${D}${sysconfdir}/init.d/iscsid
-- 
2.16.2


