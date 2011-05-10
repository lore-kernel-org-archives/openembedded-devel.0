Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlLc-0005rZ-1n
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:43:28 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so4758860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Htaygwv1E4GwsYG++f5LAlGXb+MUO1/nrZ548B149Zs=;
	b=dVqdbH/BG+Fp0J55b2uLYf4SGW0JnrrzDavxQf8hGmVNoF7gn1FqpvGeTCSG1J45U1
	/3n2tM9EnNR/pKupN/oJRFL6E1QL1JY7KWPxn8eTnNVuOgJuTRi8gW8Dv59Ho0paGkF6
	VW8uP+y2UP9k0Mh+qu8Rq4nw+HQwtnX137rF4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AEbu898O4ANZjN/ljEr0MSB6woMmB7SzP95SCcj7PMLveHvZ1Bnreliwsfc7PwBVDK
	RHyXe5CBGeyzkUGsgSs8AqkJ7stgBNWX8SwewW+EN/6X3J6S9+8lwiu2EZHO06/+0oBG
	6yZnfTaf9pQLjURnO79mkr6DiwLOcNlhHCxyw=
Received: by 10.223.59.92 with SMTP id k28mr1438547fah.27.1305027645016;
	Tue, 10 May 2011 04:40:45 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j18sm2347813faa.18.2011.05.10.04.40.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:40:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:40:37 +0200
Message-Id: <a760ee45353f8adb5c2fd24ff4bc9a5c99acddc8.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/9] python-argparse: add new recipe to provide argparse module for python and python-native older then 2.7
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
X-List-Received-Date: Tue, 10 May 2011 11:43:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-argparse_1.2.1.bb                |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb b/meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb
new file mode 100644
index 0000000..a026a25
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python command-line parsing library"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
+SRCNAME = argparse
+
+SRC_URI = "http://argparse.googlecode.com/files/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "2fbef8cb61e506c706957ab6e135840c"
+SRC_URI[sha256sum] = "ddaf4b0a618335a32b6664d4ae038a1de8fbada3b25033f9021510ed2b3941a4"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+BBCLASSEXTEND = "native"
-- 
1.7.5.rc3



