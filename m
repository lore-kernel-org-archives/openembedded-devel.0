Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C89E971634
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 03:20:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57701841"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Feb 2015 11:16:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1G3JEw3029292
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 11:19:14 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 16 Feb 2015 11:20:02 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Feb 2015 11:14:34 +0800
Message-ID: <1424056475-44818-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1424056475-44818-1-git-send-email-biannm@cn.fujitsu.com>
References: <1424056475-44818-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH 1/2] ipsec-tools: install a sample config file for racoon
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
X-List-Received-Date: Mon, 16 Feb 2015 03:20:01 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../ipsec-tools/ipsec-tools/racoon.conf.sample     | 40 ++++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |  7 ++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf.sample

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf.sample b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf.sample
new file mode 100644
index 0000000..2948a4a
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf.sample
@@ -0,0 +1,40 @@
+#
+# NOTE: This file will not be used if you use racoon-tool(8) to manage your
+# IPsec connections. racoon-tool will process racoon-tool.conf(5) and
+# generate a configuration (/var/lib/racoon/racoon.conf) and use it, instead
+# of this file.
+#
+# Simple racoon.conf
+# 
+#
+# Please look in /usr/share/doc/racoon/examples for
+# examples that come with the source.
+#
+# Please read racoon.conf(5) for details, and alsoread setkey(8).
+#
+#
+# Also read the Linux IPSEC Howto up at 
+# http://www.ipsec-howto.org/t1.html 
+#
+log notify;
+path pre_shared_key "/etc/racoon/psk.txt";
+path certificate "/etc/racoon/certs";
+
+#remote 172.31.1.1 {
+#        exchange_mode main,aggressive;
+#        proposal {
+#                encryption_algorithm 3des;
+#                hash_algorithm sha1;
+#                authentication_method pre_shared_key;
+#                dh_group modp1024;
+#        }
+#        generate_policy off;
+#}
+# 
+#sainfo address 192.168.203.10[any] any address 192.168.22.0/24[any] any {
+#        pfs_group modp768;
+#        encryption_algorithm 3des;
+#        authentication_algorithm hmac_md5;
+#        compression_algorithm deflate;
+#}
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 8cc55ef..7519d83 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV
            file://racoon-check-invalid-ivm.patch \
            file://glibc-2.20.patch \
            file://racoon-Resend-UPDATE-message-when-received-EINTR-message.patch \
+           file://racoon.conf.sample \
           "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
@@ -54,6 +55,7 @@ EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \
                 --enable-shared \
                 --enable-dpd \
                 --enable-natt=yes \
+                --sysconfdir=${sysconfdir}/racoon \
                 ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '', d)}"
 
 # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527
@@ -62,3 +64,8 @@ CFLAGS += "-fno-strict-aliasing"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,"
 PACKAGECONFIG[selinux] = "--enable-security-context,--disable-security-context,libselinux,"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/racoon
+    install -m 0644 ${WORKDIR}/racoon.conf.sample ${D}${sysconfdir}/racoon/racoon.conf
+}
-- 
1.9.1


