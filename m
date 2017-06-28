Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 42F207806E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:51 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id c73so25406961pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N8ijFPMYs07b+cRqHvJkmO3Iie7qrXQq1Vro9edxArg=;
	b=Lmms41ou5cVV8NFK1QtgLDXWw82kh1AjQ58BFW7arYO6AAlnmp4d6OmB2c6bOBJpeX
	rSaPV30fE09LFzqn8GKCz8bAch1XBUovKZwepznvMiKz/b2Uidkn1eZ035gBSfXyTLjG
	+Lydim2uedz8MlwEPuVq1dNvkOITY4yzX8GpZgd6G5Gn4nyMmu3bJOv942OGJRuaZZLQ
	n/IvhQruHJEJk7WG87serbq6/ldsxfhOWSQtfRgYeV7dpv5cjplA7kK97AQI+V1QfhTj
	kTOqSEaKhzFOmYzCuckQbH+srJVyuNYWSQhK+hFM7K9Q3fIhm8HqxPMdLR5RHfahrGe8
	f8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N8ijFPMYs07b+cRqHvJkmO3Iie7qrXQq1Vro9edxArg=;
	b=FkAxuEAjcfvRpDJMe/vaUnWfWovq7wK9hUoPoqdQ0eX6Q6GJLe3ndxhKoE14imU+Po
	AI9mFmhwp9OqDpjDcrd5y1gmKzafjTFdPrZPnHkGtS3BG5oJzHkutE5OhhL3cdY1aKkN
	upQw7HXy177cjpz3utqUAdm5etyU8dUcjTIfrTivvVvAgXAmGcar9GpjQWwkHMWzd5Ws
	NhHsx/KRQuwmOuVjmlKx5gTx5mElpB44kADxlLZTgb0EDQjPUh+MSzQteBwU9rrL/T92
	BoDd1ntGlWnmKAIaLZqu/1PC3anwKBQ7G/ObTZGm2alGv9Kp2JDWEQ/AuKHNbWtWRjmx
	xINQ==
X-Gm-Message-State: AKS2vOzSsQaG+bYWqKsypj/KFn9vJMW5BlM4hyDJp34tNC+d1LMLD3G9
	BLSU1bJnHKECpBeb
X-Received: by 10.98.26.211 with SMTP id a202mr8226654pfa.30.1498615732606;
	Tue, 27 Jun 2017 19:08:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:15 -0700
Message-Id: <20170628020819.17047-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/13] ncftp: Upgrade to 3.2.6
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:52 -0000

Fix build with hardening flags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-daemons/ncftp/ncftp/unistd.patch       | 32 ++++++++++++++++++++++
 .../ncftp/{ncftp_3.2.5.bb => ncftp_3.2.6.bb}       | 16 ++++++++---
 2 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/unistd.patch
 rename meta-networking/recipes-daemons/ncftp/{ncftp_3.2.5.bb => ncftp_3.2.6.bb} (53%)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/unistd.patch b/meta-networking/recipes-daemons/ncftp/ncftp/unistd.patch
new file mode 100644
index 000000000..1c8146eda
--- /dev/null
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/unistd.patch
@@ -0,0 +1,32 @@
+This patch is needed to avoid double definitions of functions
+especially when building with security flags turned on. The double
+definitions causes the sed.sh script in configure to fail since it
+starts to spit out double outputs e.g.
+
+wi_cv_gethostname_size_t size_t size_t
+
+which then caused almost all subsequent compile time tests to fail since
+this gets into confdefs.h file
+
+removing this include causes only one definitions to be emitted into
+the genrated protos.h file and thus avoiding the above failure.
+
+Other solution would to fix sed.sh to ignore double definitions
+
+Upstream-Status: Pending
+
+Signed-of-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: ncftp-3.2.6/configure
+===================================================================
+--- ncftp-3.2.6.orig/configure
++++ ncftp-3.2.6/configure
+@@ -7859,7 +7859,6 @@ chmod 755 "$wi_tmpdir/prpp.pl"
+ cat << 'EOF' > "$wi_tmpdir/unistd.c"
+ #include <confdefs.h>
+ 
+-#include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
similarity index 53%
rename from meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
rename to meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
index 893eacb99..5f92f27fd 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
@@ -2,21 +2,29 @@ DESCRIPTION = "A sophisticated console ftp client"
 HOMEPAGE = "http://ncftp.com/"
 SECTION = "net"
 LICENSE = "ClArtistic"
-LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9de76faeaedc4f908082e3f8142715f4"
+LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9c2390809f71465aa7ff76e03dc14d91"
 DEPENDS = "ncurses"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "ftp://ftp.ncftp.com/${BPN}/${BP}-src.tar.xz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
+           file://unistd.patch \
 "
-SRC_URI[md5sum] = "685e45f60ac11c89442c572c28af4228"
-SRC_URI[sha256sum] = "ac111b71112382853b2835c42ebe7bd59acb7f85dd00d44b2c19fbd074a436c4"
+SRC_URI[md5sum] = "42d0f896d69a4d603ec097546444245f"
+SRC_URI[sha256sum] = "5f200687c05d0807690d9fb770327b226f02dd86155b49e750853fce4e31098d"
 
 inherit autotools-brokensep pkgconfig
 
+CFLAGS += "-DNO_SSLv2 -D_FILE_OFFSET_BITS=64 -Wall"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[ccdv] = "--enable-ccdv,--disable-ccdv,,"
 
+EXTRA_OECONF = "--disable-precomp"
+TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
+
 do_configure() {
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     oe_runconf
 }
 do_install () {
-- 
2.13.2


