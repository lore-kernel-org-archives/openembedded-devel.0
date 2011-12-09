Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYxuc-0003Ka-H9
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 11:42:42 +0100
Received: by ghrr13 with SMTP id r13so2254997ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=qMfUiGYLPCFe08nvWjs8UICrxJim5EXkgQw/+xaTSsI=;
	b=whRpUTd2ZHCqarFUjXtwUsRYUaYaMt4dWGQtZ63dVjSHIMrCuxNfi+zy6ThFC11ATh
	CwMupTrn6McU8m4jsTgvoDXYWyF+mtoRFenffHbAsnVbwTE0xTErN4LGHrtd/uwFIZP4
	Myza+mTYQ3rz7fuMjKFwev03tHjlEsUS4EgXg=
Received: by 10.101.137.37 with SMTP id p37mr1619178ann.26.1323426951258;
	Fri, 09 Dec 2011 02:35:51 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 39sm15776000ant.15.2011.12.09.02.35.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 02:35:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 10:35:40 +0000
Message-Id: <a7563787e9ca6230aa14c4f47a549ae4507a9b59.1323426904.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323426904.git.otavio@ossystems.com.br>
References: <cover.1323426904.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] sg3-utils: fix license field format
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
X-List-Received-Date: Fri, 09 Dec 2011 10:42:42 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/sg3-utils/sg3-utils_1.31.bb    |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
index cab9443..5fa0765 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
@@ -2,9 +2,11 @@ DESCRIPTION = "Utilities for working with generic SCSI devices"
 HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"
 
-LICENSE = "GPLv2+ && BSD"
+LICENSE = "GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1cc481c050dc92e12db9c8145043d5dc"
 
+PR = "r1"
+
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
 RC_URI[md5sum] = "9431e1944cde829a24dedf027e1364b5"
 SRC_URI[sha256sum] = "d84b38b61f0ca3941eb1c48a5858f93d1d1b70a623e579f5ecce2440e18410a4"
-- 
1.7.2.5



