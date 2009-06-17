Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MGyow-0001Oa-Se
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 19:21:11 +0200
Received: from localhost.localdomain (unknown [10.50.1.118])
	by hermes.mvista.com (Postfix) with ESMTP
	id E9D651ADE1; Wed, 17 Jun 2009 10:10:40 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 10:10:40 -0700
Message-Id: <1245258640-1623-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 17:21:11 -0000

Set IMAGE_KEEPROOTFS to something other than the empty string to keep
tmp/rootfs around after image creation, otherwise it will be removed, as it's
not a fully functional filesystem, and causes much confusion among users as a
result.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/image.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index f0cc3b3..974e734 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -133,6 +133,7 @@ fakeroot do_rootfs () {
 	${IMAGE_POSTPROCESS_COMMAND}
 	
 	${MACHINE_POSTPROCESS_COMMAND}
+	${@['rm -rf ${IMAGE_ROOTFS}', ''][bool(d.getVar("IMAGE_KEEPROOTFS", 1))]}
 }
 
 do_deploy_to[nostamp] = "1"
-- 
1.6.0



