Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E10776AC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 08:41:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L8fKTL008844
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:41:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Fri, 21 Aug 2015 01:41:19 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 16:37:12 +0800
Message-ID: <1440146235-9630-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440146235-9630-1-git-send-email-kai.kang@windriver.com>
References: <1440146235-9630-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/4] autofs: 5.1.0 -> 5.1.1
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
X-List-Received-Date: Fri, 21 Aug 2015 08:41:23 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-systemd-allow-with-systemd-to-take-a-path-arg.patch          | 0
 .../autofs/{autofs-5.1.0 => autofs}/Makefile.rules-cross.patch        | 0
 .../autofs/{autofs-5.1.0 => autofs}/add-the-needed-stdarg.h.patch     | 0
 .../autofs-5.0.7-do-not-check-for-modprobe.patch                      | 0
 .../autofs/{autofs-5.1.0 => autofs}/autofs-5.0.7-fix-lib-deps.patch   | 0
 .../autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch        | 0
 .../autofs/{autofs-5.1.0 => autofs}/autofs-additional-distros.patch   | 0
 .../recipes-daemons/autofs/{autofs-5.1.0 => autofs}/cross.patch       | 0
 .../fix-the-YACC-rule-to-fix-a-building-failure.patch                 | 0
 .../autofs/{autofs-5.1.0 => autofs}/fix_disable_ldap.patch            | 0
 .../autofs/{autofs-5.1.0 => autofs}/force-STRIP-to-emtpy.patch        | 0
 .../autofs/{autofs-5.1.0 => autofs}/libtirpc-name-clash-backout.patch | 0
 .../recipes-daemons/autofs/{autofs-5.1.0 => autofs}/libtirpc.patch    | 0
 .../recipes-daemons/autofs/{autofs-5.1.0 => autofs}/no-bash.patch     | 0
 .../autofs/{autofs-5.1.0 => autofs}/remove-bashism.patch              | 0
 .../using-pkg-config-to-detect-libxml-2.0-and-krb5.patch              | 0
 .../recipes-daemons/autofs/{autofs_5.1.0.bb => autofs_5.1.1.bb}       | 4 ++--
 17 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/Makefile.rules-cross.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/add-the-needed-stdarg.h.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/autofs-5.0.7-do-not-check-for-modprobe.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/autofs-5.0.7-fix-lib-deps.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/autofs-additional-distros.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/cross.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/fix-the-YACC-rule-to-fix-a-building-failure.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/fix_disable_ldap.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/force-STRIP-to-emtpy.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/libtirpc-name-clash-backout.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/libtirpc.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/no-bash.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/remove-bashism.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.0.bb => autofs_5.1.1.bb} (93%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
rename to meta-networking/recipes-daemons/autofs/autofs/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/Makefile.rules-cross.patch b/meta-networking/recipes-daemons/autofs/autofs/Makefile.rules-cross.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/Makefile.rules-cross.patch
rename to meta-networking/recipes-daemons/autofs/autofs/Makefile.rules-cross.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/add-the-needed-stdarg.h.patch b/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/add-the-needed-stdarg.h.patch
rename to meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-do-not-check-for-modprobe.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-do-not-check-for-modprobe.patch
rename to meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-fix-lib-deps.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-fix-lib-deps.patch
rename to meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
rename to meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-additional-distros.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-additional-distros.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-additional-distros.patch
rename to meta-networking/recipes-daemons/autofs/autofs/autofs-additional-distros.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/cross.patch b/meta-networking/recipes-daemons/autofs/autofs/cross.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/cross.patch
rename to meta-networking/recipes-daemons/autofs/autofs/cross.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix-the-YACC-rule-to-fix-a-building-failure.patch b/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix-the-YACC-rule-to-fix-a-building-failure.patch
rename to meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix_disable_ldap.patch b/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix_disable_ldap.patch
rename to meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch b/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch
rename to meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc-name-clash-backout.patch b/meta-networking/recipes-daemons/autofs/autofs/libtirpc-name-clash-backout.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc-name-clash-backout.patch
rename to meta-networking/recipes-daemons/autofs/autofs/libtirpc-name-clash-backout.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc.patch b/meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc.patch
rename to meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/no-bash.patch b/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/no-bash.patch
rename to meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/remove-bashism.patch b/meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/remove-bashism.patch
rename to meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch b/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.1.0/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
rename to meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
similarity index 93%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
index fbfe4b3..0f4c247 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
@@ -23,8 +23,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://fix-the-YACC-rule-to-fix-a-building-failure.patch \
 "
 
-SRC_URI[md5sum] = "b7724a9a55923f3c06933a8dfd1e79d3"
-SRC_URI[sha256sum] = "794a28d178d2b21a2380ee71cbdb3b15b4be47c06f3de255b8c5c4351f046b26"
+SRC_URI[md5sum] = "e143df66b614b8cdb1ff533735f8e12d"
+SRC_URI[sha256sum] = "795419383b120d15699ab3b89ea0f3d029f6fb28405a83982d305c4b7b61130f"
 
 inherit update-rc.d pkgconfig
 
-- 
1.9.1


