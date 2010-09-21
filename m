Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oxyee-0001u9-1t
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 10:56:56 +0200
Received: (qmail 18970 invoked by uid 503); 21 Sep 2010 09:10:02 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 09:10:02 -0000
Received: (qmail 5586 invoked by uid 503); 21 Sep 2010 08:39:31 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 08:39:31 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 10:56:40 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 10:56:39 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 10:55:57 +0200
Message-Id: <1285059363-2190-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285059363-2190-2-git-send-email-eric@eukrea.com>
References: <1285059363-2190-1-git-send-email-eric@eukrea.com>
	<1285059363-2190-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8306608037933264203
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
Subject: [PATCH] apache2: unbreak recipe
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
X-List-Received-Date: Tue, 21 Sep 2010 08:56:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* tested on armv5te / angstrom

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/apache2/apache2_2.2.14.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/apache2/apache2_2.2.14.bb b/recipes/apache2/apache2_2.2.14.bb
index 1c425b7..b39f14c 100644
--- a/recipes/apache2/apache2_2.2.14.bb
+++ b/recipes/apache2/apache2_2.2.14.bb
@@ -1,6 +1,6 @@
 SECTION = "net"
 DESCRIPTION = "The apache v2 web server"
-DEPENDS = "apache2-native openssl expat pcre"
+DEPENDS = "libtool-native apache2-native openssl expat pcre"
 RDEPENDS_${PN} += "openssl"
 
 PR = "r2"
@@ -89,6 +89,11 @@ EXTRA_OECONF = "--enable-ssl \
 #
 # here we over-ride the autotools provided do_configure.
 #
+
+do_configure_prepend() {
+	sed -e 's,libtool libtool15,${TARGET_PREFIX}libtool libtool115,' -i ${S}/srclib/apr/build/buildcheck.sh
+}
+
 do_configure() {
 	( cd srclib/apr; ./buildconf ) 
 	oe_runconf
-- 
1.6.3.3



