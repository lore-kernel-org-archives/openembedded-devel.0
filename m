Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr7Dp-0004nv-TK
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 14:49:49 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so224907bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=hL/yRUg3TZmVZ6tF0QNr2BDvXpmbKrdCinXwu7kn1aY=;
	b=kPorq7eDbaq+96oJfET/1DtznrQsAtGLGY6Mb7tz3czGKECowa3SfUUzUjgBKgtzwe
	qdTUGwG6n9AqUgU4d8FWQhO3tLEIlivjAPIjB1Smg+L4rW+eMu7REhpfkxuyUzWtm9wN
	aI1XNo1IzwIKlsFA2XIWLvQzpEHVkqmfJgWbf//GoEhwvgVJc+DjCapLKLcKg3wf0BUm
	yfy045Xw33JT0GefFcn0GvsnwAILx2cSlbixMPtYdOr2Gi0bYUWB9SERncyXF97Yu+eQ
	fnVexLekDpnWOJt0fQ8t0y52k8KzZl8qTXd7+aizvqf7F439zMKFHAPAy2smV602pM2d
	oIYg==
Received: by 10.204.10.70 with SMTP id o6mr1110693bko.31.1342528712841;
	Tue, 17 Jul 2012 05:38:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 25sm9889704bkx.9.2012.07.17.05.38.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 05:38:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 14:37:59 +0200
Message-Id: <1342528680-6336-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120716175038.GL3729@jama.jama.net>
	<1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 6/7] kernel.bbclass: add deploy link to KERNEL_IMAGETYPE
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
X-List-Received-Date: Tue, 17 Jul 2012 12:49:50 -0000

From: Christopher Larson <chris_larson@mentor.com>

It's common to provide a non-machine-suffixed link in DEPLOY_DIR_IMAGE, so
let's be consistent and do so here as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 433dd30..248cd28 100644
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
1.7.8.6



