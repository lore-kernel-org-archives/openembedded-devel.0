Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhTm-0005jX-4b
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:33:22 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so5030562wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cqpLOquYvWyZUVjmg05vfcVlgQFqNVVdezt3pjswHVI=;
	b=rg2RPKQm2Jt7CQr2+qeiiWEXMCjE16TBGx2RapEVDq6QW8svAdZfuYu4seBYjpfTrc
	zui95DneyDw1JrVmKI1TEsdXl1FViFRbs71jACoZO/CIVsWlb8/6v1uLp39bBIRBTYus
	sKUnTsFh2MjyhE3spyBRnPqIgQeDTasQ8FrWMRqM4ZuSw3h7x9vRLCo0FpxYNK2VNJYF
	Gs919JVr2ak3CKnqAAg/DSFnRjycbfgPnewPXBX/Vv8sT3nT7XRui7VIOI+3xhP0Q6YL
	sEQPFUccMql0Iq+NRCl+RRLQ2H/Wvp6g3LWD9l8MclOLBz7xycpHOIBDFerfIalWsamn
	u5SA==
Received: by 10.180.78.135 with SMTP id b7mr19849070wix.11.1343859705676;
	Wed, 01 Aug 2012 15:21:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm12058179wib.8.2012.08.01.15.21.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:21:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:21:01 +0200
Message-Id: <aaa2f0a4d2d11188a6b5c60ac45d658921f1cd55.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/8] phonet-utils: simplify with inherit autotools
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
X-List-Received-Date: Wed, 01 Aug 2012 22:33:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../phonet-utils/phonet-utils_git.bb               |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
index 9a3310e..f5bd1cf 100644
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
@@ -3,17 +3,11 @@ HOMEPAGE = ""
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "git://gitorious.org/meego-cellular/phonet-utils.git;branch=master;protocol=git"
-PR = "r1"
+PR = "r2"
 S = "${WORKDIR}/git"
 SRCREV = "4acfa720fd37d178a048fc2be17180137d4a70ea"
 PV = "0.0.0+gitr${SRCPV}"
 
-do_compile () {
-	make
-}
-
-do_install () {
-	DESTDIR=${D} oe_runmake install
-}
+inherit autotools
 
 FILES_${PN} += "${base_libdir}/udev/rules.d/85-phonet-utils.rules"
-- 
1.7.8.6



