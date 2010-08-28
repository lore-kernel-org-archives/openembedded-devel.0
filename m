Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxp-0001rG-Kp
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:23 +0200
Received: by pvg6 with SMTP id 6so1648318pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=fZkhvSoRUjMVhqK2XzrXM9BoXTzgakUCAlI9ZGQKGWM=;
	b=uvsP+sybSM2vrARr7XooGiUiqzQQWjnjiH5ufE0abWZiO/tPrkFxQed/XuM/VGuNhN
	9njcczBdVVJtdnziRonQbf5vCmgRy5WwL6y+CMmOnPl5Ba+2u1dPeaWmnRrOt6h1MAXu
	e2O5nA2Bn3fcsd8zitdUr29go97JOVG34cYaE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qjS4pIvyqMJSnbDUPxtJ/YB/06Alzgggv69JyjokJoDYtoBrhrAWONng8N5vgS2mqf
	KrJCiYDJKglk+MwdyaV0tp99NpaoHyciDONnVIRr101GElYcIQzP1jneYC1HovjttoFy
	pduzuES1I2ioSZagJrMlnye473l33gebYIYpk=
Received: by 10.142.194.15 with SMTP id r15mr2646815wff.306.1283027090264;
	Sat, 28 Aug 2010 13:24:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:16 -0700
Message-Id: <1283027073-12308-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/23] sugar-fructose.bb: sugar-web-activity is not provided by any recipe dont DEPEND on it.
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:27 -0000
X-List-Received-Date: Sat, 28 Aug 2010 20:25:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/sugar/sugar-fructose.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/sugar/sugar-fructose.bb b/recipes/sugar/sugar-fructose.bb
index ad0db39..697ac21 100644
--- a/recipes/sugar/sugar-fructose.bb
+++ b/recipes/sugar/sugar-fructose.bb
@@ -1,3 +1,3 @@
 DESCRIPTION = "Sugar fructose activities"
 
-DEPENDS = "etoys sugar-web-activity"
+DEPENDS = "etoys"
-- 
1.7.1



