Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47F507CF55
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 08:07:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2887fZK009663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Mar 2019 00:07:41 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 8 Mar 2019 00:07:40 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 8 Mar 2019 03:06:14 -0500
Message-ID: <20190308080614.184756-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308080614.184756-1-kai.kang@windriver.com>
References: <20190308080614.184756-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 4/4] logcheck: 1.3.19 -> 1.3.20
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
X-List-Received-Date: Fri, 08 Mar 2019 08:07:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../logcheck/{logcheck_1.3.19.bb => logcheck_1.3.20.bb}     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.19.bb => logcheck_1.3.20.bb} (94%)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.19.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.3.20.bb
similarity index 94%
rename from meta-perl/recipes-extended/logcheck/logcheck_1.3.19.bb
rename to meta-perl/recipes-extended/logcheck/logcheck_1.3.20.bb
index 873ac2b10..10b281a66 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.19.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.20.bb
@@ -14,8 +14,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
-SRC_URI[md5sum] = "7b50d10da6f185228627c55fdd51f624"
-SRC_URI[sha256sum] = "06294c092b2115eca3d054c57778718c91dd2e0fd1c46650b7343c2a92672ca9"
+SRC_URI[md5sum] = "1c6e9a97f9cc485353c25147cb99fb25"
+SRC_URI[sha256sum] = "9fb6d02b933470d0b1d1efb54ea186e0d0d27336f9d146be592f65ce60dfb3e6"
+
+S = "${WORKDIR}/${BPN}"
 
 inherit useradd
 
-- 
2.20.0


