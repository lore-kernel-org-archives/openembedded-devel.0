Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 590867E1F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 05:10:00 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n2so4342304pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 22:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y5Ipgg4/rc3e8yQ1DxbqMxDqe0QR5meE3O/+dKWLFwc=;
	b=PsO4kDMQVQqt6omkPABjYst46s4twZ17IBA6q9115/yQPQCze83qdN8W+eO0Oowz6t
	4N4IwRmkxCwJNKHQq4pUWtBR1ePxV2IgP5yv4SP81kPKmUJ6hXuFtLija+2PGYkGJRmT
	iwRiBRA6QbQ/rMVzI0ARcyMedfEvciU85l3UHV51wqE4pFdCS5zkLn50bozfUy9iOmv2
	Dv5Q0FlGtruNFvFblFo6/2FrxpKTLC+U8BOHNTRQQnq+cQPZ1oFM7s9Y/aYap1Dv6+Bh
	C2+gNg24vVQh3+d8anujaSdm7d9Ce2dIr/7CIitYL5RiajnFFcqXqSgPb1TqQLefHtTY
	I3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y5Ipgg4/rc3e8yQ1DxbqMxDqe0QR5meE3O/+dKWLFwc=;
	b=Q7uhiYI8WkZjh+pEr1LbYRsm0o08mFE50+NTgDuuKniGD5c/C6qTyfRGvC/5Cdr++d
	JF1ckgn24E/rn+dyb9LYlLmn0Nnzq1yBaT/C3zyxlTufXsc/mvVBGfRTLQrSpdf5MNGZ
	Qd6ZeBUzmmRyBQq7Ye0ZKL7DZS1qnK5FPvpFHcZsTq9g5lRgxM6MZRie7Hz5OlKr52UI
	fu5VDma/1e+CNuexjNEfB6qUDH0/3XioNIua8ngd9Qad1vnI7Ed4u051LhAhIMjyHPY6
	b0N13rIZew9wxhi1jO0M7ER7r0VdMC0iijFc0EFZPre+NGiDPtM/jfdi68Of8lx+JLzt
	EN/g==
X-Gm-Message-State: APjAAAUWz+DG0mMWWF/8BJCxyhMMEmuuuS9MN3TFynuUtAadps1lAG8v
	5o2hgE+QzAg56Tg+TdqBX6hZDScoY9c=
X-Google-Smtp-Source: APXvYqzNGr2aVc3g2Njwg9UNNsEqhxsZkzpbPcZS+NajPiUmSSEZk6DOnOLEGQucUp82zXWlS/BJhQ==
X-Received: by 2002:a63:246:: with SMTP id 67mr104219249pgc.145.1558674600956; 
	Thu, 23 May 2019 22:10:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id 4sm1212803pfj.111.2019.05.23.22.10.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 22:10:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 22:09:52 -0700
Message-Id: <20190524050953.9647-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] udisks: Install bash_completion script in OE familiar dir
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
X-List-Received-Date: Fri, 24 May 2019 05:10:00 -0000
Content-Transfer-Encoding: 8bit

bash-completion packages up /etc/bash_completion.d automatically
so install the bash completion script in the above said dir

inherit bash-completion to do the needed for bash-completion package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sh_completion-script-in-etc-bash_com.patch | 33 +++++++++++++++++++
 .../recipes-support/udisks/udisks_1.0.5.bb    |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks/0001-tools-Install-bash_completion-script-in-etc-bash_com.patch

diff --git a/meta-oe/recipes-support/udisks/udisks/0001-tools-Install-bash_completion-script-in-etc-bash_com.patch b/meta-oe/recipes-support/udisks/udisks/0001-tools-Install-bash_completion-script-in-etc-bash_com.patch
new file mode 100644
index 0000000000..16dc440674
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks/0001-tools-Install-bash_completion-script-in-etc-bash_com.patch
@@ -0,0 +1,33 @@
+From 7863a72c723035529d6fd8d626d7fbf9a765f162 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 May 2019 21:49:57 -0700
+Subject: [PATCH] tools: Install bash_completion script in
+ /etc/bash_completion.d
+
+In OE this is one of common locations to install bash_completion files
+and its covered for packaging automatically when bash_completion class
+is inherited
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 0aaec11..839c961 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -72,7 +72,7 @@ udisks_tcp_bridge_LDADD = $(DBUS_GLIB_LIBS)
+ 
+ CLEANFILES = $(BUILT_SOURCES)
+ 
+-profiledir = $(sysconfdir)/profile.d
++profiledir = $(sysconfdir)/bash_completion.d
+ profile_SCRIPTS = udisks-bash-completion.sh
+ 
+ EXTRA_DIST = $(profile_SCRIPTS)
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index 3ae8ecc15c..0373749f0f 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -17,12 +17,13 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
            file://udisks-1.0.5-fix-service-file.patch \
            file://0001-Make-udev-rules-directory-configurable.patch \
            file://0001-include-sys-sysmacros.h.patch \
+           file://0001-tools-Install-bash_completion-script-in-etc-bash_com.patch \
            "
 
 SRC_URI[udisks.md5sum] = "70d48dcfe523a74cd7c7fbbc2847fcdd"
 SRC_URI[udisks.sha256sum] = "f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71"
 
-inherit autotools-brokensep systemd gtk-doc distro_features_check
+inherit autotools-brokensep systemd gtk-doc distro_features_check bash-completion
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-- 
2.21.0


