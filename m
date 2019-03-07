Return-Path: <sean@geanix.com>
X-Greylist: delayed 360 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Mar 2019 08:35:29 UTC
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 01FCB7CE7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 08:35:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [95.138.208.137])
	by mail.hundeboll.net (Postfix) with ESMTPSA id C8F341C3F7A;
	Thu,  7 Mar 2019 09:29:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com;
	s=hundeboll; t=1551947369;
	bh=w4kGxVZbz7cUBM0BlM5B/X3o5Fdahb2IQWM4lQMCRwk=;
	h=From:To:Cc:Subject:Date;
	b=TvTNJMQUXKG/tQHL/xRpfFcafm3hhuzfvgFKZOY3FJ+OKx+mdNTMIzLLkHixJh7g7
	SMJ4AdL4tQpKw3ff60SXE/fZJSGbtqZth/+btn2L3C7ZxbRxFUP82Qibtt+JLJt4CU
	+NO/6IlDhIpD8wPVbhYAY5ZbRI1Hq74PcvvvVxbfnmkPlbliBF0rtcgoRtYSPAkAv+
	viq007invQafkdiKakbAjfM+P+H7ksfjd0EjL+4PW+T24G5Rwi2UmB6VQF0Ucy/4dF
	pCpoN//ZtSm/0AZxAdpmGhac1V+JbSJlkHrOcfeay+tNxS8Kyzmks7fu1tf+waQfTA
	rZq11sRBxpZMA==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Thu,  7 Mar 2019 09:29:17 +0100
Message-Id: <20190307082917.18118-1-sean@geanix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] asio: add PACKAGECONFIG boost
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
X-List-Received-Date: Thu, 07 Mar 2019 08:35:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-support/asio/asio_1.12.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/asio/asio_1.12.2.bb b/meta-oe/recipes-support/asio/asio_1.12.2.bb
index ee548fd3a..ec705c275 100644
--- a/meta-oe/recipes-support/asio/asio_1.12.2.bb
+++ b/meta-oe/recipes-support/asio/asio_1.12.2.bb
@@ -20,3 +20,7 @@ SRC_URI[md5sum] = "312e53385e2daad10f08d57f91ad3431"
 SRC_URI[sha256sum] = "4e27dcb37456ba707570334b91f4798721111ed67b69915685eac141895779aa"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
+
+PACKAGECONFIG ??= "boost"
+
+PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost,boost"
-- 
2.21.0


