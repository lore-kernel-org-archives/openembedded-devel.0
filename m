Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9aNO-0002Q6-2G
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:36:02 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1143176wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=A7lUhCiGcK5oHsTnlWu/dfqogzfJA3YtE71rCWmoUzE=;
	b=jqokPSdPalu55lXgv5YnMwPZqQZtb/pyPa6hzimSzuWrp0tKAplygPdPKZznvd2/EG
	3CJn2R1NX3XZYQjhPyFDUkrf5hYOWbhKoijnJqtFegOrt2Sr5npN23nK58OgLs+gwmjg
	88VJVjdkzRcVYAKoqOUCqMMhIIJUuKez3PyGJU9fsXhWxxrfOxaYzy81AvLQuxR9hlP2
	1vBbfadsZiYEfqMbvsViSPDIEA1HgaIJ3D06EzpF/SVtqVSSR2ZmBGy1PiaCGyzhpOxe
	cUsUGKxY53MFW0Ypqo+GYrgBOzQlV5vhhOs5LGyLJHZtGDzPdfe63pRh10g8M4BdDlec
	ifkw==
Received: by 10.216.162.141 with SMTP id y13mr1093666wek.14.1346930620076;
	Thu, 06 Sep 2012 04:23:40 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3682950wib.0.2012.09.06.04.23.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:23:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 13:23:27 +0200
Message-Id: <1346930610-2977-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkZzXji9LyQkM34WqBhaiid842udCVfcy9l96kRWEjeLv/npn8YKgDrzJefitIlKTrVyKyS
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-denzil][PATCH 5/8] kernel.bbclass: add deploy link to KERNEL_IMAGETYPE
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
X-List-Received-Date: Thu, 06 Sep 2012 11:36:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

It's common to provide a non-machine-suffixed link in DEPLOY_DIR_IMAGE, so
let's be consistent and do so here as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index b2f7d0c..f68d8a9 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -541,6 +541,7 @@ kernel_do_deploy() {
 	cd ${DEPLOYDIR}
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 }
-- 
1.7.7.6



