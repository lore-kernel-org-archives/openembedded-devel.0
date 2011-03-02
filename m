Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuvZn-000895-Vw
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 00:35:28 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PuvYN-0007a5-Rr from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 15:33:59 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 15:33:59 -0800
Received: from localhost.localdomain ([172.30.80.189]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 2 Mar 2011 16:33:58 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 16:33:38 -0700
Message-Id: <1299108818-9224-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 02 Mar 2011 23:33:58.0418 (UTC)
	FILETIME=[4DA0FF20:01CBD932]
Subject: [PATCH] samba: Add avahi to DEPEND / EXTRA_OECONF
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 23:35:28 -0000

avahi is currently an 'auto' thing so we should spell it out to
be clear, set to on.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/samba/samba-ads_3.2.15.bb       |    2 +-
 recipes/samba/samba-ads_3.3.9.bb        |    2 +-
 recipes/samba/samba-ads_3.5.6.bb        |    2 +-
 recipes/samba/samba-essential_3.0.20.bb |    2 +-
 recipes/samba/samba.inc                 |    3 ++-
 recipes/samba/samba_3.0.23c.bb          |    2 +-
 recipes/samba/samba_3.0.34.bb           |    2 +-
 recipes/samba/samba_3.2.15.bb           |    2 +-
 recipes/samba/samba_3.3.0.bb            |    2 +-
 recipes/samba/samba_3.3.9.bb            |    2 +-
 recipes/samba/samba_3.5.6.bb            |    2 +-
 11 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/recipes/samba/samba-ads_3.2.15.bb b/recipes/samba/samba-ads_3.2.15.bb
index 002bed7..1579f2c 100644
--- a/recipes/samba/samba-ads_3.2.15.bb
+++ b/recipes/samba/samba-ads_3.2.15.bb
@@ -2,7 +2,7 @@ require samba.inc
 require samba-ads.inc
 LICENSE = "GPLv3"
 
-PR = "r2"
+PR = "r3"
 SRC_URI += "file://config-lfs.patch \
             file://quota.patch;striplevel=0 \
             file://configure-3.2.8.patch \
diff --git a/recipes/samba/samba-ads_3.3.9.bb b/recipes/samba/samba-ads_3.3.9.bb
index a498918..d28b0c9 100644
--- a/recipes/samba/samba-ads_3.3.9.bb
+++ b/recipes/samba/samba-ads_3.3.9.bb
@@ -2,7 +2,7 @@ require samba.inc
 require samba-ads.inc
 LICENSE = "GPLv3"
 
-PR = "r3"
+PR = "r4"
 SRC_URI += "file://config-lfs.patch \
             file://quota.patch;striplevel=0 \
             file://configure-3.3.0.patch \
diff --git a/recipes/samba/samba-ads_3.5.6.bb b/recipes/samba/samba-ads_3.5.6.bb
index 1119c1b..cbbd7ac 100644
--- a/recipes/samba/samba-ads_3.5.6.bb
+++ b/recipes/samba/samba-ads_3.5.6.bb
@@ -2,7 +2,7 @@ require samba.inc
 require samba-ads.inc
 LICENSE = "GPLv3"
 
-PR = "r3"
+PR = "r4"
 SRC_URI += "file://config-lfs.patch \
             file://quota.patch;striplevel=0 \
             file://configure-3.3.0.patch \
diff --git a/recipes/samba/samba-essential_3.0.20.bb b/recipes/samba/samba-essential_3.0.20.bb
index b775080..7b169e0 100644
--- a/recipes/samba/samba-essential_3.0.20.bb
+++ b/recipes/samba/samba-essential_3.0.20.bb
@@ -1,7 +1,7 @@
 require samba-essential.inc
 inherit update-rc.d
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "file://config-lfs.patch \
 	   file://init-essential \
diff --git a/recipes/samba/samba.inc b/recipes/samba/samba.inc
index e5fa06e..3c38de9 100644
--- a/recipes/samba/samba.inc
+++ b/recipes/samba/samba.inc
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 LICENSE = "GPL"
-DEPENDS = "readline virtual/libiconv talloc"
+DEPENDS = "readline virtual/libiconv talloc avahi"
 
 SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
            file://volatiles.03_samba \
@@ -28,6 +28,7 @@ EXTRA_OECONF='--disable-cups \
               --with-readline=${STAGING_LIBDIR}/.. \
               --with-libiconv=${STAGING_LIBDIR}/.. \
               --without-automount \
+              --enable-avahi \
               --with-configdir=${sysconfdir}/samba \
               --with-privatedir=${sysconfdir}/samba/private \
               --with-lockdir=${localstatedir}/lock \
diff --git a/recipes/samba/samba_3.0.23c.bb b/recipes/samba/samba_3.0.23c.bb
index 27ff058..7c5d738 100644
--- a/recipes/samba/samba_3.0.23c.bb
+++ b/recipes/samba/samba_3.0.23c.bb
@@ -4,7 +4,7 @@ require samba-basic.inc
 SRC_URI += "file://configure.patch \
             file://cifs.patch"
 
-PR = "r7"
+PR = "r8"
 
 EXTRA_OECONF += "\
 	--with-smbmount \
diff --git a/recipes/samba/samba_3.0.34.bb b/recipes/samba/samba_3.0.34.bb
index a5f9b26..05a4159 100644
--- a/recipes/samba/samba_3.0.34.bb
+++ b/recipes/samba/samba_3.0.34.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://configure.patch \
             "
 SRC_URI_append_libc-uclibc        = "file://uclibc-strlcpy-strlcat.patch"
 
-PR = "r6"
+PR = "r7"
 
 PACKAGES =+ " smbfs smbfs-doc"
 
diff --git a/recipes/samba/samba_3.2.15.bb b/recipes/samba/samba_3.2.15.bb
index 214de58..fb35fe9 100644
--- a/recipes/samba/samba_3.2.15.bb
+++ b/recipes/samba/samba_3.2.15.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://configure-3.2.8.patch \
 SRC_URI[md5sum] = "5a3bcc4927c9643b9f42970d0815b18f"
 SRC_URI[sha256sum] = "84281fd1faeffee8558e49dff865dd382abbf78bc1be00f8cb5aa70aeea67d46"
 
-PR = "r4"
+PR = "r5"
 
 EXTRA_OECONF += "\
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
diff --git a/recipes/samba/samba_3.3.0.bb b/recipes/samba/samba_3.3.0.bb
index 6fab7dd..6385227 100644
--- a/recipes/samba/samba_3.3.0.bb
+++ b/recipes/samba/samba_3.3.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://configure-3.3.0.patch \
             file://mtab.patch \
             file://tdbheaderfix.patch "
 
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF += "\
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
diff --git a/recipes/samba/samba_3.3.9.bb b/recipes/samba/samba_3.3.9.bb
index f8870ac..73c4cc9 100644
--- a/recipes/samba/samba_3.3.9.bb
+++ b/recipes/samba/samba_3.3.9.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://configure-3.3.0.patch \
             file://mtab.patch \
             file://tdbheaderfix.patch "
 
-PR = "r4"
+PR = "r5"
 
 EXTRA_OECONF += "\
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
diff --git a/recipes/samba/samba_3.5.6.bb b/recipes/samba/samba_3.5.6.bb
index 72bada9..23134a0 100644
--- a/recipes/samba/samba_3.5.6.bb
+++ b/recipes/samba/samba_3.5.6.bb
@@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
 SRC_URI += "file://config-h.patch \
             file://tdbheaderfix.patch;apply=no"
 
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "\
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
-- 
1.7.0.4



