Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oxyea-0001u6-PW
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 10:56:53 +0200
Received: (qmail 19724 invoked by uid 503); 21 Sep 2010 09:10:03 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 09:10:03 -0000
Received: (qmail 5648 invoked by uid 503); 21 Sep 2010 08:39:33 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 08:39:32 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 10:56:42 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 10:56:40 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 10:56:02 +0200
Message-Id: <1285059363-2190-8-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285059363-2190-7-git-send-email-eric@eukrea.com>
References: <1285059363-2190-1-git-send-email-eric@eukrea.com>
	<1285059363-2190-2-git-send-email-eric@eukrea.com>
	<1285059363-2190-3-git-send-email-eric@eukrea.com>
	<1285059363-2190-4-git-send-email-eric@eukrea.com>
	<1285059363-2190-5-git-send-email-eric@eukrea.com>
	<1285059363-2190-6-git-send-email-eric@eukrea.com>
	<1285059363-2190-7-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8306889512909974864
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
Subject: [PATCH] openvpn: add 2.1.3
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
X-List-Received-Date: Tue, 21 Sep 2010 08:56:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* tested on armv5te using shared keys setup
* DEFAULT_PREFERENCE = "-1" until it's more tested

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/openvpn/openvpn_2.1.3.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/openvpn/openvpn_2.1.3.bb

diff --git a/recipes/openvpn/openvpn_2.1.3.bb b/recipes/openvpn/openvpn_2.1.3.bb
new file mode 100644
index 0000000..c448151
--- /dev/null
+++ b/recipes/openvpn/openvpn_2.1.3.bb
@@ -0,0 +1,12 @@
+require openvpn.inc
+
+PR = "r0"
+SRC_URI = "http://openvpn.net/release/${P}.tar.gz \
+	   file://openvpn"
+
+# I want openvpn to be able to read password from file (hrw)
+EXTRA_OECONF += "--enable-password-save"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI[md5sum] = "7486d3e270ba4b033e311d3e022a0ad7"
+SRC_URI[sha256sum] = "5185181df2e6043bd667377bc92e36ea5a5bd7600af209654f109b6403ca5b36"
-- 
1.6.3.3



