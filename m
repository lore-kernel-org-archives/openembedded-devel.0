Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1841F7ED8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 17:16:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JXTm60T6z3J
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567012605;
	bh=+g0Yyd5qdTbBbu5CdXShhCbEIxRc/eSfpjctFNck0k0=;
	h=From:To:Subject:Date:From;
	b=SorJ7XKl3643wb5j4TXt3AlKOYRx6r2UNe1jEBAM6kSbuTQ7kPhk9u1nZP2hOQ/q1
	6Bqauu1OOnLmBPqThte7pICY0omYXxkzoNUiTK+PLKIn1WgI7qZwv6MEfJaTIbcAgo
	DReiletIrtizxfA2XjC4vWa35ALoOdda8OOIGo8scl5QxIXkk3Mk65leBm/9dQO4mp
	S1rOfnh5KbsuJ+g6s1QtCJNX4VUzL0RmusZUe3GU9Q00c+wE+TX/0s+d4Crj+xG8/o
	gtlQzNU4rBOsKJvCQE6PJJGuYH8cGe6+GZ8+nRS8SCbn62EJ/qMkNQx5o6dF9bJWpQ
	ePjwVmD5mljAJqy3petpcfUEV7Q+dWDhYi98wRT2QXySXUVTjLfGtDlKnSMFS0wEGN
	0YJ7Za6CtFV1SmlwRdbhCVWR5VMYm2cEBjucgw0o0U0JGyaDL4Kv/m5FdxHNR3MgQe
	PgJU0AnOYU8S9JaKcegKLUgwo9HhUASm3Jk2Ma6JhfWD6War32AIbQRY9EQ+WomYwS
	VSrbG2eHtClwNImniTkbi5QOqz3d/sEshdEZikX6DbKpfFIxbPTzG2jVe+SB4T4gnS
	UXJOT6tvXlmmzTjQO0bi5Nk+3Uz5NJa/4rDHZA5HVX7WpL3COdZjfMH25yLne7tG8N
	Pl+p9eyOrYPZ2J3ATaVWq09o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 20:16:43 +0300
Message-Id: <20190828171643.11134-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] Replace EXCLUDE_FROM_WORLD_libc-musl = "1" with COMPATIBLE_HOST_libc-musl = 'null'
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
X-List-Received-Date: Wed, 28 Aug 2019 17:16:44 -0000

This gives users a proper error message when trying to build
a known non-building package.

netkit-rsh already had COMPATIBLE_HOST_libc-musl = 'null'.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb      | 2 +-
 meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb     | 2 +-
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 3 ---
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb         | 2 +-
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb         | 2 +-
 5 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index 4fe6893fa..3a27c2c5b 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -40,4 +40,4 @@ inherit autotools-brokensep
 EXTRA_OEMAKE = "BIN_GROUP=root MAN_GROUP=root RDIST_MODE=755 RDISTD_MODE=755 MAN_MODE=644"
 
 # http://errors.yoctoproject.org/Errors/Details/186972/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
+COMPATIBLE_HOST_libc-musl = 'null'
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
index e466cc232..3df6824ff 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
@@ -69,4 +69,4 @@ INSANE_SKIP_${PN} = "dev-so"
 RDEPENDS_${PN} += "bash python"
 
 # http://errors.yoctoproject.org/Errors/Details/186970/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
+COMPATIBLE_HOST_libc-musl = 'null'
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index 6f203c5a8..a6716d06c 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -103,6 +103,3 @@ RPROVIDES_${PN}-server = "rshd"
 
 RDEPENDS_${PN}-server = "xinetd"
 RDEPENDS_${PN}-server += "tcp-wrappers"
-
-# http://errors.yoctoproject.org/Errors/Details/186963/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 296ebcad2..716794f44 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -68,4 +68,4 @@ FILES_${PN}-dbg = "${prefix}/src/debug \
 RDEPENDS_${PN}-server += "tcp-wrappers xinetd rpcbind"
 
 # http://errors.yoctoproject.org/Errors/Details/186962/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
+COMPATIBLE_HOST_libc-musl = 'null'
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 4b035af36..a8d98c940 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -62,5 +62,5 @@ SRC_URI[sha256sum] = "9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2b
 FILES_${PN} += "${sbindir}/in.* ${libdir}/* ${sysconfdir}/xinetd.d/*"
 
 # http://errors.yoctoproject.org/Errors/Details/186954/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
+COMPATIBLE_HOST_libc-musl = 'null'
 RCONFLICTS_${PN} = "inetutils-telnetd"
-- 
2.17.1


