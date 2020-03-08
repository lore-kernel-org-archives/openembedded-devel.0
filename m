Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 329BF606E7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2020 15:14:58 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id lt1so3239165pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2020 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bhRkSYnJddRr7ztK2hWuVbF2EZEARSLhDzqoIjmu4Dg=;
	b=X5oy84EXC67eXYcNfSJQaNOQ17ajiap+pa55FW6KCURvc7VKix/PyFGwTq0zvMsMSo
	7SYzUG26HjtZ6yWtvPVk4Mp5T6DhYyXpTEM3umcAOTpBOR4NAeuCqioGesx0zh/lD3x3
	gsdBwPu0fifwDxQZWGk4PeaM1abTrbECS0gLOyqGxBVZL4KtHRi1nghZcSnxaVpuwRXQ
	e5GFKz+W/3YpyZKGbhgYsA5RiA5aRrTNEMc2pBO2+cfZgoiqRYyb1a64xmklanxesWoP
	erHv4PPxXpPi02FvovwSpY+78alUBY+H2CsbwNiXKnSYBJGXOiJq+ZfH2ZGbB8DJxXqD
	0QMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bhRkSYnJddRr7ztK2hWuVbF2EZEARSLhDzqoIjmu4Dg=;
	b=cj97lt0Y/vEKWYJzPimaUIECNgjBZp/Purpd3PBbN9bpiZdriN+nQSl4RM49qgopbR
	c9NVabWcNHuqP/aLesCXZCBK6PkSu4n7cxIQl2AuOpnfAsfZwUu3S1nZPJkwrolKpggg
	+LG54GKcTxUwqsTXJFtynykf/pe3JCvnH+unIPZXBapTqMTdAbmvBvJS+FH4XUpntLE+
	DKcjja8ZaYRdDBAkA4SdEtsJ4dX++FY7faB7nb0Oe6roFBq/bC+7WSyqwlUr6BgUDAL6
	bN4BMeJxkuAe7Fn5sSUqxasiZrXBhjDw0ZUb8Ev7Io4Ac9J/Z2cNyA9ahnrcqA6WX5xO
	10ig==
X-Gm-Message-State: ANhLgQ1fnXuoTx+AgLSTGT9Jd9jH/SrG22XGT2PBN+a7Mi9/j5EpNtKQ
	hqfmfv2XA3u0ASHVFYB4Smn/dkw/NmY=
X-Google-Smtp-Source: ADFU+vvsOlqVcgESBRkxGKjXen+efIDx510mMlu1mCUQ/dJfzvKm3crcv0XF2hM9Dd3llIs91BJvRQ==
X-Received: by 2002:a17:902:8682:: with SMTP id
	g2mr11827111plo.336.1583680499588; 
	Sun, 08 Mar 2020 08:14:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	d186sm23877392pfc.8.2020.03.08.08.14.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 08:14:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2020 08:15:07 -0700
Message-Id: <20200308151509.1573831-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200308151509.1573831-1-raj.khem@gmail.com>
References: <20200308151509.1573831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/4] corosync: Update to 3.0.3
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
X-List-Received-Date: Sun, 08 Mar 2020 15:14:59 -0000
Content-Transfer-Encoding: 8bit

- Add dependency on kronosnet
- Remove obsolete options and packageconfigs
- Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...igure.ac-fix-pkgconfig-issue-of-rdma.patch | 32 -------------------
 .../{corosync_2.4.5.bb => corosync_3.0.3.bb}  | 23 +++++--------
 2 files changed, 8 insertions(+), 47 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch
 rename meta-networking/recipes-extended/corosync/{corosync_2.4.5.bb => corosync_3.0.3.bb} (82%)

diff --git a/meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch b/meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch
deleted file mode 100644
index bdc7645ce6..0000000000
--- a/meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] configure.ac: fix pkgconfig issue of rdma
-
-pkgconfig files from rdma-core(https://github.com/linux-rdma/rdma-core)
-are named start with lib, such as librdmacm.pc and libibverbs.pc. When
-rdma support is enabled, it fails to find rdma related libraries. Update
-configure.ac to the issue.
-
-Upstream-Status: Submitted [https://github.com/corosync/corosync/pull/515]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ac513e93..240cfed4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -459,8 +459,8 @@ if test "x${enable_testagents}" = xyes; then
- fi
- 
- if test "x${enable_rdma}" = xyes; then
--	PKG_CHECK_MODULES([rdmacm],[rdmacm])
--	PKG_CHECK_MODULES([ibverbs],[ibverbs])
-+	PKG_CHECK_MODULES([rdmacm],[librdmacm])
-+	PKG_CHECK_MODULES([ibverbs],[libibverbs])
- 	AC_DEFINE_UNQUOTED([HAVE_RDMA], 1, [have rdmacm])
- 	PACKAGE_FEATURES="$PACKAGE_FEATURES rdma"
- 	WITH_LIST="$WITH_LIST --with rdma"
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.5.bb b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
similarity index 82%
rename from meta-networking/recipes-extended/corosync/corosync_2.4.5.bb
rename to meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
index eefbcca8a1..c0531d3866 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.5.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
@@ -7,20 +7,16 @@ SECTION = "base"
 
 inherit autotools pkgconfig systemd useradd
 
-SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
-           file://0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch \
           "
-
-SRC_URI[md5sum] = "e36a056b893c313c4ec1fe0d7e6cdebd"
-SRC_URI[sha256sum] = "ab6eafdb8f43a23794fc15d4c5198bbd6759060cb13c8d2d1e78a6c8360aba5f"
-
+SRC_URI[sha256sum] = "20eb903eb984f6a728282c199825e442e8bba869acefd22390076ef3a33a4ded"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
 
-DEPENDS = "groff-native nss libqb"
+DEPENDS = "groff-native nss libqb kronosnet"
 
 SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service \
                          ${@bb.utils.contains('PACKAGECONFIG', 'qdevice', 'corosync-qdevice.service', '', d)} \
@@ -31,23 +27,20 @@ SYSTEMD_AUTO_ENABLE = "disable"
 INITSCRIPT_NAME = "corosync-daemon"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-                   dbus qdevice qnetd snmp \
+                   dbus snmp \
 "
 
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-PACKAGECONFIG[qdevice] = "--enable-qdevices,--disable-qdevices"
-PACKAGECONFIG[qnetd] = "--enable-qnetd,--disable-qnetd"
-PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma,rdma-core"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_unitdir},--disable-systemd --without-systemddir,systemd"
 
 EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash ap_cv_cc_pie=no"
 EXTRA_OEMAKE = "tmpfilesdir_DATA="
 
-do_configure_prepend() {
-    ( cd ${S}
-    ${S}/autogen.sh )
-}
+#do_configure_prepend() {
+#    ( cd ${S}
+#    ${S}/autogen.sh )
+#}
 
 do_install_append() {
     install -D -m 0644 ${WORKDIR}/corosync.conf ${D}/${sysconfdir}/corosync/corosync.conf.example
-- 
2.25.1


