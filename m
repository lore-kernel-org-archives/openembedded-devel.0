Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UBlJz-0005nU-Gv
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 13:13:51 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id B2DDEEA04D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2013 13:15:41 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 0ED2CA43447; Sat,  2 Mar 2013 12:57:33 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Mar 2013 12:57:04 +0100
Message-Id: <d66561d242d887d1fca3703121498c2ed53ccd6e.1362223895.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <f60395b6f7952d3cbfa5c04f06e3c4e327d2e4d4.1362223895.git.apelete@seketeli.net>
References: <f60395b6f7952d3cbfa5c04f06e3c4e327d2e4d4.1362223895.git.apelete@seketeli.net>
In-Reply-To: <cover.1362223895.git.apelete@seketeli.net>
References: <cover.1362223895.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 3/7] pam: update SRC_URI
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
X-List-Received-Date: Sat, 02 Mar 2013 12:14:00 -0000

Update SRC_URI to downloads.yoctoproject.org since pam source packages
are no longer available from kernel.org.
---
 recipes/pam/libpam_1.1.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/pam/libpam_1.1.1.bb b/recipes/pam/libpam_1.1.1.bb
index 09bc554..7f7e4b4 100644
--- a/recipes/pam/libpam_1.1.1.bb
+++ b/recipes/pam/libpam_1.1.1.bb
@@ -23,7 +23,7 @@ pn = "Linux-PAM"
 p = "${pn}-${PV}"
 S = "${WORKDIR}/${p}"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/pam/library/${p}.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${p}.tar.bz2 \
            file://pam-nodocs.patch \
            file://define-HAVE_DBM.patch \
           "
-- 
1.7.10.4



