Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TfZ3P-0000QM-TQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 17:39:35 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1658991eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lnXNxXjZMBCjklWNPIopluawLhtH0Ut/IXLiVzdo4n4=;
	b=rW+NyvRvx6y5zy/y6511scYePQTKVRCBn7+AfMTjdLllavXc0bHtj/Jr6TwnFZPJkZ
	nPL1o5Ddj9cB1HEYLysFpiGTXXyMvIF3aT60B2AOiSsPQGMt9ogXAD1pPXhIGCuYWVu0
	ibo2WUWGh6FVNsCNHlOXzSY9IMQ80CQTzXLu3Mh+5gusZj/VJ2jKLXQNPp4egtJAWm5b
	O1w/rZ2QFXYGCu3JIc2igwOX/aVtj4k54CjNqDAqsb19gno0FFIVfX6FqddZA11YVx+H
	yJ0kYsoQWf9HfnJp3fHrCSo4ZHuJpXJ+RvzW1sxyVVjmdVcYzb1Ar5FFSfso7daV9/Im
	C/+Q==
Received: by 10.14.225.194 with SMTP id z42mr31095369eep.22.1354551914501;
	Mon, 03 Dec 2012 08:25:14 -0800 (PST)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-119.unitymediagroup.de. [178.200.247.119])
	by mx.google.com with ESMTPS id b49sm15878856eem.16.2012.12.03.08.25.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 08:25:13 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:24:49 +0100
Message-Id: <1354551889-21970-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe] maliit-plugins: Don't build the documentation as it requires Doxygen
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
X-List-Received-Date: Mon, 03 Dec 2012 16:39:36 -0000

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../recipes-support/maliit/maliit-plugins_git.bb   |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
index 278220d..b80f715 100644
--- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -16,6 +16,7 @@ PV = "0.92.3+git${SRCPV}"
 EXTRA_QMAKEVARS_PRE = "\
     PREFIX=${prefix} \
     LIBDIR=${libdir} \
+    CONFIG+=nodoc \
     "
 
 FILES_${PN} += "\
-- 
1.7.9.5



