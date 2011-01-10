Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PcKYY-0005R4-Qn
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 17:25:19 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PcKY4-0005wA-Ft from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 08:24:48 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 10 Jan 2011 08:24:48 -0800
Received: from localhost.localdomain ([134.86.97.1]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 10 Jan 2011 09:24:47 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 09:24:55 -0700
Message-Id: <1294676696-13896-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.2
X-OriginalArrivalTime: 10 Jan 2011 16:24:47.0173 (UTC)
	FILETIME=[E59F9750:01CBB0E2]
Subject: [PATCH 1/2] minimal.conf: Fully switch to bluez4
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
X-List-Received-Date: Mon, 10 Jan 2011 16:25:19 -0000

We still had bluez-libs being set for bluez-libs rather than bluez4 which
meant that both were being built.

Acked-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 conf/distro/minimal.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index c935080..f9bfe03 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -24,7 +24,7 @@ DISTRO_CHECK := "${@bb.data.getVar('DISTRO_VERSION',d,1) or bb.fatal('Remove thi
 # Use bluetooth 4.0
 DISTRO_BLUETOOTH_MANAGER            = "bluez4"
 PREFERRED_PROVIDER_bluez-utils-dbus = "bluez4"
-PREFERRED_PROVIDER_bluez-libs       = "bluez-libs"
+PREFERRED_PROVIDER_bluez-libs       = "bluez4"
 PREFERRED_PROVIDER_bluez-utils      = "bluez4"
 
 # We want images supporting the following features (for task-base)
-- 
1.7.0.2



