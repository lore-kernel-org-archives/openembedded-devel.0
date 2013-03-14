Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UG8YW-0007rw-4w
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Mar 2013 14:51:01 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id DA6C8EA042;
	Thu, 14 Mar 2013 14:48:55 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 71BEDA422E0; Thu, 14 Mar 2013 14:34:18 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Mar 2013 14:33:59 +0100
Message-Id: <eeb28b0ec8649e185a2314ae49874486b793397c.1363255209.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363255209.git.apelete@seketeli.net>
References: <cover.1363255209.git.apelete@seketeli.net>
In-Reply-To: <cover.1363255209.git.apelete@seketeli.net>
References: <cover.1363255209.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH v5 1/2] gnutls: update SRC_URI
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
X-List-Received-Date: Thu, 14 Mar 2013 13:51:17 -0000

Update SRC_URI since the gnutls source packages were moved into a
different directory on ftp.gnutls.org.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/gnutls/gnutls.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes/gnutls/gnutls.inc b/recipes/gnutls/gnutls.inc
index a8e1e0d..d922840 100644
--- a/recipes/gnutls/gnutls.inc
+++ b/recipes/gnutls/gnutls.inc
@@ -8,7 +8,8 @@ LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN}-extra = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=gnutls"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.bz2;name=gnutls"
 
 inherit autotools binconfig pkgconfig gettext
 
-- 
1.7.10.4



