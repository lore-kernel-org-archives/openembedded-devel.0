Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T8lC3-00052y-7A
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Sep 2012 06:56:55 +0200
Received: by pbcwy7 with SMTP id wy7so9286795pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 21:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hAoGPtoNHFyaFysw9fCxrILGHnCudb38oc+6QJtg8/c=;
	b=HsP0GTii+wlyTb+CuFiZroCNqxNpHh/1cwOJXYy7FNPYZJxyk2BXEN4ip8jI//OCjP
	CqniRp9UDcHc0MNs3XgGbj+xWyonjGW67hZBp4DVNMSpshyt781Y1UcRSIFMpSFOCkUe
	JLibRsOkjUL5F+1ZDnhzlSNhy44/mM6qXidn3cRMWxqGgxW2/ozloe0zKOdmJBKeu55k
	otPCz5UmmKlTG9he4tluD49OfnWVe5gjBArV5FHdluH/83YwwnMkC5d1N+QOn+25V7o5
	jMi4e3O+Uk2X7k3RDg3hsothA8lKfd7eHzeXO3ILKs7HLf5To+MG/46L+u6bf9Wye/Z6
	KUmA==
Received: by 10.66.85.71 with SMTP id f7mr38628496paz.5.1346733873044;
	Mon, 03 Sep 2012 21:44:33 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ty1sm11333316pbc.76.2012.09.03.21.44.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 21:44:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2012 21:43:33 -0700
Message-Id: <1346733813-30069-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-opie][PATCH] task-opie: Adjust for nativesdk renaming
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
X-List-Received-Date: Tue, 04 Sep 2012 04:56:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tasks/task-opie-toolchain-host-nativesdk.bb    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
index 5ca80e6..42138f1 100644
--- a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
+++ b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
@@ -1,8 +1,8 @@
-require recipes-core/tasks/task-sdk-host-nativesdk.bb
+require recipes-core/tasks/nativesdk-task-sdk-host.bb
 
 DESCRIPTION = "Host packages for Opie SDK"
 PR = "r2"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-RDEPENDS_${PN} += "qmake-nativesdk uicmoc-nativesdk"
+RDEPENDS_${PN} += "nativesdk-qmake nativesdk-uicmoc"
-- 
1.7.9.5



