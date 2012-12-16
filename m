Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkInB-0007Sl-Tn
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:18:25 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1966077eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GIJ18lj1agQIvEvDxoTf6SR+aYlgcFMAfBw+paLDQyw=;
	b=FKyp6QwZnPzIyYGA2d0e+qM0zi416o8fnaUpU6qfuE58EhbemFho3i7Mu5IMSirnL6
	XR9tLjlfaq0Z1D2jUYt2AsM9yO0Muqb4PeGQlWtw5AQaXQQnEJjeQLvmO5G1Mss0gQw3
	vYimvx8Yn/wZdYDbYNkTqdlcA5iTfzXa3iTjrmWN6YEZfxFA9YHblCgxBj24ApitdGqw
	y7iMrfVoeEOHB+8zuA2z0cdKX9b6uGyS3/PQQTza0R0lOXOBtIPwf/bc8c+VrI2H5GL+
	/ttwNgMZCIXRr2F9KjdQlJGmjdqZTWQJwAN3VLbAgJOPWK2OONqLaKlL28hwlg9Y4keG
	UGJw==
Received: by 10.14.194.4 with SMTP id l4mr33365331een.42.1355680722948;
	Sun, 16 Dec 2012 09:58:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm23900154eel.17.2012.12.16.09.58.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:07 +0100
Message-Id: <6835497c58d86de86f27fb5080981d7d27366bc5.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 24/26] cryptsetup: import from oe-classic
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
X-List-Received-Date: Sun, 16 Dec 2012 18:18:26 -0000

* add LIC_FILES_CHKSUM
* depend on util-linux (renamed from util-linux-ng)
* depend on lvm2 instead of device-mapper
* inherit gettext

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
new file mode 100644
index 0000000..254f563
--- /dev/null
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Setup virtual encryption devices under dm-crypt Linux"
+HOMEPAGE = "http://code.google.com/p/cryptsetup/"
+SECTION = "console"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "util-linux lvm2 libgcrypt popt"
+RRECOMMENDS_${PN} = "kernel-module-aes \
+                     kernel-module-dm-crypt \
+                     kernel-module-md5 \
+                     kernel-module-cbc \
+                     kernel-module-sha256 \
+                    "
+SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
+SRC_URI[md5sum] = "318a64470861ea5b92a52f2014f1e7c1"
+SRC_URI[sha256sum] = "9c8e68a272f6d9cfb6cd65cc0743f4c44a2096c61f74e0602bf40208b5e69c0a"
+
+inherit autotools gettext
-- 
1.8.0.2



