Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB0C72C0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 06:14:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0G6E93G016884
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:14:10 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 22:14:09 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jan 2015 14:14:01 +0800
Message-ID: <058864b5f77163937b625071f1acc94586dda696.1421388212.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421388212.git.jackie.huang@windriver.com>
References: <cover.1421388212.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] net-snmp: fix "libtool --finish"
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
X-List-Received-Date: Fri, 16 Jan 2015 06:14:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

LIB_LDCONFIG_CMD failed since it is using a host dir $(libdir)
which is /usr/lib64 does not exist on host when compile 64bit
image.

In fact, configuring dynamic linker run-time bindings is meaningless
at this step,  If it is needed, Poky would write ldconfig scripts to
rpm-postinst for each recipe while do_package, in package.bbclass.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../net-snmp/net-snmp/fix-libtool-finish.patch     | 25 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
new file mode 100644
index 0000000..a360c3a
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
@@ -0,0 +1,25 @@
+LIB_LDCONFIG_CMD failed since it is using a host dir $(libdir)
+which is /usr/lib64 does not exist on host when compile 64bit
+image.
+
+In fact, configuring dynamic linker run-time bindings is meaningless
+at this step,  If it is needed, Poky would write ldconfig scripts to
+rpm-postinst for each recipe while do_package, in package.bbclass.
+
+Upstream-Status: Inappropriate [cross compile specific]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+diff --git a/Makefile.top b/Makefile.top
+index 862fb94..ed7dcfc 100644
+--- a/Makefile.top
++++ b/Makefile.top
+@@ -86,7 +86,7 @@ LIBREVISION = 2
+ LIB_LD_CMD      = $(LIBTOOL) --mode=link $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) -o
+ LIB_EXTENSION   = la
+ LIB_VERSION     =
+-LIB_LDCONFIG_CMD = $(LIBTOOL) --mode=finish $(INSTALL_PREFIX)$(libdir)
++LIB_LDCONFIG_CMD = echo "do not ldconfig\n"
+ LINK		= $(LIBTOOL) --mode=link $(LINKCC)
+ # RANLIB 	= @RANLIB@
+ RANLIB		= :
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 3567094..1e398d4 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://snmpd.service \
         file://snmptrapd.service \
         file://ifmib.patch \
+        file://fix-libtool-finish.patch \
 "
 
 SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
-- 
1.9.1


