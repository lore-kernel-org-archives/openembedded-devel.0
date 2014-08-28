Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-08.prod.phx3.secureserver.net
	(p3plsmtpa12-08.prod.phx3.secureserver.net [68.178.252.237])
	by mail.openembedded.org (Postfix) with ESMTP id 987A571191
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:13:42 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa12-08.prod.phx3.secureserver.net with 
	id kC6Q1o0081mTNtu01C6WDx; Thu, 28 Aug 2014 05:06:30 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Aug 2014 07:06:21 -0500
Message-Id: <1409227581-20888-6-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1409227581-20888-1-git-send-email-pab@pabigot.com>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
Subject: [meta-oe][PATCH 5/5] ntp: add optional support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 12:13:44 -0000

ntp checks for presence of sys/timepps.h to determine whether the kernel
supports the RFC 2783 KPPS interface.  Without this feature the ATOM
clock driver does not work, and other drivers like NMEA require offset
configuration.

See: http://doc.ntp.org/4.2.6/kernpps.html

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-networking/recipes-support/ntp/ntp.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 55926e0..fc50fe3 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -47,6 +47,7 @@ PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
 PACKAGECONFIG[cap] = "--enable-linuxcaps,--disable-linuxcaps,libcap"
 PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
 PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
+PACKAGECONFIG[kpps] = ",,pps-tools"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
-- 
1.8.5.5


