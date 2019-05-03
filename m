Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C99E7D69D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 May 2019 11:54:06 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by first.geanix.com (Postfix) with ESMTPSA id 5AC138F3;
	Fri,  3 May 2019 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1556884425; bh=/wabg31thnoCC7YKlVqZLLAujh0G4kPgnhasl0xyU30=;
	h=From:To:Cc:Subject:Date;
	b=dZ2OamvsU/E4iP0HJsC7sLTeNBnk1FzjC/3D3yHGyrP35T2Z1P9VLXEqdsR0I1EXf
	kTMNRFiLUAVkB/erzz9JrUPE+9UnUUFVrCdRK4SZoRIQodEbqgqGhu4D5xRany/2sc
	8sc3pRAjAi/47zrLpFDf3TpjVfLIP4ZUXw6WhLe0+ReOClcvUGNZ0TW6CEXLZLB0y1
	A1ay3K5ZYHpKKzxVoRxwzCs5s4xkxtCgaZ18wAtBf2IiknoZ7GvyKBd8lwr8WGDuYv
	2fCCNg2fk7LPBxd6zXPVmwWaxhlvLnkHiTA3stdmibWMecJLLnEz0mWP9pQ3qzgOyn
	Gt8+rPIC+F9pw==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 May 2019 13:53:55 +0200
Message-Id: <20190503115355.37774-1-sean@geanix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DKIM_VALID_EF, UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 9cf0eadf640b
Subject: [meta-oe][PATCH v2] ser2net: upgrade to version 3.5.1
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
X-List-Received-Date: Fri, 03 May 2019 11:54:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Changes since v1:
 - Nothing changed in this patch but we have changed some DMARC settings in our DNS.
   To avoid (From: openembedded-devel@lists.openembedded.org)

 .../ser2net/{ser2net_3.5.bb => ser2net_3.5.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_3.5.bb => ser2net_3.5.1.bb} (71%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_3.5.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_3.5.1.bb
similarity index 71%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_3.5.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_3.5.1.bb
index f64776c56..ed8aab016 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_3.5.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_3.5.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e10e7c8c97e5bade5e85ce6e89bdf1f4"
-SRC_URI[sha256sum] = "ba9e1d60a89fd7ed075553b4a2074352902203f7fbd9b65b15048c05f0e3f3be"
+SRC_URI[md5sum] = "569267b37b8f507d8874f28f5334b5d2"
+SRC_URI[sha256sum] = "02f5dd0abbef5a17b80836b0de1ef0588e257106fb5e269b86822bfd001dc862"
 
 inherit autotools pkgconfig
 
-- 
2.21.0


