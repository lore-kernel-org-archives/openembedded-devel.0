Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OqHa7-0002Kb-JK
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 05:32:21 +0200
Received: by gxk2 with SMTP id 2so2445420gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 20:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=vvs0vDQOm/4oooN/kDHuGp6mXV3P+H3jOCxrcoq/cao=;
	b=ssBlnIP8TkYL13QGCLBPAOfBoxIIzo3hYBI/U6nospMudSFaFMrSiSc47sazMn5Soo
	MBArF1garDqc3DoejMf/RBGxJlnF9GUm30cJJe+/+akXqUYUzVGe0vLwCt2D6zYgFKSu
	yGY10prk4DMa36kqRzKmJQUYYg5/zF4pOAJyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=CO56FAdqflkmJxgpE3tk3WQSSitV4mJvU4FcdFHBqMWBdgaOX39+3RyS5OqZLgeORP
	5sfdImZ7Ksb+MvtDbKzRXctk4jCNuYDz7W9HPByz7Lbg4RGtZj0YPrwYQb7n3q9DAkFG
	uPIkYiHEiSP3C3QkA94IFiTdsECSxOSqWIvPc=
Received: by 10.101.75.5 with SMTP id c5mr5732119anl.190.1283225506511;
	Mon, 30 Aug 2010 20:31:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id h5sm13775139anb.8.2010.08.30.20.31.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 30 Aug 2010 20:31:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Aug 2010 20:31:39 -0700
Message-Id: <1283225499-11712-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] make_3.82.bb: Add new recipe.
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
X-List-Received-Date: Tue, 31 Aug 2010 03:32:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/make/make_3.82.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 recipes/make/make_3.82.bb

diff --git a/recipes/make/make_3.82.bb b/recipes/make/make_3.82.bb
new file mode 100644
index 0000000..3cdc0a0
--- /dev/null
+++ b/recipes/make/make_3.82.bb
@@ -0,0 +1,6 @@
+require make.inc
+
+BBCLASSEXTEND = "native"
+SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
+SRC_URI[sha256sum] = "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984da4a76958d0402966"
+
-- 
1.7.1



