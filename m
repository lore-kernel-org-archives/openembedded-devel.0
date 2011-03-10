Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PxjpZ-0001Xs-Br
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 18:39:21 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pxjo2-0004vR-76 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 09:37:46 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Mar 2011 09:37:45 -0800
Received: from localhost.localdomain ([172.30.80.238]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Mar 2011 10:37:43 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 10:37:34 -0700
Message-Id: <1299778654-14912-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 10 Mar 2011 17:37:43.0723 (UTC)
	FILETIME=[DC9F5FB0:01CBDF49]
Subject: [PATCH] gettext.bbclass: Add virtclass DEPENDS prepends
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
X-List-Received-Date: Thu, 10 Mar 2011 17:39:21 -0000

With BBCLASSEXTEND recipes which also modify DEPENDS_virtclass-native
gettext.bbclass is otherwise not working and gettext-native isn't
added.  So we need to have a DEPENDS_virtclass-$foo_prepend to
make sure GETTEXT_DEPENDS gets in.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 classes/gettext.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/classes/gettext.bbclass b/classes/gettext.bbclass
index 6c480b5..2303311 100644
--- a/classes/gettext.bbclass
+++ b/classes/gettext.bbclass
@@ -14,4 +14,7 @@ python () {
 DEPENDS_GETTEXT = "gettext-native virtual/libiconv virtual/libintl"
 
 DEPENDS =+ "${DEPENDS_GETTEXT}"
+DEPENDS_virtclass-native_prepend = "${DEPENDS_GETTEXT} "
+DEPENDS_virtclass-nativesdk_prepend = "${DEPENDS_GETTEXT} "
+DEPENDS_virtclass-cross_prepend = "${DEPENDS_GETTEXT} "
 EXTRA_OECONF += "--enable-nls"
-- 
1.7.0.4



