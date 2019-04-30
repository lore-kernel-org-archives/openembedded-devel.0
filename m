Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3A28E60116
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 06:09:07 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by first.geanix.com (Postfix) with ESMTPSA id 8F811308E7E;
	Tue, 30 Apr 2019 06:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1556604541; bh=dmCqmw4Oi/9UYxURBIEZ2rgEGgeMhngRqyStAgcZOIU=;
	h=From:To:Cc:Subject:Date;
	b=N0FTKeUquH82e4Y6rSTq1W2ybV7gnHiF8OJtEzuyPRxI5Iuett5TBZfk1PgbCX1A8
	qJdp8OaQNvh7ky07PubaSnAQWydZfioYc6IXAYKVyogSb4rIxmIT8Lsm5WlS3Sz876
	yFGbtOnLxhBhg/0fcYaIdQyugEROTb5MSt+T+T20F/afBt0UyE60jnXGejmf5gLQsx
	RhmaMSM2P+L4S8lJzK3X63F+DVQsRc2REAb5Tcak4vfCa/WItEF55a6W6JV6J2y8uO
	uS6c7KbP8wfGiB89cwW4al3EGQT1IkA4xayHgYoV50UTPT7Z2zI/9FKPXB3wIJeJ0U
	8c/O1DGSrudNw==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 08:08:55 +0200
Message-Id: <20190430060855.60494-1-sean@geanix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DKIM_VALID_EF, UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b7bf6291adac
Subject: [PATCH v2] cannelloni: new package, CAN to ethernet proxy
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
X-List-Received-Date: Tue, 30 Apr 2019 06:09:07 -0000
Content-Transfer-Encoding: 8bit

Tool for sending SocketCAN messages
over Ethernet tunnel.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Changes in v2:
- Added PV

 .../cannelloni/cannelloni_git.bb                | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb

diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
new file mode 100644
index 000000000..df75e6342
--- /dev/null
+++ b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "a SocketCAN over Ethernet tunnel"
+HOMEPAGE = "https://github.com/mguentner/cannelloni"
+LICENSE = "GPLv2"
+
+SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https"
+SRCREV = "44080bb021d1a143e6906f2ec4610513c4e1cece"
+
+PV = "20160414+${SRCPV}"
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


