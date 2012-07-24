Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1StjWT-0006Zt-5j
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 20:07:53 +0200
Received: by obcva7 with SMTP id va7so11420115obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1LSfWqmqjQaAKZrENDLgbNRic5Yz/KSUxYeoxI+BssU=;
	b=xZ+OBDBjol78gvdDHbJuBeVxmqNlqFxzp4RYzG/Edg/slQ1L/O2zbQMawT/4Wts75u
	arrcTH1vePOf/1Fuw2wnHmHTsuSLTUNXi+117sP5JvM3r70ayNrLxB2nGtNgQsaMzO4n
	9d+WsiDJu4710cl/MHEWpkKlB7zo5T+alDyMIgXF1nXgSNIpQnq/UjQLg95/Haz7mZ2n
	QWqqltCCSIgJOc35wGHUmmlfq9NtyESClgfOW/J9b94A1mS9FVnBfHPvbBboJoxCv0ER
	6Sqc291OPALaKLLR8qO2NqV1SxddYI6pmlrYyelpbvkOEz37Og7czwjdU7p3F6KibD8A
	S2SA==
Received: by 10.182.212.70 with SMTP id ni6mr29109149obc.44.1343152584227;
	Tue, 24 Jul 2012 10:56:24 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hc9sm13882949obc.15.2012.07.24.10.56.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 10:56:23 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:56:17 -0700
Message-Id: <1343152577-19272-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH][meta-oe] nano: add PACKAGECONFIG for 'tiny' build
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
X-List-Received-Date: Tue, 24 Jul 2012 18:07:53 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-support/nano/nano.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index 2d52cab..68bcb2e 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 DEPENDS = "ncurses"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 PV_MAJOR = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
@@ -16,4 +16,4 @@ SRC_URI = "http://www.nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
 
 inherit autotools gettext
 
-EXTRA_OECONF = "--enable-all"
+PACKAGECONFIG[tiny] = "--enable-tiny,--enable-all,"
-- 
1.7.9.5



