Received: from smtprelay-h12.telenor.se ([62.127.194.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqCuF-0005mx-FS
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 23:00:35 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h12.telenor.se (Postfix) with ESMTP id 72FD0D352
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 22:39:37 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ao85AAZDmktT4zvyPGdsb2JhbACHYZMHDAEBAQE3La5UjVOEewQ
X-IronPort-AV: E=Sophos;i="4.49,628,1262559600"; d="scan'208";a="49484899"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb1.telenor.se with ESMTP; 12 Mar 2010 22:39:34 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 22:39:34 +0100
Message-Id: <1268429974-12872-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.5
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] multimedia:;Add media contents to rootfs
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
X-List-Received-Date: Fri, 12 Mar 2010 22:00:36 -0000

This package will copy the contents of "multimedia.tar.bz2."
(Note the dot at the end) to the "/home/root/multimedia" directory
in the target. By replacing the empty default file, you
can add your own multimedia files for testing.

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/multimedia/files/multimedia.tar.bz2. |  Bin 0 -> 118 bytes
 recipes/multimedia/multimedia_0.1.bb         |   19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 recipes/multimedia/files/multimedia.tar.bz2.
 create mode 100644 recipes/multimedia/multimedia_0.1.bb

diff --git a/recipes/multimedia/files/multimedia.tar.bz2. b/recipes/multimedia/files/multimedia.tar.bz2.
new file mode 100644
index 0000000000000000000000000000000000000000..09d719c63e6aa4afafce68e4bd6131e1a484537a
GIT binary patch
literal 118
zcmV-+0Ez!XT4*^jL0KkKS(4QIK>z?-dw{@z03bjCe}DiGV+LLz1PCAibrDVIr<61U
z(g&0hL?8j6G-*F=sE|@fLNkjR-2x^Ik_Ts_))SHl@W5~jiU45mLa9=&!C73{3N630
Y^gyx_&QUp?$p_-@NT&)C5?Y^VAXlj?#Q*>R

literal 0
HcmV?d00001

diff --git a/recipes/multimedia/multimedia_0.1.bb b/recipes/multimedia/multimedia_0.1.bb
new file mode 100644
index 0000000..5776059
--- /dev/null
+++ b/recipes/multimedia/multimedia_0.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "MultiMedia files"
+PR = "r1"
+
+# Note '.' at end of the filename to avoid decompress by bitbake
+SRC_URI = "\
+	file://multimedia.tar.bz2. \
+	"
+
+do_install() {
+	install -d ${D}/home/root/multimedia
+	tar jxvf ${WORKDIR}/multimedia.tar.bz2.	-C ${D}/home/root/multimedia
+	rm -f ${D}/home/root/multimedia/.empty
+}
+
+FILES_${PN} = "\
+	/home/root/multimedia/* \
+	"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.6.0.2



