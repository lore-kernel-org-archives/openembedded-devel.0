Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PxzI4-0005Af-QI
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:09:49 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1] helo=[10.225.64.94])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1PxzGT-0008J2-TU
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 10:08:10 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299805602.5437.32.camel@computer>
References: <1299805602.5437.32.camel@computer>
Date: Fri, 11 Mar 2011 11:08:04 +0100
Message-ID: <1299838084.2321.3.camel@computer>
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
Subject: Re: [PATCH] transmission: add recipe for 2.22 version
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
X-List-Received-Date: Fri, 11 Mar 2011 10:09:49 -0000
X-Groupsio-MsgNum: 30060
Content-Type: multipart/mixed; boundary="=-4+B1KR3MS4N8Pevg3Qzs"

--=-4+B1KR3MS4N8Pevg3Qzs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> Depends on the the previously sent libevent bump.
> 
> From: Lukas-David Gorris <lukas.gorris@gmail.com>
> Date: Fri, 11 Mar 2011 02:00:56 +0100
> Subject: [oe] [PATCH] transmission: add recipe for 2.22 version

Sorry for the corrupted patch. Resent in attachment.

Best,
Lukas


--=-4+B1KR3MS4N8Pevg3Qzs
Content-Disposition: attachment; filename="transmission-bump.diff"
Content-Type: text/x-patch; name="transmission-bump.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Lukas-David Gorris <lukas.gorris@gmail.com>
Date: Fri, 11 Mar 2011 02:00:56 +0100
Subject: [oe][PATCH] transmission: add recipe for 2.22 version

---
 recipes/transmission/transmission_2.22.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 recipes/transmission/transmission_2.22.bb

diff --git a/recipes/transmission/transmission_2.22.bb b/recipes/transmission/transmission_2.22.bb
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
+SRC_URI[archive.sha256sum] = "5a4079194f45260c143f21ea6f33ce2660d89fca02ad8f1e65169968d365e4d4"
+
-- 
1.7.1


--=-4+B1KR3MS4N8Pevg3Qzs--
