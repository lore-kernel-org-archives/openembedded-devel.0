Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Ng1H0-0000P4-Bm
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 20:33:57 +0100
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Feb 2010 20:30:16 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Feb 2010 20:29:17 +0100
Received: from localhost.localdomain ([79.17.136.227]) by
	FBCMCL01B08.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Feb 2010 20:29:17 +0100
From: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2010 20:28:36 +0100
Message-Id: <1266002916-32059-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <1266002916-32059-1-git-send-email-GNUtoo@no-log.org>
References: <1266002916-32059-1-git-send-email-GNUtoo@no-log.org>
X-OriginalArrivalTime: 12 Feb 2010 19:29:17.0664 (UTC)
	FILETIME=[AB017600:01CAAC19]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] autotools.bbclass fix issue with native
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
X-List-Received-Date: Fri, 12 Feb 2010 19:33:57 -0000

STAGING_DIR_HOST is "" when using native bbclass:
native.bbclass:STAGING_DIR_HOST = ""
But in autotools.bbclass there is:
 sed -i -e s:${STAGING_DIR_HOST}::g $i
which result in the following code in run.autotools_prepackage_lamangler
 sed -i -e s:::g $i
which makes libxml2-native fail like this:
 | sed: -e expression #1, char 0: no previous regular expression

I discussed it on IRC:
Feb 11 17:41:29 <RP>    GNUtoo: We should only be doing that is STAGING_DIR_HOST isn't empty I guess

So I made a temporary fix which only workarround,because some issues persist:
Feb 11 17:41:02 <pb_>   RP: heh, I wonder whether paths with colons in would be considered valid :-}

Signed-off-by: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
---
 classes/autotools.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 1ea4b6f..daa0deb 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -152,7 +152,10 @@ autotools_prepackage_lamangler () {
                 sed -i -e s:${CROSS_DIR}/${HOST_SYS}::g $i
                 sed -i -e s:${CROSS_DIR}::g $i
                 sed -i -e s:${STAGING_LIBDIR}:${libdir}:g $i
-                sed -i -e s:${STAGING_DIR_HOST}::g $i
+                #TODO: needs better handling of native
+                if [ -n "${STAGING_DIR_HOST}" ]; then
+                        sed -i -e s:${STAGING_DIR_HOST}::g $i
+                fi
                 sed -i -e s:${STAGING_DIR}::g $i
                 sed -i -e s:${S}::g $i
                 sed -i -e s:${T}::g $i
-- 
1.6.4.4



