Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1L2Jvz-0003U6-Jl
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 07:19:35 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2394084fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 22:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=D5c8Z8u36BcZ2G7CgoAzaJRFj1m5BRS3GSMln8Zuzkg=;
	b=B71q6qLQB4RXWcWbR8/cpdXF7P0T9FFgi4dNDZaRXFOfwcO5LPxr8hIphkhxswZBgG
	O5MJ9BK0Iz8Hk756PgWWb9sUDiHTEsKfG1GbzNTTy5VYKA5zK/nHimOIlerCAMvIhoaN
	/kYlC2VAVwlwgQUX2yXaFSbrvHKf5jXIBJDnw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=deIP3pVMRzLjxe3IgOrxTC2eWw0rXhz6tJLKdOWG2nlDrCPCiUNmKE0hFmBY59u7Zu
	BDT6KI2SGWl8ifEkE8ehje85TxOX5RW/9syiBfLpbaSWhBkU4kvPwloLfT0Lnkzbf3gl
	kBqPjRM1n5eegZynMA8BrVWza7UBVTGyYFZDU=
Received: by 10.181.226.19 with SMTP id d19mr1222674bkr.35.1226989032531;
	Mon, 17 Nov 2008 22:17:12 -0800 (PST)
Received: from localhost.localdomain (iap-pxy-mow1.siemens.ru [212.248.25.26])
	by mx.google.com with ESMTPS id 12sm5670718fks.9.2008.11.17.22.17.10
	(version=SSLv3 cipher=RC4-MD5); Mon, 17 Nov 2008 22:17:11 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Nov 2008 09:17:00 +0300
Message-Id: <1226989020-23551-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] sharprom-compatible: update to reflect current toolchain classes
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
X-List-Received-Date: Tue, 18 Nov 2008 06:19:35 -0000

Current toolchain classes want  to also have virtual/arm-linux-libc-initial
So, add it to sharprom-toolchain-native PROVIDES and to PREFERRED_PROVIDER of
sharprom-compatible.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 conf/distro/sharprom-compatible.conf               |    1 +
 .../sharprom-toolchain-native_1.0.bb               |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/distro/sharprom-compatible.conf b/conf/distro/sharprom-compatible.conf
index ef198ac..93077e1 100644
--- a/conf/distro/sharprom-compatible.conf
+++ b/conf/distro/sharprom-compatible.conf
@@ -34,6 +34,7 @@ DISTRO_TYPE = "debug"
 
 PREFERRED_PROVIDER_virtual/arm-linux-gcc-2.95 = "sharprom-toolchain-native" 
 PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "sharprom-toolchain-native" 
+PREFERRED_PROVIDER_virtual/arm-linux-libc-initial = "sharprom-toolchain-native"
 PREFERRED_PROVIDER_virtual/arm-linux-binutils = "sharprom-toolchain-native"
 PREFERRED_PROVIDER_virtual/libc = "sharprom-toolchain-native"
 PREFERRED_PROVIDER_virtual/libiconv = "sharprom-toolchain-native"
diff --git a/packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb b/packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
index 8870bcc..c391c36 100644
--- a/packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
+++ b/packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
@@ -6,6 +6,7 @@ DEPENDS = "linux-libc-headers cross-linkage staging-linkage"
 PROVIDES_sharprom-compatible = "\
   virtual/arm-linux-gcc-2.95 \
   virtual/arm-linux-libc-for-gcc \
+  virtual/arm-linux-libc-initial \
   virtual/arm-linux-binutils \
   virtual/libc \
   virtual/libintl \
@@ -14,7 +15,7 @@ PROVIDES_sharprom-compatible = "\
   virtual/arm-linux-libc-for-gcc \
   virtual/arm-linux-gcc-intermediate \
   virtual/arm-linux-gcc-initial "
-PR = "r2"
+PR = "r3"
 
 RPROVIDES = "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
-- 
1.5.6.5



