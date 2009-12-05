Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <darkstar6262@gmail.com>) id 1NGztE-0007bq-B4
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Dec 2009 20:01:59 +0100
Received: by pwj11 with SMTP id 11so2888126pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Dec 2009 11:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=AxWGGz1STVkepYO8RVQOddWDRu3egNJdLRKL8j23L7g=;
	b=eBUkEauLXe8wZGhbTxzR9s/vzUPU67Ny9hSisBwExxurMDeigMO92oCA1qv5HpB5Hk
	1vPC6ZIYGQK67tc1lkE7NdCEARF+FGpTDkFnYMi6M0el+5U8FrOVS1dbCLIcqEyeoGV8
	1fo3/dcrLj/JFKuSriXyKu8wRjt9i8wxJh5Xg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=fF4gFZ0iojJjwRuP9wEQ99doVPF18hFoH6NSQPRshPOOCDLcUUMQpZ4LERLHoBO2HE
	TFFKzbQMFqlKjZDsls4GGGNWRrJMa5LG1rtri43de104vhNxkGsHSJFiMBuN6ZqdRCWy
	3YRoEDlcyDEuUcHx1iUsMqZ7IFoljK2rRytdc=
Received: by 10.115.99.11 with SMTP id b11mr7169100wam.17.1260039617322;
	Sat, 05 Dec 2009 11:00:17 -0800 (PST)
Received: from localhost (97-126-116-159.tukw.qwest.net [97.126.116.159])
	by mx.google.com with ESMTPS id 20sm3516423pzk.9.2009.12.05.11.00.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Dec 2009 11:00:16 -0800 (PST)
From: Cory Maccarrone <darkstar6262@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Dec 2009 11:00:02 -0800
Message-Id: <1260039602-21665-1-git-send-email-darkstar6262@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: darkstar6262@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE] [PATCH] icu: Add patch for dangling #elif expression
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
X-List-Received-Date: Sat, 05 Dec 2009 19:01:59 -0000

This change adds a patch that fixes a compile error in
source/layoutex/ParagraphLayout.cpp caused by an

Signed-off-by: Cory Maccarrone <darkstar6262@gmail.com>
---
 recipes/icu/files/fix-elif-expression.patch |   11 +++++++++++
 recipes/icu/icu-3.6.inc                     |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 recipes/icu/files/fix-elif-expression.patch

diff --git a/recipes/icu/files/fix-elif-expression.patch b/recipes/icu/files/fix-elif-expression.patch
new file mode 100644
index 0000000..6021bee
--- /dev/null
+++ b/recipes/icu/files/fix-elif-expression.patch
@@ -0,0 +1,11 @@
+--- source/layoutex/ParagraphLayout.cpp	2006-08-22 17:12:42.000000000 -0700
++++ source/layoutex/ParagraphLayout.cpp-new	2009-12-05 10:35:04.728241416 -0800
+@@ -798,7 +798,7 @@
+ 
+     return nullLanguageCode;
+ }
+-#elif
++#else
+ 
+ // TODO - dummy implementation for right now...
+ le_int32 ParagraphLayout::getLanguageCode(const Locale *locale)
diff --git a/recipes/icu/icu-3.6.inc b/recipes/icu/icu-3.6.inc
index 04fc842..aaacd83 100644
--- a/recipes/icu/icu-3.6.inc
+++ b/recipes/icu/icu-3.6.inc
@@ -1,7 +1,8 @@
 
 LICENSE = "ICU"
 
-SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-3_6-src.tgz"
+SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-3_6-src.tgz \
+           file://fix-elif-expression.patch;patch=1"
 
 S = "${WORKDIR}/icu/source"
 
-- 
1.6.3.3



