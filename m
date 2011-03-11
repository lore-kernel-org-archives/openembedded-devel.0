Received: from edison.awellconnected.net ([83.167.180.132])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1Pxqw2-0005VW-8M
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 02:14:30 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1]
	helo=[10.225.64.244])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1PxquL-0005m7-AE
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 01:12:46 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 02:03:32 +0100
Message-ID: <1299805412.5437.31.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] transmission: add recipe for 2.22 version
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
X-List-Received-Date: Fri, 11 Mar 2011 01:14:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Depends on the the previously sent libevent bump.

From: Lukas-David Gorris <lukas.gorris@gmail.com>
Date: Fri, 11 Mar 2011 02:00:56 +0100
Subject: [oe] [PATCH] transmission: add recipe for 2.22 version

---
 recipes/transmission/transmission_2.22.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 recipes/transmission/transmission_2.22.bb

diff --git a/recipes/transmission/transmission_2.22.bb
b/recipes/transmission/transmission_2.22.bb
new file mode 100644
index 0000000..e9a7891
--- /dev/null
+++ b/recipes/transmission/transmission_2.22.bb
@@ -0,0 +1,9 @@
+require transmission.inc
+
+DEPENDS += "libevent"
+
+PR = ${INC_PR}.1
+
+SRC_URI[archive.md5sum] = "6499986bf769276310b00bda1090090d"
+SRC_URI[archive.sha256sum] =
"5a4079194f45260c143f21ea6f33ce2660d89fca02ad8f1e65169968d365e4d4"
+
-- 
1.7.1




