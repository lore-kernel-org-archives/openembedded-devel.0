Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SsOQO-0006fq-Rg
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 03:24:05 +0200
Received: by obcva7 with SMTP id va7so5605770obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 18:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1LSfWqmqjQaAKZrENDLgbNRic5Yz/KSUxYeoxI+BssU=;
	b=NvJ2oal7TeI4YnPM7k04KeirOaexp5d+6pApPxa7DhkMC5mYuZVdWmjF53ZvlRmQr0
	Rh/B0qdVtMLHvc2/2vXsVrAtp1G76dLGw1QmbUraFEhCXZeLVrVC+2W6B7eBw/nu1Ui9
	65zGSXarKZgI9Vpb7G+mZrshS47tL+H3A2W/AKPJy4q5nbDeVCN2p98H6WfH+1Qbad+F
	tP2c0QxtOiudextXYW5sp6npUj4ZKV3+UYSV7K2pXvdHH9+hri74/oJ2EioFaqpc9rR7
	cmKnPdrAyvKugJAmnLQ1l6sZGA1PykQkdRhR6ZFnKy0rWn1rhA3DTcJ0vW3M4PtEe0B5
	3mOA==
Received: by 10.60.29.169 with SMTP id l9mr9952538oeh.14.1342833160553;
	Fri, 20 Jul 2012 18:12:40 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id s7sm3558013oec.7.2012.07.20.18.12.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 18:12:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jul 2012 18:12:31 -0700
Message-Id: <1342833151-18755-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] nano: add PACKAGECONFIG for 'tiny' build
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
X-List-Received-Date: Sat, 21 Jul 2012 01:24:05 -0000

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



