Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5E9770A1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 08:40:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBU8eHUI029881
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 00:40:18 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 30 Dec 2014 00:40:17 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Dec 2014 00:40:17 -0800
Message-ID: <1419928817-38602-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1419928817-38602-1-git-send-email-liezhi.yang@windriver.com>
References: <1419928817-38602-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking] [PATCH 2/2 V2] esmtp: remove sendmail from sysroot
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
X-List-Received-Date: Tue, 30 Dec 2014 08:40:19 -0000
Content-Type: text/plain

The sysroot/${libdir}/sendmail conflicts with lsb's, and it's a
symlink to ${bindir}/esmtp which is meaningless for sysroot, so
remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
index 60d34e1..21cc1c3 100644
--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -30,3 +30,11 @@ SRC_URI[md5sum] = "79a9c1f9023d53f35bb82bf446150a72"
 SRC_URI[sha256sum] = "a0d26931bf731f97514da266d079d8bc7d73c65b3499ed080576ab606b21c0ce"
 
 FILES_${PN} += "${libdir}/"
+
+# The sysroot/${libdir}/sendmail conflicts with lsb's, and it's a
+# symlink to ${bindir}/esmtp which is meaningless for sysroot, so
+# remove it.
+SYSROOT_PREPROCESS_FUNCS += "remove_sysroot_sendmail"
+remove_sysroot_sendmail() {
+    rm -r "${SYSROOT_DESTDIR}${libdir}/sendmail"
+}
-- 
1.7.9.5


