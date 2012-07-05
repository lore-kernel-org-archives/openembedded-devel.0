Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCV-0003fn-I3
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:47 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id B4E9EEA040
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:24 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id F07C960D56; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:31 +0200
Message-Id: <2383e6771ddd5c227ba2e8e8bc41a26a9feddf30.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 13/14] echinus_0.4.3.2: update SRC_URI
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:47 -0000

Update the SRC_URI of echinus_0.4.3.2.bb since the source tarball has
been moved to a different directory on the source repository.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/echinus/echinus_0.4.3.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/echinus/echinus_0.4.3.2.bb b/recipes/echinus/echinus_0.4.3.2.bb
index 60ad9cf..6608a7b 100644
--- a/recipes/echinus/echinus_0.4.3.2.bb
+++ b/recipes/echinus/echinus_0.4.3.2.bb
@@ -5,7 +5,7 @@ PR = "r2"
 
 DEPENDS = "virtual/libx11 libxft libxrandr"
 
-SRC_URI = "http://plhk.ru/static/echinus/echinus-${PV}.tar.gz \
+SRC_URI = "http://plhk.ru/static/echinus/old/echinus-${PV}.tar.gz \
 	   file://Makefile"
 
 SRC_URI_append_jlime = " file://echinus-jlime.patch "
-- 
1.7.10



