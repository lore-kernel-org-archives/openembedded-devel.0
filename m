Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 822566BA93
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 12:37:57 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by first.geanix.com (Postfix) with ESMTPSA id 0AEE0308E4F;
	Wed,  1 May 2019 12:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1556714265; bh=SFaU247uv+nfKFEo0N+VAMvX+07cHGE0IfZn60USibY=;
	h=From:To:Cc:Subject:Date;
	b=IjElUhCKBGcjtPj3IJ4swuB+bi7Zgvmj7omqyxr4unbJTTAR+ejWkYI0l45Qbhsmm
	1tM6WbDl6reAyJt3vhBO2AZfDKWNs1nHw/hJ+NvVo+G5ES+rGp3Re7pGAim++q0qpL
	0fC0v06t1wBM1ruSh26sCKGAxX2F21QwY6X+U7sy1jx/rxDW/3m4+tPr8boj6Siv3p
	ZBfSeWho95EMEt05fQR+fGMzNIiRJicpsH7RbEck+RKT4pYDOiq1106kJlZTriNLBJ
	HSBjbt1p/f33xpDtQ0Rcy+LxpOTYqscw5Qx4bakP/Qwt5iMYwN35jyU958xD/4L+bp
	+Rx3TVwdmk6Ng==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 14:37:48 +0200
Message-Id: <20190501123748.77214-1-sean@geanix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DKIM_VALID_EF, UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b7bf6291adac
Subject: [PATCH] ser2net: upgrade to version 3.5.1
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
X-List-Received-Date: Wed, 01 May 2019 12:37:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
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


