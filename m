Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id C1CCD60767
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:26:26 +0000 (UTC)
Received: by qgea14 with SMTP id a14so10800012qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X1AreNMfomPF9rg7dUOa+wst4cfDjkmfpKdRJwaDDN0=;
	b=OgTm+MiPWgNFGkTtV3b15ZyIfeQHMf0sDFu5Y3EAC5l1QHgjBQ5uUctDEy2dsn8Y5q
	vHSx4skkmyRr8A89a5V6v5cZ6BpEgTJjD6LPxOWtLihIhj7hBDyb71bMr5bswFM80GIm
	M2fJckDazC5ighDMOszI8Qcr0ts6cy9D6PGDyJBzn/5SoPvRnQCfe7PJsxAI2WPEKzUv
	rj7snvWfNMPW1eqeovfZ+9EkRBOX7OsMhJWqcP9gQShZ0YbXvGCQ9TdwXT0lALuR7z2S
	SJK33AHm/QdqIeXra/D0MTYMvPU1Kr5cooht6DLy6kEzeOVYcYEgh/n7kiQhM7kJ3kYC
	dfsw==
X-Received: by 10.140.91.109 with SMTP id y100mr83030614qgd.20.1448990787168; 
	Tue, 01 Dec 2015 09:26:27 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59])
	by smtp.gmail.com with ESMTPSA id s105sm88022qge.40.2015.12.01.09.26.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Dec 2015 09:26:26 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 12:26:19 -0500
Message-Id: <1448990780-11060-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448990780-11060-1-git-send-email-philip@balister.org>
References: <1448990780-11060-1-git-send-email-philip@balister.org>
Subject: [meta-python][PATCH 2/3] python-txws: Add new recipe.
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
X-List-Received-Date: Tue, 01 Dec 2015 17:26:27 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-connectivity/python-txws/python-txws_0.9.1.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb

diff --git a/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
new file mode 100644
index 0000000..ceed228
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Twisted Web Sockets"
+HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76699830db7fa9e897f6a1ad05f98ec8"
+
+DEPENDS = "python-twisted python-six python-vcversioner"
+
+SRC_URI = "git://github.com/MostAwesomeDude/txWS.git"
+SRCREV= "88cf6d9b9b685ffa1720644bd53c742afb10a414"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
-- 
2.1.0


