Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QIMl9-0008Cm-4P
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 17:16:03 +0200
Received: by wye20 with SMTP id 20so2792782wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 08:13:22 -0700 (PDT)
Received: by 10.216.239.67 with SMTP id b45mr2621529wer.44.1304694802054;
	Fri, 06 May 2011 08:13:22 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h11sm2056356wbc.60.2011.05.06.08.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 08:13:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2011 17:13:16 +0200
Message-Id: <1304694796-9130-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] package.bbclass: convert unpackaged file message from 'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Fri, 06 May 2011 15:16:03 -0000

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 classes/package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 901ad9d..2b98049 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -464,9 +464,9 @@ python populate_packages () {
 				unshipped.append(path)
 
 	if unshipped != []:
-		bb.note("the following files were installed but not shipped in any package:")
+		bb.warn("the following files were installed but not shipped in any package:")
 		for f in unshipped:
-			bb.note("  " + f)
+			bb.warn("  " + f)
 
 	bb.build.exec_func("package_name_hook", d)
 
-- 
1.6.6.1



