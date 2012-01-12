Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHMg-0007c4-NI
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 10:54:34 +0100
Received: by mail-ey0-f175.google.com with SMTP id o13so522504eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=L6fhIe7/05Tw1xHplvBe5I9GgnZ5nPqhhTV88jsLG3o=;
	b=ucrvZJR4Cai5uex4ZVthDtzbqD8RWLyS+bL1HeUWjAvQvUK7l6CGXdYSVEyhulRgvB
	WEewq3fHoXc223gjpep0MO/SI5IezoZCmIuk7t4P0HDQy/Uipnd5zvOhzJIvDxXV68Bw
	I9DPl714aVvXZCBVST4tQms9eumQ44e2vuJlA=
Received: by 10.213.10.79 with SMTP id o15mr156141ebo.108.1326361626144;
	Thu, 12 Jan 2012 01:47:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm17417567eef.7.2012.01.12.01.47.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:47:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:46:19 +0100
Message-Id: <85c57edbd28967353f2af492865756ab5e3d4683.1326361490.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
References: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326361490.git.Martin.Jansa@gmail.com>
References: <cover.1326361490.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 5/7] edje: fix packaging of multisense module.so
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
X-List-Received-Date: Thu, 12 Jan 2012 09:54:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index 743227c..026f454 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -57,6 +57,6 @@ FILES_${PN}-utils = "\
   ${datadir}/edje/include/edje.inc \
 "
 
-FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.${SOLIBS}"
+FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.so"
 FILES_${PN}-dev += "${libdir}/${PN}/modules/*/*/module.la"
 FILES_${PN}-dbg += "${libdir}/${PN}/modules/*/*/.debug"
-- 
1.7.8.3



