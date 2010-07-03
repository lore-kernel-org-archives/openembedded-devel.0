Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUuaW-0001bY-RK
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 06:44:26 +0200
Received: by pwi10 with SMTP id 10so1592713pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jul 2010 21:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=tUDB5njb3CcMyoaoQe89QXpKs1LYCKgTPtxMiicOEWY=;
	b=C9538ceDoU9PJEkzeCO7h9aZCerm59H9bFDu73zyZJKl3OerG9yEkrYWEIQjVQG8nM
	lvErGAWJqa0m7lrF/jRNZs4JfblrD4b8oXEYrnluHwt9/Za/5vTb/YqE0ipP1oa1kvYz
	W+ZUbEQ9l9e25aJQTJA3rr+QT3FVRx6F7Yx6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XD063lk79CMySXO1Aev3shJ+Wu1hJUpXI0p/jTKavu2x9f/t1Zg8wPUGeUFapUmKyn
	yTM8fDYK+lOx8xp2I/ojatCt8Nk4Qr+u5DcSHd5CErxboeYSKRBHspnqzdg+A+CY291u
	IQgNJWMyWTZGWPN71rXL4knE2/W0WYLB0nP/o=
Received: by 10.114.120.13 with SMTP id s13mr2099567wac.77.1278131977360;
	Fri, 02 Jul 2010 21:39:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c10sm21863736wam.13.2010.07.02.21.39.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 02 Jul 2010 21:39:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jul 2010 21:39:33 -0700
Message-Id: <1278131973-3962-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][RFC] hal_0.5.14+git.bb: Make default pick for hal.
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
X-List-Received-Date: Sat, 03 Jul 2010 04:44:26 -0000

* Distributions other than angstrom default to
  0.5.11 which is old and has dependencies on
  libvolume_id which is no longer provided with
  newer versions of udev

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/hal/hal_0.5.14+git.bb |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/recipes/hal/hal_0.5.14+git.bb b/recipes/hal/hal_0.5.14+git.bb
index 36d5b3b..8d0d34d 100644
--- a/recipes/hal/hal_0.5.14+git.bb
+++ b/recipes/hal/hal_0.5.14+git.bb
@@ -1,8 +1,5 @@
 require hal.inc
 
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_angstrom = "1"
-
 SRC_URI = "git://anongit.freedesktop.org/hal/;protocol=git \
         file://0001-Add-touchscreen-option.patch \
         file://20hal \
-- 
1.7.1



