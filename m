Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 617EE6D137
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:17:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR8HkED020298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:17:46 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:17:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:46 +0800
Message-ID: <adbe1ab36459d98a9ef1a101cfbd94a7967f81ac.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 12/12] ndctl: v62 -> v63
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
X-List-Received-Date: Tue, 27 Nov 2018 08:17:45 -0000
Content-Type: text/plain

- Upstream introduce --with-systemd to replace --with-systemd-unit-dir
  [86ab28b ndctl, build: Introduce --with-{bash,systemd}]
  It fixed previously "No package 'systemd' found" failure

- Remove COMPATIBLE_HOST to build on more machines.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_git.bb => ndctl_v63.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_git.bb => ndctl_v63.bb} (81%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
similarity index 81%
rename from meta-oe/recipes-core/ndctl/ndctl_git.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v63.bb
index b20915f..17f3405 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_git.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
@@ -10,21 +10,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
 
 inherit autotools-brokensep pkgconfig module-base bash-completion systemd
 
-# v62
-SRCREV = "11f560f4048c1d38b7011a49566871a1e8a07c94"
+SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
 SRC_URI = "git://github.com/pmem/ndctl.git"
 
 DEPENDS = "virtual/kernel kmod udev json-c"
 
-PV = "v62+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd, systemd"
+
 do_configure_prepend() {
     ${S}/autogen.sh
 }
 
 SYSTEMD_SERVICE_${PN} = "ndctl-monitor.service"
-
-COMPATIBLE_HOST='(x86_64).*'
-- 
2.7.4


