Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SphWf-00074k-M6
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 17:11:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6DCN6vw017654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 05:23:06 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 13 Jul 2012 05:23:06 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jul 2012 08:22:50 -0400
Message-ID: <1342182175-6461-16-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1342182175-6461-1-git-send-email-morgan.little@windriver.com>
References: <1342182175-6461-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [OE-core] [PATCH 15/20] mesa-common: Update for python-native changes
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
X-List-Received-Date: Fri, 13 Jul 2012 15:11:27 -0000
Content-Type: text/plain

Add pythonnative to the inherits list

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index f697e67..120a256 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-INC_PR = "r14"
+INC_PR = "r15"
 PE = "2"
 
 
@@ -26,7 +26,7 @@ PROVIDES = "virtual/libgl"
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig pythonnative
 
 EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
-- 
1.7.0.4



