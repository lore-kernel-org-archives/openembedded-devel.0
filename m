Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D11D77EFE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:29 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y129so1044687pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xR6R26k3Eu4pPQkWgRk3ZmNNLg+5h7FdK02qF/yEI7M=;
	b=KU1ECJUm1TqEeMQjMzAujHWa/bakq6enpfuIN3NJ275CPnc92qL3PzNCS7thN6+z0g
	z9nunAAVxZQSuxLLeG4Hjg/wsui/any9Za5d3QIrWP5degH53ydYcBS6P3yRALt098HV
	g7EzKTkK0kXBk7mESYd79Wc1fJzE7jP6mQ4EXMKQQsrsgauFFLOzTVpa/4PWLu/S1kho
	ZL4cRLHMuB8JroRBRDW/mvl7l9czz/jl94G3WXu1snxdh68660EoDN3NW2rBIA1/H0A4
	oSSkrqOAjsB9g99MEPB053OZgcu+CHzp4dWEXSZSNX288O1kjeib7SkK8LezWKhiyBHu
	pg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xR6R26k3Eu4pPQkWgRk3ZmNNLg+5h7FdK02qF/yEI7M=;
	b=Z8aRLUccifTbzAqwflfdPs4LIkItmQkIW+I70qIvE8qKHnPrGLU7MSx1eQ1b1JOWCy
	NmClb/JAAxHbYBFkCD+6d8qjlrzd2WYZznlDlFkobxD3B78ywTxgS791nuf1czrRpsrc
	nMhzTIhMdNN0ptu+8XXFevO4IxWridK+NCLpnLYHRLFJxCzAAelntqLQ54umtVIsMeAA
	0+V9BjfYN+q7q1XzF9uWVjeWEQ2A61yBpY7uJGtWi7gR7FRoGrjQsWsJNwbeOkV6yGqm
	TjOsSaM/ZoWq0YVBr+PFQiiCR5viQ+j5f+E94qbMVHSi/a+EgscQTlQif+csUa8Jfwsj
	JzWA==
X-Gm-Message-State: AIVw110TANZG9UDo6hW7kVsc1yjvPuuhBRbCAIdzf6CpxqS63kXKHF0M
	xHaepLvgXn/di+1g
X-Received: by 10.84.234.15 with SMTP id m15mr798589plk.247.1500347431035;
	Mon, 17 Jul 2017 20:10:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:01 -0700
Message-Id: <20170718031013.44536-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/17] netkit-ftp: Include sys/types.h for u_long definition
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-ftp-include-sys-types.h-for-u_long.patch  | 30 ++++++++++++++++++++++
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |  7 ++---
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch

diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch
new file mode 100644
index 000000000..8376603ea
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch
@@ -0,0 +1,30 @@
+From 2ee0c51d81a0a08d64b64ab624074e5f7cd9615a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 00:07:32 -0700
+Subject: [PATCH] ftp: include sys/types.h for u_long
+
+fixes
+ftp.c:1091:2: error: unknown type name 'u_long'; did you mean 'long'?
+  u_long a1,a2,a3,a4,p1,p2;
+  ^~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ftp/ftp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ftp/ftp.c b/ftp/ftp.c
+index 7a56af6..5dcb513 100644
+--- a/ftp/ftp.c
++++ b/ftp/ftp.c
+@@ -43,6 +43,7 @@ char ftp_rcsid[] =
+ #include <sys/socket.h>
+ #include <sys/time.h>
+ #include <sys/file.h>
++#include <sys/types.h>
+ 
+ #include <netinet/in.h>
+ #include <netinet/ip.h>
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
index 37f5bc725..394a69e62 100644
--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
@@ -6,9 +6,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://ftp/ftp.c;beginline=2;endline=3;md5=2d40a75a50d83b8f6317b3f53db72bfa"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-ftp/netkit-ftp_${PV}.orig.tar.gz;name=archive \
-            ${DEBIAN_MIRROR}/main/n/netkit-ftp/netkit-ftp_${PV}-31.debian.tar.xz;name=patch31 \
-            file://Add_ARG_MAX_define.patch \
-"
+           ${DEBIAN_MIRROR}/main/n/netkit-ftp/netkit-ftp_${PV}-31.debian.tar.xz;name=patch31 \
+           file://Add_ARG_MAX_define.patch \
+           file://0001-ftp-include-sys-types.h-for-u_long.patch \
+           "
 
 SRC_URI[archive.md5sum] = "94441610c9b86ef45c4c6ec609444060"
 SRC_URI[archive.sha256sum] = "61c913299b81a4671ff089aac821329f7db9bc111aa812993dd585798b700349"
-- 
2.13.3


