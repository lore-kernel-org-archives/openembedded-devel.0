Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A85260167
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 22:10:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t74MAb3I020218
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Aug 2015 15:10:37 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 4 Aug 2015 15:10:35 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Aug 2015 15:10:35 -0700
Message-ID: <1438726235-21320-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] znc: add SRCREV_FORMAT variable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Aug 2015 22:10:44 -0000
Content-Type: text/plain

When more than one SRCREV is defined, we need to specify
how to construct a composite revision.  Failure to do this
can result in parsing errors.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-irc/znc/znc_git.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-irc/znc/znc_git.bb b/recipes-irc/znc/znc_git.bb
index d81c170..a7a44e2 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -13,6 +13,10 @@ SRC_URI = "git://github.com/znc/znc.git;name=znc \
 SRCREV_znc = "f47e8465efa4e1cd948b9caae93ac401b4355df8"
 SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
 
+# This constructs a composite revision based on multiple SRCREV's.
+#
+SRCREV_FORMAT = "znc_Csocket"
+
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
-- 
1.7.9.5


