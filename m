Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letav-0005e7-HO
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:17 +0100
Received: (qmail 28727 invoked by uid 813007); 4 Mar 2009 15:54:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:25 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQI-0001Fs-27; Wed, 04 Mar 2009 16:54:18 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:20 +0100
Message-Id: <1236182004-4523-66-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 65/70] rpm-native: add Python 2.6
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:18 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 packages/rpm/rpm_4.4.2.3.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
index 3083387..248a9f2 100644
--- a/packages/rpm/rpm_4.4.2.3.bb
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -97,6 +97,7 @@ do_configure () {
 def rpm_python_version(d):
 	import os, bb
 	staging_incdir = bb.data.getVar( "STAGING_INCDIR", d, 1 )
+	if os.path.exists( "%s/python2.6" % staging_incdir ): return "2.6"
 	if os.path.exists( "%s/python2.5" % staging_incdir ): return "2.5"
 	if os.path.exists( "%s/python2.4" % staging_incdir ): return "2.4"
 	if os.path.exists( "%s/python2.3" % staging_incdir ): return "2.3"
-- 
1.6.1.3





