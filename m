Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OypOj-0005Rv-6q
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 19:15:54 +0200
Received: (qmail 2158 invoked by uid 503); 23 Sep 2010 17:29:32 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 23 Sep 2010 17:29:32 -0000
Received: (qmail 6745 invoked by uid 503); 23 Sep 2010 16:58:25 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 23 Sep 2010 16:58:24 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Sep 2010 19:15:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Sep 2010 19:15:46 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 19:15:01 +0200
Message-Id: <1285262101-25477-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <AANLkTikKwmBvHMEGESdXgOo5PTqk=CAGr19kWOJ-ZwM4@mail.gmail.com>
References: <AANLkTikKwmBvHMEGESdXgOo5PTqk=CAGr19kWOJ-ZwM4@mail.gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10034582920727145801
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] liburi-perl: update to 1.5.5
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
X-List-Received-Date: Thu, 23 Sep 2010 17:15:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
v2 : update to 1.55, URL fix is no more necessary

 recipes/perl/liburi-perl_1.52.bb |   18 ------------------
 recipes/perl/liburi-perl_1.55.bb |   18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 recipes/perl/liburi-perl_1.52.bb
 create mode 100644 recipes/perl/liburi-perl_1.55.bb

diff --git a/recipes/perl/liburi-perl_1.52.bb b/recipes/perl/liburi-perl_1.52.bb
deleted file mode 100644
index d9cf315..0000000
--- a/recipes/perl/liburi-perl_1.52.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Manipulates and accesses URI strings"
-SECTION = "libs"
-LICENSE = "Artistic|GPL"
-#RDEPENDS_${PN} += " libmime-base64-perl libnet-perl"
-PR = "r3"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
-
-S = "${WORKDIR}/URI-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND="native"
-
-PACKAGE_ARCH = "all"
-
-SRC_URI[md5sum] = "d6ba96cc3e650af6537675e016e83d3e"
-SRC_URI[sha256sum] = "3d325b52c9d1e7aa2fbf67131f1f5ee39964cbe54e864bcfb9808af274a9eb4a"
diff --git a/recipes/perl/liburi-perl_1.55.bb b/recipes/perl/liburi-perl_1.55.bb
new file mode 100644
index 0000000..1f602e2
--- /dev/null
+++ b/recipes/perl/liburi-perl_1.55.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Manipulates and accesses URI strings"
+SECTION = "libs"
+LICENSE = "Artistic|GPL"
+RDEPENDS_${PN} += " perl-module-extutils-makemaker perl-module-mime-base64"
+PR = "r4"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
+
+S = "${WORKDIR}/URI-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND="native"
+
+PACKAGE_ARCH = "all"
+
+SRC_URI[md5sum] = "e66a2ab45da92a2c5f67a495c88999f5"
+SRC_URI[sha256sum] = "34ece72deedebfe7d52da90990e49d79e7c62319837def69ed943316bfb74291"
-- 
1.6.3.3



