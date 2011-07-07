Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1Qeonr-0008Vc-IR
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 15:39:39 +0200
Received: by mail-bw0-f47.google.com with SMTP id 20so1009142bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=po/Ros/W3/0jeyf7PMYpwtqd/I3K4WgeSjKkM4US8Qs=;
	b=mgG8R0g+0WJNezRu22MkXxQea/jhJqKm1/34kZ1lahUD7qvRIjr4HnHdTJ9UP8aRO/
	y+qdWvrkFlQAuVZRc7nEl6AHYETjH9USBtM1dnbVUdvfzDaLwFMI/BHT6CzbjRJNUncj
	F5Y0XrugBf35BFdqIyPqQMxKI1fBqrDQKNpbw=
Received: by 10.204.145.18 with SMTP id b18mr744656bkv.26.1310045742617;
	Thu, 07 Jul 2011 06:35:42 -0700 (PDT)
Received: from localhost.localdomain (wgr614v6.plus.sbg.ac.at
	[141.201.137.156])
	by mx.google.com with ESMTPS id ek1sm8548725bkb.9.2011.07.07.06.35.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 06:35:42 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2011 15:36:01 +0200
Message-Id: <a975594904046a990cda00ae9d968315fa36433a.1310045515.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310045515.git.michael.lippautz@gmail.com>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
Subject: [meta-oe][PATCHv2 2/4] python-sqlalchemy: Add version 0.7.1 (initial recipe)
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
X-List-Received-Date: Thu, 07 Jul 2011 13:39:39 -0000

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../python/python-sqlalchemy_0.7.1.bb              |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
new file mode 100644
index 0000000..a50ce2e
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
+application developers the full power and flexibility of SQL"
+HOMEPAGE = "http://www.sqlalchemy.org/"
+LICENSE = "MIT"         
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e88f48967a8bd1fe88f5425f7e659dbf"
+RDEPENDS_${PN} += "python-numbers"
+PR = "r0"
+
+SRCNAME = "SQLAlchemy"
+SRC_URI = "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "76e2e1e48b8047f1ca7023f143374aef"
+SRC_URI[sha256sum] = "eedd2d63d6404d9bbe3c4c6a63a5442d2c2650b862f9c10f721cfae4a735d05a"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
1.7.3.4



