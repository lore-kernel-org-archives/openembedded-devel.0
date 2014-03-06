Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id E32996F4EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:04:45 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so1252812eei.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 09:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gHWWy2wW6tksKsEnWEHYrf0rp3gNaNHYXLe98iJ3QSg=;
	b=NaI8xtj/BrFHwAOKpORvHv8nzs57A4uXJClWyNQqC2cClP34Itw/HDFrhkzXx12TqH
	YumH9R5hhzPv1cd+VScxE/H1Z3prcewajtZ5FT7cN6wayfdbzGkBXt1qVNTg6lEm5n1f
	2caMhGtcQLfQFpsyEAjTMU91OVArQCdKOVoWXwQ95F3hYagwGdM1jIvW/znFHwByWhw4
	Ipdor46gWpxJHeYZsfESMsn6oMVnUYy9659OHdHOWgEdfA/5ko/MxNDDhUS/j9PTXYta
	1BNhGiuz0oNORPsrnFiE374JMf/URMApkLbkVbwdWUuO7x59xZHkpwU/6sjdy+hc8ROb
	gvbw==
X-Received: by 10.14.179.73 with SMTP id g49mr1593519eem.116.1394125484906;
	Thu, 06 Mar 2014 09:04:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm23808347eeg.5.2014.03.06.09.04.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 09:04:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Mar 2014 18:04:50 +0100
Message-Id: <1394125490-2945-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH] bash-completion: remove allarch
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
X-List-Received-Date: Thu, 06 Mar 2014 17:04:47 -0000

* it has runtime dependency on TUNE_PKGARCH bash, so it cannot be allarch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
index ad7fd28..155fe90 100644
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9393a5852
 
 PARALLEL_MAKE = ""
 
-inherit allarch autotools
+inherit autotools
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/bash_completion.d/
-- 
1.9.0


