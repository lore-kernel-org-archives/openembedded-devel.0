Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1Lk9iZ-0007BT-V3
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 05:19:01 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.105]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1Lk9hT-0000zT-CR
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 12:17:58 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2009 22:17:30 -0600
Message-Id: <1237436250.13773.1.camel@think-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 59.124.115.149
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add enia library paths to edje-sdk
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
X-List-Received-Date: Thu, 19 Mar 2009 04:19:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


---
 packages/efl1/edje-sdk_svn.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/packages/efl1/edje-sdk_svn.bb
b/packages/efl1/edje-sdk_svn.bb
index 2bd75a0..59ce355 100644
--- a/packages/efl1/edje-sdk_svn.bb
+++ b/packages/efl1/edje-sdk_svn.bb
@@ -7,3 +7,6 @@ SRCNAME = "${@bb.data.getVar('PN', d, 1).replace('-sdk',
'')}"
 DEPENDS = "evas-native ecore-native eet-native embryo-native"
 S = "${WORKDIR}/edje"

+HOST_STAGING_NAME = "${@bb.data.getVar('STAGING_DIR_HOST', d,
1).replace('-sdk', '')}"
+
+CPPFLAGS += "-isystem${HOST_STAGING_NAME}/usr/include/eina-0 -isystem
${HOST_STAGING_NAME}/usr/include/eina-0/eina"
--
1.5.6.3




