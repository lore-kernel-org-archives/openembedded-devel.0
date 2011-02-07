Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PmZME-0005Fu-SV
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 23:14:54 +0100
Received: by wyb40 with SMTP id 40so4977936wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 14:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=ZnFD9fjexEzN/FWwPieMCWfDDpWJKhzMSpyvNtQLJe8=;
	b=ar+1aK4/GZHV2RKyBAeMS1XYOVDVsYLNjC4BDtGHRijs9OvGmYZS0fwsr27m+T8n00
	aeLTRJNonkzwUGSbknw/DwfxbXcVOLQzGGtD7rYIu4TL3XN6zPD6UV+pSlwXHYmgxLbP
	7VSuO/2n2J9L1wuBBVN6za3/mv5cSXukveXKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=sFVt2mekUmt4nk0EyV2jhajH+89jLNiwxUjOTBbSfpHKa7Bj108i69EWyqiSzg1AJF
	et1TjhLJzZ5TAFviuKklNnBiGkNmwDIZBGwZEpq6GIzjQCks3v4quV+baUxqobGlWh9m
	Na6nCpzu5Bej2iJ1jkE1wJvPF4xDHyuHF10F8=
Received: by 10.227.155.73 with SMTP id r9mr16918335wbw.63.1297116832974;
	Mon, 07 Feb 2011 14:13:52 -0800 (PST)
Received: from localhost.localdomain ([188.165.206.204])
	by mx.google.com with ESMTPS id h39sm2458090wes.5.2011.02.07.14.13.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Feb 2011 14:13:52 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Feb 2011 23:13:42 +0100
Message-Id: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Mon, 07 Feb 2011 22:14:55 -0000

This reduces amount of tasks for bootstrap-image from around 3400 to
around 1600 for jlime.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/tasks/task-base.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index 32d871d..c8d6df7 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r92"
+PR = "r93"
 
 inherit task
 
@@ -31,8 +31,8 @@ PACKAGES = ' \
             ${@base_contains("MACHINE_FEATURES", "redboot", "task-base-redboot", "",d)} \
             ${@base_contains("MACHINE_FEATURES", "apex", "task-base-apex", "",d)} \
             \
-            task-base-bluetooth \
-            task-base-wifi \
+            ${@base_contains("MACHINE_FEATURES", "bluetooth", "task-base-bluetooth", "",d)} \
+            ${@base_contains("MACHINE_FEATURES", "wifi", "task-base-wifi", "",d)} \
             \
             ${@base_contains("DISTRO_FEATURES", "cramfs", "task-base-cramfs", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "ipsec", "task-base-ipsec", "", d)} \
-- 
1.7.1



