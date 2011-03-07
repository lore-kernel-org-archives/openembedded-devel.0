Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pwfk8-00045r-Je
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 20:05:20 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pwfic-0002QZ-Qt from Tom_Rini@mentor.com ;
	Mon, 07 Mar 2011 11:03:46 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 7 Mar 2011 11:03:46 -0800
Received: from localhost.localdomain ([172.30.80.238]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Mar 2011 12:03:45 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Mar 2011 12:03:37 -0700
Message-Id: <1299524617-7212-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 07 Mar 2011 19:03:45.0547 (UTC)
	FILETIME=[6211F5B0:01CBDCFA]
Subject: [PATCH] gettext.bbclass: Drop target gettext from DEPENDS.
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
X-List-Received-Date: Mon, 07 Mar 2011 19:05:20 -0000

This should be handled via virtual/libintl already.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 classes/gettext.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/gettext.bbclass b/classes/gettext.bbclass
index 968531b..6c480b5 100644
--- a/classes/gettext.bbclass
+++ b/classes/gettext.bbclass
@@ -11,7 +11,7 @@ python () {
     gettext_after_parse(d)
 }
 
-DEPENDS_GETTEXT = "gettext gettext-native virtual/libiconv virtual/libintl"
+DEPENDS_GETTEXT = "gettext-native virtual/libiconv virtual/libintl"
 
 DEPENDS =+ "${DEPENDS_GETTEXT}"
 EXTRA_OECONF += "--enable-nls"
-- 
1.7.0.4



