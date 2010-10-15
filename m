Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P6qxb-0005Ed-Ml
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 22:33:04 +0200
Received: by gwb17 with SMTP id 17so545983gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 13:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=vQ5EDAZ58zIT64nrmWUN9URZA0VV8YQDa6m2OZu7+44=;
	b=YOEKxQZVN70Sxt2hYBXZQYS3PmLsH4opB+gVzPbtreyCNjoOgkhbH85TKJV6tCpyqh
	3kcyvDAMXMpqhwvssrn0d70SmfNNSslkmEYuSfdwWif7fKK9+ZvPEbFMNXIORXeEr/Ko
	0hu4Ijw0ykt/VKG0bvQVHLEBict866IEOTB10=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WO+hPu6VXnp6VEHrutcU+CSacL6zjGCK+GQ+OMYH5jvkzFJBegjt0OCm4N469jp8og
	FxVVZXgUTI135p3KeCIoHgXaLpAWrvtsUKmGM21TJkvQO9OL1u3AJo5QtU6vaZWEUVhm
	s1rlgxkG6MgH/pYb19Rpc1OWX57OrquRC1g4A=
Received: by 10.151.108.16 with SMTP id k16mr2481406ybm.23.1287174752673;
	Fri, 15 Oct 2010 13:32:32 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id f43sm10295602yhc.26.2010.10.15.13.32.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Oct 2010 13:32:31 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 15:32:27 -0500
Message-Id: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/2] Fix Angstrom OVERRIDES settings
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
X-List-Received-Date: Fri, 15 Oct 2010 20:33:04 -0000

* Use the new MACHINE_OVERRIDES variable in angstrom.inc to
  set the FEED_ARCH and SOC_FAMILY OVERRIDES
    * NOTE: These were left in their orignal order which will
            result in the SOC_FAMILY being more specific than
            the FEED_ARCH.  This was done on purpose as the
            SOC_FAMILY should be more specific.  i.e. for omap3
            the omap3 override is more specific than the armv7a
            override.
* Modified the glibc include files to prepend libc-glibc, etc
  to the OVERRIDES list.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/distro/include/angstrom.inc       |    2 +-
 conf/distro/include/eglibc.inc         |    2 +-
 conf/distro/include/glibc-external.inc |    2 +-
 conf/distro/include/glibc-internal.inc |    2 +-
 conf/distro/include/glibc.inc          |    2 +-
 conf/distro/include/uclibc.inc         |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 8983c86..4b38cff 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -14,7 +14,7 @@ TARGET_VENDOR = "-angstrom"
 SOC_FAMILY ?= "Unknown"
 
 # Add FEED_ARCH and SOC_FAMILY to overrides
-OVERRIDES .= ":${FEED_ARCH}:${SOC_FAMILY}"
+MACHINE_OVERRIDES += "${FEED_ARCH} ${SOC_FAMILY}"
 
 # Put links to sources in deploy/sources to make it easier for people to be GPL compliant
 INHERIT += "src_distribute_local"
diff --git a/conf/distro/include/eglibc.inc b/conf/distro/include/eglibc.inc
index 0443140..5115e7f 100644
--- a/conf/distro/include/eglibc.inc
+++ b/conf/distro/include/eglibc.inc
@@ -1,5 +1,5 @@
 # Add glibc overrides to the overrides for eglibc.
-OVERRIDES .= ":libc-glibc"
+OVERRIDES =. "libc-glibc:"
 
 # The things eglibc can provide.  We default to wanting eglibc to provide them.
 PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
diff --git a/conf/distro/include/glibc-external.inc b/conf/distro/include/glibc-external.inc
index b84d237..fd72ee8 100644
--- a/conf/distro/include/glibc-external.inc
+++ b/conf/distro/include/glibc-external.inc
@@ -1,5 +1,5 @@
 # Add glibc to the overrides.
-OVERRIDES .= ":libc-glibc"
+OVERRIDES =. "libc-glibc:"
 
 # The things glibc can provide.  We default to wanting glibc to provide them.
 PREFERRED_PROVIDER_virtual/libiconv ?= "external-toolchain-${TOOLCHAIN_BRAND}"
diff --git a/conf/distro/include/glibc-internal.inc b/conf/distro/include/glibc-internal.inc
index e06b9b0..6f84f5e 100644
--- a/conf/distro/include/glibc-internal.inc
+++ b/conf/distro/include/glibc-internal.inc
@@ -1,5 +1,5 @@
 # Add glibc to the overrides.
-OVERRIDES .= ":libc-glibc"
+OVERRIDES =. "libc-glibc:"
 
 # The things glibc can provide.  We default to wanting glibc to provide them.
 PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
diff --git a/conf/distro/include/glibc.inc b/conf/distro/include/glibc.inc
index f1c80dc..5a6e3eb 100644
--- a/conf/distro/include/glibc.inc
+++ b/conf/distro/include/glibc.inc
@@ -1,5 +1,5 @@
 # Add glibc to the overrides.
-OVERRIDES .= ":libc-glibc"
+OVERRIDES =. "libc-glibc:"
 
 # The things glibc can provide.  We default to wanting glibc to provide them.
 PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
diff --git a/conf/distro/include/uclibc.inc b/conf/distro/include/uclibc.inc
index b40fbf5..dd00647 100644
--- a/conf/distro/include/uclibc.inc
+++ b/conf/distro/include/uclibc.inc
@@ -1,5 +1,5 @@
 # Add uclibc overrides to the overrides.
-OVERRIDES .= ":libc-uclibc"
+OVERRIDES =. "libc-uclibc:"
 
 # The things uclibc can provide.  We default to wanting uclibc to provide them.
 PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
-- 
1.7.0.4



