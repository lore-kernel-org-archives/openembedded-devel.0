Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 30D737182C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 08:02:01 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so30817671wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 00:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aM16O6BbDI6GmxQCyl/RSR/0EmGaIYtIzkWBW9h7ndk=;
	b=vlT2PTgjIXUP2FPhZu9IgotiU6FBfz+sLIwgGcsUqlcYkHX+ESu0s04eA61Q8z0XOj
	LMGqM6ptxD1OY2xugBi02Eb8HwxX47Cg2jIk0VsVpnRoP3nmSCP/A9l9Rk4XEV+8VPbi
	FFyPcVR42MXQ08LjG/JP3VlPO2eJT+5w0ihAQHbWC1/W+7OzIdxh4Yh24T10zoL/ss9z
	q6ZhFXCqOY1ZvJoRNcx5FD94CBgbp/LRs2v5i9OB8In1y3KDknzfmuxDzSYsNZixNJEg
	rS+eIm5f6vQ+k9eDuHv6iZaF46nA8NzslN+d0KDbKpyZtAtq1Z3jFc+fyRbI5tYqXVom
	rU7A==
X-Received: by 10.194.158.234 with SMTP id wx10mr60000721wjb.23.1424160122482; 
	Tue, 17 Feb 2015 00:02:02 -0800 (PST)
Received: from localhost.localdomain (p5B33C632.dip0.t-ipconnect.de.
	[91.51.198.50])
	by mx.google.com with ESMTPSA id u6sm21279882wix.12.2015.02.17.00.01.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Feb 2015 00:02:01 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2015 09:01:34 +0100
Message-Id: <1424160094-5937-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
Subject: [meta-oe][PATCH v2] stunnel: Update to version 5.10
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
X-List-Received-Date: Tue, 17 Feb 2015 08:02:08 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-support/stunnel/stunnel_4.56.bb          | 17 -----------------
 .../recipes-support/stunnel/stunnel_5.10.bb          | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 17 deletions(-)
 delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.bb
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.10.bb

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
deleted file mode 100644
index 74f2234..0000000
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Program for providing universal TLS/SSL tunneling service"
-DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
-DEPENDS = "openssl zlib tcp-wrappers"
-
-RDEPENDS_${PN} += "perl"
-
-SRC_URI = "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
-SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
-
-inherit autotools
-
-EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.10.bb b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
new file mode 100644
index 0000000..5a24523
--- /dev/null
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Program for providing universal TLS/SSL tunneling service"
+DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=866cdc7459d91e092b174388fab8d283"
+DEPENDS = "openssl zlib tcp-wrappers"
+
+RDEPENDS_${PN} += "perl"
+
+SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "a0edda805eb7d6ea600a230fb0979ea1"
+SRC_URI[sha256sum] = "032bfc1854f8a0b9e452343c36ec6b52c7e0daef0863423c6b13a61a7c92eb23"
+
+inherit autotools
+
+EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
+
+PACKAGECONFIG ??= "systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-- 
1.8.1.rc3


