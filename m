Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id C4FD46FEEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 21:15:00 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so6098137pab.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VNdPqo5LsSCJQUZpzrewPI6Z5TlzBmrFTR0NqVc5UiI=;
	b=wzrZFM2SiPZSyiTpCCjVT9u5+wIez4rPWDPyTMEHVNamwWPZXtzRjFXDMN0wXW5unu
	LpDBinUSiGYOLEfpBDbNqhExO+wXs5CnM8gqoT4Hfi6RUTotvZnNIo8IX6Lnk4+vqYEF
	rI7xbD2XeGBQ0gIT5ygJuRmiRZcVfJw2MnA3eJoXbeYgIF2ISowHPhqnwo+jnywxhK4Z
	jg8dLclCtOBp6mnf7IPJ9KYGa4wJO5U9T70R5DofOV+avJJKD8/Jsq80QhMuYnfhfOF2
	v6Hw/uNUfY/6KQHFfKO9S9MVwsc1myb3plpPzghDux2Y8WhmMqYVPvjsw/PNinu6mZIG
	82rA==
X-Received: by 10.69.31.138 with SMTP id km10mr26883153pbd.93.1403039701705;
	Tue, 17 Jun 2014 14:15:01 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	ec2sm25519394pbc.63.2014.06.17.14.14.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jun 2014 14:15:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 14:14:58 -0700
Message-Id: <1403039698-5572-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][daisy][PATCH] meta-oe: update maintainers list
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
X-List-Received-Date: Tue, 17 Jun 2014 21:15:02 -0000

Add self to mainters list for daisy.

Hope I did this correct.  if so, more to follow.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-efl/README | 9 +++++----
 meta-oe/README  | 6 ++++--
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index f8b929e..25e2bbe 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,17 +1,18 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: daisy
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: daisy
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl][daisy]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --cc akuster808@gmail.com --subject-prefix=meta-efl][daisy][PATCH'
 
 Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
                            Martin Jansa <martin.jansa@gmail.com>
+                           Armin Kuster <akuster808@gmail.com>
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..db087ce 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,15 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: daisy
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --cc akuster808@gmail.com --subject-prefix=meta-oe][daisy][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
                        Martin Jansa <martin.jansa@gmail.com>
+                       Armin Kuster <akuster808@gmail.com>
+
-- 
1.9.1


