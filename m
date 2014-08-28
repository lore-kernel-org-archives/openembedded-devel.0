Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-05.prod.phx3.secureserver.net
	(p3plsmtpa06-05.prod.phx3.secureserver.net [173.201.192.106])
	by mail.openembedded.org (Postfix) with ESMTP id 920687119B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:43:19 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa06-05.prod.phx3.secureserver.net with 
	id kHjK1o00P1mTNtu01HjLbP; Thu, 28 Aug 2014 10:43:20 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Aug 2014 12:43:11 -0500
Message-Id: <1409247791-29772-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1409227581-20888-6-git-send-email-pab@pabigot.com>
References: <1409227581-20888-6-git-send-email-pab@pabigot.com>
Subject: [meta-networking][PATCH v2] ntp: add deterministic support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 17:43:22 -0000

ntp checks for presence of sys/timepps.h to determine whether the kernel
supports the RFC 2783 KPPS interface.  Under Linux the pps-tools package
installs this header.  Without this feature the ATOM clock driver does
not work, and other drivers like NMEA have reduced precision.  Remove
the feature non-determinism and increase ntpd capabilities by adding an
explicit dependency.

See: http://doc.ntp.org/4.2.6/kernpps.html

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
V2: replace PACKAGECONFIG with DEPENDS to remove nondeterminism

 meta-networking/recipes-support/ntp/ntp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 55926e0..f55a39a 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -8,6 +8,8 @@ SECTION = "console/network"
 LICENSE = "NTP"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
 
+DEPENDS = "pps-tools"
+
 INC_PR = "r6"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
-- 
1.8.5.5


