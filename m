Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UFRSz-0007rv-UV
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Mar 2013 16:50:18 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Mar 2013 16:16:04 +0100
Message-Id: <1363101364-9498-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] layer.conf: add distro-feed-configs to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Tue, 12 Mar 2013 15:50:18 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
This patch was sent for the first time about a year ago. Back then,
Koen didn't apply it, because "distro-feed-configs does the wrong thing".
in his opinion. However, distro-feed-configs persists today and is still
getting used.

 meta-oe/conf/layer.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index abb8d47..b8a53d2 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -28,4 +28,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   mplayer-common \
   fbset-modes \
   gpsd-machine-conf \
+  distro-feed-configs \
 "
-- 
1.7.10.4



