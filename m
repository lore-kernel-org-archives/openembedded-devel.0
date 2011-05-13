Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKxGt-000594-BX
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:39:31 +0200
Received: by yxn22 with SMTP id 22so1067890yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=iE6EE2DXlfo4EdDEvRC9GckGyIakJzJSds+qQ2nwkY4=;
	b=qFEuLsAHx+ZjmbTgkb5tCPOzIDFdejx5UNj0kjRdJfcu3zPaVis+FTqf4n4x0QDEHT
	ULH7/3zjwatAWCWPyuX42j3NCpacERfbHaxaRV2nPaJKwUGc6h4wQaj7/diArSFcalfo
	Ph9biJwQumPu31YWpD4DMPWYrPhz0ONzWITdE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=M6zk8kiBt6aBMwQm8UgKdZ8u6zikCRtVMVQOcqKlfG/j36juyRz3yiiuPArRoNkYdj
	DB6HOzbvtP3rY6EQI8n7zBLL9x3nK2dw8INteJHuf6EWyjY6KFe8yoKUBzC+Yb2iGO9Q
	vDBW6euS1EOShsIYKf3od7cUgnm+8nJ7mvv1w=
Received: by 10.101.136.34 with SMTP id o34mr1181337ann.73.1305311801640;
	Fri, 13 May 2011 11:36:41 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id s16sm1855267anj.26.2011.05.13.11.36.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:36:40 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 18:36:10 +0000
Message-Id: <1305311771-23547-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 1/2] libiconv: drop EXTRA_OECONF as it is handled by gettext class
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
X-List-Received-Date: Fri, 13 May 2011 18:39:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/libiconv/libiconv_1.13.1.bb    |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
index 868314b..35f4e2d 100644
--- a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
@@ -8,9 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 BBCLASSEXTEND = "native nativesdk"
 
 PROVIDES = "virtual/libiconv"
-PR = "r2"
-
-EXTRA_OECONF +=  "${@['--disable-nls','--enable-nls'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
+PR = "r3"
 
 SRC_URI += "file://autoconf.patch"
 
-- 
1.7.2.5



