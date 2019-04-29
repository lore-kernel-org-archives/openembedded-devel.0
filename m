Return-Path: <sean@geanix.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Apr 2019 13:26:51 UTC
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 690C87DBBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 13:26:51 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by first.geanix.com (Postfix) with ESMTPSA id C0068308E7F;
	Mon, 29 Apr 2019 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1556543977; bh=7vZ2oxGEmm5BnqSp+B+V9TVyqnNcfpx2kaR8cUpZ24w=;
	h=From:To:Cc:Subject:Date;
	b=kDnP9Rs8rV7q7cIwQ7WVO8IWoAicVdacR52CnNUMKaVcmlCoSaviLMJRLlVSy9J8q
	I2WTnHMB3uFcEhh4OwbtFJ+gon+8ALCaWFa1xs9T2Lik9ojt69C3tKPcpDFprHOTys
	1ZxqZ+Aq6TiCcq954MVcDnqoGCiK9gHk3eZuK1aoPKIBMoVCl4/WIaQmpxg82YZ/Id
	s02XbKNThXuAmmvTeB5zMhNmP38qBJgWuS/yfwasDKLsKExvBbMPDFVsOrGGMBpsVy
	oCpYWsUJ0K/I84B2U2euoZegwDYTKq34Vp2jOIXI/lkKWGTXrPKBa2qhBSQ2PWfNnz
	H39qbxzAoQQoA==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:19:14 +0200
Message-Id: <20190429131914.123617-1-sean@geanix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DKIM_VALID_EF, UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b7bf6291adac
Subject: [PATCH] cannelloni: new package, CAN to ethernet proxy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2019 13:26:51 -0000
Content-Transfer-Encoding: 8bit

Tool for sending SocketCAN messages
over Ethernet tunnel.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 .../cannelloni/cannelloni_git.bb                  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb

diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
new file mode 100644
index 000000000..43c04ef34
--- /dev/null
+++ b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "a SocketCAN over Ethernet tunnel"
+HOMEPAGE = "https://github.com/mguentner/cannelloni"
+LICENSE = "GPLv2"
+
+SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https"
+SRCREV = "44080bb021d1a143e6906f2ec4610513c4e1cece"
+
+LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit cmake
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= "lksctp-tools"
+PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
-- 
2.21.0


