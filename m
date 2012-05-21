Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgP-0001Iq-7y
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:01 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LENrjE005434
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:53 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENrbo030162
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:53 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:23:53 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAol008382;
	Mon, 21 May 2012 09:23:51 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:14 -0500
Message-ID: <1337610609-1173-16-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 15/70] avahi: Update LICENSE field version to GPLv2 and LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:34:02 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2+ and
  LGPLv2.1 to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/avahi/avahi.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/avahi/avahi.inc b/recipes/avahi/avahi.inc
index f4dff0a..65a593d 100644
--- a/recipes/avahi/avahi.inc
+++ b/recipes/avahi/avahi.inc
@@ -3,9 +3,9 @@ AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://avahi.org"
 SECTION = "network"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPLv2+ LGPLv2.1"
 DEPENDS = "libcap2 python-native expat virtual/libintl libdaemon dbus glib-2.0"
-INC_PR = "r13"
+INC_PR = "r14"
 # uclibc has no nss
 RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
 RDEPENDS_avahi-daemon += "sysvinit-pidof update-rc.d"
-- 
1.7.0.4



