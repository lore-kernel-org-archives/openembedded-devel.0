Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nrdtj-0001ws-RZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 22:01:56 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 15C43E8FEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 21:58:52 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnI+APKNn0tT4zvyPGdsb2JhbACHYJMjDAEBAQE3LaxZjXiEdgQ
X-IronPort-AV: E=Sophos;i="4.49,652,1262559600"; d="scan'208";a="51326697"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 16 Mar 2010 21:58:52 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 21:58:50 +0100
Message-Id: <1268773130-4625-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 195.54.99.196
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 1/1] libstdc++.bb: copy libstdc++.so* to rootfs
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
X-List-Received-Date: Tue, 16 Mar 2010 21:01:57 -0000

libstdc++.so* is needed by some applications during build,
including gnome-mplayer.

This recipe copies the shared library from the crosscompiler
directory, without having to install the complete compiler
in the target system

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/libstdc++/libstdc++.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libstdc++/libstdc++.bb

diff --git a/recipes/libstdc++/libstdc++.bb b/recipes/libstdc++/libstdc++.bb
new file mode 100644
index 0000000..a24c153
--- /dev/null
+++ b/recipes/libstdc++/libstdc++.bb
@@ -0,0 +1,15 @@
+PR = "r1"
+LIBSTDCPLUSPLUS_TARGET = ${STAGING_DIR_TARGET}/lib
+
+do_install () {
+	if ! [ -e ${LIBSTDCPLUSPLUS_TARGET}/libstdc++.so ] ; then 
+		cp ${CROSS_DIR}/${TARGET_SYS}/lib/libstdc++.so.6.*	${LIBSTDCPLUSPLUS_TARGET}
+		cd ${LIBSTDCPLUSPLUS_TARGET}
+		file=`ls libstdc++.so.6.*`
+		ln	-s $file	libstdc++.so.6
+		ln	-s $file	libstdc++.so	
+	fi
+}
+
+PROVIDES = "libstdc++"
+
-- 
1.6.0.2



