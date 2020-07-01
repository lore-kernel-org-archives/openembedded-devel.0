Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.5399.1593632093796696035
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 12:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=YWnZK9El;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 63F24601D7;
	Wed,  1 Jul 2020 21:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1593632091;
	bh=f6BCVA5VPT6loF0TLBUXtGGDSVzKhrVJ7ZFKmrSrVvI=;
	h=From:To:Cc:Subject:Date:From;
	b=YWnZK9ElFNScfzcLTi2V/E9TxW2SaHNDDRo88Gkq0iYzPv9I7Qj1XWKjcUGlA1N+O
	 Moha8Q9+E7MuFFeL6OAXV8jPPYzSTlClPVi2QknPn6dmdlXXzMB91efOiZFz1TCE9i
	 SwGMQQ3ux/e9Hh0C03VKHBmlj0f2eK4WDCmoMF9P+ZLTPkg9Jq8hX59As5RUVmFQlJ
	 fVF3SbrDu+2bjvwA5D5mCMCGlHk1tbIooJs18ckw30AC5urQ3f4W7hTgjMeGTc4ehM
	 utuLEZDmmAMRXaFGGo8fPxuFhElKn2vaoOk0JF8XaaJ9RAfCUmroHv0zGym3NeXdgt
	 evBB6ZDeQT4iQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/2] minicoredumper: update SRC_URI to use github instead
Date: Wed,  1 Jul 2020 21:34:46 +0200
Message-Id: <1593632087-18048-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Change SRC_URI:

 - all minicoredumper related sources moved to https://github.com/diamon/minicoredumper

From the NEWS:

The Linux Foundation will be shutting down their git service for workgroups.
The minicoredumper repository and bug tracking has been moved to the DiaMon
Workgroup account on github.com. We thank the Linux Foundation for providing
us the git service over the last 5 years.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index 051656b..d381c83 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -13,7 +13,7 @@ SRCREV = "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
 
 PR .= "+git${SRCPV}"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
+SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https \
            file://minicoredumper.service \
            file://minicoredumper.init \
            "
-- 
2.7.4

