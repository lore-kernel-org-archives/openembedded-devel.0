Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OvbMk-0008Cn-UE
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 21:40:48 +0200
Received: (qmail 21584 invoked by uid 503); 14 Sep 2010 19:52:02 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 14 Sep 2010 19:52:02 -0000
Received: (qmail 30826 invoked by uid 503); 14 Sep 2010 19:23:13 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 14 Sep 2010 19:23:12 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 Sep 2010 21:39:43 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 14 Sep 2010 21:39:42 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Sep 2010 21:39:33 +0200
Message-Id: <1284493173-27463-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14951387814977842505
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
Subject: [PATCH] python-native: configure unicode to ucs4
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
X-List-Received-Date: Tue, 14 Sep 2010 19:40:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* while trying to run gdb from an SDK created by OE, I got the following
errors: /usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb: undefined symbol:
PyUnicodeUCS2_FromEncodedObject

* the reason is that the workstation (ubuntu 10.04 or 9.01)'s Python is compiled using ucs4
and the python-native used to create arm-angstrom-linux-gnueabi-gdb is using ucs2, the
problem is detailed here :
http://docs.python.org/faq/extending#when-importing-module-x-why-do-i-get-undefined-symbol-pyunicodeucs2

* configuring python-native with ucs=4 solves this problem.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/python/python-native_2.6.5.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-native_2.6.5.bb b/recipes/python/python-native_2.6.5.bb
index 66573e9..999335c 100644
--- a/recipes/python/python-native_2.6.5.bb
+++ b/recipes/python/python-native_2.6.5.bb
@@ -20,6 +20,10 @@ S = "${WORKDIR}/Python-${PV}"
 
 inherit native
 
+EXTRA_OECONF_append = '\
+  --enable-unicode=ucs4 \
+'
+
 EXTRA_OEMAKE = '\
   BUILD_SYS="" \
   HOST_SYS="" \
-- 
1.6.3.3



