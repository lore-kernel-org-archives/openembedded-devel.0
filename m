Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QEmnH-0003WF-TA
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 20:15:28 +0200
Received: by yia13 with SMTP id 13so369256yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=9GkmR3/rXZ8P0HRkgqXsONbOYgEj0QMKsZW8jk84OKA=;
	b=gaiWWeh1FL524RTJipqygwdPWsYrOVr7cA0gKoPYUVxC+WgQp2gLc8mDY2A7f+SJVJ
	Qu62tNaPF9qY0j7Jqsp19r+qyZdyWIWLeZh9juqHjpAIp4abG/cyf4dZ83QpZrxppdAO
	TDxmZndTZtJYpThfiUQgQmYKZ6OP/zf5mEcSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qCSjx3ZOxgN9WurULoK6Pjc503kMwup2zPfioqASPiQicezId8FpE0rfHXziuTP+7V
	yr6bZ4P0WkmWafZCMjdrje/R1XrSGqD5pUBeFmgAH10eJJeHPGzEfwyYROhmMhPwCBih
	FTR3Synru//mFlwo54n2Pd7pP027MIEDbEi5Y=
Received: by 10.236.26.2 with SMTP id b2mr1393521yha.105.1303841576036;
	Tue, 26 Apr 2011 11:12:56 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 73sm2794402yhl.49.2011.04.26.11.12.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2011 11:12:55 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2011 14:07:38 -0500
Message-Id: <1303931258-6394-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH v2 1/1] am-benchmarks: add return values
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
X-List-Received-Date: Tue, 26 Apr 2011 18:15:28 -0000

 * add return values to dhrystone and linpack for automated test

Signed-off-by: Jeff Lance  <j-lance1@ti.com>

---
 Updated in version 2:
    * added space before bulleted list
---
 recipes/ti/am-benchmarks_1.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/am-benchmarks_1.2.bb b/recipes/ti/am-benchmarks_1.2.bb
index 38c7056..21e62a7 100644
--- a/recipes/ti/am-benchmarks_1.2.bb
+++ b/recipes/ti/am-benchmarks_1.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "60"
+SRCREV = "61"
 PR = "r2+svnr${SRCPV}"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
-- 
1.7.0.4



