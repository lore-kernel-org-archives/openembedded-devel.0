Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIhx-0005nA-7F
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2705882eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=XysA2ZBBwPiwjm5ndr37J2NzQh/RalhgjLKO7Mx6+6I=;
	b=KXLsAiT/xINg9V/TVnUM726HN9okjuv55wLQI0PTd3+/3fNrNNT7GtK0xVv/1XjieY
	x9MCANmw+zxR3YjhS4bJrf+xVv8/1p3ty446hMGsfj79F6Xmz0zUUiXBuIhS0rgUSMi3
	6Z+NcVaja7tGii+TO75AHK/Kendwpz9M1ODOrS4tR46h5jfVdRNsHaldxJhbaQgtS0Zc
	7GaNsAb8sTmgtPSgaVYZdQM1cGZiz2soARDVjj0UCuVjz1Ai+SzBjUbUaA9zpsX4Nvk7
	IgZ+GCxxNrNKSHJokGJzVsuHI4Onhsw7j73T8qtwh2R3s25StGUTEdXbFU8k1x3NVIkO
	yagg==
Received: by 10.14.202.3 with SMTP id c3mr34076865eeo.4.1355680702225;
	Sun, 16 Dec 2012 09:58:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm23867476eeo.11.2012.12.16.09.58.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:51 +0100
Message-Id: <11dfb4a15516fed633535588dadf559156b6cb7d.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/26] meta-networking: Fix erroneous use of "startline" in LIC_FILES_CHKSUM
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

"beginline" is the correct parameter name. Checksums have been updated
where necessary (i.e. if the beginning line was something other than the
default of 1).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb | 4 ++--
 meta-networking/recipes-support/mtr/mtr_0.82.bb          | 2 +-
 meta-networking/recipes-support/tunctl/tunctl.inc        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 40294b0..af48455 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -8,8 +8,8 @@ and should not be enabled unless it is expressly needed."
 DEPENDS = "tcp-wrappers readline"
 SECTION = "network"
 LICENSE = "BSD-4-Clause"
-LIC_FILES_CHKSUM = "file://MCONFIG.in;startline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
-                    file://tftp/tftp.c;startline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
+LIC_FILES_CHKSUM = "file://MCONFIG.in;beginline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
+                    file://tftp/tftp.c;beginline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
 
 PR = "r0"
 
diff --git a/meta-networking/recipes-support/mtr/mtr_0.82.bb b/meta-networking/recipes-support/mtr/mtr_0.82.bb
index c6d5152..3a93948 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.82.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.82.bb
@@ -5,7 +5,7 @@ DEPENDS = "ncurses"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://mtr.c;startline=5;endline=16;md5=87105f8fe9675e897e074869afaafa6f"
+                    file://mtr.c;beginline=5;endline=16;md5=56e390ced194aff352eefab404883057"
 
 SRC_URI = "ftp://ftp.bitwizard.nl/mtr/mtr-${PV}.tar.gz \
            file://no-gtk.patch"
diff --git a/meta-networking/recipes-support/tunctl/tunctl.inc b/meta-networking/recipes-support/tunctl/tunctl.inc
index 952af24..29aed44 100644
--- a/meta-networking/recipes-support/tunctl/tunctl.inc
+++ b/meta-networking/recipes-support/tunctl/tunctl.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Tool for controlling the Linux TUN/TAP driver"
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://tunctl.c;startline=1;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
+LIC_FILES_CHKSUM = "file://tunctl.c;beginline=1;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz"
 
-- 
1.8.0.2



