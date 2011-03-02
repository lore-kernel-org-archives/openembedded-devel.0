Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Puu7U-0005zW-8t
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 23:02:08 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Puu64-0005ev-2r from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 14:00:40 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 14:00:39 -0800
Received: from localhost.localdomain ([172.30.80.189]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 2 Mar 2011 15:00:39 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 15:00:12 -0700
Message-Id: <1299103214-30434-2-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1299103214-30434-1-git-send-email-tom_rini@mentor.com>
References: <1299103214-30434-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 02 Mar 2011 22:00:39.0227 (UTC)
	FILETIME=[444040B0:01CBD925]
Subject: [PATCH 1/3] kaeilos-2009-preferred-versions.inc: Lock policykit
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
X-List-Received-Date: Wed, 02 Mar 2011 22:02:08 -0000

glib-2.0 is locked to a version that will not work with policykit
newer than 0.97.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../include/kaeilos-2009-preferred-versions.inc    |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/conf/distro/include/kaeilos-2009-preferred-versions.inc
index 0125724..e1656cf 100644
--- a/conf/distro/include/kaeilos-2009-preferred-versions.inc
+++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
@@ -52,6 +52,8 @@ PREFERRED_VERSION_pango-native     = "1.24.4"
 #PREFERRED_VERSION_pixman	= "0.13.2"
 PREFERRED_VERSION_pkgconfig	= "0.23"
 PREFERRED_VERSION_pkgconfig-native = "0.23"
+PREFERRED_VERSION_policykit     = "0.96"
+PREFERRED_VERSION_policykit-gnome = "0.96"
 PREFERRED_VERSION_pulseaudio 	= "0.9.15"
 PREFERRED_VERSION_python-pycairo = "1.8.0"
 
-- 
1.7.0.4



