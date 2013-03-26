Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UKOd1-0005LC-8W
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 08:49:07 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 09DFED22B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 08:32:13 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Mar 2013 08:32:06 +0100
Message-Id: <1364283126-22715-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <F7146556-015E-4D6A-9F58-38284AFCF988@gmail.com>
References: <F7146556-015E-4D6A-9F58-38284AFCF988@gmail.com>
Subject: [meta-oe][PATCH] libmcrypt: add 2.5.8
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
X-List-Received-Date: Tue, 26 Mar 2013 07:49:14 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb

diff --git a/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
new file mode 100644
index 0000000..a169390
--- /dev/null
+++ b/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Replacement for the old crypt() package and crypt(1) command, with extensions."
+HOMEPAGE = "http://mcrypt.sourceforge.net/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
+DEPENDS = "libtool"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcrypt-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0821830d930a86a5c69110837c55b7da"
+SRC_URI[sha256sum] = "e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e"
+
+inherit autotools gettext binconfig
-- 
1.8.1.2



