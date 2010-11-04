Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PE5Hq-0003Pj-IQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 20:15:51 +0100
Received: by pwi7 with SMTP id 7so146487pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=OrqMvI6srksR7nS5IIaNR4aGCSItmwu4AUyNijby9ss=;
	b=NkBsLMrl+5nqqxTmAHHaJSsTA74yJG7HbYNnY0WTM4Gcx8vmWVSORHf19Ch9NCt69e
	AEkfVE5a27RepMANYQPk+IHZNDhDVEjaU6YXqSfb6z6fVxEq7Dx1Co0V3AUTzWkBAOf8
	8X8RjjF9iNbPtbaoy9zHCOEs2ditxnKF6fm+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=oEWDSo9MllfQM1PJVMrcWOWoPadsaYJ9h4U2ISJR05vk6eZ7s3hvoXmG4Lm58H0Wde
	9yKD4/2hJoCU0folOKC5048m3+T0Gr0k6dvZHcNARESPHE+6+Hf9hFt/uuoz80lWkTB9
	TGgeGg4ucAr4wnpcFjtngBzNZib8rfsNejzl4=
Received: by 10.142.177.10 with SMTP id z10mr976066wfe.141.1288898097567;
	Thu, 04 Nov 2010 12:14:57 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v19sm346225wfh.12.2010.11.04.12.14.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 12:14:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Nov 2010 12:14:40 -0700
Message-Id: <1288898080-19417-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] meta.bbclass: Exclude meta recipes from world builds
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
X-List-Received-Date: Thu, 04 Nov 2010 19:15:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/meta.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/meta.bbclass b/classes/meta.bbclass
index d35c40b..d0626e3 100644
--- a/classes/meta.bbclass
+++ b/classes/meta.bbclass
@@ -1,4 +1,4 @@
-
+EXCLUDE_FROM_WORLD = "1"
 PACKAGES = ""
 
-do_build[recrdeptask] = "do_build"
\ No newline at end of file
+do_build[recrdeptask] = "do_build"
-- 
1.7.1



