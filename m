Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QKrme-0003v3-Bf
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 14:47:56 +0200
Received: from localhost.localdomain (79.51.85.13) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C06BF027F; Fri, 13 May 2011 14:45:08 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 May 2011 14:45:01 +0200
Message-Id: <1305290702-7166-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305290080.2448.3.camel@gnutoo-laptop>
References: <1305290080.2448.3.camel@gnutoo-laptop>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/12] preferred-shr-versions.inc: remove xserver-common prefered version
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
X-List-Received-Date: Fri, 13 May 2011 12:47:56 -0000

Without that fix SHR keep choosing xserver-common 1.33 instead of the 1.34 version

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 conf/distro/include/preferred-shr-versions.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 35a4ecd..7df65c5 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -18,7 +18,6 @@ PREFERRED_VERSION_linux-libc-headers-native = "${LINUX_LIBC_HEADERS_VERSION}"
 PREFERRED_VERSION_openssh = "5.2p1"
 
 # upgrades used in Angstrom
-PREFERRED_VERSION_xserver-common = "1.33"
 PREFERRED_VERSION_xserver-nodm-init = "2.0"
 PREFERRED_VERSION_hal           = "0.5.13"
 PREFERRED_VERSION_wpa-supplicant = "0.6.9"
-- 
1.7.0.4



