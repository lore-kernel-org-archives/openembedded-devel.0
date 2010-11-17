Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1PIWK5-0001Zb-Jg
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 01:56:34 +0100
Received: by eya28 with SMTP id 28so830439eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 16:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=/zblRi8TDVN3Dx7l9q8PCuoG4V35gzLPkBq52p3ACNo=;
	b=t9aFKEd4tuQyVSMMmfInRLdouSiBB9qO437t5t1/jqRf4DyHfqZkOK2LCSd9PGWutJ
	VUS2xPu5lX3MilAomNNE7/PJBnM9hbxkBefvC43ePC3J5U9wreTrRJNqOTW0Q6et0bnd
	u0tcnAtI5/XNHG7Vwv4ZRa7SDBRxVkbzicYKI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=IBoYcI2YVp+IJxgwrxXJNGotl3HcFZrLHtHzNYIQUlR7r1vw6bTlQH+Hx1qY8c/ER4
	72KDyOW7SDCurN18JVvv4NFwbhsqU+FdJE5plWDkCafYveoGwvkJ7Prf369/BxAM6W5z
	ky+CUIBm6DKmWrsKV4DiXleirKVW6Mbnlqpp0=
Received: by 10.213.108.193 with SMTP id g1mr1375595ebp.45.1289955325855;
	Tue, 16 Nov 2010 16:55:25 -0800 (PST)
Received: from localhost.localdomain (93-81-137-132.broadband.corbina.ru
	[93.81.137.132])
	by mx.google.com with ESMTPS id b52sm1742829eei.19.2010.11.16.16.55.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 16:55:25 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 03:55:23 +0300
Message-Id: <1289955323-10243-1-git-send-email-jay4mail@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: jay4mail@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ltrace: exclude from build for SH3/SH4 targets
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
X-List-Received-Date: Wed, 17 Nov 2010 00:56:35 -0000

---
 recipes/ltrace/ltrace_0.5.3.bb  |    3 +++
 recipes/tasks/task-cli-tools.bb |    7 ++++++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3.bb
index c856788..6c13c08 100644
--- a/recipes/ltrace/ltrace_0.5.3.bb
+++ b/recipes/ltrace/ltrace_0.5.3.bb
@@ -6,6 +6,9 @@ LICENSE = "GPLv2"
 
 PR = "r2"
 
+# ltrace is not ported to sh3/sh4 targets at this time
+COMPATIBLE_TARGET_SYS = (?!sh[34])
+
 SRC_URI = "\
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;name=patch \
diff --git a/recipes/tasks/task-cli-tools.bb b/recipes/tasks/task-cli-tools.bb
index 0d2aa00..7d71e9a 100644
--- a/recipes/tasks/task-cli-tools.bb
+++ b/recipes/tasks/task-cli-tools.bb
@@ -9,6 +9,11 @@ inherit task
 
 PACKAGES += "${PN}-debug"
 
+def get_ltrace(bb, d):
+    if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'sh4', 'sh3' ] :
+        return ""
+    return "ltrace"
+
 RDEPENDS_${PN} = "\
   dbus-daemon-proxy \
   dosfstools \
@@ -33,7 +38,7 @@ RDEPENDS_${PN}-debug = "\
   devmem2 \
   i2c-tools \
   gdb \
-  ltrace \
+  ${@get_ltrace(bb, d)} \
   mkdump \
   mioctl \
   procps \
-- 
1.7.2.3



