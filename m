Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UEJJB-0007eJ-Sk
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 13:55:30 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 50646EA040;
	Sat,  9 Mar 2013 13:55:11 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id AF48FA4069B; Sat,  9 Mar 2013 13:39:06 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Mar 2013 13:38:45 +0100
Message-Id: <73f5d1d2501d60fb20e3290d758e35aaf6b91e4c.1362831936.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362831936.git.apelete@seketeli.net>
References: <cover.1362831936.git.apelete@seketeli.net>
In-Reply-To: <cover.1362831936.git.apelete@seketeli.net>
References: <cover.1362831936.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH v2 1/2] gnutls: update SRC_URI
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
X-List-Received-Date: Sat, 09 Mar 2013 12:55:30 -0000

Update SRC_URI since the gnutls source packages were moved into a
different directory on ftp.gnutls.org.
---
 recipes/gnutls/gnutls.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/gnutls/gnutls.inc b/recipes/gnutls/gnutls.inc
index a8e1e0d..0e055e3 100644
--- a/recipes/gnutls/gnutls.inc
+++ b/recipes/gnutls/gnutls.inc
@@ -8,7 +8,7 @@ LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN}-extra = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=gnutls"
+SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v2.10/gnutls-${PV}.tar.bz2;name=gnutls"
 
 inherit autotools binconfig pkgconfig gettext
 
-- 
1.7.10.4



