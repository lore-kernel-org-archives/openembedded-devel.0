Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F410F719F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 12:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uB7CB2Cw007098; Wed, 7 Dec 2016 12:11:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6JibcPbq7L5W; Wed,  7 Dec 2016 12:11:02 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uB7CAxdS007094
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Dec 2016 12:11:00 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cEb3r-0008Tk-Fq; Wed, 07 Dec 2016 12:10:59 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2016 12:10:56 +0000
Message-Id: <1481112656-32554-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] staging: Drop unused SYSROOT_LOCK
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2016 12:11:02 -0000

This hasn't been used in years and isn't referenced anywhere, drop
the definition.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index a0b09a0..bfabd06 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -171,7 +171,6 @@ addtask populate_sysroot after do_install
 
 SYSROOT_PREPROCESS_FUNCS ?= ""
 SYSROOT_DESTDIR = "${WORKDIR}/sysroot-destdir"
-SYSROOT_LOCK = "${STAGING_DIR}/staging.lock"
 
 # We clean out any existing sstate from the sysroot if we rerun configure
 python sysroot_cleansstate () {
-- 
2.7.4


