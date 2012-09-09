Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAb5z-00055S-2S
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 08:34:15 +0200
Received: by iebc11 with SMTP id c11so1400957ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2012 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hAoGPtoNHFyaFysw9fCxrILGHnCudb38oc+6QJtg8/c=;
	b=06Sucbdn4tz8hupU3eFsoU/gZ+SlZFGirw3YMXA33MZxrA0haXZCOuc3huQzv0mP+h
	1ZpLjDL9ef4dsAJjEGT4muBj2YDF8SyGqb5U2u2PMMRHy6QcL2wBPQ8K9mZJvhxWNyzR
	vNIqF7t0JkBjpVKgEbK4hHjv6BoMQnUw/jK00lBJ9tRCwozRaWzsrtF2Dn3bO0DU7ASm
	NFdzKaiUBwGfVSnTAn1KxHRpW5gjl8RRQjNlULJ1x1A8GZizNBZOU/BA6g5au7nVcxyG
	FeYgBeXgSvugxWn7IcGxHAUTrCKvw5ZgjmW6Bm8fgKiCL+DmPmaShGYN0NooKk5/vjuI
	ktLQ==
Received: by 10.50.183.135 with SMTP id em7mr665133igc.31.1347171706763;
	Sat, 08 Sep 2012 23:21:46 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ff4sm10783893igc.5.2012.09.08.23.21.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 08 Sep 2012 23:21:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Sep 2012 23:20:42 -0700
Message-Id: <1347171642-22926-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-opie][PATCH] task-opie: Adjust for nativesdk renaming
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
X-List-Received-Date: Sun, 09 Sep 2012 06:34:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tasks/task-opie-toolchain-host-nativesdk.bb    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
index 5ca80e6..42138f1 100644
--- a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
+++ b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
@@ -1,8 +1,8 @@
-require recipes-core/tasks/task-sdk-host-nativesdk.bb
+require recipes-core/tasks/nativesdk-task-sdk-host.bb
 
 DESCRIPTION = "Host packages for Opie SDK"
 PR = "r2"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-RDEPENDS_${PN} += "qmake-nativesdk uicmoc-nativesdk"
+RDEPENDS_${PN} += "nativesdk-qmake nativesdk-uicmoc"
-- 
1.7.9.5



