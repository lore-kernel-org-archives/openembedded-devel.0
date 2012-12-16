Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkKjP-0002H2-6U
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 21:22:40 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2740134eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 12:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=c9DbRSkGPenTfXaou3kK4r7zLfzRsbpmrG/CXOdQ9qU=;
	b=C/NxqoDw7x5XVCMpvLrc4jGvy2QhVWyWRbT9egViKG/oQYWfro1LBcVaeMi9JmAtJU
	75q7snsKwEAGTUdDydm0cC2gKcJLkp0Eq2QUTnP5/cAslxt5jYVCiCSoNtInVkQpecSm
	4OStIJbNNiO4hTGMYyUxqE48nPStIHxVLWm/wHftNr8D1hsKh01wGe3iFxVkvYcUOrwV
	GaNj60snBrQpzZZ7F7ftyVr5r8SfMWrn8IPVVNj6CTSYT6wlUQfiACC03zm6zjN8OocE
	Jy9lJGHDcGssBJ6LQJ1XyqvJhkotPAdIi37tLf1UnGqP7+mnVRp8G9Y7A1du8PIlPcan
	dy7g==
Received: by 10.14.223.135 with SMTP id v7mr34650070eep.41.1355688479893;
	Sun, 16 Dec 2012 12:07:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm24557529eea.3.2012.12.16.12.07.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 12:07:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 21:07:55 +0100
Message-Id: <1355688475-4783-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [meta-handheld][PATCH] linux-handhelds-2.6: remove comment ending with backslash
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
X-List-Received-Date: Sun, 16 Dec 2012 20:22:40 -0000

* http://lists.linuxtogo.org/pipermail/bitbake-devel/2012-December/003954.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-handhelds-2.6_2.6.21-hh20.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-handhelds-2.6_2.6.21-hh20.bb b/recipes-kernel/linux/linux-handhelds-2.6_2.6.21-hh20.bb
index ddaf055..e0fbc72 100644
--- a/recipes-kernel/linux/linux-handhelds-2.6_2.6.21-hh20.bb
+++ b/recipes-kernel/linux/linux-handhelds-2.6_2.6.21-hh20.bb
@@ -21,7 +21,6 @@ SRC_URI = "http://sources.openembedded.org/linux.kernel26_anoncvs.handhelds.org_
 
 require linux-handhelds-2.6.inc
 
-#           ${RPSRC}/export_atags-r0a.patch;status=pending;name=rppatch35 \
 SRC_URI[rppatch35.md5sum] = "8ab51e8ff728f4155db64b9bb6ea6d71"
 SRC_URI[rppatch35.sha256sum] = "75d4c6ddbfc5e4fff7690a3308e2574f89a0e2709fb91caccb29067a9dad251a"
 SRC_URI[kernelsrc.md5sum] = "1098aed5ccce21d880d98b4ed71b9bcd"
-- 
1.8.0.2



