Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PapH7-00055d-Aa
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 13:49:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id B62A6314C872;
	Thu,  6 Jan 2011 13:48:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id akLE3f9MVCbk; Thu,  6 Jan 2011 13:48:32 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 8FFA2314C868;
	Thu,  6 Jan 2011 13:48:31 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 06 Jan 2011 12:48:31 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jan 2011 12:48:28 +0000
Message-Id: <1294318110-23521-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/4] python-wifi: remove version 0.3.1
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
X-List-Received-Date: Thu, 06 Jan 2011 12:49:05 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/python/python-wifi_0.3.1.bb |   21 ---------------------
 1 files changed, 0 insertions(+), 21 deletions(-)
 delete mode 100644 recipes/python/python-wifi_0.3.1.bb

diff --git a/recipes/python/python-wifi_0.3.1.bb b/recipes/python/python-wifi_0.3.1.bb
deleted file mode 100644
index fefffe6..0000000
--- a/recipes/python/python-wifi_0.3.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Fusil is a Python library used to write fuzzing programs."
-HOMEPAGE = "http://fusil.hachoir.org/"
-SECTION = "devel/python"
-LICENSE = "GPLv2"
-SRCNAME = "python-wifi"
-
-SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} = "\
-  python-ctypes \
-  python-datetime \
-"
-
-
-
-
-SRC_URI[md5sum] = "0458e32f82900e03c9fd155442242638"
-SRC_URI[sha256sum] = "a7087ac16ce2d1f146dd76cbfc442ae5b91774f4b8c8eba913c09d0c325eb12f"
-- 
1.7.2.3



