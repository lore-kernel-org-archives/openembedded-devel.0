Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1P69Kf-0006Sj-5A
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 23:58:00 +0200
Received: from source ([74.125.83.41]) by na3sys009aob101.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTLYrSBhioj1Lstw/JVayfkwIvjKI3AzO@postini.com;
	Wed, 13 Oct 2010 14:57:31 PDT
Received: by mail-gw0-f41.google.com with SMTP id 21so1495701gwj.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 14:57:28 -0700 (PDT)
Received: by 10.100.124.4 with SMTP id w4mr1526426anc.76.1287005187993;
	Wed, 13 Oct 2010 14:26:27 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id c32sm12922273anc.21.2010.10.13.14.26.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 14:26:27 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 17:26:25 -0400
Message-Id: <1287005185-27109-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <i94r56$spo$1@dough.gmane.org>
References: <i94r56$spo$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i94r56$spo$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 74.125.149.67
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: [PATCH] distro, toolchain-external: override TARGET_VENDOR with TOOLCHAIN_VENDOR
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
X-List-Received-Date: Wed, 13 Oct 2010 21:58:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Trying to use an external toolchain like the 2009q1 toolchain from codesourcery
has some strange results since the toolchain has vendor 'none' but
distributions like angstrom set TARGET_VENDOR unconditionally.

This patch overrides the TARGET_VENDOR with the value of TOOLCHAIN_VENDOR,
if set. TOOLCHAIN_VENDOR can be set in the local configuration alongside the
other TOOLCHAIN_* variables. The override is performed in
toolchain-external.inc, as suggested by Koen Kooi [1]. It also reorders the
inclusion of the distro and toolchain-* so that toolchain-external can override
the value of TARGET_VENDOR, as suggested by Denys Dmytriyenko [2].

Tested with angstrom-2008.1 and the codesourcery 2009q1 toolchain by assigning
TOOLCHAIN_VENDOR = "-none"
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "csl"
, in addition to putting the CSL in the PATH.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
CC: Koen Kooi <k.kooi@student.utwente.nl>
CC: Víctor M. Jáquez L. <vjaquez@igalia.com>
CC: CC: Denys Dmytriyenko <denis@denix.org>

[1] http://article.gmane.org/gmane.comp.handhelds.openembedded/38053
[2] http://article.gmane.org/gmane.comp.handhelds.openembedded/38188
---
 conf/distro/angstrom-2008.1.conf           |    8 ++++----
 conf/distro/angstrom-2010.x.conf           |    8 ++++----
 conf/distro/include/toolchain-external.inc |    2 ++
 conf/distro/kaeilos.conf                   |    8 ++++----
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index ec4f21e..1fd5ab6 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -124,10 +124,6 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 
-# Toolchain virtuals:
-require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
-require conf/distro/include/arm-thumb.inc
-
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
 PREFERRED_PROVIDER_opkg                 ?= "opkg"
@@ -143,6 +139,10 @@ ANGSTROMLIBC ?= "glibc"
 
 require conf/distro/include/angstrom.inc
 
+# Toolchain virtuals:
+require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
+require conf/distro/include/arm-thumb.inc
+
 # Set DISTRO_FEED_CONFIGS to our config var, assigned in the above .inc
 DISTRO_FEED_CONFIGS = "${ANGSTROM_FEED_CONFIGS}"
 
diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010.x.conf
index b872450..8693cda 100644
--- a/conf/distro/angstrom-2010.x.conf
+++ b/conf/distro/angstrom-2010.x.conf
@@ -114,10 +114,6 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 
-# Toolchain virtuals:
-require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
-require conf/distro/include/arm-thumb.inc
-
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
 PREFERRED_PROVIDER_opkg                 ?= "opkg"
@@ -131,6 +127,10 @@ ANGSTROM_BLACKLIST_pn-ipkg			= "ipkg has been superseded by opkg"
 
 require conf/distro/include/angstrom.inc
 
+# Toolchain virtuals:
+require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
+require conf/distro/include/arm-thumb.inc
+
 # Set DISTRO_FEED_CONFIGS to our config var, assigned in the above .inc
 DISTRO_FEED_CONFIGS = "${ANGSTROM_FEED_CONFIGS}"
 
diff --git a/conf/distro/include/toolchain-external.inc b/conf/distro/include/toolchain-external.inc
index ff83f5a..585d50e 100644
--- a/conf/distro/include/toolchain-external.inc
+++ b/conf/distro/include/toolchain-external.inc
@@ -6,3 +6,5 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain-${TOOLCHAIN
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain-${TOOLCHAIN_BRAND}"
 #PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain-${TOOLCHAIN_BRAND}"
 
+TOOLCHAIN_VENDOR ?= "${TARGET_VENDOR}"
+TARGET_VENDOR = "${TOOLCHAIN_VENDOR}"
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index 1287ea1..6625ba1 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -119,10 +119,6 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 
-# Toolchain virtuals:
-require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
-require conf/distro/include/arm-thumb.inc
-
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
 PREFERRED_PROVIDER_opkg                 ?= "opkg"
@@ -135,6 +131,10 @@ ANGSTROM_BLACKLIST_pn-fso-apm       = "regular apmd is good enough"
 
 require conf/distro/include/kaeilos.inc
 
+# Toolchain virtuals:
+require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
+require conf/distro/include/arm-thumb.inc
+
 # If we're using an .ipk based rootfs, we want to have opkg installed so postinst script can run
 # We also take this opportunity to inject angstrom-version and the feed configs into the rootfs
 IPKG_VARIANT = "opkg angstrom-version ${ANGSTROM_FEED_CONFIGS}"
-- 
1.7.0.4



